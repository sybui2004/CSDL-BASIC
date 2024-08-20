CREATE DATABASE HealthcareSystemDB

CREATE TABLE Patients (
	PatientID INT PRIMARY KEY
	, Name NVARCHAR (50)
	, DOB DATE
	, Gender CHAR(1)
	, Address NVARCHAR (150)
	, ContactInfo NVARCHAR (50)
);

CREATE TABLE Doctors (
	DoctorID INT PRIMARY KEY
	, Name NVARCHAR (50)
	, Specialty NVARCHAR (50)
	, ContactInfo NVARCHAR (50)
);

CREATE TABLE Appointments (
	AppointmentID INT PRIMARY KEY
	, PatientID INT NOT NULL
	, DoctorID INT NOT NULL
	, FOREIGN KEY (PatientID) REFERENCES [dbo].[Patients](PatientID)
	, FOREIGN KEY (DoctorID) REFERENCES [dbo].[Doctors](DoctorID)
	, Date DATE
	, Time TIME
	, Reason NVARCHAR (50)
);

CREATE TABLE Treatments (
	TreatmentID INT PRIMARY KEY
	, AppointmentID INT NOT NULL
	, FOREIGN KEY (AppointmentID) REFERENCES [dbo].[Appointments](AppointmentID)
	, Description NVARCHAR (200)
	, Outcome NVARCHAR (50)
);


CREATE TABLE Prescriptions (
	PrescriptionID INT PRIMARY KEY
	, PatientID INT NOT NULL
	, FOREIGN KEY (PatientID) REFERENCES [dbo].[Patients](PatientID)
	, DrugName NVARCHAR (100)
	, Dosage INT
	, Duration NVARCHAR (50)
	
);

-- Basic Data Manipulation
-- Task 1: Retrieve a complete list of all registered patient

SELECT 
	*
FROM 
	[dbo].[Patients]

-- Task 2: A patient has moved to a new address and updated their contact information. Reflect this change in the database

UPDATE Patients
SET 
    Address = 'Ha Noi',
    ContactInfo = 'sdfdsdd'
WHERE 
    PatientID = 2;

-- Task 3: Delete a Doctor


DELETE FROM Treatments
WHERE AppointmentID IN (
    SELECT AppointmentID
    FROM Appointments
    WHERE DoctorID = 3
);

DELETE FROM Appointments
WHERE DoctorID = 3;


DELETE FROM Doctors
WHERE DoctorID = 3;

-- Intermediate Querying
-- Task 4: For a new brochure, list all doctors along with their specialties in alphabetical order

SELECT 
    Name,
    Specialty
FROM 
    Doctors
ORDER BY 
    Name ASC;

-- Task 5: Analyze the patient demographic by counting the number of patients of each gender

SELECT 
    Gender,
    COUNT(*) AS NumberOfPatients
FROM 
    Patients
GROUP BY 
    Gender;

-- Task 6: Review the scheduling load by finding all appointments scheduled in a specific year

SELECT 
    *
FROM 
    Appointments
WHERE 
    YEAR(Date) = 2023;

-- Advanced Data Manipulation
-- Task 7: Classify older appointments as 'Old Appointment' and recent ones as 'Recent Appointment'

SELECT 
    *,
    CASE
        WHEN Date < DATEADD(MONTH, -12, GETDATE()) THEN 'Old Appointment'
        ELSE 'Recent Appointment'
    END AS AppointmentType
FROM 
    Appointments;

-- Task 8: Remove appointments from the database that have not led to any treatments

DELETE FROM Appointments
WHERE AppointmentID NOT IN (
    SELECT DISTINCT AppointmentID
    FROM Treatments
);

-- Task 9: To better categorize treatments, add a new column 'Treatment Type' to the Treatments table

ALTER TABLE Treatments
ADD TreatmentType VARCHAR(50);

UPDATE Treatments
SET TreatmentType = 'Type1'
WHERE TreatmentID = 10;

-- Advanced SQL Concepts and Joins
-- Task 10: Generate a report that shows each patient's name along with their appointment dates

