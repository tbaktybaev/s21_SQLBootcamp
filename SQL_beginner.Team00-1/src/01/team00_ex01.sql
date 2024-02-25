WITH ans AS (
    WITH RECURSIVE temp AS (
        SELECT
            point1,
            point2,
            cost,
            1 AS level,
            ARRAY[point1] AS path,
            FALSE AS cycle,
            ARRAY[cost] AS costs
        FROM tsp
        WHERE point1 = 'a'
        UNION ALL
        SELECT
            tsp.point1,
            tsp.point2,
            tsp.cost + temp.cost AS cost,
            temp.level + 1 AS level,
            temp.path || tsp.point1 AS path,
            tsp.point1 = ANY(temp.path) AS cycle,
            temp.costs || tsp.cost AS costs
        FROM tsp
        	JOIN
			temp ON temp.point2 = tsp.point1
			AND NOT cycle
    )

    SELECT
        cost - costs[5] AS total_cost,
        path AS tour
    FROM temp
    WHERE level = 5 AND path[1] = path[5]
    ORDER BY total_cost, tour
)

SELECT DISTINCT *
FROM ans
WHERE total_cost = (SELECT MIN(total_cost) FROM ans)
	OR total_cost = (SELECT MAX(total_cost) FROM ans)
ORDER BY 1, 2;