USE readit;

-- Trigger to update h_index when an author publishes a paper or receives a citation
DELIMITER //

CREATE TRIGGER UpdateHIndex
AFTER INSERT ON Paper_keywords
FOR EACH ROW
BEGIN
    DECLARE researcher_id VARCHAR(15);
    DECLARE new_h_index INT;

    -- Get the researcher ID associated with the paper
    SELECT r_id INTO researcher_id
    FROM Write1
    WHERE doi = NEW.doi;

    -- Calculate the new h_index
    SELECT COUNT(DISTINCT doi) + COUNT(DISTINCT c_id) INTO new_h_index
    FROM Paper
    JOIN Publish ON Paper.doi = Publish.doi
    WHERE Write1.r_id = researcher_id OR Publish.doi = NEW.doi;

    -- Update the h_index in Researcher_details
    UPDATE Researcher_details
    SET h_index = new_h_index
    WHERE r_id = researcher_id;
END //

DELIMITER ;