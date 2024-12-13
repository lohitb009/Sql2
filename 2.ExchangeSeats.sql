# Solution 1: Case Statements
# finding the mod

# SELECT MOD(ID,2) AS 'MOD' FROM SEAT;

# GET THE COUNT
# SELECT COUNT(ID) FROM SEAT;

# PUT THESE QUERIES INSIDE FLOW CONTROL STATEMENT

# query for result
SELECT (
     CASE
        WHEN MOD(S1.ID,2) != 0 AND S1.ID = (SELECT COUNT(*) FROM SEAT S2) THEN ID
        WHEN MOD(S1.ID,2) != 0 THEN ID+1
        ELSE S1.ID-1
    END
 ) 
AS 'ID', 
S1.STUDENT
 
FROM SEAT S1
 
ORDER BY ID;

#-----------------------------------------------------------------------------------

# Solution 2: Bit Manipulation 
# bit maniplation and left join
# can use coalesce also -- kind of like nested if null
SELECT S1.ID, IFNULL(S2.STUDENT,S1.STUDENT) AS STUDENT FROM SEAT S1 LEFT JOIN SEAT S2 ON (S1.ID+1)^1-1 = S2.ID;
