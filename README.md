# 📈 Multi-Stock Performance & Volatility Analysis Dashboard

## Overview

This project is an end-to-end financial analytics solution designed to analyze the performance, volatility, and risk-adjusted returns of multiple stocks using Python, SQL, PostgreSQL, and Power BI.

The project leverages historical stock market data to evaluate investment opportunities through financial metrics such as Daily Returns, Volatility, Sharpe Ratio, Moving Averages, and Cumulative Returns. Interactive Power BI dashboards provide insights into stock performance, risk assessment, and trend analysis.

---

## Business Problem

Investors and financial analysts often need to answer questions such as:

* Which stocks generate the highest returns?
* Which stocks carry the highest risk?
* Which investments provide the best risk-adjusted performance?
* How do stock trends evolve over time?
* Which stocks move together and impact diversification strategies?

This project addresses these questions through data analytics and visualization.

---

## Tech Stack

### Programming & Analytics

* Python
* Pandas
* NumPy

### Database

* PostgreSQL

### Visualization

* Power BI

### Data Source

* Yahoo Finance (2020–2024)

---

## Dataset

Stocks Analyzed:

* AAPL (Apple)
* AMZN (Amazon)
* GOOGL (Alphabet)
* MSFT (Microsoft)
* NVDA (NVIDIA)
* TSLA (Tesla)

Historical stock data was collected and transformed into an analytical dataset.

---

## Project Workflow

### 1. Data Collection

Collected historical stock market data using Yahoo Finance.

### 2. Data Cleaning

* Handled missing values
* Corrected data types
* Standardized stock information
* Removed inconsistencies

### 3. Feature Engineering

Created key financial metrics:

* Daily Return
* Volatility
* MA50 (50-Day Moving Average)
* MA200 (200-Day Moving Average)
* Sharpe Ratio
* Cumulative Return
* Risk Category

### 4. Exploratory Data Analysis (EDA)

Performed:

* Stock trend analysis
* Return analysis
* Risk analysis
* Correlation analysis

### 5. SQL Analysis

Solved business-driven financial problems using:

* GROUP BY
* HAVING
* Window Functions
* RANK()
* DENSE_RANK()
* ROW_NUMBER()
* CTEs
* Subqueries

### 6. Dashboard Development

Created interactive Power BI dashboards for:

* Performance Analysis
* Risk & Volatility Analysis
* Trend Analysis & Investment Insights

---

# SQL Business Problems Solved

### Performance Analysis

* Which stock gave the highest return with the lowest risk?
* Which stock generated the highest cumulative wealth?
* Which stock attracted the highest investor activity?
* Which years delivered the best market performance?

### Risk Analysis

* Which stock is the most risky?
* Which stock provides the highest return per unit risk?
* Which stocks experienced volatility spikes?

### Trend Analysis

* Which stocks are showing bullish signals (Golden Cross)?
* Which stocks are showing bearish signals (Death Cross)?
* Which stocks consistently outperformed the market average?

### Advanced SQL Analysis

* Rank stocks based on Sharpe Ratio
* Top 3 performing stocks each year
* Most volatile stock every year
* Monthly best-performing stocks
* Portfolio recommendation analysis using risk-return criteria

---

# SQL Query Screenshots

### Query Execution Examples

![SQL Query 1](..SQL%20queries/Best%20stock.png)

![SQL Query 2](..SQL%20queries/return_volatility.png)

![SQL Query 3](..SQL%20queries/Risky_stock.png)

![SQL Query 4](..SQL%20queries/Stock_rank.png)

![SQL Query 5](..SQL%20queries/attractive_stock.png)

---

# Dashboard Screenshots

## Page 1 — Executive Summary & Performance Overview

Features:

* Average Daily Return
* Average Volatility
* Highest Sharpe Ratio
* Total Trading Volume
* Stock Price Trend Analysis
* Top Performing Stocks
* Long-Term Wealth Creation Analysis

![Executive Summary Dashboard](screenshots/01_executive_summary.png)

---

## Page 2 — Risk & Volatility Analysis

Features:

* Volatility Trend Analysis
* Sharpe Ratio Comparison
* Risk vs Return Analysis
* Highest & Lowest Volatility Metrics

![Risk Analysis Dashboard](screenshots/02_risk_analysis.png)

---

## Page 3 — Trend Analysis & Investment Insights

Features:

* Moving Average Analysis
* Bullish Trend Detection
* Correlation Heatmap
* Investment Insights

![Trend Analysis Dashboard](screenshots/03_trend_analysis.png)

---

# Key Insights

### Performance

* NVDA delivered the strongest long-term growth among all analyzed stocks.
* TSLA and NVDA generated significantly higher returns than traditional technology stocks.

### Risk

* TSLA exhibited the highest volatility, indicating larger price fluctuations.
* MSFT maintained relatively stable performance with lower risk.

### Risk-Adjusted Returns

* NVDA achieved the highest Sharpe Ratio, providing the strongest risk-adjusted performance.

### Diversification

* MSFT and GOOGL displayed strong positive correlation.
* TSLA showed comparatively lower correlation, improving diversification opportunities.

---

# Project Structure

```text
Multi-Stock-Performance-Volatility-Analysis/

│
├── data/
│
├── notebooks/
│
├── sql/
│
├── screenshots/
```

---

# Future Enhancements

* Portfolio optimization analysis
* Real-time stock market integration
* Forecasting using Machine Learning
* Automated financial reporting
* Sector-wise stock comparison

---

# Author

**Jai Kesarwani**

Data Analytics | Power BI | SQL | Python | Excel

If you found this project useful, consider giving it a ⭐ on GitHub.
