/* Get all papers published by a researcher */
SELECT
    p.*,
    CASE
        WHEN pc.c_id IS NOT NULL THEN pc.c_name
        ELSE ''
    END AS conference_name
FROM
    Paper p
LEFT JOIN
    Publish_Conf pc ON p.doi = pc.doi
WHERE
    p.doi IN (
        SELECT wp.doi
        FROM WritePaper wp
        WHERE wp.r_id = 'your_researcher_id'
    );

