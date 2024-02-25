--04
CREATE OR REPLACE VIEW v_symmetric_union AS
SELECT   person_id
FROM     (
                -- First part: (R - S)
                (SELECT person_id
                FROM   person_visits
                WHERE  visit_date = '2022-01-02'
                EXCEPT
                SELECT person_id
                FROM   person_visits
                WHERE  visit_date = '2022-01-06')
                UNION
                -- Second part: (S - R)
                (SELECT person_id
                FROM   person_visits
                WHERE  visit_date = '2022-01-06'
                EXCEPT
                SELECT person_id
                FROM   person_visits
                WHERE  visit_date = '2022-01-02' )) AS symmetric_union
ORDER BY person_id;
