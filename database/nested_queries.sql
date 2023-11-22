/* Find papers published by researchers in a specific university */

SELECT *
FROM Paper
WHERE doi IN (
    SELECT doi
    FROM WritePaper
    WHERE r_id IN (
        SELECT r_id
        FROM Work_University
        WHERE u_id = 'university_id'
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
        WHERE c_name = 'Your Conference Name'
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
