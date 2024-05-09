--Shortest Distance in a Plane

SELECT ROUND(sqrt(MIN(pow(p2.x-p1.x,2)+ pow(p2.y-p1.y,2))),2) AS Shortest
FROM Point2D p1
INNER JOIN Point2D p2
ON p1.x!= p2.x or p1.y!= p2.y;

--To reduce repeated calculation

SELECT ROUND(sqrt(MIN(pow(p2.x-p1.x,2)+ pow(p2.y-p1.y,2))),2) AS Shortest
FROM Point2D p1
INNER JOIN Point2D p2
ON (p1.x <= p2.x AND p1.y < p2.y)
OR (p1.x <= p2.x AND p1.y > p2.y)
OR(p1.x > p2.x AND p1.y = p2.y);