/* Calculate the number of citations a researcher has received */
SELECT
    r.r_id,
    r.first_name,
    r.last_name,
    SUM(citation_count) AS total_citations
FROM
    Researcher r
JOIN
    WritePaper wp ON r.r_id = wp.r_id
LEFT JOIN (
    SELECT
        wp.r_id,
        p.doi,
        COUNT(c.paper_citing) AS citation_count
    FROM
        WritePaper wp
    JOIN
        Paper p ON wp.doi = p.doi
    LEFT JOIN
        Citations c ON p.doi = c.paper_cited
    GROUP BY
        wp.r_id, p.doi
) AS CitationCounts ON r.r_id = CitationCounts.r_id
GROUP BY
    r.r_id, r.first_name, r.last_name;
