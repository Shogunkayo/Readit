/* Get new publications from tier 1 for home page */
SELECT
    p.doi as doi,
    p.title as title,
    c.c_id as conf_id,
    c.c_name as conf_name,
    r.r_id as r_id,
    r.first_name as first_name,
    r.last_name as last_name
FROM Paper as p
JOIN WritePaper pw ON pw.doi = p.doi
JOIN Researcher r ON pw.r_id = r.r_id
JOIN Publish_Conf pc ON pc.doi = p.doi
JOIN Conference c ON c.c_id = pc.c_id
WHERE c.tier = 'Tier 1'
ORDER BY pc.date_published DESC LIMIT 5;

