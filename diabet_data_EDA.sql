-- ******* Diabetes Dataset: Exploratory Data Analysis with SQL *******

-- DDL: Create the diabetes_data table with appropriate data types
CREATE TABLE diabetes_data (
    Diabetes_binary FLOAT,
    HighBP FLOAT,
    HighChol FLOAT,
    CholCheck FLOAT,
    BMI FLOAT,
    Smoker FLOAT,
    Stroke FLOAT,
    HeartDiseaseorAttack FLOAT,
    PhysActivity FLOAT,
    Fruits FLOAT,
    Veggies FLOAT,
    HvyAlcoholConsump FLOAT,
    AnyHealthcare FLOAT,
    NoDocbcCost FLOAT,
    GenHlth FLOAT,
    MentHlth FLOAT,
    PhysHlth FLOAT,
    DiffWalk FLOAT,
    Sex FLOAT,
    Age FLOAT,
    Education FLOAT,
    Income FLOAT
);

--Total record count : 70692

SELECT COUNT(*) AS total_records 
FROM diabetes_data;

--Count and Percentage of patients with diabetes and those without

SELECT
	Diabetes_binary,
	COUNT(*) AS count,
	ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM diabetes_data)),2) AS percentage
FROM diabetes_data
GROUP BY Diabetes_binary;

-- Count of males and females
SELECT 
	Sex,
	COUNT(*) AS count,
	ROUND((COUNT(*) * 100.0 /(SELECT COUNT(*) FROM diabetes_data)),2) AS percentage
FROM diabetes_data
GROUP BY Sex;

-- Average, Min and Max BMI for diabetic and non-diabetic patients
SELECT 
	Diabetes_binary,
	AVG(BMI) AS average_bmi,
	MIN(BMI) AS min_bmi,
	MAX(BMI) AS max_bmi
FROM diabetes_data
GROUP BY Diabetes_binary;

-- Relationship between diabetes and education level
SELECT
	Diabetes_binary,
	Education,
	COUNT(*) AS count,
	ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM diabetes_data)),2) AS percentage
FROM diabetes_data
GROUP BY Diabetes_binary, Education
ORDER BY count DESC;

-- Relationship between diabetes and general & mental health
SELECT
    Diabetes_binary,
    ROUND(CAST(AVG(GenHlth) AS numeric), 2) AS avg_gen_health,
    ROUND(CAST(AVG(MentHlth) AS numeric), 2) AS avg_mental_health
FROM diabetes_data
GROUP BY Diabetes_binary;

-- Smoking and diabetes status relationship
SELECT
    CASE 
        WHEN Smoker = 1 THEN 'Smoker' 
        ELSE 'Non-Smoker' 
    END AS smoker_status,
    CASE 
        WHEN Diabetes_binary = 1 THEN 'Diabetic' 
        ELSE 'Non-Diabetic' 
    END AS diabetes_status,
    COUNT(*) AS count,
    ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM diabetes_data)), 2) AS percentage
FROM diabetes_data
GROUP BY Smoker, Diabetes_binary;

-- Physical activity and diabetes status relationship
SELECT
   PhysActivity,
   Diabetes_binary,
   COUNT(*) AS count,
   (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM diabetes_data)) AS percentage
 FROM  diabetes_data
 GROUP BY PhysActivity, Diabetes_binary;

-- Heavy alcohol consumption and diabetes status relationship
SELECT
	HvyAlcoholConsump,
	Diabetes_binary,
	COUNT(*) AS count,
	(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM diabetes_data)) AS percentage
FROM diabetes_data
GROUP BY HvyAlcoholConsump, Diabetes_binary
ORDER BY count DESC;

-- Fruits and Veggies consumption and diabetes status relationship
SELECT
	Fruits, Veggies,
	Diabetes_binary,
	COUNT(*) AS count,
	(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM diabetes_data)) AS percentage
FROM diabetes_data
GROUP BY Fruits, Veggies, Diabetes_binary
ORDER BY count DESC;

-- Diabetes rate by age range
SELECT
    Age,
    SUM(CASE WHEN Diabetes_binary = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS diabetes_rate
FROM diabetes_data
GROUP BY Age
ORDER BY Age;

-- *** Summary statistics  General Health, and Mental Health
SELECT
    Diabetes_binary,
    AVG(GenHlth) AS avg_gen_health,
    AVG(MentHlth) AS avg_mental_health
FROM diabetes_data
GROUP BY Diabetes_binary;


