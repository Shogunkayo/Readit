/* Calculate citations for a paper */
DELIMITER //

CREATE FUNCTION CalculateCitations (paperDOI UUID) RETURNS INT
BEGIN
    DECLARE citationCount INT;

    SELECT COUNT(paper_cited) INTO citationCount
    FROM Citations
    WHERE paper_citing = paperDOI;

    RETURN citationCount;
END //

DELIMITER ;

/* Check if researcher belongs to an organization */
DELIMITER //

CREATE FUNCTION IsResearcherInOrganization (researcherID UUID, organizationID UUID) RETURNS BOOLEAN
BEGIN
    DECLARE result BOOLEAN;

    SELECT EXISTS (
        SELECT 1
        FROM Belong_To
        WHERE r_id = researcherID AND o_id = organizationID
    ) INTO result;

    RETURN result;
END //

DELIMITER ;

/* Check if researcher works in a company */
DELIMITER //

CREATE FUNCTION IsResearcherInCompany (researcherID UUID, companyID UUID) RETURNS BOOLEAN
BEGIN
    DECLARE result BOOLEAN;

    SELECT EXISTS (
        SELECT 1
        FROM Work_Company
        WHERE r_id = researcherID AND c_id = companyID
    ) INTO result;

    RETURN result;
END //

DELIMITER ;

DELIMITER //

/* Check if researcher works in a university */
CREATE FUNCTION IsResearcherInUniversity (researcherID UUID, universityID UUID) RETURNS BOOLEAN
BEGIN
    DECLARE result BOOLEAN;

    SELECT EXISTS (
        SELECT 1
        FROM Work_University
        WHERE r_id = researcherID AND u_id = universityID
    ) INTO result;

    RETURN result;
END //

DELIMITER ;

/* Calculate average h-index for a university */
DELIMITER //

CREATE FUNCTION CalculateAverageHIndex (universityID UUID) RETURNS DECIMAL(5, 2)
BEGIN
    DECLARE avgHIndex DECIMAL(5, 2);

    SELECT AVG(r.h_index) INTO avgHIndex
    FROM Researcher r
    JOIN Work_University wu ON r.r_id = wu.r_id
    WHERE wu.u_id = universityID;

    RETURN avgHIndex;
END //

DELIMITER ;
