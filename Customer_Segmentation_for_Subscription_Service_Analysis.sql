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
