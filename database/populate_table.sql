USE readit;

INSERT INTO Country (country_id, country_name) VALUES
(1, 'USA'),
(2, 'Canada'),
(3, 'United Kingdom'),
(4, 'Germany'),
(5, 'France'),
(6, 'Australia'),
(7, 'Japan'),
(8, 'Brazil'),
(9, 'India'),
(10, 'South Africa');

INSERT INTO City (city_id, city_name, country_id) VALUES
(1, 'New York', 1),
(2, 'Toronto', 2),
(3, 'London', 3),
(4, 'Berlin', 4),
(5, 'Paris', 5),
(6, 'Sydney', 6),
(7, 'Tokyo', 7),
(8, 'Rio de Janeiro', 8),
(9, 'Mumbai', 9),
(10, 'Johannesburg', 10);

-- passwords is password1 for all
INSERT INTO Researcher (r_id, last_name, first_name, password, email, h_index, no_citations, date_created, page_visits, nationality, dob) VALUES
('1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1', 'Smith', 'John', '$2b$12$A.GCY9AXrL.sxN8Dj49YbObHtrEOH5d0UMI7B6AHxlXZlmFNuzAv6', 'john.smith@email.com', 10, '2023-11-23 12:00:00', 50, 1, '2023-11-04'),
('2b8d924a-725e-49ec-aa79-1b6e44e17e34', 'Johnson', 'Emily', '$2b$12$A.GCY9AXrL.sxN8Dj49YbObHtrEOH5d0UMI7B6AHxlXZlmFNuzAv6', 'emily.johnson@email.com', 8,'2023-11-23 12:05:00', 40, 2, '2023-11-04'),
('3c9eab53-62bf-46b5-b86b-3d93321c1e7e', 'Williams', 'David', '$2b$12$A.GCY9AXrL.sxN8Dj49YbObHtrEOH5d0UMI7B6AHxlXZlmFNuzAv6', 'david.williams@email.com', 12, '2023-11-23 12:10:00', 60, 3, '2023-11-04'),
('4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4', 'Müller', 'Anna', '$2b$12$A.GCY9AXrL.sxN8Dj49YbObHtrEOH5d0UMI7B6AHxlXZlmFNuzAv6', 'anna.muller@email.com', 9, '2023-11-23 12:15:00', 45, 4, '2023-11-04'),
('5e2aeb18-59b7-4f7c-b169-8d96f470c5a2', 'Dubois', 'Lucas', '$2b$12$A.GCY9AXrL.sxN8Dj49YbObHtrEOH5d0UMI7B6AHxlXZlmFNuzAv6', 'lucas.dubois@email.com', 11, '2023-11-23 12:20:00', 55, 5, '2023-11-04'),
('6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d', 'Smith', 'Olivia', '$2b$12$A.GCY9AXrL.sxN8Dj49YbObHtrEOH5d0UMI7B6AHxlXZlmFNuzAv6', 'olivia.smith@email.com', 7, '2023-11-23 12:25:00', 35, 6, '2023-11-04'),
('7g0c83b2-1d2e-4a74-9b4b-3286894c70a3', 'Sato', 'Kenji', '$2b$12$A.GCY9AXrL.sxN8Dj49YbObHtrEOH5d0UMI7B6AHxlXZlmFNuzAv6', 'kenji.sato@email.com', 14, '2023-11-23 12:30:00', 70, 7, '2023-11-04'),
('8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8', 'Silva', 'Maria', '$2b$12$A.GCY9AXrL.sxN8Dj49YbObHtrEOH5d0UMI7B6AHxlXZlmFNuzAv6', 'maria.silva@email.com', 13, '2023-11-23 12:35:00', 65, 8, '2023-11-04'),
('9i4d20b8-2a94-429e-9a4a-5769667e1701', 'Reddy', 'Raj', '$2b$12$A.GCY9AXrL.sxN8Dj49YbObHtrEOH5d0UMI7B6AHxlXZlmFNuzAv6', 'raj.reddy@email.com', 6, '2023-11-23 12:40:00', 30, 9, '2023-11-04'),
('10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea', 'Zulu', 'Thabo', '$2b$12$A.GCY9AXrL.sxN8Dj49YbObHtrEOH5d0UMI7B6AHxlXZlmFNuzAv6', 'thabo.zulu@email.com', 5, '2023-11-23 12:45:00', 25, 10, '2023-11-04');

