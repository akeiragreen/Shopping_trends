# 🛒 Shopping Trends SQL Analysis Project

## Project Overview

This project leverages SQL to analyze customer shopping trends, behaviors, and sales performance. The goal is to extract actionable business insights that can inform marketing, operations, logistics, and customer retention strategies.

## Dataset Description

The dataset includes detailed information across multiple customer touchpoints:

- Customer demographics (Age, Gender, Location)
- Purchase information (Item, Category, Purchase Amount)
- Subscription and shipping status
- Discounts, promo codes, and payment methods
- Review ratings and frequency of purchases

---

## Business Questions & Key Insights

### 1️⃣ Customer Behavior Analysis
**Question:** Who are our top 10 most valuable customers?
**Insight:**
- All top 10 customers are male, subscribed, and shop weekly.
- These high-value customers are highly loyal and predictable revenue drivers.
- Retention strategies for weekly subscribers can yield strong financial returns.

### 2️⃣ Review Ratings vs Purchase Frequency
**Question:** What is the relationship between review ratings and purchase frequency?
**Insight:**
- Infrequent shoppers often leave lower ratings, suggesting unmet expectations.
- Frequent shoppers (bi-weekly) spend more per transaction even when reviews are mixed.
- Improving the experience for infrequent shoppers may help convert them to high-frequency buyers.

### 3️⃣ Revenue & Seasonal Performance
**Question:** Which seasons generate the most revenue and purchases?
**Insight:**
- Fall leads in revenue (~$756K), while Spring sees the highest transaction count (1,230 purchases).
- Fall should be the primary focus for revenue-boosting campaigns, with Spring optimized for volume-based promotions.

### 4️⃣ Discounts & Promo Codes Impact
**Question:** Do discounts and promo codes increase total purchase amount or frequency?
**Insight:**
- Promo code users generate the lowest total purchases and revenue.
- Discounts without promo codes perform better financially.
- The promo code strategy may need optimization to target higher-value, repeat customers rather than bargain hunters.

### 5️⃣ Shipping Type Preferences
**Question:** Which shipping type is preferred by high-value customers?
**Insight:**
- Free shipping is overwhelmingly preferred (52 top-tier customers).
- Express shipping appeals to a smaller, time-sensitive segment (39 customers).
- Offering both free and express options supports customer satisfaction and loyalty.

### 6️⃣ Payment Method Preferences
**Question:** What payment methods are most common among frequent shoppers?
**Insight:**
- Credit Card is the leading method (44 users), followed closely by PayPal (39 users).
- Providing diverse digital payment options helps maximize customer convenience.

### 7️⃣ Spending Behavior by Review Rating
**Question:** Do higher ratings correlate with more spending over time?
**Insight:**
- High raters have fewer orders but higher average order values (~$60.62).
- Medium raters have the highest average order value ($61.47) and purchase frequency.
- Low raters transact more but spend less per order.
- Boosting satisfaction could directly increase average transaction value.

---

## Tools Used

- **SQL:** MySQL syntax for querying, aggregations, filtering, grouping, and advanced analysis.
- **Data Preparation:** Table cloning to protect raw data.

---

## Business Implications

- Loyalty programs targeting weekly subscribers can maximize revenue.
- Promo codes should focus on long-term customer acquisition, not just short-term volume.
- Shipping flexibility strengthens customer satisfaction.
- Enhancing customer satisfaction correlates with higher spending behavior.
- Payment method variety supports frictionless purchasing experiences.

---

## Author

Created by **akeira green**
