

/*
 * 2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
 */

-- Pre pripojenie tabuľky k dočasnej tabuľke YearLimits bol použitý INNER JOIN, aby sa zahrnuli iba roky, ktoré sú prvé alebo posledné pre každú kategóriu potravín.



-- Priemerné ceny vybraných potravín v rokoch 2006 a 2018.

WITH YearLimits AS (
    SELECT 
        food_category,
        min(payroll_year) AS first_year,
        max(payroll_year) AS last_year
    FROM peter_meleh_project_sql_primary_final
    GROUP BY food_category
) 
SELECT 
    pt.food_category,
    pt.payroll_year,
    round(avg(pt.food_price),2) AS avg_food_price
FROM peter_meleh_project_sql_primary_final pt
INNER JOIN YearLimits yl
    ON pt.food_category = yl.food_category
    AND (pt.payroll_year = yl.first_year OR pt.payroll_year = yl.last_year)
WHERE pt.food_category IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový')
GROUP BY 
    pt.food_category,
    pt.payroll_year
ORDER BY 
    pt.food_category,
    pt.payroll_year;
   
   
   
-- Priemerné mzdy v rokoch 2006 a 2018
   
SELECT
    payroll_year,
    round(avg(avg_wages),2) AS avg_wage
FROM peter_meleh_project_sql_primary_final
WHERE payroll_year IN (2006, 2018)
GROUP BY payroll_year
ORDER BY payroll_year;




-- V roku 2006 si môžeme kúpiť približne 1,287 kg chleba alebo 1,438 l mlieka. Kdežto v roku 2018 si môžeme kúpiť približne 1,343 kg chleba alebo 1,641 l mlieka.




   
