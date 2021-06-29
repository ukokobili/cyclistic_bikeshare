/* Data Cleaning/Processing - The combined size of all the 12 datasets is close to 600 MB. 
Data cleaning in spreadsheets will be time-consuming and slow compared to SQL or R. 
I am choosing SQL and Tableau simply because I could do both data wrangling, analysis and 
visualizations respectively. It is also an opportunity for me to learn R better.
*/

WITH all_trip_data AS
(
SELECT *
FROM "202004_tripdata"

UNION

SELECT *
FROM "202005_tripdata"

UNION

SELECT *
FROM "202006_tripdata"

UNION

SELECT *
FROM "202007_tripdata"

UNION

SELECT *
FROM "202008_tripdata"

UNION

SELECT *
FROM "202009_tripdata"

UNION

SELECT *

FROM "202010_tripdata"

UNION

SELECT *
FROM "202011_tripdata"

UNION

SELECT *
FROM "202012_tripdata"

UNION

SELECT *
FROM "202101_tripdata"

UNION

SELECT *
FROM "202102_tripdata"

UNION

SELECT *
FROM "202103_tripdata"
)
SELECT 
	ride_id,
	rideable_type,	
	CASE
		WHEN (EXTRACT(MONTH FROM CAST(started_at as DATE))) = 4 THEN 'Apr' -- extracting and converting months number to text
		WHEN (EXTRACT(MONTH FROM CAST(started_at as DATE))) = 5 THEN 'May'
		WHEN (EXTRACT(MONTH FROM CAST(started_at as DATE))) = 6 THEN 'Jun'
		WHEN (EXTRACT(MONTH FROM CAST(started_at as DATE))) = 7 THEN 'Jul'
		WHEN (EXTRACT(MONTH FROM CAST(started_at as DATE))) = 8 THEN 'Aug'
		WHEN (EXTRACT(MONTH FROM CAST(started_at as DATE))) = 9 THEN 'Sep'
		WHEN (EXTRACT(MONTH FROM CAST(started_at as DATE))) = 10 THEN 'Oct'
		WHEN (EXTRACT(MONTH FROM CAST(started_at as DATE))) = 11 THEN 'Nov'
		WHEN (EXTRACT(MONTH FROM CAST(started_at as DATE))) = 12 THEN 'Dec'
		WHEN (EXTRACT(MONTH FROM CAST(started_at as DATE))) = 1 THEN 'Jan'
		WHEN (EXTRACT(MONTH FROM CAST(started_at as DATE))) = 2 THEN 'Feb'
		WHEN (EXTRACT(MONTH FROM CAST(started_at as DATE))) = 3 THEN 'Mar'
		END AS month,
	EXTRACT(DAY FROM CAST(started_at as DATE)) AS date, -- extracting date from timestamp
	EXTRACT(YEAR FROM CAST(started_at as DATE)) AS year, -- extracting year from timestamp
	EXTRACT(EPOCH FROM (ended_at - started_at)) AS duration_in_secs, -- calculating ride duration
	CASE
		WHEN (EXTRACT(DOW FROM CAST(started_at as DATE))) = 0 THEN 'Sun' -- day of the week as Sunday(0) to Saturday(6)
		WHEN (EXTRACT(DOW FROM CAST(started_at as DATE))) = 1 THEN 'Mon'
		WHEN (EXTRACT(DOW FROM CAST(started_at as DATE))) = 2 THEN 'Tue'
		WHEN (EXTRACT(DOW FROM CAST(started_at as DATE))) = 3 THEN 'Wed'
		WHEN (EXTRACT(DOW FROM CAST(started_at as DATE))) = 4 THEN 'Thu'
		WHEN (EXTRACT(DOW FROM CAST(started_at as DATE))) = 5 THEN 'Fri'
		WHEN (EXTRACT(DOW FROM CAST(started_at as DATE))) = 6 THEN 'Sat'
		END AS day_of_week,
	EXTRACT(HOUR FROM CAST(started_at AS TIME(0))) AS time_of_day, -- extracting time from timestamp
	CONCAT (start_station_name,'to', end_station_name) AS route, -- joining start and end station name to form routes
	member_casual AS customer
FROM
	all_trip_data -- virtual table
WHERE 
	start_station_name <> 'HQ QR' -- a few hundred entries when bikes were taken out of docks and checked for quality by Divvy
AND 
	EXTRACT(EPOCH FROM (ended_at - started_at)) >= 0; -- where duration is negative







