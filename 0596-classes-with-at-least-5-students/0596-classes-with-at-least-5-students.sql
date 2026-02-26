/* Write your T-SQL query statement below */

/*
WITH class_students AS (
    SELECT COUNT(*) AS student_num, 
    class
    FROM Courses
    GROUP BY class
)

SELECT class
FROM class_students
WHERE student_num > 4;
*/

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(*) >= 5;