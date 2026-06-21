
-- Multi Stock Performance & Volatility Analysis

SELECT * FROM stocks LIMIT 5;


-- Business Problems 

-- Problem 1: Which stock gave highest return with lowest risk?

SELECT "Stock", ROUND((AVG("Daily_Return")*100)::numeric,2) AS "Average Return", 
	   ROUND((AVG("Volatility")*100)::numeric,2) AS "Average Volatility"
FROM stocks
GROUP BY "Stock"
ORDER BY "Average Return" DESC, "Average Volatility" ASC


-- Problem 2: Which stock had highest cumulative wealth creation?

SELECT "Stock", ROUND(MAX("Cumulative_Return")::numeric,2) AS "Total Growth"
FROM stocks
GROUP BY "Stock"
ORDER BY "Total Growth" DESC


-- Problem 3: Which stock is most risky?

SELECT "Stock", ROUND((AVG("Volatility")*100)::numeric,2) AS "Average Volatility"
FROM stocks
WHERE "Sharpe_Ratio" < 1
GROUP BY "Stock"
ORDER BY "Average Volatility" DESC


-- Problem 4: Which stock provides highest return per unit risk?

SELECT "Stock", ROUND(AVG("Sharpe_Ratio")::numeric,2) AS "Average Sharpe"
FROM stocks
GROUP BY "Stock"
ORDER BY "Average Sharpe" DESC


-- Problem 5 : Which stock attracts highest investor activity?

SELECT "Stock", SUM("Volume") AS "Total Volume"
FROM stocks
GROUP BY "Stock"
ORDER BY "Total Volume" DESC


-- Problem 6: Which years was best market periods?

SELECT "Year", "Stock", ROUND((AVG("Daily_Return")*100)::numeric,2) AS "Average Return"
FROM stocks
GROUP BY "Year", "Stock"
ORDER BY "Year", "Average Return" DESC


-- Problem 7 : Which stocks are showing bullish signals?
-- MA50 > MA200 => Golden Cross

SELECT "Date", "Stock", ROUND("MA50"::numeric,2) AS "MA50", ROUND("MA200"::numeric,2) AS "MA200"
FROM stocks
WHERE "MA50" > "MA200"
ORDER BY "Date" DESC


-- Problem 8 : Which stocks are detecting bearish signals?
-- MA50 < MA200 => Death Cross

SELECT "Date", "Stock", ROUND("MA50"::numeric,2) AS "MA50", ROUND("MA200"::numeric,2) AS "MA200"
FROM stocks
WHERE "MA50" < "MA200"
ORDER BY "Date" DESC


--Problem 9 : Rank Stocks Based on Risk-Adjusted Performance

SELECT "Stock", ROUND(AVG("Sharpe_Ratio")::numeric,2) AS "Averge Sharpe",
	   RANK() OVER (ORDER BY AVG("Sharpe_Ratio") DESC) AS "Sharpe Rank"
FROM stocks
GROUP BY "Stock"

--Problem 10 : Top 3 Performing Stocks Each Year

WITH yearly_returns AS (
SELECT "Year", "Stock", ROUND((AVG("Daily_Return")*100)::numeric,2) AS "Average Return",
RANK() OVER(PARTITION BY "Year" 
			ORDER BY AVG("Daily_Return") DESC) AS "Rank Number"

FROM stocks
GROUP BY "Year", "Stock")

SELECT *
FROM yearly_returns
WHERE "Rank Number" <=3;


--Problem 11 : Most Volatile Stock Every Year

WITH yearly_risks AS (
SELECT "Year","Stock", ROUND((AVG("Volatility")*100)::numeric,2) AS "Average Volatility",
ROW_NUMBER() OVER (PARTITION BY "Year"
				   ORDER BY AVG("Volatility") DESC) AS rn

FROM stocks
GROUP BY "Year", "Stock")

SELECT * 
FROM yearly_risks
WHERE rn = 1;


--Problem 12 : Which Stocks Consistently Beat Market Average?

SELECT "Stock", ROUND((AVG("Daily_Return")*100)::numeric,2) AS "Average Return"
FROM stocks
GROUP BY "Stock"
HAVING AVG("Daily_Return") > (SELECT AVG("Daily_Return") FROM stocks) -- Stock Avg > Market Avg
ORDER BY "Average Return" DESC


--Problem 13 : Rank Stocks by Trading Activity

SELECT "Stock", SUM("Volume") AS "Total Volume",
DENSE_RANK() OVER(ORDER BY SUM("Volume") DESC) AS dense
FROM stocks
GROUP BY "Stock"


--Problem 14: Monthly Best Performing Stock

WITH monthly_rank AS(
SELECT "Year", "Month", "Stock", ROUND((AVG("Daily_Return")*100)::numeric,2) AS "Average Return",
ROW_NUMBER() OVER(PARTITION BY "Year", "Stock"
			ORDER BY AVG("Daily_Return") DESC) AS rn
FROM stocks
GROUP BY "Year", "Month", "Stock"
)
SELECT * 
FROM monthly_rank
WHERE rn =1;


--Problem 15 : Find stocks that combine high return, low risk, strong sharpe ratio

SELECT "Stock", ROUND((AVG("Daily_Return")*100)::numeric,2) AS "Average Return",
				ROUND((AVG("Volatility")*100)::numeric,2) AS "Average Volatility",
				ROUND(AVG("Sharpe_Ratio")::numeric,2) AS "Average Sharpe"
FROM stocks
GROUP BY "Stock"
HAVING AVG("Sharpe_Ratio") > 0.05 AND AVG("Volatility") < 0.03
ORDER BY "Average Sharpe" DESC


--Problem 16 : Identify Stocks with Unusual Volatility Spikes

SELECT "Date", "Stock", ROUND(("Volatility"*100)::numeric,2) AS "Volatility"
FROM stocks
WHERE "Volatility" > ( SELECT AVG("Volatility") + 2 * STDDEV("Volatility") FROM stocks )
ORDER BY "Volatility" DESC;


--Problem 17 : Compare Stock Performance Against Yearly Average

WITH yearly_avg AS (
SELECT "Year", ROUND(AVG("Daily_Return")::numeric,2) AS "Average Return"
FROM stocks
GROUP BY "Year"
)

SELECT s."Year", s."Stock",
ROUND((AVG(s."Daily_Return")*100)::numeric,2) AS "Stock Return",
ROUND((y."Average Return"*100)::numeric,2) AS "Market Average"
FROM stocks s
JOIN yearly_avg y
ON s."Year" = y."Year"
GROUP BY s."Year", s."Stock", y."Average Return"
ORDER BY s."Year";



