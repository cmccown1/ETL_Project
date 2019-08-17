-------------------------------------------------------------
--STEP 1: create the database
-------------------------------------------------------------
CREATE DATABASE etl_project

-------------------------------------------------------------
--STEP 2: run all the ETL processes from jupyter notebooks, Python files, etc.
-------------------------------------------------------------
--DROP TABLE abbr;
--DROP TABLE unemployment;
--DROP TABLE complaints;
--DROP VIEW uvwComplaints;

-- test import
SELECT * FROM abbr; --replace this with Mohamed's version
SELECT * FROM unemployment;
SELECT * FROM complaints;


-------------------------------------------------------------
-- STEP 3: correct the schema
-- add primary keys
-- convert datatypes where necessary
-------------------------------------------------------------
ALTER TABLE abbr ADD PRIMARY KEY("abbr");
ALTER TABLE unemployment ADD PRIMARY KEY("state");
ALTER TABLE complaints ADD PRIMARY KEY("index");

-------------------------------------------------------------
-- LAST STEP: create the view
-------------------------------------------------------------
CREATE VIEW uvwComplaints AS (
	SELECT 
		ab.abbr AS "state",
		co."State" AS "complaints",
		un.unemployment_rate
	FROM 
		abbr ab 
		JOIN unemployment un ON ab.State = un.State
		JOIN complaints co ON ab.abbr = co.index
	);

-- test the view
SELECT * FROM uvwComplaints ORDER BY "state"
