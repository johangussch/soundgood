-- Insert data for "address"
INSERT INTO "address" ("street", "city", "zip_code") VALUES
('123 Elm St', 'Springfield', '12345'),
('456 Oak St', 'Shelbyville', '67890'),
('789 Pine St', 'Capital City', '54321'),
('101 Maple St', 'Ogdenville', '11223'),
('202 Birch St', 'North Haverbrook', '44556'),
('303 Cedar St', 'Brockway', '66778'),
('404 Willow St', 'Springfield', '88990'),
('505 Aspen St', 'Shelbyville', '10112'),
('606 Redwood St', 'Capital City', '12131'),
('707 Sequoia St', 'Ogdenville', '14141');

-- Insert data for "contact_person"
INSERT INTO "contact_person" ("address_id", "phone_number", "email") VALUES
(1, '555-1234', 'john.doe@example.com'),
(2, '555-5678', 'jane.smith@example.com'),
(3, '555-8765', 'bob.jones@example.com'),
(4, '555-4321', 'susan.miller@example.com'),
(5, '555-1122', 'tom.clark@example.com'),
(6, '555-3344', 'ann.brown@example.com'),
(7, '555-5566', 'jim.green@example.com'),
(8, '555-7788', 'lisa.white@example.com'),
(9, '555-9900', 'david.black@example.com'),
(10, '555-2233', 'nancy.wilson@example.com');

-- Insert data for "student"
INSERT INTO "student" ("address_id", "contact_id", "name", "personal_number") VALUES
(1, 1, 'John Doe', '1234567890'),
(2, 2, 'Jane Smith', '2345678901'),
(3, 3, 'Bob Jones', '3456789012'),
(4, 4, 'Susan Miller', '4567890123'),
(5, 5, 'Tom Clark', '5678901234'),
(6, 6, 'Ann Brown', '6789012345'),
(7, 7, 'Jim Green', '7890123456'),
(8, 8, 'Lisa White', '8901234567'),
(9, 9, 'David Black', '9012345678'),
(10, 10, 'Nancy Wilson', '0123456789');

-- Insert data for "instructor"
INSERT INTO "instructor" ("address_id", "name", "personal_number", "email", "phone_number", "teaches_ensamble") VALUES
(1, 'Michael Adams', 'A123456789', 'michael.adams@music.com', '555-1111', TRUE),
(2, 'Elizabeth Harris', 'B987654321', 'elizabeth.harris@music.com', '555-2222', FALSE),
(3, 'George Taylor', 'C543216789', 'george.taylor@music.com', '555-3333', TRUE),
(4, 'Patricia Scott', 'D678901234', 'patricia.scott@music.com', '555-4444', TRUE),
(5, 'Samuel Johnson', 'E234567890', 'samuel.johnson@music.com', '555-5555', FALSE);

-- Insert data for "lesson_type"
INSERT INTO "lesson_type" ("lesson_type") VALUES
('Individual'),
('Group'),
('Ensemble'),

-- Insert data into the "pricing_scheme" table
INSERT INTO "pricing_scheme" ("cost_per_student", "pay_for_instructor", "discount") VALUES
(100, 50, 10),  -- Standard pricing scheme: $100 per student, $50 for the instructor, 10% discount
(120, 60, 15),  -- Premium pricing: $120 per student, $60 for the instructor, 15% discount
(80, 40, 5),    -- Budget pricing: $80 per student, $40 for the instructor, 5% discount
(150, 80, 20),  -- High-end pricing: $150 per student, $80 for the instructor, 20% discount
(90, 45, 0);    -- Discounted pricing: $90 per student, $45 for the instructor, no discount