INSERT INTO Paper (doi, domain, paper_url, title, no_reads) VALUES
('1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1', 'Computer Science', '~/sample_files/papers/p1.txt', 'Advanced Algorithms', 50),
('2b8d924a-725e-49ec-aa79-1b6e44e17e34', 'Physics', '~/sample_files/papers/p2.txt', 'Quantum Mechanics', 40),
('3c9eab53-62bf-46b5-b86b-3d93321c1e7e', 'Biology', '~/sample_files/papers/p3.txt', 'Genetic Engineering', 60),
('4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4', 'Engineering', '~/sample_files/papers/p4.txt', 'Civil Infrastructure', 45),
('5e2aeb18-59b7-4f7c-b169-8d96f470c5a2', 'Chemistry', '~/sample_files/papers/p5.txt', 'Organic Synthesis', 55),
('6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d', 'Computer Science', '~/sample_files/papers/p6.txt', 'Machine Learning', 35),
('7g0c83b2-1d2e-4a74-9b4b-3286894c70a3', 'Medicine', '~/sample_files/papers/p7.txt', 'Clinical Trials', 70),
('8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8', 'Social Sciences', '~/sample_files/papers/p8.txt', 'Cultural Impact', 65),
('9i4d20b8-2a94-429e-9a4a-5769667e1701', 'Computer Science', '~/sample_files/papers/p9.txt', 'Software Engineering', 30),
('10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea', 'Environmental Science', '~/sample_files/papers/p10.txt', 'Climate Change', 25);

INSERT INTO Organization (o_id, o_name, location) VALUES
('1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1', 'TechCon', 'New York'),
('2b8d924a-725e-49ec-aa79-1b6e44e17e34', 'SciTech', 'Toronto'),
('3c9eab53-62bf-46b5-b86b-3d93321c1e7e', 'InnoSummit', 'London'),
('4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4', 'EngExpo', 'Berlin'),
('5e2aeb18-59b7-4f7c-b169-8d96f470c5a2', 'TechSymposium', 'Paris'),
('6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d', 'OzTech', 'Sydney'),
('7g0c83b2-1d2e-4a74-9b4b-3286894c70a3', 'TokyoTech', 'Tokyo'),
('8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8', 'BrazilInnovate', 'Rio de Janeiro'),
('9i4d20b8-2a94-429e-9a4a-5769667e1701', 'IndiaTech', 'Mumbai'),
('10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea', 'SAInnovators', 'Johannesburg');

INSERT INTO Priv_Repository (repo_id, repo_name, admin_id) VALUES
('1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1', 'CodeRepo1', '1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1'),
('2b8d924a-725e-49ec-aa79-1b6e44e17e34', 'DataRepo1', '2b8d924a-725e-49ec-aa79-1b6e44e17e34'),
('3c9eab53-62bf-46b5-b86b-3d93321c1e7e', 'AlgorithmRepo', '3c9eab53-62bf-46b5-b86b-3d93321c1e7e'),
('4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4', 'InfrastructureCode', '4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4'),
('5e2aeb18-59b7-4f7c-b169-8d96f470c5a2', 'MLModelsRepo', '5e2aeb18-59b7-4f7c-b169-8d96f470c5a2'),
('6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d', 'AppDevelopmentRepo', '6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d'),
('7g0c83b2-1d2e-4a74-9b4b-3286894c70a3', 'MedicalResearchRepo', '7g0c83b2-1d2e-4a74-9b4b-3286894c70a3'),
('8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8', 'SocialStudiesRepo', '8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8'),
('9i4d20b8-2a94-429e-9a4a-5769667e1701', 'SoftwareEngineeringRepo', '9i4d20b8-2a94-429e-9a4a-5769667e1701'),
('10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea', 'EnvironmentalResearchRepo', '10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea');

