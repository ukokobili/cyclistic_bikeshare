/* Data Analysis -  descriptive analysis that will help us uncover some 
insights on how the casual riders and members use Cyclistic rideshare differently
*/

-- Calculating the total number of rides
SELECT 
	COUNT(ride_id)
FROM 
	"202004_202103_tripdata"
-- Total number of rides is 3.4 million


-- Calculating the average ride duration
SELECT 
	ROUND(AVG(duration_in_secs))
FROM 
	"202004_202103_tripdata"
-- Average duration per ride is 1704 secs


-- Calculating the maximum and minimum ride duration
SELECT 
	ROUND(MAX(duration_in_secs)),
	ROUND(MIN(duration_in_secs))
FROM 
	"202004_202103_tripdata"
-- Maximum duration is 3523200 secs while minimum duration is 0 sec

	
-- Calculating the summary for members and casual riders
SELECT 
	customer,
	ROUND(AVG(duration_in_secs)) AS average_duration_for_customer,
	ROUND(MAX(duration_in_secs)) AS max_duration_for_customer,
	ROUND(MIN(duration_in_secs)) AS min_duration_for_customer
FROM 
	"202004_202103_tripdata"
GROUP BY 1
-- Casual riders cover more duration on the average than members although members
-- tend to have the highest ride duration.


-- Calculating the average duration of users per day of week
SELECT 
	* 
FROM crosstab( -- for creating pivot table
    'SELECT
		customer,
        day_of_week,
		ROUND(AVG(duration_in_secs))
    FROM 
        "202004_202103_tripdata"
	GROUP  BY 1,2'
)
AS pivot_table ( 
	customer text,
    Sun double precision, 
    Mon double precision,
	Tue double precision,
	Wed double precision,
	Thu double precision,
	Fri double precision,
	Sat double precision
);
-- There are longer rides on Weds for both customer types compared to other days of the week
-- and from observation, casual riders on weekends compared to memebers.


-- Calculating the number of rides for users by day of week
SELECT 	* 
FROM crosstab( 
    'SELECT
		customer,
        day_of_week,
		COUNT(ride_id) 
    FROM 
        "202004_202103_tripdata"
	GROUP  BY 1,2'
)
AS pivot_table ( 
	customer text,
    Sun bigint, 
    Mon bigint,
	Tue bigint,
	Wed bigint,
	Thu bigint,
	Fri bigint,
	Sat bigint
);
-- It's interesting to note that there are more riders by members. Lets determine of rides by customer.


-- Calculating number of rides by customer
SELECT 
	customer,
	COUNT(ride_id) 
FROM 
	"202004_202103_tripdata"
GROUP  BY 1	
-- hmmmm, we actually have more members as customers 


-- Calculating the number of rides for users by year
SELECT 
	* 
FROM crosstab( 
    'SELECT
		customer,
        day_of_week,
		COUNT(year) 
    FROM 
        "202004_202103_tripdata"
	GROUP  BY 1,2'
)
AS pivot_table ( 
	customer text,
    "2020" bigint, 
    "2021" bigint
);
-- There were more members compared to casual for 
-- both 2020 qnd 2021 respectively.


-- Calculating the number ride and average duration by customer, rideable type and day of the week
SELECT
	rideable_type,
	customer,	
    day_of_week,
	COUNT(ride_id) AS number_ride,
	ROUND(AVG(duration_in_secs)) AS avg_duration
FROM 
	"202004_202103_tripdata"
GROUP BY 
	1,2,3
ORDER BY
	COUNT(ride_id) DESC,
	ROUND(AVG(duration_in_secs)) DESC
-- Both groups of customers prefer Docked bike to Classic and Electric bikes


-- Calculating the average duration of users by month
SELECT 
	* 
FROM crosstab( -- for creating pivot table
    'SELECT
		customer,
        month,
		ROUND(AVG(duration_in_secs))
    FROM 
        "202004_202103_tripdata"
	GROUP  BY 1,2'
)
AS pivot_table ( 
	customer text,
    Jan double precision, 
    Feb double precision,
	Mar double precision,
	Apr double precision,
	May double precision,
	Jun double precision,
	Jul double precision,
	Aug double precision,
	Sep double precision,
	Oct double precision,
	Nov double precision,
	DEC double precision
);











