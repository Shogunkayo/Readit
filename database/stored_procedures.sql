/* Calculate Average Graduation Rate for a Country */
DELIMITER //

CREATE PROCEDURE CalculateAverageGraduationRate (IN countryName VARCHAR(50))
BEGIN
    DECLARE avgGraduationRate DECIMAL(5, 2);

    SELECT AVG(u.graduation_rate) INTO avgGraduationRate
    FROM University u
    JOIN City c ON u.city_id = c.city_id
    JOIN Country co ON c.country_id = co.country_id
    WHERE co.country_name = countryName;

    SELECT avgGraduationRate AS average_graduation_rate;
END //

DELIMITER ;

/* Get Researcher Details with Paper Count */
DELIMITER //

CREATE PROCEDURE GetResearcherDetailsWithPaperCount (IN researcherID UUID)
BEGIN
    SELECT r.*, COUNT(wp.doi) AS paper_count
    FROM Researcher r
    LEFT JOIN WritePaper wp ON r.r_id = wp.r_id
    WHERE r.r_id = researcherID;

END //

DELIMITER ;
