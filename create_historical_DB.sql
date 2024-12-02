-- Queries to generate a historical database
CREATE TABLE "historical_lessons" (
    "id" SERIAL PRIMARY KEY,               -- Unique ID for each historical lesson record
    "lesson_type" VARCHAR(50) NOT NULL,     -- Type of the lesson (individual, group, ensemble)
    "genre" VARCHAR(50),                   -- Genre (only relevant for ensemble lessons)
    "instrument" VARCHAR(50),              -- Instrument (only relevant for group/individual lessons)
    "lesson_price" NUMERIC(10, 2) NOT NULL, -- Price of the lesson at the time it was taken
    "student_name" VARCHAR(255) NOT NULL,   -- Name of the student
    "student_email" VARCHAR(255) NOT NULL  -- Email of the student
);
-- Populate table
INSERT INTO "historical_lessons" ("lesson_type", "genre", "instrument", "lesson_price", "student_name", "student_email")
SELECT lesson_type.lesson_type, target_genre, instrument, cost_per_student, student.name, contact_person.email 
FROM booking 
JOIN lesson ON lesson.id = booking.lesson_id
JOIN student ON booking.student_id = student.id
JOIN given_lesson ON given_lesson.lesson_id = lesson.id
JOIN pricing_scheme ON pricing_scheme.id = lesson.pricing_id
JOIN contact_person ON contact_person.id = student.contact_id
JOIN lesson_type ON lesson_type.id = lesson.lesson_type
