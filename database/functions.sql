/* Calculate citations for a paper */
DELIMITER //

CREATE FUNCTION CalculateCitations (paperDOI VARCHAR(100)) RETURNS INT
READS SQL DATA
DETERMINISTIC
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

CREATE FUNCTION IsResearcherInOrganization (researcherID VARCHAR(100), organizationID VARCHAR(100)) RETURNS BOOLEAN
READS SQL DATA
DETERMINISTIC
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

CREATE FUNCTION IsResearcherInCompany (researcherID VARCHAR(100), companyID VARCHAR(100)) RETURNS BOOLEAN
READS SQL DATA
DETERMINISTIC
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
CREATE FUNCTION IsResearcherInUniversity (researcherID VARCHAR(100), departmentID VARCHAR(100)) RETURNS BOOLEAN
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE result BOOLEAN;

    SELECT EXISTS (
        SELECT 1
        FROM Work_University
        WHERE r_id = researcherID AND d_id = departmentID
    ) INTO result;

    RETURN result;
END //

DELIMITER ;

/* Calculate average h-index for a university */
DELIMITER //

CREATE FUNCTION CalculateAverageHIndex(university_id VARCHAR(100))
RETURNS FLOAT
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE total_h_index INT;
    DECLARE total_researchers INT;
    DECLARE average_h_index FLOAT;

    -- Calculate the total h-index and the total number of researchers for the university
    SELECT SUM(r.h_index), COUNT(*) 
    INTO total_h_index, total_researchers
    FROM Researcher r
    JOIN Department d ON r.r_id = d.d_head
    JOIN University u ON d.u_id = u.u_id
    WHERE u.u_id = university_id;

    -- Avoid division by zero
    IF total_researchers > 0 THEN
        -- Calculate the average h-index
        SET average_h_index = total_h_index / total_researchers;
    ELSE
        SET average_h_index = 0;
    END IF;

    RETURN average_h_index;
END //

DELIMITER ;
