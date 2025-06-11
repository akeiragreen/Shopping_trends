-- Creating a copy of the original table to preserve the raw data and avoid making direct changes

SELECT *
FROM shopping_trends;

CREATE TABLE shopping_trend2
LIKE shopping_trends;

INSERT shopping_trend2
SELECT *
FROM shopping_trends;

SELECT *
FROM shopping_trend2;

-- --------------------------------------------------------------------------------------------------------------
--                                           CUSTOMER BEHAVIOR 

--    Who are our top 10 most valuable customers?

SELECT `customer_id`,
`age`, `gender`, `item_purchased`, `category`,
 `purchase_amount_usd`, `location`, `season`, 
 `review_rating`, `subscription_status`, `shipping_type`,
 `discount_applied`, `previous_purchases`, 
 `preferred_payment_method`, `frequency_of_purchases`
FROM shopping_trend2
WHERE `frequency_of_purchases` = 'weekly'
AND `subscription_status` = 'Yes'
ORDER BY `purchase_amount_usd` DESC
LIMIT 10;

-- SQL Logic Summary: Filtered customers who shop weekly and have active subscriptions.
--        Ranked customers based on their total purchase amount in USD.
--        Selected the top 10 highest spenders.

-- Insights for Stakeholders: All top 10 customers are male, subscribed to our service, and exhibit weekly shopping habits.
--        These high-value customers significantly contribute to revenue stability and predictability.
--        Retention strategies targeting weekly subscribers could yield strong ROI.


-- -----------------------------------------------------------------------------------------

-- What is the relationship between review ratings and frequency of purchase ?


SELECT 
	`frequency_of_purchases`,
	CASE 
		WHEN `review_rating` >= 4 THEN 'High'
        WHEN `review_rating` = 3 THEN 'Medium'
        ELSE 'Low' 
   END AS review_ratings, 
   COUNT(*) AS total_purchases,
   ROUND(AVG(`purchase_amount_usd`),2) AS avg_purchase_amount
   FROM shopping_trend2
   GROUP BY `frequency_of_purchases`, review_ratings
   ORDER BY total_purchases DESC  ;

-- SQL Logic Summary: Categorized review ratings into High (≥4), Medium (=3), and Low (<3).
--      Grouped the data by frequency of purchase and review rating category.
--      Calculated both total purchases and average purchase amount per group.

-- Insights for Stakeholders: Infrequent shoppers (Quarterly, Annually) often leave lower ratings, 
--         which may indicate dissatisfaction or unmet expectations.
--      More frequent shoppers (e.g., Bi-Weekly) tend to spend more per transaction, even if they occasionally leave lower ratings.
--      Improving the experience of infrequent shoppers may help convert them into more frequent, high-value customers.


-- -----------------------------------------------------------------------------------------------------------------

--                        Revenue & Sales Performance

--     Which seasons generate the most revenue and purcases?

SELECT `season`,
COUNT(*) AS total_purchase,
SUM(`purchase_amount_usd`) AS total_revenue 
FROM shopping_trend2
GROUP BY `season`
ORDER BY total_revenue DESC
;

-- SQL Logic Summary: Aggregated total purchases and revenue for each season.
--       Ranked seasons based on revenue contribution.

-- Insights for Stakeholders: Fall is the most lucrative season, generating approximately $756,367 in revenue.
--        Spring accounts for the highest purchase volume (1,230 transactions).
--        Marketing and inventory efforts should focus on maximizing high-revenue potential during Fall, 
--           while optimizing Spring campaigns for volume sales.


-- --------------------------------------------------------------------------------------------------

-- Do discounts and promo codes actually increase the total purchae amount or frequency?

SELECT discount_applied,promo_code_used,
COUNT(*) AS total_purchases,
SUM(purchase_amount_usd) AS total_revenue,
ROUND(AVG(previous_purchases), 2) AS avg_purchase_frequency
FROM shopping_trend2
GROUP BY discount_applied, promo_code_used
ORDER BY total_revenue DESC;

