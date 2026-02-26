/* Write your T-SQL query statement below */
WITH user_login AS (
    SELECT *,
    ROW_NUMBER() OVER (
        PARTITION BY player_id
        ORDER BY event_date ASC
    ) AS first_login
    FROM Activity
)

SELECT player_id, event_date AS first_login FROM user_login WHERE first_login = 1;