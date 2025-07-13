Create database covid_19;
USE covid_19;
Create table Covid_data(
date DATE,
Country VARCHAR(100),
New_cases INT,
Total_cases INT,
New_deaths INT,
Total_deaths INT,
population BIGINT);
USE covid_19;
-- Show all data(limit 5 rows)
SELECT * FROM covid_data
LIMIT 5;
-- Find total cases in India.
SELECT country, SUM(total_cases) AS total_cases_in_india
FROM covid_data
WHERE country = 'India';
-- Show total deaths in india.
SELECT country, SUM(total_deaths) AS total_deaths_in_india
From covid_data
Where country = 'India';
-- Calculate death rate (total deaths/total cases) for india.
SELECT Country, SUM(new_deaths) / SUM(new_cases)* 100 AS
Death_rate_percentage
FROM covid_data
WHERE country = 'india';
-- Find countries with highest number of total cases.
SELECT country, SUM(new_cases) AS total_cases
From covid_data
Group by country
Order by total_cases DESC;
SELECT DISTINCT country from covid_data;

-- Top 5 countries with highest death rate.
SELECT country, SUM(new_deaths) / SUM(new_cases)* 100 AS death_rate
FROM covid_data
Group by country
HAVING SUM(new_cases) > 1000
order by death_rate DESC
LIMIT 5;
-- Total cases per month in india.
SELECT country, Month(date) AS Month, SUM(new_cases) AS total_cases
FROM covid_data
Where country = 'India'
Group by Month(date)
Order by total_cases;
-- Tell me the name of the top 1 country where the total number of deaths is highest.
SELECT country, total_deaths From covid_data
Where total_deaths = (SELECT MAX(total_deaths)
From covid_data);
SELECT country, MAX(total_deaths) AS highest_deaths
FROM covid_data
Group by country
order by MAX(total_deaths) DESC
Limit 1;

