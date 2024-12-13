# Solution 1: Union / Full Join
# Write your MySQL query statement below

SELECT ID, 'Root' AS TYPE FROM TREE WHERE P_ID IS NULL

UNION

SELECT ID, 'Leaf' AS TYPE FROM TREE WHERE 
P_ID IS NOT NULL
AND 
ID NOT IN (
        SELECT DISTINCT P_ID FROM TREE WHERE P_ID IS NOT NULL
)

UNION 

SELECT ID, 'Inner' AS TYPE FROM TREE WHERE 
P_ID IS NOT NULL
AND 
ID IN (
        SELECT DISTINCT P_ID FROM TREE WHERE P_ID IS NOT NULL
)

ORDER BY ID;

#-----------------------------------------------------------------------------------

# Solution 2: Case Statement 
# Write your MySQL query statement below

SELECT ID, (
    CASE
        WHEN P_ID IS NULL THEN 'Root'
        WHEN ID IN (SELECT DISTINCT P_ID FROM TREE WHERE P_ID IS NOT NULL) THEN 'Inner'
        ELSE 'Leaf'
    END
) AS 'TYPE' 
FROM TREE


#------------------------------------------------------------------------------------

# Solution 3: IF Statement
SELECT ID AS 'ID', IF(ISNULL(a.P_ID), 'Root', IF(a.ID IN (SELECT DISTINCT b.P_ID FROM TREE as b WHERE b.P_ID IS NOT NULL), 'Inner', 'Leaf')) AS 'TYPE'
FROM TREE AS a; 
