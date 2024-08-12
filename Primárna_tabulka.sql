

/*
 * Primárna tabulka
 */ 

-- Filtrácia dat pomocou klauzule SELECT DISTINCT a množinového operátora INTERSECT, aby sa zahrnuli len roky,
-- ktoré sú spoločné ako pre data o mzdách tak pre data o cenách potravín.
-- spoločené roky 2006 - 2018
-- 5958 - hodnota poskytujúca ucelený obraz o priemerných príjmoch zamestnanca v rôznych rokoch a odvetviach



CREATE TABLE Peter_Meleh_project_SQL_primary_final AS
SELECT 
	cpc.name AS food_category,
	cpc.price_value,
	cpc.price_unit, 
	cp.value AS food_price,
	cpib.name AS industry_name,
	cpay.value AS avg_wages,
	cp.date_from AS date_cz_price,
	cpay.payroll_year 
FROM czechia_price cp 
JOIN czechia_payroll cpay
	ON cpay.payroll_year = year(cp.date_from)
	AND cpay.value_type_code = 5958
	AND cp.region_code IS NULL
JOIN czechia_price_category cpc 
	ON cpc.code = cp.category_code 
JOIN czechia_payroll_industry_branch cpib 
	ON cpib.code = cpay.industry_branch_code
WHERE cpay.payroll_year IN (
	SELECT DISTINCT 
		payroll_year 
	FROM czechia_payroll cp 
	INTERSECT
	SELECT DISTINCT 
		year(date_from) AS czechia_price_year
	FROM czechia_price cp
);
	

