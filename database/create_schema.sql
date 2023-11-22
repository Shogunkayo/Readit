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
    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

CREATE TABLE Researcher
(
    r_id UUID NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    password BINARY(60) NOT NULL,
    email VARCHAR(20) NOT NULL,
    h_index INT NOT NULL DEFAULT 0,
    no_citations INT NOT NULL DEFAULT 0,
    date_created DATETIME NOT NULL,
    page_visits INT NOT NULL DEFAULT 0,
    nationality INT NOT NULL,
    PRIMARY KEY (r_id),
    UNIQUE (email),
    FOREIGN KEY (nationality) REFERENCES Country(country_id)
);

CREATE TABLE Paper
(
    doi UUID NOT NULL,
    domain VARCHAR(20) NOT NULL,
    blob_paper LONGBLOB NOT NULL,
    blob_abstract MEDIUMBLOB NOT NULL,
    title VARCHAR(20) NOT NULL,
    no_reads INT NOT NULL DEFAULT 0,
    PRIMARY KEY (doi)
);

CREATE TABLE Organization
(
    o_id UUID NOT NULL,
    o_name VARCHAR(20) NOT NULL,
    location VARCHAR(20) NOT NULL,
    PRIMARY KEY (o_id)
);

CREATE TABLE Private_Repository
(
    repo_id UUID NOT NULL,
    repo_name VARCHAR(20) NOT NULL,
    admin_id UUID NOT NULL,
    PRIMARY KEY (repo_id),
    FOREIGN KEY (admin_id) REFERENCES Researcher(r_id)
);

CREATE TABLE University
(
    u_id UUID NOT NULL,
    u_name VARCHAR(20) NOT NULL,
    city_id INT NOT NULL,
    country_id INT NOT NULL,
    accredition VARCHAR(20) NOT NULL,
    graduation_rate INT NOT NULL,
    PRIMARY KEY (u_id),
    FOREIGN KEY (city_id) REFERENCES City(city_id),
    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

CREATE TABLE Company
(
    c_id UUID NOT NULL,
    c_name VARCHAR(20) NOT NULL,
    comp_type ENUM('NGO', 'For Profit', 'Other') NOT NULL,
    industry_sector INT NOT NULL,
    head_city_id INT NOT NULL,
    market_share INT NOT NULL,
    PRIMARY KEY (c_id),
    FOREIGN KEY (head_city_id) REFERENCES City(city_id)
);

CREATE TABLE Department
(
    d_id UUID NOT NULL,
    d_name VARCHAR(20) NOT NULL,
    d_head UUID NOT NULL,
    budget INT NOT NULL DEFAULT 0,
    no_students INT NOT NULL DEFAULT 0,
    u_id UUID NOT NULL,
    PRIMARY KEY (d_id),
    FOREIGN KEY (u_id) REFERENCES University(u_id),
    FOREIGN KEY (d_head) REFERENCES Researcher(r_id)
);

CREATE TABLE Paper_keywords
(
    keyword VARCHAR(20) NOT NULL,
    doi UUID NOT NULL,
    PRIMARY KEY (keyword, doi),
    FOREIGN KEY (doi) REFERENCES Paper(doi)
);

CREATE TABLE University_degrees
(
    degree VARCHAR(20) NOT NULL,
    u_id UUID NOT NULL,
    PRIMARY KEY (degree, u_id),
    FOREIGN KEY (u_id) REFERENCES University(u_id)
);

CREATE TABLE WritePaper
(
    r_id UUID NOT NULL,
    doi UUID NOT NULL,
    PRIMARY KEY (r_id, doi),
    FOREIGN KEY (r_id) REFERENCES Researcher(r_id),
    FOREIGN KEY (doi) REFERENCES Paper(doi)
);

CREATE TABLE Follows
(
    follows UUID NOT NULL,
    follower UUID NOT NULL,
    PRIMARY KEY (follows, follower),
    FOREIGN KEY (follows) REFERENCES Researcher(r_id),
    FOREIGN KEY (follower) REFERENCES Researcher(r_id)
);

CREATE TABLE Belong_To
(
    r_id UUID NOT NULL,
    o_id UUID NOT NULL,
    PRIMARY KEY (r_id),
    FOREIGN KEY (r_id) REFERENCES Researcher(r_id),
    FOREIGN KEY (o_id) REFERENCES Organization(o_id)
);

CREATE TABLE Citations
(
    paper_citing UUID NOT NULL,
    paper_cited UUID NOT NULL,
    PRIMARY KEY (paper_citing, paper_cited),
    FOREIGN KEY (paper_citing) REFERENCES Paper(doi),
    FOREIGN KEY (paper_cited) REFERENCES Paper(doi)
);

CREATE TABLE Publish_Repo
(
    doi UUID NOT NULL,
    repo_id UUID NOT NULL,
    PRIMARY KEY (doi),
    FOREIGN KEY (doi) REFERENCES Paper(doi),
    FOREIGN KEY (repo_id) REFERENCES Private_Repository(repo_id)
);

CREATE TABLE Company_Repo
(
    c_id UUID NOT NULL,
    repo_id UUID NOT NULL,
    PRIMARY KEY (repo_id),
    FOREIGN KEY (c_id) REFERENCES Company(c_id),
    FOREIGN KEY (repo_id) REFERENCES Private_Repository(repo_id)
);

CREATE TABLE University_Repo
(
    repo_id UUID NOT NULL,
    u_id UUID NOT NULL,
    PRIMARY KEY (repo_id),
    FOREIGN KEY (repo_id) REFERENCES Private_Repository(repo_id),
    FOREIGN KEY (u_id) REFERENCES University(u_id)
);

CREATE TABLE Work_Company
(
    r_id UUID NOT NULL,
    c_id UUID NOT NULL,
    PRIMARY KEY (r_id),
    FOREIGN KEY (r_id) REFERENCES Researcher(r_id),
    FOREIGN KEY (c_id) REFERENCES Company(c_id)
);

CREATE TABLE Work_University
(
    r_id UUID NOT NULL,
    d_id UUID NOT NULL,
    PRIMARY KEY (r_id),
    FOREIGN KEY (r_id) REFERENCES Researcher(r_id),
    FOREIGN KEY (d_id) REFERENCES Department(d_id)
);

CREATE TABLE Conference
(
    c_id UUID NOT NULL,
    tier ENUM('Tier 1', 'Tier 2', 'Tier 3', 'Other') NOT NULL,
    c_name VARCHAR(20) NOT NULL,
    date_conduct DATE NOT NULL,
    venue_city_id INT NOT NULL,
    venue_country_id INT NOT NULL,
    o_id UUID NOT NULL,
    PRIMARY KEY (c_id),
    FOREIGN KEY (o_id) REFERENCES Organization(o_id),
    FOREIGN KEY (venue_city_id) REFERENCES City(city_id),
    FOREIGN KEY (venue_country_id) REFERENCES Country(country_id)
);

CREATE TABLE Conference_domains
(
    domain VARCHAR(20) NOT NULL,
    c_id UUID NOT NULL,
    PRIMARY KEY (domain, c_id),
    FOREIGN KEY (c_id) REFERENCES Conference(c_id)
);

CREATE TABLE Publish_Conf
(
    date_published DATETIME NOT NULL,
    doi UUID NOT NULL,
    c_id UUID NOT NULL,
    domain VARCHAR(20) NOT NULL,
    PRIMARY KEY (doi),
    FOREIGN KEY (doi) REFERENCES Paper(doi),
    FOREIGN KEY (c_id) REFERENCES Conference(c_id)
);