INSERT INTO University (u_id, u_name, city_id, country_id, accredition, graduation_rate) VALUES
('1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1', 'Tech University', 1, 1, 'ABET', 80),
('2b8d924a-725e-49ec-aa79-1b6e44e17e34', 'Science Institute', 2, 2, 'CIC', 75),
('3c9eab53-62bf-46b5-b86b-3d93321c1e7e', 'Innovation College', 3, 3, 'AACSB', 85),
('4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4', 'Engineering School', 4, 4, 'ASIIN', 78),
('5e2aeb18-59b7-4f7c-b169-8d96f470c5a2', 'Tech Academy', 5, 5, 'ABET', 82),
('6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d', 'Digital Institute', 6, 6, 'TEQSA', 79),
('7g0c83b2-1d2e-4a74-9b4b-3286894c70a3', 'Medical University', 7, 7, 'JUAA', 87),
('8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8', 'Social Studies College', 8, 8, 'CAPES', 80),
('9i4d20b8-2a94-429e-9a4a-5769667e1701', 'Software Engineering Institute', 9, 9, 'NAAC', 75),
('10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea', 'Environmental Research University', 10, 10, 'HESA', 78);

INSERT INTO Company (c_id, c_name, comp_type, industry_sector, head_city_id, market_share) VALUES
('1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1', 'TechCorp', 'For Profit', 1, 1, 20),
('2b8d924a-725e-49ec-aa79-1b6e44e17e34', 'EcoSolutions', 'For Profit', 2, 2, 15),
('3c9eab53-62bf-46b5-b86b-3d93321c1e7e', 'InnoTech', 'For Profit', 3, 3, 25),
('4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4', 'GreenEng', 'For Profit', 4, 4, 18),
('5e2aeb18-59b7-4f7c-b169-8d96f470c5a2', 'DataSolutions', 'For Profit', 5, 5, 22),
('6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d', 'TechInnovators', 'For Profit', 6, 6, 19),
('7g0c83b2-1d2e-4a74-9b4b-3286894c70a3', 'MedResearchCorp', 'For Profit', 7, 7, 28),
('8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8', 'SocImpactInc', 'NGO', 8, 8, 20),
('9i4d20b8-2a94-429e-9a4a-5769667e1701', 'SoftSolutions', 'For Profit', 9, 9, 15),
('10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea', 'EnviroTech', 'For Profit', 10, 10, 18);

INSERT INTO Department (d_id, d_name, d_head, budget, no_students, u_id) VALUES
('1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1', 'Computer Science', '1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1', 100000, 500, '1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1'),
('2b8d924a-725e-49ec-aa79-1b6e44e17e34', 'Physics', '2b8d924a-725e-49ec-aa79-1b6e44e17e34', 90000, 450, '2b8d924a-725e-49ec-aa79-1b6e44e17e34'),
('3c9eab53-62bf-46b5-b86b-3d93321c1e7e', 'Biology', '3c9eab53-62bf-46b5-b86b-3d93321c1e7e', 120000, 600, '3c9eab53-62bf-46b5-b86b-3d93321c1e7e'),
('4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4', 'Engineering', '4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4', 110000, 550, '4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4'),
('5e2aeb18-59b7-4f7c-b169-8d96f470c5a2', 'Chemistry', '5e2aeb18-59b7-4f7c-b169-8d96f470c5a2', 95000, 475, '5e2aeb18-59b7-4f7c-b169-8d96f470c5a2'),
('6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d', 'Computer Engineering', '6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d', 105000, 525, '6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d'),
('7g0c83b2-1d2e-4a74-9b4b-3286894c70a3', 'Medicine', '7g0c83b2-1d2e-4a74-9b4b-3286894c70a3', 130000, 650, '7g0c83b2-1d2e-4a74-9b4b-3286894c70a3'),
('8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8', 'Social Studies', '8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8', 120000, 600, '8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8'),
('9i4d20b8-2a94-429e-9a4a-5769667e1701', 'Software Engineering', '9i4d20b8-2a94-429e-9a4a-5769667e1701', 100000, 500, '9i4d20b8-2a94-429e-9a4a-5769667e1701'),
('10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea', 'Environmental Science', '10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea', 110000, 550, '10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea');

