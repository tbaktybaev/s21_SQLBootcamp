WITH last_upd_cur AS (
	SELECT c1.id, c1.name, c2.rate_to_usd, c2.updated
	FROM
		(SELECT id, name, MAX(updated)
		 FROM currency
		 GROUP BY id, name) AS c1
		JOIN currency c2 ON (c1.name = c2.name AND c1.max = c2.updated))

SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    b.type AS type,
    SUM(b.money) AS volume,
    COALESCE(last_upd_cur.name, 'not defined') AS currency_name,
    COALESCE(rate_to_usd, 1) AS last_rate_to_usd,
    SUM(b.money) * COALESCE(rate_to_usd, 1) AS total_volume_in_usd
FROM last_upd_cur
RIGHT JOIN balance b ON last_upd_cur.id = b.currency_id
FULL JOIN "user" u ON b.user_id = u.id
GROUP BY 
    u.name,
    lastname,
    type,
    currency_name,
    last_upd_cur.rate_to_usd
ORDER BY 1 DESC, 2, 3;