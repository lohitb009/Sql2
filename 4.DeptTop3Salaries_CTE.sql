# Write your MySQL query statement below

WITH CTE AS(
    SELECT *, DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY SALARY DESC) AS RNK
    FROM EMPLOYEE
)

SELECT Department.name AS Department, CTE.NAME AS Employee, CTE.SALARY AS Salary
FROM CTE INNER JOIN DEPARTMENT
ON CTE.departmentId = Department.id
AND CTE.RNK < 4
ORDER BY SALARY DESC;