SELECT * FROM retail;

SELECT DATE(InvoiceDate) AS SaleDate, SUM(Quantity) AS ItemsSold
FROM retail
GROUP BY SaleDate
ORDER BY SaleDate;

SELECT
    SaleDate,
    ItemsSold,
    SUM(ItemsSold) OVER (ORDER BY SaleDate) AS RunningTotal
FROM (
    SELECT DATE(InvoiceDate) AS SaleDate, SUM(Quantity) AS ItemsSold
    FROM retail
    GROUP BY SaleDate
) daily_sales
ORDER BY SaleDate;

SELECT
    SaleDate,
    ItemsSold,
    SUM(ItemsSold) OVER (PARTITION BY Country ORDER BY SaleDate) AS RunningTotal,
    Country
FROM (
    SELECT DATE(InvoiceDate) AS SaleDate, SUM(Quantity) AS ItemsSold, Country
    FROM retail
    GROUP BY SaleDate, Country
) daily_sales
ORDER BY Country, SaleDate;
