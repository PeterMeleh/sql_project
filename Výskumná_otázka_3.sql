

/*
 * 3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
 */ 

-- využie subselectov a JOIN operácie. Prvý subselect curr vypočíta priemerné ceny potravín za každý rok.
-- Druhý subselect prev vypočíta priemerné ceny za predchádzajúci rok. Výsledky sú spojené pomocou JOIN operácie,
-- čo umožňuje porovnanie cien medzi súčasným a predchádzajúcim stavom. V konečnom dotaze sa vypočíta percentuálny nárast cien medzi týmito rokmi.

-- celkový pohľad na ceny potravín

SELECT
	food_category,
	price_value,
	price_unit,
	payroll_year,
	round(avg(food_price),2) AS avg_price
FROM peter_meleh_project_sql_primary_final pmpspf 
GROUP BY
	food_category,
	price_value,
	price_unit,
	payroll_year ASC; 



	
-- 	Kategória potravín s najnižším percentuálnym nárastom.
	
SELECT
    food_category,
    round(avg(percent_growth),2) AS avg_percent_growth
FROM (
    SELECT
        curr.food_category,
        curr.payroll_year,
        curr.avg_food_price,
        prev.avg_food_price AS prev_year_price,
        ((curr.avg_food_price - prev.avg_food_price) / prev.avg_food_price * 100) AS percent_growth
FROM (
    SELECT
        food_category,
        payroll_year,
        round(avg(food_price), 2) AS avg_food_price
    FROM peter_meleh_project_sql_primary_final
    GROUP BY
        food_category,
        payroll_year
) curr
JOIN (
    SELECT
        food_category,
        payroll_year,
        round(avg(food_price), 2) AS avg_food_price
    FROM peter_meleh_project_sql_primary_final
    GROUP BY
        food_category,
        payroll_year
) prev
    ON curr.food_category = prev.food_category
    AND curr.payroll_year = prev.payroll_year + 1
) growth
GROUP BY
    food_category
ORDER BY
    avg_percent_growth ASC
LIMIT 1;
	

-- Všetky kategórie potravín od najnižšieho percentuálneho nárastu po najvyšší.

SELECT
    food_category,
    round(avg(percent_growth),2) AS avg_percent_growth
FROM (
    SELECT
        curr.food_category,
        curr.payroll_year,
        curr.avg_food_price,
        prev.avg_food_price AS prev_year_price,
        ((curr.avg_food_price - prev.avg_food_price) / prev.avg_food_price * 100) AS percent_growth
FROM (
    SELECT
        food_category,
        payroll_year,
        round(avg(food_price), 2) AS avg_food_price
    FROM peter_meleh_project_sql_primary_final
    GROUP BY
        food_category,
        payroll_year
) curr
JOIN (
    SELECT
        food_category,
        payroll_year,
        round(avg(food_price), 2) AS avg_food_price
    FROM peter_meleh_project_sql_primary_final
    GROUP BY
        food_category,
        payroll_year
) prev
    ON curr.food_category = prev.food_category
    AND curr.payroll_year = prev.payroll_year + 1
) growth
GROUP BY
    food_category
ORDER BY
    avg_percent_growth ASC;

	
	
