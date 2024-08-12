

/*
 * 4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
 */
	
-- LEFT JOIN je použitý k prepojeniu aktuálnych údajov s predchádzajúcimi údajmi na základe kategórie potravín a roku, čo umožňuje porovnať ceny a mzdy medzi rokmi. 
-- Pomocou klauzule HAVING sa filtrujú výsledky tak, aby sa zobrazili len tie záznamy, kde je rozdiel medzi medziročným nárastom cien potravín a rastom miedz väčší ako 10%.



-- Zoznam rokov a katogórií potravín, kde bol nárast cien potravín medziročne vyšší než nárast miezd o viac než 10%.

 SELECT 
    curr.payroll_year AS year,
    prev.payroll_year AS prev_year,
    round(((curr.food_price - prev.food_price) / prev.food_price) * 100, 2) AS food_price_growth,
    round(((curr.avg_wages - prev.avg_wages) / prev.avg_wages) * 100, 2) AS avg_wages_growth,
    round(((curr.food_price - prev.food_price) / prev.food_price) * 100, 2) - round(((curr.avg_wages - prev.avg_wages) / prev.avg_wages) * 100, 2) AS difference
FROM 
    Peter_Meleh_project_SQL_primary_final curr
LEFT JOIN 
    Peter_Meleh_project_SQL_primary_final prev
    ON curr.food_category = prev.food_category
    AND curr.payroll_year = prev.payroll_year + 1
HAVING 
    difference > 10;


    
 -- Top 5 záznamov, kde bol rast cien potravín výrazne vyšší než rast miezd.
   
SELECT 
    curr.payroll_year AS year,
    prev.payroll_year AS prev_year,
    round(((curr.food_price - prev.food_price) / prev.food_price) * 100, 2) AS food_price_growth,
    round(((curr.avg_wages - prev.avg_wages) / prev.avg_wages) * 100, 2) AS avg_wages_growth,
    round(((curr.food_price - prev.food_price) / prev.food_price) * 100, 2) - round(((curr.avg_wages - prev.avg_wages) / prev.avg_wages) * 100, 2) AS difference
FROM 
    Peter_Meleh_project_SQL_primary_final curr
LEFT JOIN 
    Peter_Meleh_project_SQL_primary_final prev
    ON curr.food_category = prev.food_category
    AND curr.payroll_year = prev.payroll_year + 1
HAVING 
    difference > 10
LIMIT 5;




