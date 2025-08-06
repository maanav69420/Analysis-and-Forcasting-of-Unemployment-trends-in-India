-- Query 1: Top 5 regions with highest average unemployment rate during 2020–21
--SELECT Region, AVG("Estimated Unemployment Rate (%)") AS AvgRate
--FROM 'Unemployment in India'
--WHERE substr(Date, 1, 4) IN ('2020', '2021')
--GROUP BY Region
--ORDER BY AvgRate DESC
--LIMIT 5;

-- Insight:
--This query identifies the top 5 Indian regions (like states or UTs) with the highest average unemployment rates during the pandemic years (2020 and 2021).
--It helps highlight which areas were most economically impacted in terms of employment during COVID-19.
--Use Case: Useful for government agencies to target job recovery programs.

-- Query 2: Compare participation rates between rural and urban regions
--SELECT Area, AVG("Estimated Labour Participation Rate (%)") AS AvgParticipation
--FROM 'Unemployment in India'
--GROUP BY Area;

--Insight:
--Shows average labor participation for rural vs urban areas.
--Typically:
--Urban areas may have higher participation due to more structured job markets.
--Rural areas may reflect seasonal variations based on agriculture.
--Helps assess employment engagement across different living environments.

-- Query 3: Regional unemployment trends over years
--SELECT Region, substr(Date, 1, 4) AS Year, AVG("Estimated Unemployment Rate (%)") AS AvgRate
--FROM 'Unemployment in India'
--GROUP BY Region, Year
--ORDER BY Region, Year;

--Insight:
--Displays year-wise unemployment rates for each region.
--Shows if regions are:
--Improving (rates decreasing)
--Worsening
--Helps in understanding long-term economic trends across states.

-- Query 4: Regions with greatest improvement post-2019
--WITH Pre2019 AS (
--  SELECT Region, AVG("Estimated Unemployment Rate (%)") AS AvgPre
--  FROM 'Unemployment in India'
--  WHERE substr(Date, 1, 4) = '2019'
--  GROUP BY Region
--),
--Post2019 AS (
--  SELECT Region, AVG("Estimated Unemployment Rate (%)") AS AvgPost
--  FROM 'Unemployment in India'
--  WHERE substr(Date, 1, 4) >= '2020'
--  GROUP BY Region
--)
--SELECT p.Region, p.AvgPre, q.AvgPost, (p.AvgPre - q.AvgPost) AS Improvement
--FROM Pre2019 p
--JOIN Post2019 q ON p.Region = q.Region
--ORDER BY Improvement DESC;

--Insight:
--Compares unemployment in 2019 (pre-pandemic) and 2021 (recovery phase).
--Ranks regions that reduced their unemployment rate the most after 2019.
--Highlights successful regional economic recovery.
--Use Case: Study policies or industries that drove recovery in those areas.

-- Query 5: Count of months/years where unemployment rate exceeded national average
--WITH NationalAvg AS (
--  SELECT substr(Date, 1, 7) AS MonthYear, AVG("Estimated Unemployment Rate (%)") AS NatAvg
--  FROM 'Unemployment in India'
--  GROUP BY substr(Date, 1, 7)
--)
--SELECT u.Region, COUNT(*) AS CountExceeding
--FROM 'Unemployment in India' u
--JOIN NationalAvg n ON substr(u.Date, 1, 7) = n.MonthYear
--WHERE u."Estimated Unemployment Rate (%)" > n.NatAvg
--GROUP BY u.Region
--ORDER BY CountExceeding DESC;

--Insight:
--Counts how many region-months had unemployment above national average.
--Indicates frequency of economic stress in specific areas.
--Helps in regional performance benchmarking against national trends.

