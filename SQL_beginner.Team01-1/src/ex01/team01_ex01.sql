insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT DISTINCT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    currency.name AS currency_name,
    COALESCE(
		(SELECT currency.rate_to_usd
		 FROM currency
		 WHERE currency.updated < b.updated
		 AND currency.id = b.currency_id
		 ORDER BY currency.updated DESC
		 LIMIT 1),
		(SELECT currency.rate_to_usd
		 FROM currency
		 WHERE currency.updated > b.updated
		 AND currency.id = b.currency_id
		 ORDER BY currency.updated
		 LIMIT 1)) * b.money AS currency_in_usd
FROM currency
JOIN balance b ON currency.id = b.currency_id
LEFT JOIN "user" u ON b.user_id = u.id
ORDER BY 1 DESC, 2, 3;