SELECT 
    p.Name AS PatientName,
    a.Date AS AppointmentDate
FROM 
    Patients p
JOIN 
    Appointments a
ON 
    p.PatientID = a.PatientID
ORDER BY 
    p.Name, a.Date;

-- Task 11: Identify patients who have not made any appointments yet

SELECT 
    p.PatientID,
    p.Name
FROM 
    Patients p
LEFT JOIN 
    Appointments a
ON 
    p.PatientID = a.PatientID
WHERE 
    a.AppointmentID IS NULL;

-- Task 12: Determine the most frequently prescribed drugs

SELECT 
    DrugName,
    COUNT(*) AS PrescriptionCount
FROM 
    Prescriptions
GROUP BY 
    DrugName
ORDER BY 
    PrescriptionCount DESC;

-- Set Operations and Complex Queries
-- Task 13: Create a complete contact list that includes both healthcare personnel (doctors in this case) and patients, 
-- including all entries even if some personnel are also patients

SELECT 
    p.PatientID AS ID,
    p.Name AS Name,
    p.ContactInfo AS ContactInfo,
    'Patient' AS Role
FROM 
    Patients p
FULL JOIN 
    Doctors d
ON 
    p.ContactInfo = d.ContactInfo
WHERE 
    p.PatientID IS NOT NULL
    OR d.DoctorID IS NOT NULL 
UNION
SELECT 
    d.DoctorID AS ID,
    d.Name AS Name,
    d.ContactInfo AS ContactInfo,
    'Doctor' AS Role
FROM 
    Doctors d
FULL JOIN 
    Patients p
ON 
    p.ContactInfo = d.ContactInfo
WHERE 
    d.DoctorID IS NOT NULL
    OR p.PatientID IS NOT NULL 
ORDER BY 
    Name;

-- Task 14: Identify doctors who are busier than average, based on the number of appointments

SELECT 
    d.DoctorID,
    d.Name,
    COUNT(a.AppointmentID) AS AppointmentCount
FROM 
    Doctors d
JOIN 
    Appointments a
ON 
    d.DoctorID = a.DoctorID
GROUP BY 
    d.DoctorID, d.Name
HAVING 
    COUNT(a.AppointmentID) > (
        SELECT AVG(AppointmentCount)
        FROM (
            SELECT 
                COUNT(AppointmentID) AS AppointmentCount
            FROM 
                Appointments
            GROUP BY 
                DoctorID
        ) AS Temp
    )
ORDER BY 
    AppointmentCount DESC;

-- Task 15: For a detailed treatment report, list all appointments along with their corresponding treatment outcomes

SELECT 
    a.*,
    t.*
FROM 
    Appointments a
LEFT JOIN 
    Treatments t
ON 
    a.AppointmentID = t.AppointmentID
ORDER BY 
    a.AppointmentID;

-- Analyze Advanced
-- Task 16: Find the treatment history for a specific patient

SELECT 
    a.*,
    t.*
FROM 
    Appointments a
JOIN 
    Treatments t
ON 
    a.AppointmentID = t.AppointmentID
WHERE 
    a.PatientID = 101
ORDER BY 
    a.Date, a.Time;

-- Task 17: List all treatments and their frequencies

SELECT 
    Description,
    COUNT(*) AS Frequency
FROM 
    Treatments
GROUP BY 
    Description
ORDER BY 
    Frequency DESC;

-- Task 18: Find upcoming appointments for each doctor. (Eg: 2023-1-1)

SELECT 
    d.*
    , a.*
FROM 
    Doctors d
JOIN 
    Appointments a
ON 
    d.DoctorID = a.DoctorID
WHERE 
    a.Date > '2023-01-01'
ORDER BY 
    d.DoctorID, a.Date, a.Time;

-- Task 19: Identify days with the highest number of appointments

SELECT 
    a.Date,
    COUNT(*) AS AppointmentCount
FROM 
    Appointments a
GROUP BY 
    a.Date
HAVING 
    COUNT(*) = (SELECT MAX(AppointmentCount)
                FROM (SELECT COUNT(*) AS AppointmentCount
                      FROM Appointments
                      GROUP BY Date) AS Sub)
