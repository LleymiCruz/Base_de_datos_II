--EJERCICIO 1 
SELECT
   gender,
   name,
   SUM(number) as suma
FROM `bigquery-public-data.usa_names.usa_1910_2013`
GROUP BY name, gender
ORDER BY suma DESC;

--EJERCICIO 2
SELECT 
date,
state,
tests_total,
cases_positive_total,
SUM(tests_total)  OVER(partition by state)  as suma_test_total,
FROM `bigquery-public-data.covid19_covidtracking.summary`



--EJERCICIO 3
SELECT 
channelGrouping,
SUM(totals.pageviews) as pageviews,
(SUM(totals.pageviews) /(SELECT 
SUM(totals.pageviews) 
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_20170801`)
) AS porcentaje_del_total,
(SELECT 
SUM(totals.pageviews)
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_20170801`)/(7) as promedio
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_20170801`
Group by channelGrouping;


--Ejerecicio 4
SELECT 
Region,
Country,
Total_Revenue,
RANK() OVER(PARTITION BY Region order by Total_Revenue DESC) as rank
FROM `lleymicruztareas.datasettarea.sales_records`
ORDER BY REGION ASC