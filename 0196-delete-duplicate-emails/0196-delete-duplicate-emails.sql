/* Write your T-SQL query statement below */
WITH cte AS (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY email ORDER BY id ASC) AS row_number
    FROM Person
)

DELETE FROM Person
WHERE id IN (
    SELECT id FROM cte WHERE row_number > 1
);