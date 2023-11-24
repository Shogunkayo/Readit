-- admin
GRANT ALL PRIVILEGES ON readit.* TO 'admin'@'localhost' WITH GRANT OPTION;

-- user(default if signed in)
GRANT INSERT, DELETE ON readit.Researcher TO 'user'@'localhost';
GRANT INSERT, DELETE ON readit.Paper TO 'user'@'localhost';
GRANT SELECT ON readit.* TO 'user'@'localhost';

-- readonly(default if not signed in)
GRANT SELECT ON readit.* TO 'readonly'@'localhost';
