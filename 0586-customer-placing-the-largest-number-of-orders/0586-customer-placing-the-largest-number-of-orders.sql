/* Write your T-SQL query statement below */
WITH conteo_clientes AS (
    SELECT customer_number,
           RANK() OVER (ORDER BY COUNT(order_number) DESC) AS ranking
    FROM Orders
    GROUP BY customer_number
)
SELECT customer_number
FROM conteo_clientes
WHERE ranking = 1;