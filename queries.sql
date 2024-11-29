-- 1. find all lessons given for each month
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

-- 2. Show how many students there are with no sibling, with one sibling, with two siblings
SELECT num_of_siblings, COUNT(*) 
FROM (
	SELECT student.id, COUNT(student_siblings.id) AS num_of_siblings
	FROM student
	LEFT JOIN student_siblings ON student.id = student_siblings.id
	GROUP BY student.id
)
GROUP BY num_of_siblings
ORDER BY num_of_siblings

-- 3. List ids and names of all instructors who has given more than a specific number of lessons during the current month
Select name, COUNT(*) 
FROM instructor 
JOIN available_timeslot ON instructor.id = available_timeslot.instructor_id
JOIN lesson ON lesson.time_slot = available_timeslot.id
JOIN given_lesson ON given_lesson.lesson_id = lesson.id
GROUP BY name HAVING COUNT(*) > 1
ORDER BY count DESC

-- 4. List all ensembles held during the next week
SELECT
TO_CHAR(ats.start_time ,'day') as day_of_week,
l.target_genre as Genre,
CASE
    WHEN COUNT(b.id) >= l.max_participants THEN 'fully booked'
    WHEN l.max_participants - COUNT(b.id) <= 2 THEN '1-2 seats left'
    ELSE 'more seats left'
  END AS booking_status
FROM lesson l
JOIN available_timeslot ats ON l.time_slot = ats.id
LEFT JOIN booking b ON l.id = b.lesson_id
WHERE l.lesson_type = '3'
AND ats.start_time BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '7 days'

GROUP BY l.target_genre, l.max_participants, ats.start_time
ORDER BY ats.start_time
