USE readit;

-- Insert data into Company table
INSERT INTO Company (company_id, company_name) VALUES 
  ('C1', 'CompanyA'),
  ('C2', 'CompanyB');

-- Insert data into Institution table
INSERT INTO Institution (i_id, i_name) VALUES 
  ('I1', 'InstitutionA'),
  ('I2', 'InstitutionB');

-- Insert data into Researcher table
INSERT INTO Researcher (r_id, email, last_name, passwd) VALUES 
  ('R1', 'researcher1@email.com', 'Smith', 'password1'),
  ('R2', 'researcher2@email.com', 'Johnson', 'password2');

-- Insert data into Paper table
INSERT INTO Paper (doi, no_reads, blob_paper, blob_abstract, title) VALUES 
  ('D1', 100, 'paper_blob_1', 'abstract_blob_1', 'Paper Title 1'),
  ('D2', 75, 'paper_blob_2', 'abstract_blob_2', 'Paper Title 2');

-- Insert data into Conference table
INSERT INTO Conference (c_id, tier, c_name, date_conduct, venue_conduct) VALUES 
  ('Conf1', 1, 'ConferenceA', '2023-01-01', 'VenueA'),
  ('Conf2', 2, 'ConferenceB', '2023-02-01', 'VenueB');

-- Insert data into Company_team table
INSERT INTO Company_team (team_id, company_id, team_name) VALUES 
  ('Team1', 'C1', 'TeamA'),
  ('Team2', 'C2', 'TeamB');

-- Insert data into Department table
INSERT INTO Department (i_id, department_id, domain) VALUES 
  ('I1', 'Dept1', 'DomainA'),
  ('I2', 'Dept2', 'DomainB');

-- Insert data into RWorkinC table
INSERT INTO RWorkinC (role, r_id, team_id, company_id) VALUES 
  ('Role1', 'R1', 'Team1', 'C1'),
  ('Role2', 'R2', 'Team2', 'C2');

-- Insert data into RWorkinI table
INSERT INTO RWorkinI (r_id, i_id, department_id) VALUES 
  ('R1', 'I1', 'Dept1'),
  ('R2', 'I2', 'Dept2');

-- Insert data into Paper_keywords table
INSERT INTO Paper_keywords (keywords, doi) VALUES 
  ('Keyword1', 'D1'),
  ('Keyword2', 'D2');

-- Insert data into Organization table
INSERT INTO Organization (o_id, o_name, c_id) VALUES 
  ('Org1', 'OrganizationA', 'Conf1'),
  ('Org2', 'OrganizationB', 'Conf2');

-- Insert data into Conference_domains table
INSERT INTO Conference_domains (domains, c_id) VALUES 
  ('Domain1', 'Conf1'),
  ('Domain2', 'Conf2');

-- Insert data into Researcher_details table
INSERT INTO Researcher_details (h_index, no_citations, page_visits, date_created, first_name, nationality, r_id) VALUES 
  (10, 50, 100, '2023-01-01', 'John', 'USA', 'R1'),
  (8, 40, 80, '2023-02-01', 'Alice', 'Canada', 'R2');

-- Insert data into Apply_for table
INSERT INTO Apply_for (doi, c_id, date_submitted, accepted) VALUES 
  ('D1', 'Conf1', '2023-03-01', 1),
  ('D2', 'Conf2', '2023-04-01', 0);

-- Insert data into Publish table
INSERT INTO Publish (doi, c_id, date_accepted) VALUES 
  ('D1', 'Conf1', '2023-04-01'),
  ('D2', 'Conf2', '2023-05-01');

-- Insert data into Write1 table
INSERT INTO Write1 (r_id, doi) VALUES 
  ('R1', 'D1'),
  ('R2', 'D2');

