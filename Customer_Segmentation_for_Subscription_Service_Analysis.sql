

SELECT *FROM [dbo].[Customer_Segmentation_for_Subscription_Service_Analysis];

SELECT Region, COUNT(CustomerID) AS TotalCustomers
FROM [dbo].[Customer_Segmentation_for_Subscription_Service_Analysis]
GROUP BY Region;


SELECT SubscriptionType, COUNT(CustomerID) AS MostPopularSubscriptionType
FROM [dbo].[Customer_Segmentation_for_Subscription_Service_Analysis]
GROUP BY SubscriptionType
ORDER BY MostPopularSubscriptionType DESC;

SELECT TOP 1 SubscriptionType, COUNT(CustomerID) AS NumberOfCustomers
FROM [dbo].[Customer_Segmentation_for_Subscription_Service_Analysis]
GROUP BY SubscriptionType
ORDER BY NumberOfCustomers DESC;


SELECT CustomerID, CustomerName
FROM [dbo].[Customer_Segmentation_for_Subscription_Service_Analysis]
WHERE Canceled = 1 AND Duration_Months <= 6;


SELECT AVG(Duration_Months) AS AverageSubscriptionDuration
FROM [dbo].[Customer_Segmentation_for_Subscription_Service_Analysis];


SELECT CustomerID, CustomerName
FROM [dbo].[Customer_Segmentation_for_Subscription_Service_Analysis]
WHERE DATEDIFF(month, SubscriptionStart, SubscriptionEnd) > 12;



SELECT SubscriptionType, SUM(Revenue) AS TotalRevenue
FROM [dbo].[Customer_Segmentation_for_Subscription_Service_Analysis]
GROUP BY SubscriptionType;


SELECT Region, COUNT(CustomerID) AS Cancellations
FROM [dbo].[Customer_Segmentation_for_Subscription_Service_Analysis]
WHERE Canceled = 1
GROUP BY Region
ORDER BY Cancellations DESC


SELECT 
    SUM(CASE WHEN Canceled = 0 THEN 1 ELSE 0 END) AS ActiveSubscriptions,
    SUM(CASE WHEN Canceled = 1 THEN 1 ELSE 0 END) AS CanceledSubscriptions
FROM [dbo].[Customer_Segmentation_for_Subscription_Service_Analysis];
