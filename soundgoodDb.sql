-- Inserting addresses
INSERT INTO "address" ("street", "city", "zip_code") VALUES
('123 Elm St', 'Springfield', '12345'),
('456 Oak St', 'Shelbyville', '67890'),
('789 Pine St', 'Capital City', '54321'),
('101 Maple St', 'Greenwich', '11223'),
('202 Birch St', 'Woodstock', '33445');

-- Inserting contact persons
INSERT INTO "contact_person" ("address_id", "phone_number", "email") VALUES
(1, '555-1234', 'john.doe@example.com'),
(2, '555-2345', 'jane.doe@example.com'),
(3, '555-3456', 'alice.smith@example.com'),
(4, '555-4567', 'bob.jones@example.com'),
(5, '555-5678', 'charlie.brown@example.com');

-- Inserting students
INSERT INTO "student" ("address_id", "contact_id", "name", "personal_number") VALUES
(1, 1, 'John Doe', '1234567890'),
(2, 2, 'Jane Doe', '2345678901'),
(3, 3, 'Alice Smith', '3456789012'),
(4, 4, 'Bob Jones', '4567890123'),
(5, 5, 'Charlie Brown', '5678901234');

-- Inserting instruments for renting
INSERT INTO "instrument_for_renting" ("name", "rent_cost", "brand") VALUES
('Guitar', 30, 'Fender'),
('Piano', 50, 'Yamaha'),
('Violin', 25, 'Stradivarius'),
('Drum Kit', 40, 'Pearl'),
('Saxophone', 35, 'Selmer');

-- Inserting pricing schemes
INSERT INTO "pricing_scheme" ("cost_per_student", "pay_for_instructor", "discount") VALUES
(100, 50, 10),
(120, 60, 15),
(80, 40, 5),
(150, 80, 20),
(90, 45, 0);

-- Inserting lesson types
INSERT INTO "lesson_type" ("lesson_type") VALUES
('Individual'),
('Group'),
('Ensemble');

-- Inserting instructors
INSERT INTO "instructor" ("address_id", "name", "personal_number", "email", "phone_number", "teaches_ensamble") VALUES
(1, 'David Clark', '0012345678', 'david.clark@example.com', '555-8765', TRUE),
(2, 'Eva Turner', '0023456789', 'eva.turner@example.com', '555-9876', FALSE),
(3, 'Fred Williams', '0034567890', 'fred.williams@example.com', '555-2345', TRUE),
(4, 'Helen White', '0045678901', 'helen.white@example.com', '555-3456', FALSE),
(5, 'Igor Petrov', '0056789012', 'igor.petrov@example.com', '555-4567', TRUE);

-- Inserting instruments that instructors can teach
INSERT INTO "instructor_instruments" ("instructor_id", "instrument") VALUES
(1, 'Guitar'),
(2, 'Piano'),
(3, 'Violin'),
(4, 'Drum Kit'),
(5, 'Saxophone');

-- Inserting available timeslots
INSERT INTO "available_timeslot" ("instructor_id", "start_time", "end_time") VALUES
(1, '2024-12-01 09:00:00', '2024-12-01 11:00:00'),
(2, '2024-12-01 10:00:00', '2024-12-01 12:00:00'),
(3, '2024-12-02 13:00:00', '2024-12-02 15:00:00'),
(4, '2024-12-03 14:00:00', '2024-12-03 16:00:00'),
(5, '2024-12-04 15:00:00', '2024-12-04 17:00:00');

-- Inserting skills
INSERT INTO "skill" ("skill_name") VALUES
('Beginner'),
('Intermediate'),
('Advanced');

-- Inserting student skills
INSERT INTO "student_skill" ("student_id", "instrument", "skill_level") VALUES
(1, 'Guitar', 1),
(2, 'Piano', 2),
(3, 'Violin', 3),
(4, 'Drum Kit', 2),
(5, 'Saxophone', 1);

-- Inserting lessons
INSERT INTO "lesson" ("time_slot", "address_id", "pricing_id", "lesson_type", "skill_level", "target_genre", "min_participants", "max_participants", "instrument") VALUES
(1, 1, 1, 1, 1, NULL, 1, 5, 'Guitar'),
(2, 2, 2, 2, 2, NULL, 1, 2, 'Piano'),
(3, 3, 3, 3, 3, 'Jazz', 1, 5, 'Violin'),  -- Genre only for Ensemble lessons
(4, 4, 4, 2, 2, NULL, 1, 10, 'Drum Kit'),
(5, 5, 5, 1, 1, NULL, 1, 3, 'Saxophone');

-- Inserting bookings
INSERT INTO "booking" ("lesson_id", "student_id") VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserting attended lessons
INSERT INTO "attended_lesson" ("student_id", "time", "cost") VALUES
(1, '2024-12-01 09:00:00', 90),
(2, '2024-12-01 10:00:00', 100),
(3, '2024-12-02 13:00:00', 110),
(4, '2024-12-03 14:00:00', 120),
(5, '2024-12-04 15:00:00', 95);
