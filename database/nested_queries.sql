/* Find papers published by researchers in a specific university */

SELECT *
FROM Paper
WHERE doi IN (
    SELECT doi
    FROM WritePaper
    WHERE r_id IN (
        SELECT r_id
        FROM Researcher
        WHERE nationality = (SELECT country_id FROM University WHERE u_id = '1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1')
    )
);


/* Get papers published in a particular conference by name */
SELECT *
FROM Paper
WHERE doi IN (
    SELECT doi
    FROM Publish_Conf
    WHERE c_id IN (
        SELECT c_id
        FROM Conference
        WHERE c_name = 'TechSymposium'
    )
);

/* Get papers published in conferences of a specific tier */
SELECT *
FROM Paper
WHERE doi IN (
    SELECT doi
    FROM Publish_Conf
    WHERE c_id IN (
        SELECT c_id
        FROM Conference
        WHERE tier = 'Tier 1'
    )
);
