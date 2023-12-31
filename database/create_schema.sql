CREATE DATABASE readit;
USE readit;

CREATE TABLE Country (
    country_id INT NOT NULL AUTO_INCREMENT,
    country_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (country_id)
);

CREATE TABLE City (
    city_id INT NOT NULL AUTO_INCREMENT,
    city_name VARCHAR(50) NOT NULL,
    country_id INT NOT NULL,
    PRIMARY KEY (city_id),
    FOREIGN KEY (country_id) REFERENCES Country(country_id) ON DELETE SET NULL
);

CREATE TABLE Researcher
(
    r_id VARCHAR(100) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    password BINARY(60) NOT NULL,
    email VARCHAR(50) NOT NULL,
    h_index INT NOT NULL DEFAULT 0,
    date_created DATETIME NOT NULL,
    dob DATE NOT NULL,
    page_visits INT NOT NULL DEFAULT 0,
    nationality INT NOT NULL,
    role VARCHAR(10) NOT NULL DEFAULT "user",
    PRIMARY KEY (r_id),
    UNIQUE (email),
    FOREIGN KEY (nationality) REFERENCES Country(country_id) ON DELETE SET NULL
);

CREATE TABLE Paper
(
    doi VARCHAR(100) NOT NULL,
    domain VARCHAR(50) NOT NULL,
    paper_url VARCHAR(100) NOT NULL,
    title VARCHAR(50) NOT NULL,
    no_reads INT NOT NULL DEFAULT 0,
    PRIMARY KEY (doi)
);

CREATE TABLE TrendingPapers
(
    doi VARCHAR(100) NOT NULL,
    trend_score INT NOT NULL DEFAULT 0,
    FOREIGN KEY (doi) REFERENCES Paper(doi) ON DELETE CASCADE,
    INDEX idx_TrendingScore_desc (trend_score DESC)
);

CREATE TABLE Organization
(
    o_id VARCHAR(100) NOT NULL,
    o_name VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL,
    PRIMARY KEY (o_id)
);

CREATE TABLE Priv_Repository
(
    repo_id VARCHAR(100) NOT NULL,
    repo_name VARCHAR(50) NOT NULL,
    admin_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (repo_id),
    FOREIGN KEY (admin_id) REFERENCES Researcher(r_id) ON DELETE CASCADE
);

CREATE TABLE University
(
    u_id VARCHAR(100) NOT NULL,
    u_name VARCHAR(50) NOT NULL,
    city_id INT NOT NULL,
    country_id INT NOT NULL,
    accredition VARCHAR(50) NOT NULL,
    graduation_rate INT NOT NULL,
    PRIMARY KEY (u_id),
    FOREIGN KEY (city_id) REFERENCES City(city_id) ON DELETE CASCADE,
    FOREIGN KEY (country_id) REFERENCES Country(country_id) ON DELETE CASCADE
);

CREATE TABLE Company
(
    c_id VARCHAR(100) NOT NULL,
    c_name VARCHAR(50) NOT NULL,
    comp_type ENUM('NGO', 'For Profit', 'Other') NOT NULL,
    industry_sector INT NOT NULL,
    head_city_id INT NOT NULL,
    market_share INT NOT NULL,
    PRIMARY KEY (c_id),
    FOREIGN KEY (head_city_id) REFERENCES City(city_id) ON DELETE SET NULL
);

CREATE TABLE Department
(
    d_id VARCHAR(100) NOT NULL,
    d_name VARCHAR(50) NOT NULL,
    d_head VARCHAR(100) NOT NULL,
    budget INT NOT NULL DEFAULT 0,
    no_students INT NOT NULL DEFAULT 0,
    u_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (d_id),
    FOREIGN KEY (u_id) REFERENCES University(u_id) ON DELETE CASCADE,
    FOREIGN KEY (d_head) REFERENCES Researcher(r_id) ON DELETE CASCADE
);

CREATE TABLE Paper_keywords
(
    keyword VARCHAR(50) NOT NULL,
    doi VARCHAR(100) NOT NULL,
    PRIMARY KEY (keyword, doi),
    FOREIGN KEY (doi) REFERENCES Paper(doi) ON DELETE CASCADE
);

CREATE TABLE University_degrees
(
    degree VARCHAR(50) NOT NULL,
    u_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (degree, u_id),
    FOREIGN KEY (u_id) REFERENCES University(u_id) ON DELETE CASCADE
);

CREATE TABLE WritePaper
(
    r_id VARCHAR(100) NOT NULL,
    doi VARCHAR(100) NOT NULL,
    PRIMARY KEY (r_id, doi),
    FOREIGN KEY (r_id) REFERENCES Researcher(r_id) ON DELETE CASCADE,
    FOREIGN KEY (doi) REFERENCES Paper(doi) ON DELETE CASCADE
);

