-- Insert data into "address"
INSERT INTO "address" ("street", "city", "zip_code")
VALUES 
  ('123 Main St', 'Springfield', '12345'),
  ('456 Elm St', 'Shelbyville', '67890'),
  ('789 Maple Ave', 'Capital City', '11223'),
  ('321 Oak St', 'Ogdenville', '33445'),
  ('654 Pine St', 'North Haverbrook', '55667');

-- Insert data into "contact_person"
INSERT INTO "contact_person" ("address_id", "phone_number", "email")
VALUES 
  (1, '555-1234', 'johndoe@example.com'),
  (2, '555-5678', 'janedoe@example.com'),
  (3, '555-9101', 'mike@example.com'),
  (4, '555-1122', 'susan@example.com'),
  (5, '555-3344', 'steve@example.com');

-- Insert data into "student"
INSERT INTO "student" ("address_id", "contact_id", "name", "personal_number")
VALUES 
  (1, 1, 'Alice Johnson', '1234567890'),
  (2, 2, 'Bob Smith', '9876543210'),
  (3, 3, 'Charlie Brown', '2345678901'),
  (4, 4, 'Dana White', '3456789012'),
  (5, 5, 'Eve Black', '4567890123');

-- Insert data into "student_siblings"
INSERT INTO "student_siblings" ("id", "sibling_id")
VALUES 
  (1, 2),
  (2, 1),
  (3, 4),
  (4, 3);

-- Insert data into "instrument_for_renting"
INSERT INTO "instrument_for_renting" ("name", "rent_cost", "brand")
VALUES 
  ('Piano', 50, 'Yamaha'),
  ('Violin', 30, 'Stradivarius'),
  ('Guitar', 40, 'Fender'),
  ('Flute', 20, 'Pearl'),
  ('Drums', 60, 'Tama');

-- Insert data into "rental"
INSERT INTO "rental" ("student_id", "instrument_id", "start_date", "end_date")
VALUES 
  (1, 1, '2024-01-01', '2024-06-01'),
  (2, 2, '2024-02-01', '2024-07-01'),
  (3, 3, '2024-03-01', '2024-08-01'),
  (4, 4, '2024-04-01', '2024-09-01'),
  (5, 5, '2024-05-01', '2024-10-01');

-- Insert data into "pricing_scheme"
INSERT INTO "pricing_scheme" ("cost_per_student", "pay_for_instructor", "discount")
VALUES 
  (100, 50, 10),
  (150, 75, 15),
  (200, 100, 20),
  (250, 125, 25),
  (300, 150, 30);

-- Insert data into "lesson_type"
INSERT INTO "lesson_type" ("lesson_type")
VALUES 
  ('Individual'),
  ('Group'),
  ('Ensemble'),
  ('Workshop'),
  ('Masterclass');

-- Insert data into "instructor"
INSERT INTO "instructor" ("address_id", "name", "personal_number", "email", "phone_number", "teaches_ensamble")
VALUES 
  (1, 'John Williams', '1234567890', 'jwilliams@example.com', '555-4321', TRUE),
  (2, 'Anna Smith', '2345678901', 'asmith@example.com', '555-8765', FALSE),
  (3, 'Mark Brown', '3456789012', 'mbrown@example.com', '555-1111', TRUE),
  (4, 'Sophia Johnson', '4567890123', 'sjohnson@example.com', '555-2222', FALSE),
  (5, 'Ethan Davis', '5678901234', 'edavis@example.com', '555-3333', TRUE);

-- Insert data into "given_lesson"
INSERT INTO "given_lesson" ("instructor_id", "time", "pay")
VALUES 
  (1, '2024-11-01 10:00:00', 50.0),
  (2, '2024-11-02 11:00:00', 75.0),
  (3, '2024-11-03 12:00:00', 100.0),
  (4, '2024-11-04 13:00:00', 125.0),
  (5, '2024-11-05 14:00:00', 150.0);

-- Insert data into "instructor_instruments"
INSERT INTO "instructor_instruments" ("instructor_id", "instrument")
VALUES 
  (1, 'Piano'),
  (2, 'Violin'),
  (3, 'Guitar'),
  (4, 'Flute'),
  (5, 'Drums');

-- Insert data into "available_timeslot"
INSERT INTO "available_timeslot" ("instructor_id", "start_time", "end_time")
VALUES 
  (1, '2024-11-01 09:00:00', '2024-11-01 10:00:00'),
  (2, '2024-11-02 10:00:00', '2024-11-02 11:00:00'),
  (3, '2024-11-03 11:00:00', '2024-11-03 12:00:00'),
  (4, '2024-11-04 12:00:00', '2024-11-04 13:00:00'),
  (5, '2024-11-05 13:00:00', '2024-11-05 14:00:00');

