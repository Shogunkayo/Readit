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

-- Triggers for getting trending pages
DELIMITER //
CREATE TRIGGER on_paper_publish
AFTER INSERT ON Publish_Conf
FOR EACH ROW
BEGIN
    INSERT INTO TrendingPapers
    VALUES (NEW.doi, 10);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER on_paper_cite
AFTER INSERT ON Citations
FOR EACH ROW
BEGIN
    UPDATE TrendingPapers tp
    SET trend_score = trend_score + 5
    WHERE tp.doi = NEW.paper_cited;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER on_paper_read
BEFORE UPDATE ON Paper
FOR EACH ROW
BEGIN
    IF NEW.no_reads = OLD.no_reads + 1 THEN
        UPDATE TrendingPapers tp
        SET trend_score = trend_score + 3
        WHERE tp.doi = NEW.doi;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER on_author_visit
BEFORE UPDATE ON Researcher
FOR EACH ROW
BEGIN
    IF NEW.page_visits = OLD.page_visits + 1 THEN
        UPDATE TrendingPapers tp
        JOIN WritePaper wp ON tp.doi = wp.doi
        JOIN Researcher r ON r.r_id = wp.r_id
        SET tp.trend_score = tp.trend_score + 1
        WHERE r.r_id = NEW.r_id;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER on_author_follow
AFTER INSERT ON Follows
FOR EACH ROW
BEGIN
    UPDATE TrendingPapers tp
    JOIN WritePaper wp ON tp.doi = wp.doi
    JOIN Researcher r ON r.r_id = wp.r_id
    SET tp.trend_score = tp.trend_score + 2
    WHERE r.r_id = NEW.follows;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER on_author_unfollow
AFTER DELETE ON Follows
FOR EACH ROW
BEGIN
    UPDATE TrendingPapers tp
    JOIN WritePaper wp ON tp.doi = wp.doi
    JOIN Researcher r ON r.r_id = wp.r_id
    SET tp.trend_score = tp.trend_score - 2
    WHERE r.r_id = Old.follows;
END //
DELIMITER ;


-- Trigger to update h-index of researcher when an entry is made to Citations table

DELIMITER //

CREATE TRIGGER update_h_index_after_citation
AFTER INSERT ON Citations
FOR EACH ROW
BEGIN
    DECLARE author_id VARCHAR(100);

    -- Get the author(s) of the cited paper
    SELECT r_id INTO author_id
    FROM WritePaper
    WHERE doi = NEW.paper_cited;

    -- Update h-index for each author
    UPDATE Researcher
    SET h_index = (
        SELECT MAX(citations) 
        FROM (
            SELECT COUNT(*) as citations
            FROM Citations
            JOIN WritePaper ON Citations.paper_citing = WritePaper.doi
            WHERE WritePaper.r_id = author_id
            GROUP BY Citations.paper_citing
        ) AS citation_counts
        WHERE citations >= (
            SELECT ROW_NUMBER() OVER (ORDER BY citations DESC) as row_num
            FROM (
                SELECT COUNT(*) as citations
                FROM Citations
                JOIN WritePaper ON Citations.paper_citing = WritePaper.doi
                WHERE WritePaper.r_id = author_id
                GROUP BY Citations.paper_citing
            ) AS citation_counts_inner
        )
    )
    WHERE r_id = author_id;
END //

DELIMITER ;
