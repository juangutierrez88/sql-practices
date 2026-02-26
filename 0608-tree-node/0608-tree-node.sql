/* Write your T-SQL query statement below */
WITH ParentList AS (
    -- Identificar los padres
    SELECT DISTINCT p_id 
    FROM Tree 
    WHERE p_id IS NOT NULL
)
SELECT 
    t.id,
    CASE 
        WHEN t.p_id IS NULL THEN 'Root'
        WHEN p.p_id IS NOT NULL THEN 'Inner'
        ELSE 'Leaf'
    END AS type
FROM Tree t
LEFT JOIN ParentList p ON t.id = p.p_id; -- Unir para saber si el ID actual es padre de alguien