# Write your MySQL query statement below

SELECT S1.SCORE, 
                (
                    SELECT COUNT(DISTINCT S2.SCORE)
                    FROM SCORES S2
                    WHERE S2.SCORE >= S1.SCORE
                ) AS 'RANK'
FROM SCORES S1
ORDER BY S1.SCORE DESC;