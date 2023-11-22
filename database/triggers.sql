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

