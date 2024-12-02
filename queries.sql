-- EXPLAIN ANALYZE for query 1:
EXPLAIN ANALYZE monthly_lesson_summary

-- View for Query 1: Find all lessons given for each month
CREATE OR REPLACE VIEW monthly_lessons_summary AS
SELECT 
  TO_CHAR(given_lesson.time, 'YYYY-MM') AS month,
  COUNT(CASE WHEN lesson_type.lesson_type = 'Individual' THEN 1 END) AS individual_lessons,
  COUNT(CASE WHEN lesson_type.lesson_type = 'Group' THEN 1 END) AS group_lessons,
  COUNT(CASE WHEN lesson_type.lesson_type = 'Ensemble' THEN 1 END) AS ensemble_lessons,
  COUNT(given_lesson.id) AS total_lessons
FROM given_lesson
JOIN lesson ON given_lesson.lesson_id = lesson.id
JOIN lesson_type ON lesson.lesson_type = lesson_type.id
GROUP BY TO_CHAR(given_lesson.time, 'YYYY-MM')
ORDER BY month;

-- View for Query 2: Students with specific number of siblings
CREATE OR REPLACE VIEW student_siblings_summary AS
SELECT num_of_siblings, COUNT(*) AS student_count
FROM (
  SELECT student.id, COUNT(student_siblings.id) AS num_of_siblings
  FROM student
  LEFT JOIN student_siblings ON student.id = student_siblings.id
  GROUP BY student.id
) AS siblings_count
GROUP BY num_of_siblings
ORDER BY num_of_siblings;

-- View for Query 3: Instructors with more than a specific number of lessons during the current month
CREATE OR REPLACE VIEW active_instructors_current_month AS
SELECT instructor.id, instructor.name, COUNT(*) AS lesson_count
FROM instructor 
JOIN available_timeslot ON instructor.id = available_timeslot.instructor_id
JOIN lesson ON lesson.time_slot = available_timeslot.id
JOIN given_lesson ON given_lesson.lesson_id = lesson.id
WHERE DATE_PART('month', available_timeslot.start_time) = DATE_PART('month', CURRENT_DATE)
  AND DATE_PART('year', available_timeslot.start_time) = DATE_PART('year', CURRENT_DATE)
GROUP BY instructor.id, instructor.name
HAVING COUNT(*) > 1
ORDER BY lesson_count DESC;

-- View for Query 4: Ensembles held during the next week
CREATE OR REPLACE VIEW next_week_ensembles AS
SELECT
  TO_CHAR(ats.start_time, 'day') AS day_of_week,
  l.target_genre AS genre,
  CASE
    WHEN COUNT(b.id) >= l.max_participants THEN 'fully booked'
    WHEN l.max_participants - COUNT(b.id) <= 2 THEN '1-2 seats left'
    ELSE 'more seats left'
  END AS booking_status
FROM lesson l
JOIN available_timeslot ats ON l.time_slot = ats.id
LEFT JOIN booking b ON l.id = b.lesson_id
WHERE l.lesson_type = '3'  -- Ensemble lessons
  AND ats.start_time BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '7 days'
GROUP BY l.target_genre, l.max_participants, ats.start_time
ORDER BY ats.start_time;
