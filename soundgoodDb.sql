-- Create the "address" table
CREATE TABLE "address" (
  "id" SERIAL,
  "street" VARCHAR(50),
  "city" VARCHAR(50),
  "zip_code" VARCHAR(50),
  PRIMARY KEY ("id")
);

-- Create the "contact_person" table with ON DELETE SET NULL
CREATE TABLE "contact_person" (
  "id" SERIAL,
  "address_id" INT,
  "phone_number" VARCHAR(50),
  "email" VARCHAR(50),
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_contact_person.address_id"
    FOREIGN KEY ("address_id")
      REFERENCES "address"("id") ON DELETE SET NULL
);

-- Create the "student" table with ON DELETE CASCADE/SET NULL
CREATE TABLE "student" (
  "id" SERIAL,
  "address_id" INT,
  "contact_id" INT NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "personal_number" CHAR(10) UNIQUE,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_student.address_id"
    FOREIGN KEY ("address_id")
      REFERENCES "address"("id") ON DELETE SET NULL,
  CONSTRAINT "FK_student.contact_id"
    FOREIGN KEY ("contact_id")
      REFERENCES "contact_person"("id") ON DELETE SET NULL
);

-- Create the "student_siblings" table with ON DELETE CASCADE
CREATE TABLE "student_siblings" (
  "id" INT NOT NULL,
  "sibling_id" INT NOT NULL,
  PRIMARY KEY ("id", "sibling_id"),
  CONSTRAINT "FK_student_siblings.id"
    FOREIGN KEY ("id")
      REFERENCES "student"("id") ON DELETE CASCADE,
  CONSTRAINT "FK_student_siblings.sibling_id"
    FOREIGN KEY ("sibling_id")
      REFERENCES "student"("id") ON DELETE CASCADE
);

-- Create the "instrument_for_renting" table
CREATE TABLE "instrument_for_renting" (
  "id" SERIAL,
  "name" VARCHAR(50) NOT NULL,
  "rent_cost" INT NOT NULL,
  "brand" VARCHAR(50),
  PRIMARY KEY ("id")
);

-- Create the "rental" table with ON DELETE CASCADE
CREATE TABLE "rental" (
  "id" SERIAL,
  "student_id" INT NOT NULL,
  "instrument_id" INT NOT NULL,
  "start_date" TIMESTAMP NOT NULL,
  "end_date" TIMESTAMP NOT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_rental.instrument_id"
    FOREIGN KEY ("instrument_id")
      REFERENCES "instrument_for_renting"("id") ON DELETE CASCADE,
  CONSTRAINT "FK_rental.student_id"
    FOREIGN KEY ("student_id")
      REFERENCES "student"("id") ON DELETE CASCADE
);

-- Create the "pricing_scheme" table
CREATE TABLE "pricing_scheme" (
  "id" SERIAL,
  "cost_per_student" INT NOT NULL,
  "pay_for_instructor" INT NOT NULL,
  "discount" INT NOT NULL,
  PRIMARY KEY ("id")
);

-- Create the "lesson_type" table
CREATE TABLE "lesson_type" (
  "id" SERIAL,
  "lesson_type" VARCHAR(50) NOT NULL,
  PRIMARY KEY ("id")
);

-- Create the "instructor" table with ON DELETE SET NULL
CREATE TABLE "instructor" (
  "id" SERIAL,
  "address_id" INT NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "personal_number" CHAR(10) UNIQUE,
  "email" VARCHAR(50),
  "phone_number" VARCHAR(50),
  "teaches_ensamble" BOOL,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_instructor.address_id"
    FOREIGN KEY ("address_id")
      REFERENCES "address"("id") ON DELETE SET NULL
);

-- Create the "given_lesson" table with ON DELETE CASCADE
CREATE TABLE "given_lesson" (
  "id" SERIAL,
  "instructor_id" INT NOT NULL,
  "time" TIMESTAMP NOT NULL,
  "pay" FLOAT NOT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_given_lesson.instructor_id"
    FOREIGN KEY ("instructor_id")
      REFERENCES "instructor"("id") ON DELETE CASCADE
);

