/* CREATE DATABASE: Human Resources */

/* IMPORTING DATA */
--CREATE TABLE Public.HR(id varchar(20), first_name varchar(100), last_name varchar(100), birthdate date, gender varchar(100), race varchar(100), department varchar(100), jobtitle varchar(100), location varchar(100), hire_date date, termdate date, location_city varchar(100), location_state varchar(100))
--COPY Public.HR FROM 'C:\Users\user\Downloads\Human Resources.csv' DELIMITER ',' CSV HEADER;

/* CONFIRM TABLE*/
--SELECT *
--FROM HR

/*CHANGE Id to Employee_Id*/
--ALTER TABLE HR
--RENAME COLUMN Id
--TO Employee_Id;

/* CHANGE DATA TYPES (termdate)*/
--UPDATE "HR"
--SET termdate=date_format(termdate, %Y-%m-%d)

--ALTER TABLE HR
--DROP COLUMN age;

/*ADD AGE COLUMN*/
--ALTER TABLE HR
--ADD COLUMN age INT;

/*POPULATE AGE COLUMN*/
--UPDATE HR
--SET age = EXTRACT(YEAR FROM age(CURRENT_DATE, birthdate));

/*CORRECTING AGE ERROR*/
--SELECT 
 --MIN(age) AS youngest,
 --MAX(age) AS Oldest
--FROM HR;

--SELECT count(*) 
--FROM HR 
--WHERE age < 18;

--QUESTIONS 
--1. What is the gender breakdown of employees in the company?
--SELECT gender, COUNT(*) AS gender_count
--FROM HR 
--WHERE age >= 18 AND termdate IS NULL
--GROUP BY gender;

--2. What is the race/ethnicity of employees in the company?
--SELECT race, COUNT(*) AS race_count
--FROM HR 
--WHERE hr.age >= 18 AND hr.termdate IS NULL
--GROUP BY race
--ORDER BY race_count DESC;

--3. What is the age distribution of employees in the company
--SELECT 
 --MIN(age) AS youngest,
 --MAX(age) AS oldest
--FROM HR 
--WHERE hr.age >= 18 AND hr.termdate IS NULL;
 
--SELECT 
 --CASE
  --WHEN age >=18 AND age <=24 THEN '18-24'
  --WHEN age >=25 AND age <=34 THEN '25-34'
  --WHEN age >=35 AND age <=44 THEN '35-44'
  --WHEN age >=45 AND age <=54 THEN '45-54'
  --WHEN age >=55 AND age <=64 THEN '55-64'
  --ELSE '65+'
 --END AS age_group,
--COUNT(*) AS age_count
--FROM HR 
--WHERE age >= 18 AND termdate IS NULL
--GROUP BY age_group
--ORDER BY age_group;

--4.How many employees works at headquarters versus remote location?
--SELECT location, COUNT(*) AS location_count
 --FROM HR 
 --WHERE age >= 18 AND termdate IS NULL
 --GROUP BY location
 --ORDER BY location_count DESC;

--5. What is the average lenght of employment for employees who has been terminated?
--SELECT ROUND(AVG(CAST(termdate - hire_date AS NUMERIC))/365,0) AS average_days
--FROM HR
--WHERE Termdate <= CURRENT_DATE AND termdate IS NOT NULL AND age >= 18;

--6. How does the gender distribution vary across department and job titles?
--SELECT department, gender, COUNT(*) AS count
--FROM HR
--WHERE age >= 18 AND termdate IS NULL
--GROUP BY gender, department
--ORDER BY department

--SELECT jobtitle, gender, COUNT(*) AS count
--FROM HR
--WHERE age >= 18 AND termdate IS NULL
--GROUP BY gender, jobtitle
--ORDER BY jobtitle;

--7. What is the distribution of job title in the company?
--SELECT jobtitle, COUNT(*) AS count
--FROM HR
--WHERE age >= 18 AND termdate IS NULL
--GROUP BY jobtitle
--ORDER BY jobtitle DESC;

--8. Which departments has the highest turnover rate?
--SELECT department, total_count, terminated_count, ROUND(terminated_count*1.0/total_count, 4) AS turnover_rate
--FROM 
--(SELECT department, COUNT(*) AS total_count, 
 --SUM(CASE
 -- WHEN termdate <= CURRENT_DATE AND termdate IS NOT NULL THEN 1 ELSE 0 END) AS terminated_count 
 --FROM HR
--WHERE age >= 18
--GROUP BY department) AS subquery
--ORDER BY turnover_rate DESC;
              
			    --OR(without terminated_count column )

--SELECT 
 --department, 
 --COUNT(*) AS total_count, 
 --SUM(CASE
  --WHEN termdate <= CURRENT_DATE AND termdate IS NOT NULL THEN 1 ELSE 0 END)*1.0/COUNT(*) AS terminated_rate
--FROM HR
--WHERE age >= 18
--GROUP BY department
--ORDER BY terminated_rate DESC;

--9.What is the distribution of employees across location by city and states?
--SELECT location_state, COUNT(*) AS state_count
--FROM HR
--WHERE age >= 18 AND termdate IS NULL
--GROUP BY location_state
--ORDER BY state_count DESC;

--SELECT location_city, COUNT(*) AS city_count
--FROM HR
--WHERE age >= 18 AND termdate IS NULL
--GROUP BY location_city
--ORDER BY city_count DESC;

--10. How has the company's empoyees count changed over time based on hire and term date?
--SELECT year, hire_count, terminated_count, hire_count-terminated_count AS net_change, ROUND((hire_count-terminated_count)*100/hire_count, 1) AS net_change_percent
--FROM (
--SELECT EXTRACT(YEAR FROM hire_date) AS year, COUNT(*) AS hire_count, SUM(CASE WHEN termdate <= CURRENT_DATE AND termdate IS NOT NULL THEN 1 ELSE 0 END) AS terminated_count
--FROM HR
--WHERE age >= 18
--GROUP BY EXTRACT(YEAR FROM hire_date)) AS subquery
--ORDER BY year;

--11. What is the tenure distribution for each department?
--SELECT department, ROUND(AVG(CAST(termdate-hire_date AS NUMERIC)/365),0) AS avg_tenure
--FROM HR
--WHERE age >= 18 AND termdate IS NOT NULL AND termdate <= CURRENT_DATE
--GROUP BY department;