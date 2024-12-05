**Diabetes Data Analysis with SQL**

**Project Overview**

This project demonstrates the power of SQL in exploring and analyzing health-related data, focusing on diabetes risk factors and their relationships with various health indicators. The dataset, derived from the BRFSS (Behavioral Risk Factor Surveillance System) 2015 data, includes 70,692 records with 22 health-related features, such as BMI, smoking habits, physical activity, general health, and mental health.

The primary goals of this analysis are to uncover patterns, relationships, and insights related to diabetes prevalence using SQL queries and techniques that range from beginner to advanced levels.

**Dataset Description**

Source: Kaggle (Inspired by Xie ZiDian et al., 2019 - Building Risk Prediction Models for Type 2 Diabetes).

Record Count: 70,692 entries.

Columns: 22 (All variables are FLOAT type; no missing values).

**Features:**
Target Variable: Diabetes_binary (1 for diabetic, 0 for non-diabetic).
Other  Variables: BMI, Age, HighBP, HighChol, PhysActivity, GenHlth, MentHlth, Smoker,	CholCheck, Stroke,	HeartDiseaseorAttack, Fruits, Veggies,	HvyAlcoholConsump, AnyHealthcare, NoDocbcCost, PhysHlth,	DiffWalk,	Sex, Education,	Income

**Importance of SQL in Health Data Analysis**
The use of SQL enables efficient processing and analysis of large datasets, facilitating actionable insights for healthcare practitioners and policymakers. 


**Some Key Findings**

1. Prevalence of Diabetes
Percentage of Diabetic Patients: 50 % of the dataset population.

2. BMI Trends
Average BMI: 29,85
Diabetic Patients: 31,94
Non-Diabetic Patients: 27,77

**Project Structure**

**File 1: health_data_SQL.sql :**
This file focuses on exploratory data analysis (EDA) with SQL.
Basic Queries: Data filtering, sorting, and aggregations.
Advanced Queries: Subqueries, conditional logic, and CTEs.
Focus: Uncovering health trends and diabetes patterns.

**File 2: SQL_beginner2advanced_health_data.sql:** 
A structured learning path from beginner to advanced SQL concepts using the same dataset.
Beginner Level: Selecting data, filtering, and sorting.
Intermediate Level: Aggregations, grouping, and basic case statements.
Advanced Level: Subqueries, CTEs, and data modifications.

**Next Steps**
Visualization: Complement SQL analysis with visualizations (e.g., in Tableau or Python).
Machine Learning: Use the insights as features for predictive modeling to identify diabetes risks.
Health Interventions: Leverage findings to design targeted health campaigns and lifestyle recommendations.

**This project highlights the utility of SQL for healthcare data analysis, paving the way for impactful decisions in public health and medicine.**






