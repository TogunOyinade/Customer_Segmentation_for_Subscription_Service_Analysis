# Customer_Segmentation_Analysis

### PROJECT TITLE: CUSTOMER-SEGMENTATION-ANALYSIS
---
[PROJECT OVERVIEW](#project-overview)

[DATA SOURCES](#data-sources)

[TOOLS USED](#tools-used)

[PROJECT STEPS](#Project-steps)

[DATA CLEANING AND PREPARATION](#data-cleaning-and-preparation)

[EXPLORATORY DATA ANALYSIS](#exploratory-data-analysis)

[DATA ANALYSIS](#data-analysis)

[DATA VISUALIZATION](#data-visualization)

[RECOMMENDATION AND CONCLUSION](#recommendation-and-conclusion)


## Project Overview
The goal of this project is to analyze subscription data to understand customer behavior, track subscription types, and trends in cancellations and renewals. This analysis will help in making informed decisions for customer retention and growth strategies.  The final deliverable is a Power BI dashboard that presents the analysis.


### DATA SOURCES
---
The Primary source of Data used is the Customer Segmentation for a Subscription service downloaded from the Learning Management System of the Ladies in Tech Africa.

## Tools Used
- **Microsoft Excel**: Used for
  a. Checked for Duplicates
  
  b. Remove Duplicates (data cleaning)

  c. Added Column to show End of Subscription
  
  d. Visualization

  e. Pivot table Analysis.

  f. Calculations.
  
- **SQL**: Used for data queries to extract insights on customer segmentation and subscription trends.
- **Power BI**: Created an interactive dashboard to visualize key findings.

## Project Steps
1. **Data Exploration in Excel**:
   - Used pivot tables to identify patterns in subscription data.
   - Calculated metrics like average subscription duration and popular subscription types.

2. **SQL Analysis**:
   - Wrote queries to answer key business questions, such as the number of customers per region, the average subscription duration, and subscription cancellation trends.
   - Additional queries calculated total revenue by subscription type and identified customers who canceled early.

3. **Power BI Visualization**:
   - Developed a dashboard with insights on customer segmentation, cancellation patterns, and subscription type popularity.
   - Included slicers for interactive analysis by subscription type, region, and cancellation status.
  

### DATA CLEANING AND PREPARATION
---
For Data cleaning and preparation, I carried out the following:

* Data loading and inspection
* Checked for Duplicates
* Removed duplicates
* Data cleaning using column profile 

### EXPLORATORY DATA ANALYSIS
---
This involved exploring the data to answer some questions such as:

* Understanding customer behavior
  
*  track subscription types
  
*  identify key trends in cancellations and renewals
  
### DATA ANALYSIS
---
some basic lines of codes and queries used:

```
SELECT * FROM [dbo].[Customer_Segmentation_for_Subscription_Service_Analysis];

-----1----- retrieve the total number of customers from each region.------
SELECT Region, COUNT(CustomerID) AS TotalCustomers
FROM [dbo].[Customer_Segmentation_for_Subscription_Service_Analysis]
GROUP BY Region;

----2----- find the most popular subscription type by the number of customers------
SELECT SubscriptionType, COUNT(CustomerID) AS MostPopularSubscriptionType
FROM [dbo].[Customer_Segmentation_for_Subscription_Service_Analysis]
GROUP BY SubscriptionType
ORDER BY MostPopularSubscriptionType DESC;

SELECT TOP 1 SubscriptionType, COUNT(CustomerID) AS NumberOfCustomers
FROM [dbo].[Customer_Segmentation_for_Subscription_Service_Analysis]
GROUP BY SubscriptionType
ORDER BY NumberOfCustomers DESC;

-----3---find customers who canceled their subscription within 6 months-----
SELECT CustomerID, CustomerName
FROM [dbo].[Customer_Segmentation_for_Subscription_Service_Analysis]
WHERE Canceled = 1 AND Duration_Months <= 6;

-----4-------calculate the average subscription duration for all customers-------
SELECT AVG(Duration_Months) AS AverageSubscriptionDuration
FROM [dbo].[Customer_Segmentation_for_Subscription_Service_Analysis];

-----5-----find customers with subscriptions longer than 12 months----
SELECT CustomerID
FROM[dbo].[CustomerProject]
WHERE datediff(day,SubscriptionStart,SubscriptionEnd) > 12;

SELECT * FROM [dbo].[CustomerProject]

-----6-----calculate total revenue by subscription type-----
SELECT SubscriptionType, SUM(Revenue) AS TotalRevenue
FROM [dbo].[Customer_Segmentation_for_Subscription_Service_Analysis]
GROUP BY SubscriptionType;


-----7-----find the top 3 regions by subscription cancellations-----


SELECT TOP 3 Region,
count (SubscriptionEnd) as SubscriptionEnd
FROM [dbo].[Customer_Segmentation_for_Subscription_Service_Analysis]
WHERE SubscriptionEnd is NOT NULL
GROUP BY Region
ORDER BY SubscriptionEnd DESC;

-----8------find the total number of active and canceled subscriptions----
SELECT SUM(CASE WHEN SubscriptionEnd is NULL THEN 1 ELSE 0 END) as total_active_Subscriptions,
SUM(CASE WHEN SubscriptionEnd is not null THEN 1 ELSE 0 END) as total_canceled_Subscriptions
FROM [dbo].[Customer_Segmentation_for_Subscription_Service_Analysis];

```
### DATA VISUALIZATION
---

![Screenshot (17)](https://github.com/user-attachments/assets/5e9e2802-b90d-4605-bdcf-cd93eae2a61e)
![Screenshot (16)](https://github.com/user-attachments/assets/10b803a3-b964-4950-a630-52f9f1b5163b)
![Screenshot (20)](https://github.com/user-attachments/assets/d07fd3f5-90bb-49d0-86bf-e5cc5da6ba29)


## Key Insights
- **Customer Segmentation**: The majority of customers come from the East, with Basic being the most popular subscription type.
- **Cancellation Trends**: The highest cancellation was with the Basic Subscription type and was from the North.
- **Revenue by Subscription Type**: Basic subscriptions contribute the most to total revenue, followed by Premium.

---

## Next Steps
- Focus on improving retention strategies for customers at high risk of early cancellation.
- Target marketing campaigns based on popular regions and subscription types.
- Consider incentives for long-term subscribers to increase average subscription duration.
- Survey should be conducted to know why most subscription was canceled. 

THANK YOU.
