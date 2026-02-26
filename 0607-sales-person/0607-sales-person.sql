/* Write your T-SQL query statement below */

SELECT name
FROM SalesPerson
WHERE sales_id NOT IN (
    -- Esta es tu "lista negra"
    SELECT o.sales_id
    FROM Orders o
    JOIN Company c ON o.com_id = c.com_id
    WHERE c.name = 'RED'
);