CREATE DATABASE readit;
USE readit;

CREATE TABLE Company(
            company_id varchar(15),
            company_name varchar(30),
            PRIMARY KEY (company_id));

CREATE TABLE Institution(
            i_id varchar(15),
            i_name varchar(30),
            PRIMARY KEY (i_id));

CREATE TABLE Researcher(
            r_id varchar(15),
            email nvarchar(30),
            last_name varchar(30),
            passwd varchar(30),
            PRIMARY KEY (r_id));

CREATE TABLE Paper(
            doi varchar(15),
            no_reads int,
            blob_paper blob,
            blob_abstract blob,
            title varchar(30),
            PRIMARY KEY (doi));

CREATE TABLE Conference(
            c_id varchar(15),
            tier int,
            c_name varchar(30),
            date_conduct date,
            venue_conduct varchar(40),
            PRIMARY KEY (c_id));

CREATE TABLE Company_team(
            team_id varchar(15),
            company_id varchar(15),
            team_name varchar(30),
            PRIMARY KEY (team_id, company_id),
            FOREIGN KEY (company_id) REFERENCES Company(company_id));

CREATE TABLE Department(
            i_id varchar(15),
            department_id varchar(15),
            domain varchar(30),
            PRIMARY KEY (i_id, department_id),
            FOREIGN KEY (i_id) REFERENCES Institution(i_id));

CREATE TABLE RWorkinC(
            role varchar(30),
            r_id varchar(15),
            team_id varchar(15),
            company_id varchar(15),
            FOREIGN KEY (team_id, company_id) REFERENCES Company_team(team_id, company_id),
            FOREIGN KEY (r_id) REFERENCES Researcher(r_id));

CREATE TABLE RWorkinI(
            r_id varchar(15),
            i_id varchar(15),
            department_id varchar(15),
            FOREIGN KEY (r_id) REFERENCES Researcher(r_id),
            FOREIGN KEY (i_id, department_id) REFERENCES Department(i_id, department_id));

CREATE TABLE Paper_keywords(
            keywords varchar(30),
            doi varchar(15),
            PRIMARY KEY (keywords, doi),
            FOREIGN KEY (doi) REFERENCES Paper(doi));

CREATE TABLE Organization(
            o_id varchar(15),
            o_name varchar(30),
            c_id varchar(15),
            PRIMARY KEY (o_id),
            FOREIGN KEY (c_id) REFERENCES Conference(c_id));

CREATE TABLE Conference_domains(
            domains varchar(30),
            c_id varchar(15),
            PRIMARY KEY (domains, c_id),
            FOREIGN KEY (c_id) REFERENCES Conference(c_id));

CREATE TABLE Researcher_details(
            h_index int,
            no_citations int,
            page_visits int,
            date_created date,
            first_name varchar(30),
            nationality varchar(30),
            r_id varchar(15),
            FOREIGN KEY (r_id) REFERENCES Researcher(r_id));

CREATE TABLE Apply_for(
            doi varchar(15),
            c_id varchar(15),
            date_submitted date,
            accepted bit,
            PRIMARY KEY (doi, c_id),
            FOREIGN KEY (doi) REFERENCES Paper(doi),
            FOREIGN KEY (c_id) REFERENCES Conference(c_id));

CREATE TABLE Publish(
            doi varchar(15),
            c_id varchar(15),
            date_accepted date,
            PRIMARY KEY (doi, c_id),
            FOREIGN KEY (doi) REFERENCES Paper(doi),
            FOREIGN KEY (c_id) REFERENCES Conference(c_id));
            
CREATE TABLE Write1(
            r_id varchar(15),
            doi varchar(15),
            PRIMARY KEY (r_id, doi),
            FOREIGN KEY (r_id) REFERENCES Researcher(r_id),
            FOREIGN KEY (doi) REFERENCES Paper(doi));