-- Insert data for "lesson"
INSERT INTO "lesson" ("time_slot", "address_id", "pricing_id", "lesson_type", "skill_level", "target_genre", "min_participants", "max_participants", "instrument") VALUES
(1, 1, 1, 2, 1, 'NULL', 1, 1, 'Piano'),
(2, 2, 2, 3, 2, 'Jazz', 2, 10, 'Guitar'),
(3, 3, 3, 2, 3, 'NULL', 3, 5, 'Drums'),
(4, 4, 4, 3, 1, 'Blues', 2, 6, 'Violin'),
(5, 5, 5, 2, 2, 'NULL', 1, 1, 'Voice'),
(6, 6, 1, 3, 3, 'Classical', 3, 8, 'Cello'),
(7, 7, 2, 3, 1, 'Jazz', 1, 4, 'Bass'),
(8, 8, 3, 3, 2, 'Blues', 2, 7, 'Guitar'),
(9, 9, 4, 1, 3, 'NULL', 1, 1, 'Voice'),
(10, 10, 5, 2, 1, 'NULL', 2, 6, 'Piano'),
(1, 1, 1, 3, 2, 'Classical', 1, 5, 'Violin'),
(2, 2, 2, 3, 3, 'Jazz', 3, 10, 'Trumpet'),
(3, 3, 3, 3, 1, 'Blues', 1, 4, 'Harmonica'),
(4, 4, 4, 1, 2, 'NULL', 1, 6, 'Oboe'),
(5, 5, 5, 2, 3, 'NULL', 2, 5, 'Electric Guitar'),
(6, 6, 1, 3, 2, 'Jazz', 2, 7, 'Piano'),
(7, 7, 2, 3, 3, 'Blues', 1, 8, 'Guitar'),
(8, 8, 3, 3, 1, 'Rock', 3, 6, 'Bass'),
(9, 9, 4, 1, 2, 'NULL', 2, 4, 'Drums'),
(10, 10, 5, 2, 3, 'NULL', 1, 5, 'Saxophone');

-- Insert data for "given_lesson"
INSERT INTO "given_lesson" ("lesson_id", "time", "pay") VALUES
(1, '2024-12-01 10:00:00', 100.00),
(2, '2024-12-01 12:00:00', 150.00),
(3, '2024-12-01 14:00:00', 120.00),
(4, '2024-12-02 10:00:00', 110.00),
(5, '2024-12-02 12:00:00', 160.00),
(6, '2024-12-02 14:00:00', 130.00),
(7, '2024-12-03 10:00:00', 140.00),
(8, '2024-12-03 12:00:00', 125.00),
(9, '2024-12-03 14:00:00', 115.00),
(10, '2024-12-04 10:00:00', 105.00),
(11, '2024-12-04 12:00:00', 150.00),
(12, '2024-12-04 14:00:00', 140.00),
(13, '2024-12-05 10:00:00', 160.00),
(14, '2024-12-05 12:00:00', 120.00),
(15, '2024-12-05 14:00:00', 130.00),
(16, '2024-12-06 10:00:00', 110.00),
(17, '2024-12-06 12:00:00', 100.00),
(18, '2024-12-06 14:00:00', 135.00),
(19, '2024-12-07 10:00:00', 120.00),
(20, '2024-12-07 12:00:00', 150.00);

-- Insert data for "booking"
INSERT INTO "booking" ("lesson_id", "student_id") VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 1), (12, 2), (13, 3), (14, 4), (15, 5),
(16, 6), (17, 7), (18, 8), (19, 9), (20, 10);

-- Insert data for "rental"
INSERT INTO "rental" ("student_id", "instrument_id", "start_date", "end_date") VALUES
(1, 1, '2024-11-01', '2024-11-30'),
(2, 2, '2024-11-01', '2024-11-30'),
(3, 3, '2024-11-01', '2024-11-30'),
(4, 4, '2024-11-01', '2024-11-30'),
(5, 5, '2024-11-01', '2024-11-30');

-- Insert data for "student_siblings"
INSERT INTO "student_siblings" ("id", "sibling_id") VALUES
(1, 2), (3, 4), (5, 6), (7, 8), (9, 10);

-- Insert data for "student_skill"
INSERT INTO "student_skill" ("student_id", "instrument", "skill_level") VALUES
(1, 'Piano', 2),
(2, 'Guitar', 3),
(3, 'Drums', 1),
(4, 'Violin', 2),
(5, 'Voice', 3),
(6, 'Cello', 2),
(7, 'Bass', 3),
(8, 'Guitar', 2),
(9, 'Voice', 1),
(10, 'Piano', 3);
