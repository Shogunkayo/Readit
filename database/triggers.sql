USE readit;

/* Trigger to update h_index when an author publishes a paper or receives a citation */

/* Trigger to enforce graduation rate constraints */
DELIMITER //

CREATE TRIGGER Before_Insert_University
BEFORE INSERT ON University
FOR EACH ROW
BEGIN
    IF NEW.graduation_rate < 0 OR NEW.graduation_rate > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid graduation rate. Must be between 0 and 100.';
    END IF;
END //

DELIMITER ;

/* Trigger to check the paper domain before inserting into publish_conf */
DELIMITER //

CREATE TRIGGER Before_Insert_Publish_Conf
BEFORE INSERT ON Publish_Conf
FOR EACH ROW
BEGIN
    IF NEW.domain NOT IN (
        SELECT domain
        FROM Conference_domains
        WHERE c_id = NEW.c_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid paper domain for the specified conference.';
    END IF;
END //

DELIMITER ;

-- Trigger to check if a user is already working in a company or university
DELIMITER //

CREATE TRIGGER before_insert_Work_Company
BEFORE INSERT ON Work_Company
FOR EACH ROW
BEGIN
    DECLARE user_exists_university INT;
    DECLARE user_exists_company INT;

    -- Check if the user is already working in a university
    SELECT COUNT(*)
    INTO user_exists_university
    FROM Work_University
    WHERE r_id = NEW.r_id;

    -- Check if the user is already working in a company
    SELECT COUNT(*)
    INTO user_exists_company
    FROM Work_Company
    WHERE r_id = NEW.r_id;

    IF user_exists_university > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User is already working in a university.';
    END IF;

    IF user_exists_company > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User is already working in a company.';
    END IF;
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_insert_Work_University
BEFORE INSERT ON Work_University
FOR EACH ROW
BEGIN
    DECLARE user_exists_university INT;
    DECLARE user_exists_company INT;

    -- Check if the user is already working in a university
    SELECT COUNT(*)
    INTO user_exists_university
    FROM Work_University
    WHERE r_id = NEW.r_id;

    -- Check if the user is already working in a company
    SELECT COUNT(*)
    INTO user_exists_company
    FROM Work_Company
    WHERE r_id = NEW.r_id;

    IF user_exists_university > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User is already working in a university.';
    END IF;

    IF user_exists_company > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User is already working in a company.';
    END IF;
END//

DELIMITER ;



-- Trigger to check if a paper is already published in either a private repo or a public conference





-- Trigger to check if an email already exists before inserting