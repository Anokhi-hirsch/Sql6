--Combine two tables

SELECT p.firstName, p.lastName, a.city, a.state
FROM Person as p
LEFT JOIN Address a
ON p.personId = a.personId;

--using right join

SELECT p.firstName, p.lastName, a.city, a.state
FROM Address a
RIGHT JOIN Person p
ON p.personId = a.personId;