-- SQL Logic Summary: Grouped customer transactions based on whether they used a discount and/or a promo code.
--      Calculated total purchases, total revenue, and average purchase frequency for each combination.

-- Insights for Stakeholders: Promo code users contributed the lowest total purchases (2,251 orders) and 
--             revenue ($137,765), suggesting limited financial upside.
--     Discounted purchases without promo codes performed better in both order volume and revenue.
--     Promo codes may attract deal-seekers with lower lifetime value; optimization of promo strategy is 
--             recommended to target long-term, high-value customers instead of one-time bargain hunters.





-- -------------------------------------------------------------------------------------------------------------

--                               Logisticts & operations


--    Which shipping type is preferred by high-value customers?

SELECT `shipping_type`, 
COUNT(*) AS total_high_value_customers
FROM shopping_trend2
WHERE `subscription_status` = 'Yes'
AND `frequency_of_purchases` = 'Weekly'
GROUP BY `shipping_type`
ORDER BY total_high_value_customers DESC;

-- SQL Logic Summary: Filtered for high-value customers (weekly shoppers with active subscriptions).
--    Aggregated data by shipping type to determine popularity among this segment.

-- Insights for Stakeholders: Free Shipping is the most favored option among top-tier customers (52 users),
--               emphasizing that convenience and cost-saving drive loyalty.
--    Express Shipping appeals to a secondary segment (39 users), indicating some customers are willing to pay for speed.
--     Shipping options should continue prioritizing free shipping to maintain loyalty 
--               while offering fast delivery options for time-sensitive shoppers.


-- ----------------------------------------------------------------------------

--  	What payment methods are most common among the frequent shoppers?

SELECT `preferred_payment_method`, 
COUNT(*) AS total_high_value_customers
FROM shopping_trend2
WHERE `subscription_status` = 'Yes'
AND `frequency_of_purchases` = 'Weekly'
GROUP BY `preferred_payment_method`
ORDER BY total_high_value_customers DESC;


-- SQL Logic Summary: Filtered for high-value, frequent shoppers.
--  Grouped data by preferred payment method and calculated count for each.

-- Insights for Stakeholders: Credit Card is the leading payment method (44 users), 
--        showing a strong preference for traditional payment systems.
--    PayPal follows closely (39 users), suggesting that offering multiple digital options is important.
--    Payment flexibility contributes to smoother customer experiences; 
--        expanding secure digital options may further improve conversion rates.






-- ------------------------------------------------------------------------------------------------------



--                              Marketing Insights


-- 	Do customers who rate items higher spend more overtime?


SELECT 
		CASE
        WHEN `review_rating` >= 4 THEN 'High'
        WHEN `review_rating` = 3 THEN 'Meduim'
        ELSE 'Low'
        END AS rating_group,
COUNT(*) AS total_orders ,
SUM(`purchase_amount_usd`) AS Total_spent ,
ROUND(AVG(`previous_purchases`), 2) AS avg_previous_purchases,
ROUND(AVG(`purchase_amount_usd`), 2) AS avg_order_value
FROM shopping_trend2
GROUP BY rating_group
ORDER BY total_spent DESC;

-- SQL Logic Summary: Grouped customers by review rating sentiment: High (≥4), Medium (=3), Low (<3).
--   Calculated total orders, total spending, average previous purchases, and average order value.

-- Insights for Stakeholders: High raters had fewer orders but higher average order values ($60.62), 
--         indicating premium customer behavior.
--    Medium raters exhibited the highest average order value ($61.47) and higher repeat purchase behavior.
--   Low raters generated the most orders but had lower average spending per order.
--   While dissatisfied customers transact frequently, satisfied customers tend to spend more per purchase, 
--        suggesting that improving satisfaction can directly increase profitability.

































