/* Write your T-SQL query statement below */
SELECT 
    CASE 
        -- Si es impar y es el último registro, se queda igual
        WHEN id % 2 != 0 AND id = (SELECT COUNT(*) FROM Seat) THEN id
        -- Si es impar (y no es el último), súmale 1
        WHEN id % 2 != 0 THEN id + 1
        -- Si es par, réstale 1
        ELSE id - 1
    END AS id,
    student
FROM Seat
ORDER BY id ASC;