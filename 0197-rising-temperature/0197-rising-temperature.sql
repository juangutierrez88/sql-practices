/* Write your T-SQL query statement below */
WITH prev_data AS (
    SELECT id, recordDate, temperature,
        LAG(temperature) OVER (ORDER BY recordDate) AS temp_anterior,
        LAG(recordDate) OVER (ORDER BY recordDate) AS fecha_anterior
    FROM Weather
)

SELECT id
FROM prev_data
WHERE temperature > temp_anterior
AND DATEDIFF(day, fecha_anterior, recordDate) = 1;