


/*
 * 1. Rostou v prôbehu let mzdy ve všech odvětvích, nebo v některých klesají?
 */

-- Pre výpočet boli použité agregačné ufnkcie MIN a MAX, ktoré poskytujú prehľad o zmene miedz v priebehu času pre každé odvetvie.
-- Na základe týchto hodnôt bol pomocou podmienkových výrazov CASE určený trend zmien miezd, ktorý môže byť 'Growing' (rastúci), 
-- 'Falling' (klesajúci), alebo 'Stable' (stabilný). 



-- Mzdy vo všetkých odvetviach rastú.

SELECT 
	industry_name,
	min(avg_wages) AS first_avg_wages,
	max(avg_wages) AS last_avg_wages,
	min(payroll_year) AS first_avg_year,
	max(payroll_year) AS last_avg_year,
	CASE
		WHEN min(avg_wages) < max(avg_wages) THEN 'Growing'
		WHEN min(avg_wages) > max(avg_wages) THEN 'Falling'
		ELSE 'Stable'
	END AS wage_direction
	FROM peter_meleh_project_sql_primary_final pmpspf 
GROUP BY
	industry_name
ORDER BY 
	industry_name;




-- Top 5 odvetví, kde rástla mzda najrýchlešie.

SELECT 
	industry_name,
	min(avg_wages) AS first_avg_wages,
	max(avg_wages) AS last_avg_wages,
	min(payroll_year) AS first_avg_year,
	max(payroll_year) AS last_avg_year,
	CASE
		WHEN min(avg_wages) < max(avg_wages) THEN 'Growing'
		WHEN min(avg_wages) > max(avg_wages) THEN 'Falling'
		ELSE 'Stable'
	END AS wage_direction,
	round(((max(avg_wages) - min(avg_wages)) / min(avg_wages)) * 100, 2) AS percentage_change
FROM peter_meleh_project_sql_primary_final pmpspf 
GROUP BY
	industry_name
ORDER BY 
	percentage_change DESC
LIMIT 5;



-- Top 5 odvetví, kde rástla mzda najpomalšie.

SELECT 
	industry_name,
	min(avg_wages) AS first_avg_wages,
	max(avg_wages) AS last_avg_wages,
	min(payroll_year) AS first_avg_year,
	max(payroll_year) AS last_avg_year,
	CASE
		WHEN min(avg_wages) < max(avg_wages) THEN 'Growing'
		WHEN min(avg_wages) > max(avg_wages) THEN 'Falling'
		ELSE 'Stable'
	END AS wage_direction,
	round(((max(avg_wages) - min(avg_wages)) / min(avg_wages)) * 100, 2) AS percentage_change
FROM peter_meleh_project_sql_primary_final pmpspf 
GROUP BY
	industry_name
ORDER BY 
	percentage_change ASC
LIMIT 5;



