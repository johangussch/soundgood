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
