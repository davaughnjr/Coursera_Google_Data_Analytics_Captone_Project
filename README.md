# Google Data Analytics Capstone: Cyclistic Case Study
Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)
## Introduction
In this case study, I will perform many real-world tasks of a junior data analyst at a fictional company, Cyclistic. In order to answer the key business questions, I will follow the steps of the data analysis process: [Ask](https://github.com/davaughnjr/Coursera_Google_Data_Analytics_Captone_Project/tree/main/README.md#ask), [Prepare](https://github.com/davaughnjr/Coursera_Google_Data_Analytics_Captone_Project/tree/main/README.md#prepare), [Process](https://github.com/davaughnjr/Coursera_Google_Data_Analytics_Captone_Project/tree/main/README.md#process), [Analyze](https://github.com/davaughnjr/Coursera_Google_Data_Analytics_Captone_Project/tree/main/README.md#analyze-and-share), [Share](https://github.com/davaughnjr/Coursera_Google_Data_Analytics_Captone_Project/tree/main/README.md#analyze-and-share), and [Act](https://github.com/davaughnjr/Coursera_Google_Data_Analytics_Captone_Project#act).
### Quick links:
Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) [accessed on 04/03/23]  
  
SQL Queries:  
[Data Combining](https://github.com/davaughnjr/Coursera_Google_Data_Analytics_Captone_Project/blob/main/DataCombining.sql)  
[Data Exploration](https://github.com/davaughnjr/Coursera_Google_Data_Analytics_Captone_Project/blob/main/DataExploration.sql)  
[Data Cleaning](https://github.com/davaughnjr/Coursera_Google_Data_Analytics_Captone_Project/blob/main/DataCleaning.sql)  
  
Data Visualizations: [Tableau](https://public.tableau.com/app/profile/davaughn.henderson/viz/capstone-bike-tripdata/Story1)  
## Background
### Cyclistic
A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day.   
  
Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.  
  
Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno (the director of marketing and my manager) believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.  

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.  

### Scenario
I am assuming to be a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve our recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## Ask
### Business Task
Devise marketing strategies to convert casual riders to members.
### Analysis Questions
Three questions will guide the future marketing program:  
1. How do annual members and casual riders use Cyclistic bikes differently?  
2. Why would casual riders buy Cyclistic annual memberships?  
3. How can Cyclistic use digital media to influence casual riders to become members?  

Moreno has assigned me the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?
## Prepare
### Data Source
I will analyze Cyclistic’s historical trip data from January 2023 to December 2023 to identify trends. This data, provided by Motivate International Inc., can be downloaded from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) and is available under this [license](https://www.divvybikes.com/data-license-agreement).  
  
This public data allows us to explore how different customer types use Cyclistic bikes. However, due to data privacy regulations, personally identifiable information is not included. As a result, we cannot link pass purchases to credit card numbers to determine whether casual riders live within the Cyclistic service area or if they have purchased multiple single passes.
### Data Organization
There are 12 files, each following the naming convention YYYYMM-divvy-tripdata, with each file containing data for one month. The dataset includes details such as ride ID, bike type, start and end times, station names and IDs, locations, and rider membership status. The corresponding column names are:

ride_id
rideable_type
started_at
ended_at
start_station_name
start_station_id
end_station_name
end_station_id
start_lat
start_lng
end_lat
end_lng
member_casual

## Process
BigQuery is used to merge and clean the various datasets into a single dataset.   
Reason:  
Microsoft Excel has a row limit of 1,048,576, making it unsuitable for handling large datasets. Since the Cyclistic dataset contains over 5.6 million rows, a platform like BigQuery is essential for efficiently managing and analyzing such a large volume of data.
### Combining the Data
SQL Query: [Data Combining](https://github.com/davaughnjr/Coursera_Google_Data_Analytics_Captone_Project/blob/main/DataCombining.sql)  
I uploaded 12 CSV files, one for each month, into the Cyclistic dataset.
Data Cleaning Process:
-Removed all empty rows and rows with empty cells using Excel.
-After cleaning, a total of 4,314,896 rows were merged, covering the 12-month period from June 2023 to May 2024.
### Data Exploration
SQL Query: [Data Exploration](https://github.com/davaughnjr/Coursera_Google_Data_Analytics_Captone_Project/blob/main/DataExploration.sql)  
Before cleaning the data, I am familiarizing myself with the data to find the inconsistencies.  

Observations:  
1. All column names listed the year trip data, ride_id is the primary key that'll check in every table
 
![image](https://github.com/user-attachments/assets/eabcaa45-5dd2-4ecb-aebc-ac71c1d4756a)

2. No null values listed

![image](https://github.com/user-attachments/assets/599166d8-7d57-4601-812f-3482ef1e70d5)

3. Found 60 duplicate rows

![image](https://github.com/user-attachments/assets/809f608d-838a-4acf-887d-3152e4ae7fb6)

4. ride_id values have length less than 16

![image](https://github.com/user-attachments/assets/2498867b-93db-4606-a3e4-de4cae551112)

5. Remove all ride_id that’s less than 16

![image](https://github.com/user-attachments/assets/fd1be418-b52d-413a-8631-cabc7527e537)

6. There are a total of 3 bikes listed under rideable_type

![image](https://github.com/user-attachments/assets/c98671fd-558f-4004-a929-a55614cc5c76)

7. Found 164 trips that has a duration longer than a day and 108,481 trips having less than a minute

![image](https://github.com/user-attachments/assets/32c4d0d2-6e57-449a-b91f-8b2775c0f23e)

![image](https://github.com/user-attachments/assets/7c0ec0b3-693e-4afa-8c56-f2d968b0cbf8)

8. member_casual column is the subscription and has two unique values. Casual with 1,515,238 total trips and Member with 2,799,658 total trips

![image](https://github.com/user-attachments/assets/22ef06e0-575f-4cd6-ba54-96afad008199)

### Data Cleaning
SQL Query: [Data Cleaning](https://github.com/davaughnjr/Coursera_Google_Data_Analytics_Captone_Project/blob/main/DataCleaning.sql)  

1. All rows with missing values were removed in Excel
2. Added the requested columns ride_length, day_of_week and month were added

![image](https://github.com/user-attachments/assets/e3a2a609-3f01-424a-b0d5-2830b9d7ba2b)

3. Trips that was less and a minute and longer than a day are removed
  
## Analyze and Share
Data Visualization: [Tableau](https://public.tableau.com/app/profile/davaughn.henderson/viz/capstone-bike-tripdata/Story1)  
The data is now prepared of analysis and have been visualized in Tableau.
The analysis question is: How do annual members and casual riders use Cyclistic bikes differently?

Here is the comparison of members and casual riders and what type of bikes they're using.

![image](https://github.com/user-attachments/assets/e98cef8a-468f-4367-bb43-8f56ced1aa80)

The casual riders makes up for 50.6% of the riders while members take the remaining 49.4%. Each bike type chart displays the percentage of total usage. Classic bikes are the most popular, followed by electric bikes. Docked bikes have the lowest usage and are only ridden by casual users.

Here is the average ride duration per month and day of the week

![image](https://github.com/user-attachments/assets/5f671a18-64d9-4d2c-82df-917a689d9ac8)

Casual riders tend to ride longer than members on average. Throughout the year and week, members maintain a consistent ride duration with little variation. In contrast, casual riders' ride durations fluctuate, with longer rides occurring during the spring and summer months and on weekends, while riding less on Wednesdays.

This difference may be because members primarily use bikes for commuting, such as riding from home to work. Casual riders, on the other hand, may use bikes for single-time trips or when they are in the vicinity and need a faster mode of transportation than walking. The longer ride durations on weekends and in warmer months suggest that casual riders may be using the bikes for recreational purposes.

Here is the total number of trips per month and day of the week

![image](https://github.com/user-attachments/assets/756b213f-1c91-4278-9afb-8067b49628cb)

Months: Compared to ride duration, casual riders may travel longer distances, but members use the bikes more frequently. The line pattern for both groups is similar. However, October shows the largest gap, with members taking over 140,000+ more trips than casual riders.
Days of the Week: When comparing daily trends, members take significantly more trips than casual riders during the workweek. This could be due to members using bikes for commuting, running errands, or even short trips during lunch or breaks. In contrast, casual riders' trips increase on weekends, while member trips decline.

Based on these observations, we can infer that members primarily use bikes for commuting to and from work during the weekdays. Meanwhile, casual riders tend to use bikes more frequently on weekends, likely for leisure activities.
  
Summary:
  
|Casual|Member|
|------|------|
|Travel 2-3x longer but less frequently than members.|Take shorter rides but uses the bike more frequently.|
|Prefer using bikes on weekends compared to weekdays. Use bikes more frequently in Spring/Summer months.|Prefer riding bikes on weekdays and take more trips.|
|Main user of dock bikes and totaling 50.6% of all bike types.|Uses the electric bike more than the casual.|  
  
## Act
Marketing Strategy for Converting Casual Riders to Members:
After analyzing the differences between casual and member riders, targeted marketing strategies can be developed to encourage casual riders to become members.

Recommendations:  
1. Seasonal Marketing Campaigns: Launch marketing efforts in spring and summer at popular tourist and recreational locations where casual riders are most active.
2. Special Membership Offers: Introduce seasonal or weekend-only memberships to attract casual riders, as they are more active on weekends and during warmer months.
3. Incentives for Longer Rides: Since casual riders tend to ride for longer durations, offering discounts or perks for extended ride times could encourage them to become members. Additionally, this may also encourage existing members to ride longer.