INSERT INTO Paper_keywords (keyword, doi) VALUES
('Algorithm', '1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1'),
('Quantum', '2b8d924a-725e-49ec-aa79-1b6e44e17e34'),
('Genetics', '3c9eab53-62bf-46b5-b86b-3d93321c1e7e'),
('Infrastructure', '4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4'),
('Organic Chemistry', '5e2aeb18-59b7-4f7c-b169-8d96f470c5a2'),
('Machine Learning', '6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d'),
('Clinical Trials', '7g0c83b2-1d2e-4a74-9b4b-3286894c70a3'),
('Cultural Impact', '8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8'),
('Software Engineering', '9i4d20b8-2a94-429e-9a4a-5769667e1701'),
('Climate Change', '10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea');

INSERT INTO University_degrees (degree, u_id) VALUES
('Computer Science', '1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1'),
('Physics', '2b8d924a-725e-49ec-aa79-1b6e44e17e34'),
('Biology', '3c9eab53-62bf-46b5-b86b-3d93321c1e7e'),
('Engineering', '4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4'),
('Chemistry', '5e2aeb18-59b7-4f7c-b169-8d96f470c5a2'),
('Computer Engineering', '6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d'),
('Medicine', '7g0c83b2-1d2e-4a74-9b4b-3286894c70a3'),
('Social Studies', '8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8'),
('Software Engineering', '9i4d20b8-2a94-429e-9a4a-5769667e1701'),
('Environmental Science', '10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea');

INSERT INTO WritePaper (r_id, doi) VALUES
('1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1', '1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1'),
('2b8d924a-725e-49ec-aa79-1b6e44e17e34', '2b8d924a-725e-49ec-aa79-1b6e44e17e34'),
('3c9eab53-62bf-46b5-b86b-3d93321c1e7e', '3c9eab53-62bf-46b5-b86b-3d93321c1e7e'),
('4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4', '4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4'),
('5e2aeb18-59b7-4f7c-b169-8d96f470c5a2', '5e2aeb18-59b7-4f7c-b169-8d96f470c5a2'),
('6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d', '6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d'),
('7g0c83b2-1d2e-4a74-9b4b-3286894c70a3', '7g0c83b2-1d2e-4a74-9b4b-3286894c70a3'),
('8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8', '8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8'),
('9i4d20b8-2a94-429e-9a4a-5769667e1701', '9i4d20b8-2a94-429e-9a4a-5769667e1701'),
('10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea', '10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea');

INSERT INTO Follows (follows, follower) VALUES
('1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1', '2b8d924a-725e-49ec-aa79-1b6e44e17e34'),
('2b8d924a-725e-49ec-aa79-1b6e44e17e34', '3c9eab53-62bf-46b5-b86b-3d93321c1e7e'),
('3c9eab53-62bf-46b5-b86b-3d93321c1e7e', '4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4'),
('4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4', '5e2aeb18-59b7-4f7c-b169-8d96f470c5a2'),
('5e2aeb18-59b7-4f7c-b169-8d96f470c5a2', '6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d'),
('6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d', '7g0c83b2-1d2e-4a74-9b4b-3286894c70a3'),
('7g0c83b2-1d2e-4a74-9b4b-3286894c70a3', '8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8'),
('8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8', '9i4d20b8-2a94-429e-9a4a-5769667e1701'),
('9i4d20b8-2a94-429e-9a4a-5769667e1701', '10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea'),
('10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea', '1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1');

