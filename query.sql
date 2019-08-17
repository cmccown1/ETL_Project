-------------------------------------------------------------
--STEP 1: create the database
-------------------------------------------------------------
CREATE DATABASE etl_project

------------------------------------------------------------------------------------
--STEP 2: run all the ETL processes from jupyter notebooks, Python files, etc.
------------------------------------------------------------------------------------
--DROP TABLE abbr;
--DROP TABLE unemployment;
--DROP TABLE complaints;
--DROP VIEW uvwComplaints;

-- test import
SELECT * FROM "State_Abreviation";
SELECT * FROM "GDP";
SELECT * FROM unemployment;
SELECT * FROM complaints;
SELECT * FROM consumer_debt;


-------------------------------------------------------------
-- STEP 3: correct the schema
-- add primary keys
-- convert datatypes where necessary
-------------------------------------------------------------
ALTER TABLE "State_Abreviation" ADD PRIMARY KEY("Abreviation");
ALTER TABLE unemployment ADD PRIMARY KEY("state");
ALTER TABLE complaints ADD PRIMARY KEY("index");

-------------------------------------------------------------
-- LAST STEP: create the view
-------------------------------------------------------------
CREATE VIEW uvwComplaints AS (
	SELECT 
		ab."Abbreviation" AS "state",
		co."State" AS "complaints",
		un.unemployment_rate,
		gd."2018" AS "gpd_per_capita",
		cd."population",
		cd."auto",
		cd."creditcard",
		cd."mortgage",
		cd."studentloan",
		cd."total" AS "total_dept"		
	FROM 
		"State_Abreviation" ab 
		JOIN unemployment un ON UPPER(ab."State") = UPPER(un.State)
		JOIN complaints co ON UPPER(ab."Abbreviation") = UPPER(co.index)
		JOIN "GDP" gd ON UPPER(gd."State")= UPPER(ab."State")
		JOIN "consumer_debt" cd ON UPPER(cd.state) = UPPER(ab."Abbreviation") and cd.year = 2018
		);

-- test the view
SELECT * FROM uvwComplaints ORDER BY "state"
