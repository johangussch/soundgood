----- TRIGGERS ------
-- 1. rental limit is 2 instruments
-- 2. no instrument can exist in two seperate rentals
-- 3. make min/max participant 1 if it is an individual lesson
-- 4. always create the inverse of a sibling relation

CREATE OR REPLACE FUNCTION enforce_rental_limit()
RETURNS TRIGGER AS $$
BEGIN
  IF (SELECT COUNT(*) 
      FROM "rental" 
      WHERE "student_id" = NEW."student_id" 
      AND "end_date" > CURRENT_DATE) >= 2 THEN
    RAISE EXCEPTION 'A student can only rent up to 2 instruments at a time';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER rental_limit_trigger
BEFORE INSERT OR UPDATE ON "rental"
FOR EACH ROW EXECUTE FUNCTION enforce_rental_limit();

---------------------

CREATE OR REPLACE FUNCTION enforce_unique_instrument_rental()
RETURNS TRIGGER AS $$
BEGIN
  -- Check if the instrument is already rented during the same period
  IF EXISTS (
    SELECT 1
    FROM "rental"
    WHERE "instrument_id" = NEW."instrument_id"
      AND (NEW."start_date", NEW."end_date") OVERLAPS ("start_date", "end_date")
  ) THEN
    RAISE EXCEPTION 'The instrument is already rented for this period';
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER unique_instrument_rental_trigger
BEFORE INSERT OR UPDATE ON "rental"
FOR EACH ROW EXECUTE FUNCTION enforce_unique_instrument_rental();

-----------------

CREATE OR REPLACE FUNCTION enforce_individual_lesson_participants()
RETURNS TRIGGER AS $$
BEGIN
  -- Check if the lesson is an individual lesson
  IF (SELECT "lesson_type" FROM "lesson_type" WHERE "id" = NEW."lesson_type") = 'Individual' THEN
    -- Set min and max participants to 1
    NEW."min_participants" := 1;
    NEW."max_participants" := 1;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER enforce_min_max_individual
BEFORE INSERT OR UPDATE ON "lesson"
FOR EACH ROW EXECUTE FUNCTION enforce_individual_lesson_participants();

------------------

CREATE OR REPLACE FUNCTION insert_inverse_sibling()
RETURNS TRIGGER AS $$
BEGIN
  -- Check if the inverse relationship already exists
  IF NOT EXISTS (
    SELECT 1
    FROM "student_siblings"
    WHERE "id" = NEW."sibling_id" AND "sibling_id" = NEW."id"
  ) THEN
    -- Insert the inverse relationship
    INSERT INTO "student_siblings" ("id", "sibling_id")
    VALUES (NEW."sibling_id", NEW."id");
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER insert_inverse_sibling_trigger
AFTER INSERT ON "student_siblings"
FOR EACH ROW EXECUTE FUNCTION insert_inverse_sibling();