INSERT INTO Belong_To (r_id, o_id) VALUES
('1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1', '1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1'),
('2b8d924a-725e-49ec-aa79-1b6e44e17e34', '2b8d924a-725e-49ec-aa79-1b6e44e17e34'),
('3c9eab53-62bf-46b5-b86b-3d93321c1e7e', '3c9eab53-62bf-46b5-b86b-3d93321c1e7e'),
('4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4', '4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4'),
('5e2aeb18-59b7-4f7c-b169-8d96f470c5a2', '5e2aeb18-59b7-4f7c-b169-8d96f470c5a2'),
('6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d', '6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d'),
('7g0c83b2-1d2e-4a74-9b4b-3286894c70a3', '7g0c83b2-1d2e-4a74-9b4b-3286894c70a3'),
('8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8', '8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8'),
('9i4d20b8-2a94-429e-9a4a-5769667e1701', '9i4d20b8-2a94-429e-9a4a-5769667e1701'),
('10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea', '10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea');

INSERT INTO Citations (paper_citing, paper_cited) VALUES
('1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1', '2b8d924a-725e-49ec-aa79-1b6e44e17e34'),
('2b8d924a-725e-49ec-aa79-1b6e44e17e34', '3c9eab53-62bf-46b5-b86b-3d93321c1e7e'),
('3c9eab53-62bf-46b5-b86b-3d93321c1e7e', '4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4'),
('4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4', '5e2aeb18-59b7-4f7c-b169-8d96f470c5a2'),
('5e2aeb18-59b7-4f7c-b169-8d96f470c5a2', '6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d'),
('6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d', '7g0c83b2-1d2e-4a74-9b4b-3286894c70a3'),
('7g0c83b2-1d2e-4a74-9b4b-3286894c70a3', '8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8'),
('8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8', '9i4d20b8-2a94-429e-9a4a-5769667e1701'),
('9i4d20b8-2a94-429e-9a4a-5769667e1701', '10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea'),
('10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea', '1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1');

INSERT INTO Publish_Repo (doi, repo_id) VALUES
('1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1', '1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1'),
('2b8d924a-725e-49ec-aa79-1b6e44e17e34', '2b8d924a-725e-49ec-aa79-1b6e44e17e34'),
('3c9eab53-62bf-46b5-b86b-3d93321c1e7e', '3c9eab53-62bf-46b5-b86b-3d93321c1e7e'),
('4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4', '4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4'),
('5e2aeb18-59b7-4f7c-b169-8d96f470c5a2', '5e2aeb18-59b7-4f7c-b169-8d96f470c5a2'),
('6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d', '6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d'),
('7g0c83b2-1d2e-4a74-9b4b-3286894c70a3', '7g0c83b2-1d2e-4a74-9b4b-3286894c70a3'),
('8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8', '8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8'),
('9i4d20b8-2a94-429e-9a4a-5769667e1701', '9i4d20b8-2a94-429e-9a4a-5769667e1701'),
('10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea', '10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea');

INSERT INTO Company_Repo (c_id, repo_id) VALUES
('1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1', '1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1'),
('2b8d924a-725e-49ec-aa79-1b6e44e17e34', '2b8d924a-725e-49ec-aa79-1b6e44e17e34'),
('3c9eab53-62bf-46b5-b86b-3d93321c1e7e', '3c9eab53-62bf-46b5-b86b-3d93321c1e7e'),
('4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4', '4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4'),
('5e2aeb18-59b7-4f7c-b169-8d96f470c5a2', '5e2aeb18-59b7-4f7c-b169-8d96f470c5a2'),
('6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d', '6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d'),
('7g0c83b2-1d2e-4a74-9b4b-3286894c70a3', '7g0c83b2-1d2e-4a74-9b4b-3286894c70a3'),
('8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8', '8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8'),
('9i4d20b8-2a94-429e-9a4a-5769667e1701', '9i4d20b8-2a94-429e-9a4a-5769667e1701'),
('10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea', '10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea');

