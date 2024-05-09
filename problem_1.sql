-- Game Play Analysis II 

SELECT a.player_id, a.device_id 
FROM Activity a
WHERE a.event_date IN (
    SELECT MIN(b.event_date) 
    FROM Activity b
    WHERE a.player_id = b.player_id 
);

--Using cte
WITH CTE AS(
    SELECT player_id, device_id, RANK() OVER (PARTITION BY player_id ORDER BY event_date) AS 'rnk'
    FROM Activity
)
SELECT player_id, device_id
FROM CTE
WHERE rnk= 1;

--Using first value
SELECT DISTINCT player_id, FIRST_VALUE(device_id) OVER(PARTITION BY player_id ORDER BY event_date)AS device_id
FROM Activity;