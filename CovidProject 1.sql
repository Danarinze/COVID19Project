SELECT continent, location, date, total_cases, new_cases, total_deaths, population
FROM dbo.CovidDeath
ORDER BY 2

--TOTAL CASE VS TOTAL DEATH BY LOCATION

SELECT location, date, total_cases, CAST(total_deaths AS INT) AS total_deaths, (CAST(total_deaths AS INT)/total_cases)*100 AS PercentageDeath
FROM dbo.CovidDeath
WHERE location = 'nigeria'
ORDER BY 1 


--TOTAL CASE VS POPULATION
SELECT Location, date, population, total_cases, (total_cases/population)*100 AS PercentageInfected
FROM dbo.CovidDeath
WHERE location = 'nigeria'
ORDER BY 1


--LOCATION WITH HIGEST NEW CASE

SELECT location, SUM(new_cases) AS TotalNewCases
FROM dbo.CovidDeath
GROUP BY location
ORDER BY 2 DESC

--LOCATION WITH HIGEST INFECTION RATE

SELECT location, population, MAX(total_cases) AS HighestInfected, (MAX(total_cases)/population)*100 PercentageHighestInfected
FROM dbo.CovidDeath
GROUP BY population, location
ORDER BY 4 DESC


--LOCATION WITH HIHGEST DEATH RATE

SELECT location, MAX(CAST(total_deaths AS INT)) AS HighestDeath
FROM dbo.CovidDeath
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY 2 DESC


--CONTINENT WITH HIGHEST DEARTH RECORD

SELECT continent, MAX(CAST(total_deaths AS INT)) AS HighestDeath
FROM dbo.CovidDeath
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY 2 DESC


--CONTINENT TOTAL CASE VS POPULATION

SELECT continent, date, SUM(total_cases) AS total_case, SUM(population) AS population, (SUM(total_cases)/SUM(population))*100 AS PercentageInfected
FROM dbo.CovidDeath
WHERE continent IS NOT NULL
GROUP BY continent, date
ORDER BY continent, date


--CONTINENT TOTAL CASE VS TOTAL DEATH

SELECT continent, date, SUM(total_cases) AS total_case, SUM(CAST(total_deaths AS int)) AS total_death, (SUM(CAST(total_deaths AS int))/SUM(total_cases))*100 AS PercentageDeath
FROM dbo.CovidDeath
WHERE continent IS NOT NULL
GROUP BY continent, date
--HAVING SUM(new_cases) <> 0
ORDER BY 1, 2;


--GLOBAL DAILY RECORDED CASES AND PERCENTAGE INFECTED COMPARED TO POPULATION

SELECT date, SUM(new_cases) AS total_case, SUM(population) AS population, (SUM(new_cases)/SUM(population))*100 AS PercentageInfected
FROM dbo.CovidDeath
--WHERE continent IS NOT NULL
GROUP BY date
ORDER BY date


--GLOBAL TOTAL DEATH VS TOTAL CASE

SELECT date, SUM(total_cases) AS total_case, SUM(CAST(total_deaths AS int)) AS total_death, (SUM(CAST(total_deaths AS int))/SUM(total_cases))*100 AS PercentageDeath
FROM dbo.CovidDeath
WHERE continent IS NOT NULL
GROUP BY date
--HAVING SUM(new_cases) <> 0
ORDER BY 1, 2;



--PEOPLE VACCINATED VS POPULATION

SELECT de.location, de.date, de.population, va.people_vaccinated, (va.people_vaccinated/de.population)*100 AS PercentageofPeopleVaccinated
FROM dbo.CovidDeath de
	JOIN dbo.CovidVaccine va
	ON de.location = va.location
	AND de.date = va.date
	WHERE de.location = 'nigeria'
ORDER BY 1,2


--PEOPLE FULLY VACCINATED VS POPULATION

SELECT de.location, de.date, de.population, va.people_fully_vaccinated, (va.people_fully_vaccinated/de.population)*100 AS PercentageofPeopleFullyVaccinated
FROM dbo.CovidDeath de
	JOIN dbo.CovidVaccine va
	ON de.location = va.location
	AND de.date = va.date
	WHERE de.location = 'nigeria'
ORDER BY 1,2



SELECT *
FROM dbo.CovidDeath


SELECT *
FROM dbo.CovidVaccine
