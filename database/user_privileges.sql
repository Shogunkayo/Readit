-- Grant all privileges on the entire database to an admin user
GRANT ALL PRIVILEGES ON readit.* TO 'admin_user'@'localhost' IDENTIFIED BY 'admin_password' WITH GRANT OPTION;

-- Grant SELECT and INSERT privileges on specific tables to a researcher user
GRANT SELECT, INSERT ON readit.Researcher TO 'researcher_user'@'localhost' IDENTIFIED BY 'researcher_password';
GRANT SELECT, INSERT ON readit.Paper TO 'researcher_user'@'localhost';

-- Grant only SELECT privileges on specific tables to a read-only user
GRANT SELECT ON readit.Paper TO 'readonly_user'@'localhost' IDENTIFIED BY 'readonly_password';
GRANT SELECT ON readit.Conference TO 'readonly_user'@'localhost';
