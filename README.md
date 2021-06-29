# Cyclistic Bikeshare Data Analysis

## Introduction
This is a [Google Data Analytics Professional Certificate](https://www.coursera.org/professional-certificates/google-data-analytics) Capstone project, a requirement for completing the course. The case study involves a bikeshare company's data of its customer's trip details over a 12 month period (April 2020 - March 2021). The data has been made available by Motivate International Inc. under this [license](https://www.divvybikes.com/data-license-agreement).

### Scenario
The director of a marketing team at a Chicago based Cyclistic bike-share company wants to maximize the number of annual memberships by converting casual riders to annual members. In oder to do this, the marketing analyst team need to better understand how casual riders and annual members use Cyclistic bike differently.

## Objective
The aim of this analysis is to gain meaningful insights and identifying how casual riders and annual members use bikes differently which will help develop a new marketing strategy to convert casual riders into annual members.

## Data Sources
There's a total of 12 datasets used for this analysis starting from April 2020 to March 2021 which is available [here](https://divvy-tripdata.s3.amazonaws.com/index.html)(Note: The datasets have a different name because Cyclistic is a fictional company). Each dataset captures the details of every ride logged by the customers of Cyclistic and data has been publicly made available which has been scrubbed to omit rider's personal information.

## Documentation, Cleaning/Preparation and Data Analysis
Due to the size of all the 12 datasets which is about 600 MB, I used PostgreSQL for storing, data cleaning and descriptive data analysis. I also used R programming simply because, I could do both data wrangling and analysis/visualizations in the same platform. It is also an opportunity for me to learn R better.

## Data Visualization 
Created visualizations to share my findings from the dinsights gained in order to effectively communicate with the stakeholders. Here's a the a [link](https://public.tableau.com/app/profile/jacob.ukokobili/viz/CasualVs_Member/CasualVs_Member) to the visualization

## Key Takeaways
* There was a total of approximately 3.4 million rides were recorded between Apr'20 - Mar'21 of which **Casual riders** made 41% of total trips contributing to 66% of total trip duration while **Annual members** make up 59% of total trips contributing to 34% of total trip duration for the aforementioned period.

* Based on trip duration,  the number of rides by **Casual riders** is almost twice as that of **Annual members**. In addition, there's a relatively high number of **Casual riders** using bikeshare services more on weekends, while **Annual members** tend use bikeshare services consistently over the entire week.

* The average trip duration by **Casual riders** is more than twice that of **Annual members** over any given day of the week cumulatively.

* Lastly, **Casual riders**  covered more ride lenght during first half of the year compared to the second half, while **Annual members** clock relatively similar average trip duration month over month and finally, docked bikes are preferred by **Casual riders**  and **Annual members** although most classic bikes and electric bikes also popular.

## Recommendations
* Providing attractive/value added services for **Casual riders** on weekdays to enable **Casual riders** use the bikeshare services more across the entire week.

* Providing discounted membership fee for renewals after the first year as it might encourage **Casual riders** to take up membership.

* Offering discounted pricing during non-busy hours so that **Casual riders** might choose to use bikes more often and level out demand over the day.

