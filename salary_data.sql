/* IMPORT DATA*/
--CREATE TABLE Public.salaries(Job_Title varchar(50), Employment_Type varchar(20), Experience_Level varchar (20), Expertise_Level varchar(20), Salary int, Salary_Currency varchar(50), Company_Location varchar(50), Salary_in_USD int, Employee_Residence varchar(50), Company_Size varchar(20), Year int)
--COPY Public.salaries FROM 'C:\Users\user\Desktop\v5_Latest_Data_Science_Salaries (1).csv' DELIMITER ',' CSV HEADER;

/*CONFIRM DATA IMPORT*/
--SELECT *
--FROM salaries

/*KPI/METRICS*/
--1. What is the average salary in USD across all rows?
--SELECT ROUND(AVG(salary_in_usd),0) AS Average_salary_in_usd
--FROM salaries;

--2. What is the salary range in the dataset for each job title corresponds to it?
--SELECT job_title, MIN(salary_in_usd) AS Min_salary_in_usd, MAX(salary_in_usd) AS Max_salary_in_usd
--FROM salaries
--WHERE job_title <> 'Others'
--GROUP BY job_title
--ORDER BY Min_salary_in_usd,Max_salary_in_usd DESC ;

--3. Average Salary by Job Title
--SELECT job_title, ROUND(AVG(salary_in_usd),0) AS Average_salary_in_usd
--FROM salaries
--GROUP BY job_title
--ORDER BY Average_salary_in_usd DESC;

--4. Salary Distribution by Employment Types
--SELECT
    --employment_type,
    --COUNT(*) as count_of_employees,
    --MIN(salary_in_usd) as min_salary_in_usd,
    --MAX(salary_in_usd) as max_salary_in_usd,
    --ROUND(AVG(salary_in_usd), 2) as average_salary_in_usd,
    --PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY salary_in_usd) as percentile_25,
    --PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY salary_in_usd) as median_salary,
    --PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY salary_in_usd) as percentile_75
--FROM salaries
--GROUP BY employment_type
--ORDER BY employment_type;

--5. Salary Distribution by Expertise Level
--SELECT
    --expertise_level,
    --COUNT(*) as count_of_employees,
    --MIN(salary_in_usd) as min_salary_in_usd,
    --MAX(salary_in_usd) as max_salary_in_usd,
    --ROUND(AVG(salary_in_usd), 2) as average_salary_in_usd,
    --PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY salary_in_usd) as percentile_25,
    --PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY salary_in_usd) as median_salary,
    --PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY salary_in_usd) as percentile_75
--FROM salaries
--GROUP BY expertise_level
--ORDER BY expertise_level;


--6. What is the most common salary currency in the dataset?
--SELECT salary_currency, COUNT(*) AS currency_count
--FROM salaries
--GROUP BY salary_currency
--ORDER BY currency_count DESC;

--7. Salary by Experience Level 
--SELECT Experience_level, COUNT(*), ROUND(AVG(salary_in_usd), 2) as avg_salary_in_usd_by_Exp_level 
--FROM salaries
--GROUP BY Experience_level
--ORDER BY avg_salary_in_usd_by_Exp_level DESC;

--8. Salary by Company Location
--SELECT company_location, COUNT(*) AS count, ROUND(AVG(salary_in_usd), 2) as avg_salary_in_usd_by_comp_location
--FROM salaries
--GROUP BY company_location
--ORDER BY count DESC;

--9. Salary by Company Size
--SELECT company_size, COUNT(*) AS count, ROUND(AVG(salary_in_usd), 2) as avg_salary_in_usd_by_company_size, MIN(salary_in_usd) as min_salary_in_usd,
    --MAX(salary_in_usd) as max_salary_in_usd
--FROM salaries
--GROUP BY company_size
--ORDER BY count DESC;

--10. Salary by Employee Residence, first 15 residence.
--SELECT employee_residence, COUNT(*) AS count, ROUND(AVG(salary_in_usd), 2) as avg_salary_in_usd_by_company_size, MIN(salary_in_usd) as min_salary_in_usd,
    --MAX(salary_in_usd) as max_salary_in_usd
--FROM salaries
--GROUP BY employee_residence
--ORDER BY count DESC
--LIMIT 15;

--11. Number of employess by company size and expertise level
--SELECT company_size, expertise_level, COUNT(*) AS count
--FROM salaries
--GROUP BY company_size, expertise_level
--ORDER BY company_size, count DESC ;

--12. salary trend over time time trend for different job titles
--SELECT year, job_title, SUM(salary_in_usd) AS salary 
--FROM salaries
--GROUP BY year, job_title 
--ORDER BY year, job_title 

--SELECT year, job_title, COUNT(salary_in_usd) AS salary 
--FROM salaries
--GROUP BY year, job_title 
--ORDER BY year, job_title 


Question: What is the average salary in USD across all rows?
Question: What is the highest salary in the dataset and which job title corresponds to it?
Question: How many employees work in Canada?
Question: What is the median salary for Entry-level positions?
Question: What is the most common salary currency in the dataset?
Question: What is the average salary for Senior-level positions?
Question: How many employees work in Large companies?
Question: What is the total salary expenditure in 2023?
Question: What is the lowest salary in the dataset and which job title corresponds to it?
Question: How many employees have Full-Time employment type?
Question: What is the highest salary in USD for employees residing in the United States?
Question: What is the average salary for employees in Medium-sized companies?
Question: How many employees are in Small companies and have Expert-level expertise?
Question: What is the total salary expenditure in Euro for employees in Italy?
Question: What is the total salary expenditure for Contract positions in 2020?
Question: What is the average salary for Senior-level employees in Germany?
Question: What is the average salary in USD for employees with Expert-level expertise who work in Small-sized companies in Italy?
Question: How many employees have Expert-level expertise and work in the United States?
Question: What is the average salary for employees who work in companies with Small and Medium sizes?
Question: How many employees have Entry-level experience in Small-sized companies in Italy and work in Germany?
Question: How many unique job titles are there for employees who work in Full-Time positions in the United States?
Question: What is the average salary in USD for employees with Senior-level expertise who work in Medium-sized companies in the United States?
Question: What is the percentage of employees who work in Large-sized companies?
Question: What is the salary range for Machine Learning Engineers in the United States?
Question: How many employees work in companies with Small size and have Expert-level expertise?