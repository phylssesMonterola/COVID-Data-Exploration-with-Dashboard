/*This is the SQL script/code for the COVID Data & Visualization Project*/


--Sheet 1: 
Select SUM(new_cases) as total_cases, 
	   SUM(cast(new_deaths as int)) as total_deaths, 
	   round(SUM(cast(new_deaths as int))/SUM(New_Cases)*100, 2) as DeathPercentage
From PortfolioProject..CovidDeaths
where continent is not null 
order by 1,2


--Sheet 2: 
Select location, 
	   SUM(cast(new_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent is null 
  and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc
--remember the order: WHERE, GROUP BY, HAVING, ORDER BY


--Sheet 3:
Select Location, 
	   Population, 
	   MAX(total_cases) as HighestInfectionCount,  
	   round(Max((total_cases/population))*100, 2) as PercentPopulationInfected
From PortfolioProject..CovidDeaths
Group by Location, Population
order by PercentPopulationInfected desc


--Sheet 4:
Select Location, 
	   Population,
	   date, 
	   MAX(total_cases) as HighestInfectionCount,  
	   round(Max((total_cases/population))*100, 2) as PercentPopulationInfected
From PortfolioProject..CovidDeaths
Group by Location, Population, date
order by PercentPopulationInfected desc




