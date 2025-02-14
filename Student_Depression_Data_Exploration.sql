CREATE TABLE StudentDepression (
    Gender TEXT,
    Age INTEGER,
    Academic_Pressure FLOAT,
    Study_Satisfaction FLOAT,
    Sleep_Duration TEXT,
    Dietary_Habits TEXT,
    Have_you_ever_had_suicidal_thoughts TEXT,
    Study_Hours INTEGER,
    Financial_Stress INTEGER,
    Family_History_of_Mental_Illness TEXT,
    Depression TEXT
);

SELECT * FROM StudentDepression;


-- 1. Mencari jumlah siswa yg memiliki suicidal thoughts & depresi berdasarkan gender
SELECT Gender,
	COUNT(*) as Total_People,
	COUNT(CASE WHEN Have_you_ever_had_suicidal_thoughts = 'Yes' Then 1 End) as Suicidal_Thoughts_Count,
	COUNT(CASE WHEN Depression = 'Yes' Then 1 End) as Depression_Count
FROM StudentDepression 
GROUP BY Gender 
ORDER BY Gender DESC;


-- 2. Korelasi riwayat penyakit mental keluarga terhadap suicidal Thoughts & depresi
SELECT Family_History_of_Mental_Illness, 
	   Have_you_ever_had_suicidal_thoughts, 
	   Depression, 
	   COUNT(*) as Total_Person
FROM StudentDepression 
GROUP BY Depression, Have_you_ever_had_suicidal_thoughts, Family_History_of_Mental_Illness
ORDER BY Total_Person DESC;


-- 3. Korelasi Tekananan Akademis, kepuasan belajar, Jam belajar, financial terhadap depresi
SELECT Depression, 
	   Have_you_ever_had_suicidal_thoughts,
	   ROUND(AVG(academic_pressure)) as Average_Academic_Pressure,
	   ROUND(AVG(study_satisfaction)) as Average_Study_Satisfaction,
       ROUND(AVG(study_hours)) as Average_Study_Hours,
	   ROUND(AVG(financial_stress)) as Average_Financial_Stress
FROM StudentDepression 
GROUP BY Depression, have_you_ever_had_suicidal_thoughts 
ORDER BY 1 DESC;


-- 4. Pengaruh Jumlah jam tidur terhadap depresi dan suicidal toughts
SELECT Sleep_Duration, 
	   COUNT(CASE WHEN depression = 'Yes' THEN 1 END) as Depression_Count,
	   COUNT(CASE WHEN depression = 'No' THEN 1 END) as Not_Depression_Count
FROM StudentDepression 
GROUP BY Sleep_Duration 
ORDER BY Sleep_Duration ASC;
 


-- 5. Analisis pola makan terhadap depresi
SELECT dietary_habits,
	   COUNT(CASE WHEN depression = 'Yes' Then 1 End) as Depression_Count,
 	   COUNT(CASE WHEN depression = 'No' Then 1 End) as Not_Depression_Count
FROM StudentDepression 
GROUP BY dietary_habits 
ORDER BY Depression_Count DESC





