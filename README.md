# Real-State-Analysis----SQL-Excel
This project focuses on analyzing a real estate market dataset using SQL to uncover insights related to property pricing, market trends, demand, construction activity, investor activity, and affordability.
📌 Project Overview

This project focuses on analyzing a real estate market dataset using SQL to uncover insights related to property pricing, market trends, demand, construction activity, investor activity, and affordability.

The project follows a structured case-study approach covering data exploration, data cleaning, market analysis, economic indicators, and buyer/affordability analysis.

🎯 Objectives

The main objectives of this project are to:

Assess data quality and identify missing values and anomalies
Clean and standardize real estate transaction data
Analyze property prices across cities, years, and property types
Calculate year-over-year changes in property prices
Analyze the relationship between interest rates and property prices
Compare housing demand across cities
Analyze property size distributions
Track new property construction over time
Identify changes in investor activity
Analyze buyer segmentation and affordability challenges where the available data supports it
🗂️ Dataset

The project uses three main datasets:

1. Properties & Transactions

Contains property-level transaction information such as:

Property ID
Property Type
City
Neighborhood
Size (Sq. Ft.)
Bedrooms
Bathrooms
Year Built
Listing Price
Rental Price
Status
2. Agents & Clients

Contains information related to:

Agents
Clients
Client type
Income bracket
Agent performance
3. Market Trends & Economic Indicators

Contains city/year-level market information including:

📊 Project Analysis
Stage 1 — Data Exploration & Initial Assessment
Evaluated dataset completeness
Checked missing values
Identified duplicate records
Checked invalid and extreme property prices
Investigated property-size anomalies
Examined property types and geographic coverage
Stage 2 — Data Cleaning & Preparation
Imputed missing listing prices using median values
Imputed missing property sizes using average values
Removed duplicate property records
Removed invalid prices
Applied price outlier treatment using the 99th percentile
Stage 3 — Market Trends & Pricing Analysis
Calculated average listing prices by city and year
Calculated YoY price changes
Compared property prices across cities
Compared average prices by property type
Identified frequently listed property types
Studied the relationship between interest rates and listing prices
Stage 4 — Housing Demand & Property Characteristics
Compared housing demand across cities
Analyzed average property sizes by property type
Examined property-size distributions
Stage 5 — Supply & Investment Analysis
Analyzed new property developments by year
Compared new construction across cities
Studied supply-price dynamics
Calculated changes in investor activity over time

Data limitation: The currently available transaction table does not contain sufficient buyer-level information such as Client_ID, transaction history, or ownership/occupancy information. Therefore, First-Time Buyer, Repeat Buyer, and Investor categories cannot be reliably derived from the available transaction data without making unsupported assumptions.

🔍 Key SQL Concepts Demonstrated
CTEs

Used to break complex analytical queries into manageable steps.

Window Functions

Used for:

LAG()
ROW_NUMBER()
COUNT() OVER()

particularly for year-over-year and ranking analysis.

Data Cleaning

Handled:

Missing values
Duplicate records
Invalid prices
Extreme values
Outliers
Statistical Analysis

Used:

Mean
Median
Percentiles
IQR-based outlier detection
Percentage change
📁 Project Structure
Real-Estate-Market-Analysis/
│
├── README.md
│
├── SQL/
│   ├── Stage_1_Data_Exploration.sql
│   ├── Stage_2_Data_Cleaning.sql
│   ├── Stage_3_Market_Analysis.sql
│   ├── Stage_4_Demand_Analysis.sql
│   ├── Stage_5_Supply_Investment.sql
│   └── Stage_6_Buyer_Affordability.sql
│
├── Dataset/
│   └── Real_Estate_Dataset.csv
│
└── Documentation/
    └── Problem_Statement.pdf
💡 Business Questions Answered

Some of the major questions addressed in this project include:

How complete and reliable is the real estate dataset?
What are the major pricing trends across cities?
Which property types have the highest average listing prices?
How have property prices changed year over year?
How do interest rates relate to property prices?
Which cities have the strongest housing demand?
Which cities have the highest construction activity?
How has investor activity changed over time?
What affordability challenges exist across income groups?
📈 Skills Demonstrated

SQL | MySQL | Data Cleaning | Data Analysis | CTEs | Window Functions | Statistical Analysis | Business Analysis | Real Estate Analytics
