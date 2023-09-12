create database Pizza_sales
GO
USE Pizza_sales
GO
SELECT * FROM sales
/*A> KPI*/
---Total Revenue
SELECT SUM(total_price) AS total_revenue 
  FROM sales;
---Average Order Value:
  SELECT ROUND(SUM(total_price)/COUNT (DISTINCT (order_id)),2) AS average_order_value
    FROM sales;
---Total Pizza Solds:
SELECT SUM(quantity) AS total_pizza_solds 
  FROM sales;
--- Total Orders: 
SELECT COUNT(DISTINCT(order_id)) AS total_orders
  FROM sales;
---Average Pizza per order:
SELECT ROUND(SUM(quantity)/COUNT(DISTINCT(order_id)),2) AS Average_Pizza_per_order
  FROM sales;

/*B> DAILY TREND FOR TOTAL ORDERS*/
  SELECT DATENAME(WEEKDAY,Order_date) AS Date,
         COUNT(DISTINCT(order_id)) AS total_orders
    FROM sales
GROUP BY DATENAME(WEEKDAY,Order_date);

/* C> MONTH TREND FOR TOTAL ORDERS */
  SELECT DATENAME(MONTH,Order_date) AS Month,
       COUNT(DISTINCT(order_id)) AS Total_orders
    FROM sales
GROUP BY DATENAME(MONTH,Order_date);

/* D> PERCENTAGE OF SALES BY PIZZA CATEGORY */
  SELECT pizza_category,
         SUM(total_price) AS total_revenue,
         ROUND(SUM(total_price)/(SELECT SUM(total_price) FROM sales)*100,2) AS percentage
    FROM SALES
GROUP BY pizza_category;

/*E> PERCENTAGE OF SALES BY PIZZA SALES */
  SELECT pizza_size,
         SUM(total_price) AS total_revenue,
	     ROUND(SUM(total_price) / (SELECT SUM(total_price) FROM sales)*100,2) AS percentage
    FROM sales
GROUP BY pizza_size;

/* F> TOTAL PIZZAS SOLDS BY PIZZA CATEGORY TRONG THÁNG 12 */
  SELECT pizza_category,
         SUM(quantity) AS Total_quantities_solds
    FROM sales
   WHERE month(order_date) = 12
GROUP BY pizza_category;

/*G> TOP 5 BEST-SELLERS BY REVENUE*/
  SELECT TOP 5 pizza_name,
         SUM(total_price) AS total_revenue
    FROM sales
GROUP BY pizza_name
ORDER BY total_revenue DESC;

/* H> TOP 5 BEST-SELLERS BY TOTAL QUANTITY*/
  SELECT TOP 5 pizza_name,
         SUM(quantity) AS total_quantity
    FROM sales
GROUP BY pizza_name
ORDER BY total_quantity DESC;

/* K> TOP 5 BEST-SELLERS BY TOTAL ORDER*/
  SELECT TOP 5 pizza_name,
         COUNT(DISTINCT(order_id)) AS total_order
    FROM sales
GROUP BY pizza_name
ORDER BY total_order DESC;

/*G> BOTTOM 5 BEST-SELLERS BY REVENUE*/
  SELECT TOP 5 pizza_name,
         SUM(total_price) AS total_revenue
    FROM sales
GROUP BY pizza_name
ORDER BY total_revenue;

/* H> BOTTOM 5 BEST-SELLERS BY TOTAL QUANTITY*/
  SELECT TOP 5 pizza_name,
         SUM(quantity) AS total_quantity
    FROM sales
GROUP BY pizza_name
ORDER BY total_quantity;

/* K> BOTTOM 5 BEST-SELLERS BY TOTAL ORDER*/
  SELECT TOP 5 pizza_name,
         COUNT(DISTINCT(order_id)) AS total_order
    FROM sales
GROUP BY pizza_name
ORDER BY total_order;
