/* Get Researcher Details with Paper Count */
DELIMITER //

CREATE PROCEDURE GetResearcher(IN researcher_id VARCHAR(100))
BEGIN
    SELECT
        r.r_id,
        r.last_name,
        r.first_name,
        r.email,
        r.h_index,
        r.dob,
        r.page_visits,
        c.country_name AS nationality
    FROM Researcher r
    JOIN Country c ON r.nationality = c.country_id
    WHERE r.r_id = researcher_id;
END //

DELIMITER ;

/* Get university info if researcher is working there */
DELIMITER //

CREATE PROCEDURE GetUniInfo(
    In p_r_id VARCHAR(100)
)
BEGIN
    SELECT
        u.u_id AS uni_id,
        u.u_name AS uni_name,
        c.city_name AS uni_city,
        co.country_name AS uni_country,
        d.d_name AS department_name,
        d.d_id AS department_id
    FROM University u
    JOIN City c ON u.city_id = c.city_id
    JOIN Country co ON u.country_id = co.country_id
    JOIN Department d ON u.u_id = d.u_id
    JOIN Work_University wu ON wu.d_id = d.d_id
    WHERE wu.r_id = p_r_id;
END //

DELIMITER ;

/* Get company info if researcher is working there */
DELIMITER //

CREATE PROCEDURE GetCompInfo(
    IN p_r_id VARCHAR(100)
)
BEGIN
    SELECT
        comp.c_id AS comp_id,
        comp.c_name AS comp_name,
        c.city_name AS comp_city,
        co.country_name AS comp_country
    FROM Company comp
    JOIN Work_Company wc ON wc.c_id = comp.c_id
    JOIN City c ON wc.city_id = c.city_id
    JOIN Country co ON wc.country_id = co.country_id
    WHERE wc.r_id = p_r_id;
END //

DELIMITER ;

/* Get organization info if researcher is working there */
DELIMITER //

CREATE PROCEDURE GetOrgInfo(
    IN p_r_id VARCHAR(100)
)
BEGIN
    SELECT
        org.o_id AS org_id,
        org.o_name AS org_name
    FROM Organization org
    JOIN Belong_To bt ON org.o_id = bt.o_id
    WHERE bt.r_id = p_r_id;
END //

DELIMITER ;

/* Get social information about r_id */
DELIMITER //

CREATE PROCEDURE GetSocial(
    IN p_r_id VARCHAR(100)
)
BEGIN
    SELECT
        "follows" AS type,
        r.r_id as r_id,
        r.last_name AS last_name,
        r.first_name AS first_name
    FROM Researcher r
    JOIN Follows f ON r.r_id = f.follows
    WHERE f.follower = p_r_id

    UNION

    SELECT
        "follower" AS type,
        r.r_id as r_id,
        r.last_name AS last_name,
        r.first_name AS first_name
    FROM Researcher r
    JOIN Follows f on r.r_id = f.follower
    WHERE f.follows = p_r_id;
END //

DELIMITER ;

/* Get information about the papers published by r_id if publicly available */
DROP PROCEDURE GetPapers;
DELIMITER //
CREATE PROCEDURE GetPapers(
    IN p_r_id VARCHAR(100)
)
BEGIN
    SELECT
        p.doi AS doi,
        p.domain AS domain,
        p.paper_url AS paper_url,
        p.title AS p_title,
        COUNT(ci.paper_cited) AS p_citations,
        conf.c_id AS conf_id,
        conf.c_name AS conf_name,
        pc.date_published AS p_date
    FROM Paper p
    JOIN Citations ci ON ci.paper_cited = p.doi
    JOIN Publish_Conf pc ON pc.doi = p.doi
    JOIN Conference conf ON pc.c_id = conf.c_id
    JOIN WritePaper wp ON wp.doi = p.doi
    WHERE wp.r_id = p_r_id;
END //

DELIMITER ;

/* Get search results */
DROP PROCEDURE GetSearchPapers;
DELIMITER //

CREATE PROCEDURE GetSearchPapers(
    IN p_search_key VARCHAR(100)
)
BEGIN
    SELECT DISTINCT
        p.doi as doi,
        p.domain as domain,
        p.title as title,
        p.paper_url as paper_url,
        r.r_id as r_id,
        r.first_name as first_name,
        r.last_name as last_name,
        conf.c_id as conf_id,
        conf.c_name as conf_name
    FROM Paper p
    JOIN Citations ci ON ci.paper_cited = p.doi
    JOIN WritePaper wp ON wp.doi = p.doi
    JOIN Researcher r ON wp.r_id = r.r_id
    JOIN Publish_Conf pc ON pc.doi = p.doi
    JOIN Conference conf ON pc.c_id = conf.c_id
    WHERE p.title LIKE CONCAT('%', p_search_key, '%') 
    OR r.first_name LIKE CONCAT('%', p_search_key, '%')
    OR r.last_name LIKE CONCAT('%', p_search_key, '%')
    OR conf.c_name LIKE CONCAT('%', p_search_key, '%');
END //

DELIMITER ;

DROP PROCEDURE GetSearchUsers;
DELIMITER //

CREATE PROCEDURE GetSearchUsers(
    IN p_search_key VARCHAR(100)
)
BEGIN
    SELECT DISTINCT
        r.r_id as r_id,
        r.first_name as first_name,
        r.last_name as last_name
    FROM Researcher r
    WHERE r.first_name LIKE CONCAT('%', p_search_key, '%')
    OR r.last_name LIKE CONCAT('%', p_search_key, '%');
END //

DELIMITER ;

/* Procedures for handling trending papers */
DELIMITER //
CREATE PROCEDURE TrendDecay()
BEGIN
    UPDATE TrendingPapers
    SET trend_score = trend_score - 2;

    DELETE FROM TrendingPapers
    WHERE trend_score <= 0;
END //
DELIMITER ;
