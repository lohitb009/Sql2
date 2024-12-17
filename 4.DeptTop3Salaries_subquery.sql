# Write your MySQL query statement below

SELECT Department.name AS Department , E1.name AS Employee , E1.salary AS Salary
FROM Employee E1 INNER JOIN Department
WHERE 
    E1.departmentId = Department.id 
    AND

# SELECT E1.* FROM EMPLOYEE E1
# WHERE 

    (
        SELECT COUNT(DISTINCT E2.salary) as 'rank'  FROM EMPLOYEE E2
        WHERE 
            E1.departmentId  = E2.departmentId 
            AND
            E1.salary < E2.salary

    ) < 3 
    
#     AND E1.departmentId = 1
    
    ORDER BY E1.salary DESC;
