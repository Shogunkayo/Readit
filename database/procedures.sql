USE readit;

-- Retrieve information about a researcher and the papers they have written.
DELIMITER //

CREATE PROCEDURE GetResearcherPapers(IN researcher_id VARCHAR(15))
BEGIN
    -- Declare variables to store result columns
    DECLARE researcher_name VARCHAR(30);
    DECLARE paper_title VARCHAR(30);

    -- Select researcher's name
    SELECT first_name INTO researcher_name
    FROM Researcher_details
    WHERE r_id = researcher_id;

    -- Select papers written by the researcher
    SELECT p.title INTO paper_title
    FROM Paper p
    JOIN Write1 w ON p.doi = w.doi
    WHERE w.r_id = researcher_id;

    -- Display the results
    SELECT 'Researcher Name: ', researcher_name AS Result;
    SELECT 'Papers Written: ', GROUP_CONCAT(paper_title) AS Result;
END //

DELIMITER ;


-- Retrieve information about papers accepted at a specific conference.
DELIMITER //

CREATE PROCEDURE GetAcceptedPapersForConference(IN conference_id VARCHAR(15))
BEGIN
    -- Declare variables to store result columns
    DECLARE conference_name VARCHAR(30);
    DECLARE paper_title VARCHAR(30);
    DECLARE paper_doi VARCHAR(15);

    -- Select conference name
    SELECT c_name INTO conference_name
    FROM Conference
    WHERE c_id = conference_id;

    -- Select accepted papers for the conference
    SELECT p.title, p.doi INTO paper_title, paper_doi
    FROM Paper p
    JOIN Publish pub ON p.doi = pub.doi
    WHERE pub.c_id = conference_id;

    -- Display the results
    SELECT 'Conference Name: ', conference_name AS Result;
    SELECT 'Accepted Papers: ', GROUP_CONCAT(CONCAT(paper_title, ' (DOI: ', paper_doi, ')')) AS Result;
END //

DELIMITER ;