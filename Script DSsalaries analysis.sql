
-- 0. View the entire dataset

SELECT * 
FROM 
    data_science_salaries

-- 1. Average salary by job title
SELECT 
    job_title, AVG(salary_in_usd) AS avg_salary
FROM 
    data_science_salaries
GROUP BY 
    job_title
ORDER BY 
    avg_salary DESC;
    
-- 2. Salary distribution
SELECT 
    job_title,
    MIN(salary_in_usd) AS min_salary,
    MAX(salary_in_usd) AS max_salary,
    ROUND(AVG(salary_in_usd), 2) AS avg_salary,
    COUNT(*) AS num_employees
FROM 
    data_science_salaries
GROUP BY 
    job_title;

-- 3. Salary by experience level
SELECT 
    experience_level,
    AVG(salary_in_usd) AS avg_salary
FROM 
    data_science_salaries
GROUP BY 
    experience_level;

-- 4. Salary by employment type
SELECT 
    employment_type,
    AVG(salary_in_usd) AS avg_salary
FROM 
    data_science_salaries
GROUP BY 
    employment_type;

-- 5. Salary by work location
SELECT 
    company_location,
    AVG(salary_in_usd) AS avg_salary
FROM 
    data_science_salaries
GROUP BY 
    company_location;

-- 6. Salary trends over time
SELECT 
    work_year,
    AVG(salary_in_usd) AS avg_salary
FROM
    data_science_salaries
GROUP BY 
    work_year;

-- 7. Salary trend for select job titles

-- 7.1. Salary Growth Over Time for Data Scientists
SELECT 
    work_year, 
    AVG(salary_in_usd) AS avg_salary
FROM 
    data_science_salaries
WHERE 
    job_title = 'Data Scientist'
GROUP BY 
    work_year;

-- 7.2. Salary Growth Over Time for Data Analysts
SELECT 
    work_year, AVG(salary_in_usd) AS avg_salary
FROM 
    data_science_salaries
WHERE 
    job_title = 'Data Analyst'
GROUP BY 
    work_year;

-- 7.3.  Salary Growth Over Time for Data Engineers
SELECT 
    work_year, AVG(salary_in_usd) AS avg_salary
FROM 
    data_science_salaries
WHERE 
    job_title = 'Data Engineer'
GROUP BY 
    work_year;


-- 8. Company size and salary
SELECT 
    company_size,
    AVG(salary_in_usd) AS avg_salary
FROM 
    data_science_salaries
GROUP BY 
    company_size;

-- 9. Which country pays the highest for "data analsyt" position
SELECT  
    company_location, AVG(salary_in_usd) as average_salary, 
    COUNT(job_title) AS no_of_jobs
FROM 
    data_science_salaries
WHERE
    job_title = 'Data Analyst' -- change to get info about other job titles 
GROUP BY 
    company_location
ORDER BY 
    --average_salary DESC, 
    no_of_jobs DESC;


-- 10. Do remote jobs pay more than on site?
SELECT
    work_models, ROUND(AVG(salary_in_usd),2) AS avg_salary,
    COUNT(work_models) AS no_of_jobs
FROM 
    data_science_salaries
GROUP BY 
    work_models
ORDER BY
    avg_salary DESC;


-- 11. Does experience affect earning?
SELECT experience_level, ROUND(AVG(salary_in_usd),2) AS avg_salary,
    COUNT(experience_level) AS no_of_jobs
FROM 
    data_science_salaries
GROUP BY 
   experience_level
ORDER BY
    avg_salary DESC;
