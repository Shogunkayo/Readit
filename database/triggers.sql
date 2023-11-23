USE readit;

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
DELIMITER //

CREATE TRIGGER before_insert_Publish_Conf
BEFORE INSERT ON Publish_Conf
FOR EACH ROW
BEGIN
    DECLARE paper_exists_conf INT;
    DECLARE paper_exists_repo INT;

    -- Check if the user is already working in a university
    SELECT COUNT(*)
    INTO paper_exists_conf
    FROM Publish_Conf
    WHERE doi = NEW.doi;

    -- Check if the user is already working in a company
    SELECT COUNT(*)
    INTO paper_exists_repo
    FROM Publish_Repo
    WHERE doi = NEW.doi;

    IF paper_exists_conf > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Paper is already in a conference.';
    END IF;

    IF paper_exists_repo > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Paper is already in a repository.';
    END IF;
END//


DELIMITER ;


DELIMITER //

CREATE TRIGGER before_insert_Publish_Repo
BEFORE INSERT ON Publish_Repo
FOR EACH ROW
BEGIN
    DECLARE paper_exists_conf INT;
    DECLARE paper_exists_repo INT;

    -- Check if the user is already working in a university
    SELECT COUNT(*)
    INTO paper_exists_conf
    FROM Publish_Conf
    WHERE doi = NEW.doi;

    -- Check if the user is already working in a company
    SELECT COUNT(*)
    INTO paper_exists_repo
    FROM Publish_Repo
    WHERE doi = NEW.doi;

    IF paper_exists_conf > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Paper is already in a conference.';
    END IF;

    IF paper_exists_repo > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Paper is already in a repository.';
    END IF;
END//


DELIMITER ;
