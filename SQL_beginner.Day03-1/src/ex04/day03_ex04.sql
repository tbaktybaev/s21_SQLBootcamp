WITH 
	people AS (
		SELECT piz.name, gender
		FROM person_order po
			JOIN
			person p ON po.person_id = p.id
			JOIN
			menu ON po.menu_id = menu.id
			JOIN
			pizzeria piz ON menu.pizzeria_id = piz.id
	),
	female AS (
		SELECT name
		FROM people
		WHERE gender = 'female'
	),
	male AS (
		SELECT name
		FROM people
		WHERE gender = 'male'
	)
	
(
	SELECT *
	FROM female
	EXCEPT
	SELECT *
	FROM male
)
UNION
(
	SELECT *
	FROM male
	EXCEPT
	SELECT *
	FROM female
);