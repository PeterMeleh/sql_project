
	
/*
 * Sekundárna tabulka
 */ 

CREATE TABLE Peter_Meleh_project_SQL_secondary_final AS
SELECT 
	c.country AS country_name,
	e.year,
	e.GDP,
	e.gini,
	e.population
FROM countries c 
JOIN economies e 
	ON c.country = e.country  
	WHERE c.continent = 'Europe'
	AND e.year BETWEEN 2006 AND 2008
ORDER BY
	c.country ASC, 
	e.year;
	