-- Insert data into "skill"
INSERT INTO "skill" ("skill_name")
VALUES 
  ('Beginner'),
  ('Intermediate'),
  ('Advanced'),
  ('Professional'),
  ('Expert');

-- Insert data into "student_skill"
INSERT INTO "student_skill" ("student_id", "instrument", "skill_level")
VALUES 
  (1, 'Piano', 1),
  (2, 'Violin', 2),
  (3, 'Guitar', 3),
  (4, 'Flute', 4),
  (5, 'Drums', 5);

-- Insert data into "lesson"
INSERT INTO "lesson" ("time_slot", "address_id", "pricing_id", "lesson_type", "skill_level", "target_genre", "min_participants", "max_participants", "instrument")
VALUES 
  (1, 1, 1, 1, 1, 'Classical', 1, 5, 'Piano'),
  (2, 2, 2, 2, 2, 'Jazz', 2, 10, 'Violin'),
  (3, 3, 3, 3, 3, 'Rock', 3, 15, 'Guitar'),
  (4, 4, 4, 4, 4, 'Pop', 4, 20, 'Flute'),
  (5, 5, 5, 5, 5, 'Folk', 5, 25, 'Drums');

-- Insert data into "booking"
INSERT INTO "booking" ("lesson_id", "student_id")
VALUES 
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);

-- Insert data into "attended_lesson"
INSERT INTO "attended_lesson" ("student_id", "time", "cost")
VALUES 
  (1, '2024-11-01 10:00:00', 100.00),
  (2, '2024-11-02 11:00:00', 150.00),
  (3, '2024-11-03 12:00:00', 200.00),
  (4, '2024-11-04 13:00:00', 250.00),
  (5, '2024-11-05 14:00:00', 300.00);

INSERT INTO "available_timeslot" ("instructor_id", "start_time", "end_time") 
VALUES
(1, '2024-01-01 10:00:00', '2024-01-01 11:00:00'), -- Time slot 6
(2, '2024-01-02 14:00:00', '2024-01-02 15:00:00'), -- Time slot 7
(3, '2024-01-03 16:00:00', '2024-01-03 17:00:00'), -- Time slot 8
(4, '2024-01-04 09:00:00', '2024-01-04 10:00:00'), -- Time slot 9
(5, '2024-01-05 11:30:00', '2024-01-05 12:30:00'); -- Time slot 10

-- January lessons
INSERT INTO "lesson" ("time_slot", "address_id", "pricing_id", "lesson_type", "skill_level", "target_genre", "min_participants", "max_participants", "instrument")
VALUES 
(6, 1, 1, 1, 2, 'Classical', 1, 1, 'Piano'), -- Individual
(7, 2, 2, 2, 3, 'Jazz', 3, 10, 'Guitar'), -- Group
(8, 3, 3, 3, 1, 'Pop', 3, 20, 'Drums'); -- Ensemble

-- February lessons
INSERT INTO "lesson" ("time_slot", "address_id", "pricing_id", "lesson_type", "skill_level", "target_genre", "min_participants", "max_participants", "instrument")
VALUES 
(9, 4, 4, 1, 3, 'Rock', 1, 1, 'Violin'), -- Individual
(10, 5, 5, 2, 2, 'Blues', 2, 8, 'Saxophone'), -- Group
(6, 1, 1, 3, 1, 'Electronic', 5, 15, 'Keyboard'); -- Ensemble

-- March lessons
INSERT INTO "lesson" ("time_slot", "address_id", "pricing_id", "lesson_type", "skill_level", "target_genre", "min_participants", "max_participants", "instrument")
VALUES 
(7, 2, 2, 1, 1, 'Classical', 1, 1, 'Flute'), -- Individual
(8, 3, 3, 2, 3, 'Rock', 4, 12, 'Electric Guitar'), -- Group
(9, 4, 4, 3, 2, 'Hip-Hop', 6, 18, 'Percussion'); -- Ensemble

-- April lessons
INSERT INTO "lesson" ("time_slot", "address_id", "pricing_id", "lesson_type", "skill_level", "target_genre", "min_participants", "max_participants", "instrument")
VALUES 
(10, 5, 5, 1, 2, 'Jazz', 1, 1, 'Trumpet'), -- Individual
(6, 1, 1, 2, 1, 'Pop', 2, 9, 'Bass Guitar'), -- Group
(7, 2, 2, 3, 3, 'Fusion', 5, 15, 'Drums'); -- Ensemble