-- Create the "instructor_instruments" table with ON DELETE CASCADE
CREATE TABLE "instructor_instruments" (
  "instructor_id" INT,
  "instrument" VARCHAR(50),
  PRIMARY KEY ("instructor_id", "instrument"),
  CONSTRAINT "FK_instructor_instruments.instructor_id"
    FOREIGN KEY ("instructor_id")
      REFERENCES "instructor"("id") ON DELETE CASCADE
);

-- Create the "available_timeslot" table with ON DELETE CASCADE
CREATE TABLE "available_timeslot" (
  "id" SERIAL,
  "instructor_id" INT NOT NULL,
  "start_time" TIMESTAMP NOT NULL,
  "end_time" TIMESTAMP NOT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_available_timeslot.instructor_id"
    FOREIGN KEY ("instructor_id")
      REFERENCES "instructor"("id") ON DELETE CASCADE
);

-- Create the "skill" table
CREATE TABLE "skill" (
  "id" SERIAL,
  "skill_name" VARCHAR(50) NOT NULL,
  PRIMARY KEY ("id")
);

-- Create the "student_skill" table with ON DELETE CASCADE
CREATE TABLE "student_skill" (
  "student_id" INT,
  "instrument" VARCHAR(50),
  "skill_level" INT NOT NULL,
  PRIMARY KEY ("student_id", "instrument"),
  CONSTRAINT "FK_student_skill.student_id"
    FOREIGN KEY ("student_id")
      REFERENCES "student"("id") ON DELETE CASCADE,
  CONSTRAINT "FK_student_skill.skill_level"
    FOREIGN KEY ("skill_level")
      REFERENCES "skill"("id") ON DELETE CASCADE
);

-- Create the "lesson" table with ON DELETE CASCADE
CREATE TABLE "lesson" (
  "id" SERIAL,
  "time_slot" INT NOT NULL,
  "address_id" INT NOT NULL,
  "pricing_id" INT NOT NULL,
  "lesson_type" INT NOT NULL,
  "skill_level" INT NOT NULL,
  "target_genre" VARCHAR(50),
  "min_participants" INT,
  "max_participants" INT,
  "instrument" VARCHAR(50),
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_lesson.time_slot"
    FOREIGN KEY ("time_slot")
      REFERENCES "available_timeslot"("id") ON DELETE CASCADE,
  CONSTRAINT "FK_lesson.address_id"
    FOREIGN KEY ("address_id")
      REFERENCES "address"("id") ON DELETE SET NULL,
  CONSTRAINT "FK_lesson.pricing_id"
    FOREIGN KEY ("pricing_id")
      REFERENCES "pricing_scheme"("id") ON DELETE CASCADE,
  CONSTRAINT "FK_lesson.skill_level"
    FOREIGN KEY ("skill_level")
      REFERENCES "skill"("id") ON DELETE SET NULL,
  CONSTRAINT "FK_lesson.lesson_type"
    FOREIGN KEY ("lesson_type")
      REFERENCES "lesson_type"("id") ON DELETE CASCADE
);

-- Create the "booking" table with ON DELETE CASCADE
CREATE TABLE "booking" (
  "id" SERIAL,
  "lesson_id" INT NOT NULL,
  "student_id" INT NOT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_booking.student_id"
    FOREIGN KEY ("student_id")
      REFERENCES "student"("id") ON DELETE CASCADE,
  CONSTRAINT "FK_booking.lesson_id"
    FOREIGN KEY ("lesson_id")
      REFERENCES "lesson"("id") ON DELETE CASCADE
);

-- Create the "attended_lesson" table with ON DELETE CASCADE
CREATE TABLE "attended_lesson" (
  "id" SERIAL,
  "student_id" INT NOT NULL,
  "time" TIMESTAMP NOT NULL,
  "cost" NUMERIC(10,2) NOT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_attended_lesson.student_id"
    FOREIGN KEY ("student_id")
      REFERENCES "student"("id") ON DELETE CASCADE
);


