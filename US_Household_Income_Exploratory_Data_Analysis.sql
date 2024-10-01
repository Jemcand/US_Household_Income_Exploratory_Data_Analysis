#US Household Income Project (Exploratory Data Analysis)

SELECT *
FROM us_household_income
;
SELECT *
FROM us_statistics
;

SELECT State_Name,
SUM(ALand),
SUM(AWater)
FROM us_household_income
GROUP BY State_Name
#ORDER BY 2 DESC
ORDER BY 3 DESC
LIMIT 10
;

SELECT *
FROM us_household_income i
JOIN us_statistics s
	ON i.id = s.id
WHERE Mean <> 0
;

SELECT i.State_Name, County, Type, `Primary`, Mean, Median
FROM us_household_income i
JOIN us_statistics s
	ON i.id = s.id
WHERE Mean <> 0
;

SELECT i.State_Name, ROUND(AVG(Mean),1) Mean, ROUND(AVG(Median),1) Median
FROM us_household_income i
JOIN us_statistics s
	ON i.id = s.id
WHERE Mean <> 0
GROUP BY i.State_Name
ORDER BY 3 DESC
LIMIT 10
;

SELECT Type, COUNT(Type), ROUND(AVG(Mean),1) Mean, ROUND(AVG(Median),1) Median
FROM us_household_income i
JOIN us_statistics s
	ON i.id = s.id
WHERE Mean <> 0
GROUP BY 1
HAVING COUNT(Type) > 100
ORDER BY 4 DESC
LIMIT 20
;

SELECT i.State_Name, City, ROUND(AVG(Mean),1) Mean, ROUND(AVG(Median),1) Median
FROM us_household_income i
JOIN us_statistics s
	ON i.id = s.id
WHERE Mean <> 0
#AND i.State_Name = 'New York'
GROUP BY i.State_Name, City
ORDER BY Mean DESC
;












