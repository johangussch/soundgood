-- Insert Addresses
INSERT INTO "address" ("street", "city", "zip_code") VALUES
('123 Maple Street', 'Springfield', '12345'),
('456 Oak Avenue', 'Shelbyville', '67890'),
('789 Pine Road', 'Ogdenville', '11223');

-- Insert Contact Persons
INSERT INTO "contact_person" ("address_id", "phone_number", "email") VALUES
(1, '555-1234', 'contact1@example.com'),
(2, '555-5678', 'contact2@example.com'),
(3, '555-9012', 'contact3@example.com');

-- Insert Students
INSERT INTO "student" ("address_id", "contact_id", "name", "personal_number") VALUES
(1, 1, 'John Doe', '1234567890'),
(2, 2, 'Jane Smith', '0987654321'),
(3, 3, 'Bob Brown', '1122334455');

-- Insert Instruments for Renting
INSERT INTO "instrument_for_renting" ("name", "rent_cost", "brand") VALUES
('Violin', 50, 'Yamaha'),
('Piano', 100, 'Casio'),
('Guitar', 40, 'Fender');

-- Insert Rentals
INSERT INTO "rental" ("student_id", "instrument_id", "start_date", "end_date") VALUES
(1, 1, '2024-01-01 10:00:00', '2024-06-01 10:00:00'),
(2, 2, '2024-02-01 10:00:00', '2024-07-01 10:00:00'),
(3, 3, '2024-03-01 10:00:00', '2024-08-01 10:00:00');

-- Insert Skill Levels
INSERT INTO "skill" ("skill_name") VALUES
('Beginner'), ('Intermediate'), ('Advanced');

-- Insert Lesson Types
INSERT INTO "lesson_type" ("lesson_type") VALUES
('Private Lesson'), ('Group Lesson'), ('Ensemble Lesson');

-- Insert Pricing Schemes
INSERT INTO "pricing_scheme" ("cost_per_student", "pay_for_instructor", "discount") VALUES
(20, 10, 5), (30, 15, 10), (50, 25, 20);

-- Insert Instructors
INSERT INTO "instructor" ("address_id", "name", "personal_number", "email", "phone_number", "teaches_ensamble") VALUES
(1, 'Alice Johnson', '5555555551', 'alice@example.com', '555-1001', true),
(2, 'Bob Lee', '5555555552', 'bob@example.com', '555-1002', false),
(3, 'Catherine Kim', '5555555553', 'catherine@example.com', '555-1003', true);

-- Insert Available Timeslots for Instructors
INSERT INTO "available_timeslot" ("instructor_id", "start_time", "end_time") VALUES
(1, '2024-01-01 10:00:00', '2024-01-01 12:00:00'),
(1, '2024-01-02 14:00:00', '2024-01-02 16:00:00'),
(2, '2024-01-03 10:00:00', '2024-01-03 12:00:00'),
(2, '2024-01-04 14:00:00', '2024-01-04 16:00:00'),
(3, '2024-01-05 10:00:00', '2024-01-05 12:00:00'),
(3, '2024-01-06 14:00:00', '2024-01-06 16:00:00');

-- Insert Lessons
INSERT INTO "lesson" ("time_slot", "address_id", "pricing_id", "lesson_type", "skill_level", "target_genre", "min_participants", "max_participants", "instrument") VALUES
(1, 1, 1, 1, 1, 'Classical', 1, 5, 'Violin'),
(2, 2, 2, 2, 2, 'Jazz', 3, 10, 'Guitar'),
(3, 3, 3, 3, 3, 'Pop', 5, 20, 'Piano');
