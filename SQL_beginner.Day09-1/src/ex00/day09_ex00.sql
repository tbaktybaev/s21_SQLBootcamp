--00
create table person_audit (
	created timestamp with time zone default current_timestamp NOT NULL,
	type_event char(1) default 'I' NOT NULL,
	row_id bigint not null,
	name varchar,
	age integer,
	gender varchar,
	address varchar
	);

ALTER TABLE person_audit ADD CONSTRAINT ch_type_event CHECK (type_event in ('I', 'D', 'U'));

CREATE FUNCTION fnc_trg_person_insert_audit() returns trigger AS $person_audit$
BEGIN
IF (TG_OP = 'INSERT') THEN
	INSERT INTO person_audit
SELECT
	current_timestamp,
	'I',
	new.id, new.name, new.age, new.gender, new.address;
	end if;
	RETURN NULL;
	END;
$person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit AFTER INSERT 
on PERSON
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) 
VALUES (10,'Damir', 22, 'male', 'Irkutsk');