INSERT INTO University_Repo (repo_id, u_id) VALUES
('1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1', '1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1'),
('2b8d924a-725e-49ec-aa79-1b6e44e17e34', '2b8d924a-725e-49ec-aa79-1b6e44e17e34'),
('3c9eab53-62bf-46b5-b86b-3d93321c1e7e', '3c9eab53-62bf-46b5-b86b-3d93321c1e7e'),
('4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4', '4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4'),
('5e2aeb18-59b7-4f7c-b169-8d96f470c5a2', '5e2aeb18-59b7-4f7c-b169-8d96f470c5a2'),
('6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d', '6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d'),
('7g0c83b2-1d2e-4a74-9b4b-3286894c70a3', '7g0c83b2-1d2e-4a74-9b4b-3286894c70a3'),
('8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8', '8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8'),
('9i4d20b8-2a94-429e-9a4a-5769667e1701', '9i4d20b8-2a94-429e-9a4a-5769667e1701'),
('10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea', '10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea');

INSERT INTO Work_Company (r_id, c_id) VALUES
('1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1', '1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1'),
('2b8d924a-725e-49ec-aa79-1b6e44e17e34', '2b8d924a-725e-49ec-aa79-1b6e44e17e34'),
('3c9eab53-62bf-46b5-b86b-3d93321c1e7e', '3c9eab53-62bf-46b5-b86b-3d93321c1e7e'),
('4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4', '4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4'),
('5e2aeb18-59b7-4f7c-b169-8d96f470c5a2', '5e2aeb18-59b7-4f7c-b169-8d96f470c5a2'),
('6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d', '6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d'),
('7g0c83b2-1d2e-4a74-9b4b-3286894c70a3', '7g0c83b2-1d2e-4a74-9b4b-3286894c70a3'),
('8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8', '8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8'),
('9i4d20b8-2a94-429e-9a4a-5769667e1701', '9i4d20b8-2a94-429e-9a4a-5769667e1701'),
('10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea', '10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea');

INSERT INTO Work_University (r_id, d_id) VALUES
('1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1', '1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1'),
('2b8d924a-725e-49ec-aa79-1b6e44e17e34', '2b8d924a-725e-49ec-aa79-1b6e44e17e34'),
('3c9eab53-62bf-46b5-b86b-3d93321c1e7e', '3c9eab53-62bf-46b5-b86b-3d93321c1e7e'),
('4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4', '4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4'),
('5e2aeb18-59b7-4f7c-b169-8d96f470c5a2', '5e2aeb18-59b7-4f7c-b169-8d96f470c5a2'),
('6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d', '6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d'),
('7g0c83b2-1d2e-4a74-9b4b-3286894c70a3', '7g0c83b2-1d2e-4a74-9b4b-3286894c70a3'),
('8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8', '8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8'),
('9i4d20b8-2a94-429e-9a4a-5769667e1701', '9i4d20b8-2a94-429e-9a4a-5769667e1701'),
('10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea', '10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea');

