--01
CREATE FUNCTION fnc_trg_person_update_audit() returns trigger AS $person_audit$
BEGIN
IF (TG_OP = 'UPDATE') THEN
	INSERT INTO person_audit
SELECT
	current_timestamp,
	'U',
	old.id, old.name, old.age, old.gender, old.address;
	end if;
	RETURN NULL;
	END;
$person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_update_audit AFTER UPDATE 
on PERSON
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10; 
UPDATE person SET name = 'Damir' WHERE id = 10;