CREATE TABLE Follows
(
    follows VARCHAR(100) NOT NULL,
    follower VARCHAR(100) NOT NULL,
    PRIMARY KEY (follows, follower),
    FOREIGN KEY (follows) REFERENCES Researcher(r_id) ON DELETE CASCADE,
    FOREIGN KEY (follower) REFERENCES Researcher(r_id) ON DELETE CASCADE
);

CREATE TABLE Belong_To
(
    r_id VARCHAR(100) NOT NULL,
    o_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (r_id),
    FOREIGN KEY (r_id) REFERENCES Researcher(r_id) ON DELETE CASCADE,
    FOREIGN KEY (o_id) REFERENCES Organization(o_id) ON DELETE CASCADE
);

CREATE TABLE Citations
(
    paper_citing VARCHAR(100) NOT NULL,
    paper_cited VARCHAR(100) NOT NULL,
    PRIMARY KEY (paper_citing, paper_cited),
    FOREIGN KEY (paper_citing) REFERENCES Paper(doi) ON DELETE CASCADE,
    FOREIGN KEY (paper_cited) REFERENCES Paper(doi) ON DELETE CASCADE
);

CREATE TABLE Publish_Repo
(
    doi VARCHAR(100) NOT NULL,
    repo_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (doi),
    FOREIGN KEY (doi) REFERENCES Paper(doi) ON DELETE CASCADE,
    FOREIGN KEY (repo_id) REFERENCES Priv_Repository(repo_id) ON DELETE CASCADE
);

CREATE TABLE Company_Repo
(
    c_id VARCHAR(100) NOT NULL,
    repo_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (repo_id),
    FOREIGN KEY (c_id) REFERENCES Company(c_id) ON DELETE CASCADE,
    FOREIGN KEY (repo_id) REFERENCES Priv_Repository(repo_id) ON DELETE CASCADE
);

CREATE TABLE University_Repo
(
    repo_id VARCHAR(100) NOT NULL,
    u_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (repo_id),
    FOREIGN KEY (repo_id) REFERENCES Priv_Repository(repo_id) ON DELETE CASCADE,
    FOREIGN KEY (u_id) REFERENCES University(u_id) ON DELETE CASCADE
);

CREATE TABLE Work_Company
(
    r_id VARCHAR(100) NOT NULL,
    c_id VARCHAR(100) NOT NULL,
    city_id INT NOT NULL,
    country_id INT NOT NULL,
    PRIMARY KEY (r_id),
    FOREIGN KEY (r_id) REFERENCES Researcher(r_id) ON DELETE CASCADE,
    FOREIGN KEY (c_id) REFERENCES Company(c_id) ON DELETE CASCADE,
    FOREIGN KEY (city_id) REFERENCES City(city_id) ON DELETE SET NULL,
    FOREIGN KEY (country_id) REFERENCES Country(country_id) ON DELETE SET NULL
);

CREATE TABLE Work_University
(
    r_id VARCHAR(100) NOT NULL,
    d_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (r_id),
    FOREIGN KEY (r_id) REFERENCES Researcher(r_id) ON DELETE CASCADE,
    FOREIGN KEY (d_id) REFERENCES Department(d_id) ON DELETE CASCADE
);

CREATE TABLE Conference
(
    c_id VARCHAR(100) NOT NULL,
    tier ENUM('Tier 1', 'Tier 2', 'Tier 3', 'Other') NOT NULL,
    c_name VARCHAR(50) NOT NULL,
    date_conduct DATE NOT NULL,
    venue_city_id INT NOT NULL,
    venue_country_id INT NOT NULL,
    o_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (c_id),
    FOREIGN KEY (o_id) REFERENCES Organization(o_id) ON DELETE CASCADE,
    FOREIGN KEY (venue_city_id) REFERENCES City(city_id) ON DELETE SET NULL,
    FOREIGN KEY (venue_country_id) REFERENCES Country(country_id) ON DELETE SET NULL
);

CREATE TABLE Conference_domains
(
    domain VARCHAR(50) NOT NULL,
    c_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (domain, c_id),
    FOREIGN KEY (c_id) REFERENCES Conference(c_id) ON DELETE CASCADE
);

CREATE TABLE Publish_Conf
(
    date_published DATETIME NOT NULL,
    doi VARCHAR(100) NOT NULL,
    c_id VARCHAR(100) NOT NULL,
    domain VARCHAR(50) NOT NULL,
    PRIMARY KEY (doi),
    FOREIGN KEY (doi) REFERENCES Paper(doi) ON DELETE CASCADE,
    FOREIGN KEY (c_id) REFERENCES Conference(c_id) ON DELETE CASCADE
);
