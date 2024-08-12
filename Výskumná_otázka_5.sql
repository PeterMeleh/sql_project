

/*
 * 5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce,
 * projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
 */


SELECT
    p2.`year`,
   	round(p2.GDP,2) AS GDP,
    round(avg(p1.food_price),2) AS avg_food_price,
    round(avg(p1.price_value),2) AS avg_wage
FROM
    peter_meleh_project_sql_secondary_final p2
LEFT JOIN
	peter_meleh_project_sql_primary_final p1
	ON p2.`year` = p1.payroll_year
WHERE 
	p2.GDP IS NOT NULL
GROUP BY
    p2.`year`, 
    p2.GDP
ORDER BY
    p2.`year`;  
  
   
-- Vplyv HDP na Slovensku 
  
SELECT
    p2.`year`,
   	round(p2.GDP,2) AS GDP,
    round(avg(p1.food_price),2) AS avg_food_price,
    round(avg(p1.price_value),2) AS avg_wage
FROM
    peter_meleh_project_sql_secondary_final p2
LEFT JOIN
	peter_meleh_project_sql_primary_final p1
	ON p2.`year` = p1.payroll_year
WHERE 
	p2.GDP IS NOT NULL
	AND p2.country_name = 'Slovakia'
GROUP BY
    p2.`year`, 
    p2.GDP
ORDER BY
    p2.`year`;  














    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    




	