ORDER BY 
    a.Date;

-- Task 20: Analyze the distribution of patients among doctors

SELECT 
    d.DoctorID,
    d.Name AS DoctorName,
    COUNT(DISTINCT a.PatientID) AS PatientCount
FROM 
    Doctors d
LEFT JOIN 
    Appointments a ON d.DoctorID = a.DoctorID
GROUP BY 
    d.DoctorID, d.Name
ORDER BY 
    PatientCount DESC;

-- Task 21: Calculate the success rate of treatments for each doctor

SELECT 
    d.DoctorID,
    d.Name AS DoctorName,
    CASE 
        WHEN COUNT(t.TreatmentID) = 0 THEN 0
        ELSE (COUNT(CASE WHEN t.Outcome = 'Successful' THEN 1 END) * 100.0 / COUNT(t.TreatmentID))
    END AS SuccessRate
FROM 
    Doctors d
LEFT JOIN 
    Appointments a ON d.DoctorID = a.DoctorID
LEFT JOIN 
    Treatments t ON a.AppointmentID = t.AppointmentID
GROUP BY 
    d.DoctorID, d.Name
ORDER BY 
    SuccessRate DESC;

-- Task 22: Identify patients who have switched doctors more than twice within the last year

SELECT 
    p.PatientID,
    p.Name AS PatientName,
    COUNT(DISTINCT a.DoctorID) AS DoctorCount
FROM 
    Patients p
JOIN 
    Appointments a ON p.PatientID = a.PatientID
WHERE 
    a.Date > DATEADD(YEAR, -1, GETDATE())
GROUP BY 
    p.PatientID, p.Name
HAVING 
    COUNT(DISTINCT a.DoctorID) > 2;

-- Task 23: List doctors who have a success rate of over 75% in their treatments

SELECT 
    d.DoctorID,
    d.Name AS DoctorName,
    ISNULL(
        (COUNT(CASE WHEN t.Outcome = 'Successful' THEN 1 END) * 100.0 / NULLIF(COUNT(t.TreatmentID), 0)),
        0
    ) AS SuccessRate
FROM 
    Doctors d
LEFT JOIN 
    Appointments a ON d.DoctorID = a.DoctorID
LEFT JOIN 
    Treatments t ON a.AppointmentID = t.AppointmentID
GROUP BY 
    d.DoctorID, d.Name
HAVING 
    NULLIF(COUNT(t.TreatmentID), 0) > 0 
    AND ISNULL(
        (COUNT(CASE WHEN t.Outcome = 'Successful' THEN 1 END) * 100.0 / NULLIF(COUNT(t.TreatmentID), 0)),
        0
    ) > 75;


-- Task 24: Find the most common treatment description for patients who have received a specific drug more than or equal to one (Eg: Drug-897)

SELECT 
    TOP 1
    t.Description AS MCTD,
    COUNT(t.Description) AS Frequency
FROM 
    Patients p
JOIN 
    Prescriptions pr ON p.PatientID = pr.PatientID
JOIN 
    Appointments a ON p.PatientID = a.PatientID
JOIN 
    Treatments t ON a.AppointmentID = t.AppointmentID
WHERE 
    pr.DrugName = 'Drug-897'
GROUP BY 
    t.Description
ORDER BY 
    COUNT(t.Description) DESC;

-- Task 25: Find the month with the highest average number of treatments per appointment across all doctors

SELECT TOP 1
    YEAR(a.Date) AS Year,
	MONTH(a.Date) AS Month,
    CAST(COUNT(t.TreatmentID) AS FLOAT) / COUNT(DISTINCT a.AppointmentID) AS AvgTreatmentsPerAppointment
FROM 
    Appointments a
LEFT JOIN 
    Treatments t ON a.AppointmentID = t.AppointmentID
GROUP BY 
    DATEPART(YEAR, a.Date),
    DATEPART(MONTH, a.Date)
ORDER BY 
    AvgTreatmentsPerAppointment DESC;