INSERT INTO Conference (c_id, tier, c_name, date_conduct, venue_city_id, venue_country_id, o_id) VALUES
('1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1', 'Tier 1', 'Conference 1', '2023-01-01', 1, 1, '1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1'),
('2b8d924a-725e-49ec-aa79-1b6e44e17e34', 'Tier 2', 'Conference 2', '2023-02-01', 2, 2, '2b8d924a-725e-49ec-aa79-1b6e44e17e34'),
('3c9eab53-62bf-46b5-b86b-3d93321c1e7e', 'Tier 3', 'Conference 3', '2023-03-01', 3, 3, '3c9eab53-62bf-46b5-b86b-3d93321c1e7e'),
('4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4', 'Tier 1', 'Conference 4', '2023-04-01', 4, 4, '4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4'),
('5e2aeb18-59b7-4f7c-b169-8d96f470c5a2', 'Other', 'Conference 5', '2023-05-01', 5, 5, '5e2aeb18-59b7-4f7c-b169-8d96f470c5a2'),
('6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d', 'Tier 2', 'Conference 6', '2023-06-01', 6, 6, '6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d'),
('7g0c83b2-1d2e-4a74-9b4b-3286894c70a3', 'Tier 3', 'Conference 7', '2023-07-01', 7, 7, '7g0c83b2-1d2e-4a74-9b4b-3286894c70a3'),
('8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8', 'Tier 1', 'Conference 8', '2023-08-01', 8, 8, '8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8'),
('9i4d20b8-2a94-429e-9a4a-5769667e1701', 'Tier 2', 'Conference 9', '2023-09-01', 9, 9, '9i4d20b8-2a94-429e-9a4a-5769667e1701'),
('10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea', 'Tier 3', 'Conference 10', '2023-10-01', 10, 10, '10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea');

INSERT INTO Conference_domains (domain, c_id) VALUES
('Domain 1', '1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1'),
('Domain 2', '2b8d924a-725e-49ec-aa79-1b6e44e17e34'),
('Domain 3', '3c9eab53-62bf-46b5-b86b-3d93321c1e7e'),
('Domain 4', '4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4'),
('Domain 5', '5e2aeb18-59b7-4f7c-b169-8d96f470c5a2'),
('Domain 6', '6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d'),
('Domain 7', '7g0c83b2-1d2e-4a74-9b4b-3286894c70a3'),
('Domain 8', '8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8'),
('Domain 9', '9i4d20b8-2a94-429e-9a4a-5769667e1701'),
('Domain 10', '10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea');

INSERT INTO Publish_Conf (date_published, doi, c_id, domain) VALUES
('2023-01-15 12:00:00', '1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1', '1a7c813f-13b2-4f4d-bb79-6d8dc23f28a1', 'Domain 1'),
('2023-02-15 12:00:00', '2b8d924a-725e-49ec-aa79-1b6e44e17e34', '2b8d924a-725e-49ec-aa79-1b6e44e17e34', 'Domain 2'),
('2023-03-15 12:00:00', '3c9eab53-62bf-46b5-b86b-3d93321c1e7e', '3c9eab53-62bf-46b5-b86b-3d93321c1e7e', 'Domain 3'),
('2023-04-15 12:00:00', '4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4', '4d6f2739-3e2e-4b5c-bb3a-5bf9402e2bc4', 'Domain 4'),
('2023-05-15 12:00:00', '5e2aeb18-59b7-4f7c-b169-8d96f470c5a2', '5e2aeb18-59b7-4f7c-b169-8d96f470c5a2', 'Domain 5'),
('2023-06-15 12:00:00', '6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d', '6f1b6987-4f8a-4965-9e9a-4e45a2d7b12d', 'Domain 6'),
('2023-07-15 12:00:00', '7g0c83b2-1d2e-4a74-9b4b-3286894c70a3', '7g0c83b2-1d2e-4a74-9b4b-3286894c70a3', 'Domain 7'),
('2023-08-15 12:00:00', '8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8', '8h8e20f3-93c1-462e-9aef-2b1ed80ff9e8', 'Domain 8'),
('2023-09-15 12:00:00', '9i4d20b8-2a94-429e-9a4a-5769667e1701', '9i4d20b8-2a94-429e-9a4a-5769667e1701', 'Domain 9'),
('2023-10-15 12:00:00', '10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea', '10j6c7c1-0e92-4cb7-a184-9fbd9f1d19ea', 'Domain 10');
