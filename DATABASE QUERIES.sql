-- Create Patient table
DROP TABLE Patient;
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    ContactNumber VARCHAR(15),
    Address VARCHAR(100)
);

-- Insert data into Patient table
INSERT INTO Patient (PatientID, FirstName, LastName, DateOfBirth, Gender, ContactNumber, Address)
VALUES
(1, 'umer', 'ali', '1990-05-15', 'Male', '123-456-7890', '123 Main St'),
(2, 'anousha', 'shakeel', '1985-08-20', 'Female', '987-654-3210', '456 Mr St'),
(3, 'maira', 'rauf', '1992-02-10', 'Female', '555-123-4567', '789 Jr St');

-- Create Doctor table
DROP TABLE Doctor;
CREATE TABLE Doctor (
 DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialization VARCHAR(50),
    ContactNumber VARCHAR(15),
    Email VARCHAR(50)
);

INSERT INTO Doctor (DoctorID, FirstName, LastName, Specialization, ContactNumber, Email)
VALUES
(1, 'Dr. jameel', 'ali', 'Cardiologist', '555-888-7777', 'ali@example.com'),
(2, 'Dr. Abdul', 'Ahad', 'Orthopedic Surgeon', '555-999-6666', 'ahad@example.com'),
(3, 'Dr. ayesha', 'Nasir', 'Pediatrician', '555-777-8888', 'ayesha@example.com')

-- Create Appointment table
DROP TABLE Appointments;
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATETIME,
    Reason VARCHAR(255),
    Status VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);
-- Insert data into Appointment table
INSERT INTO Appointment (AppointmentID, PatientID, DoctorID, AppointmentDate, Reason, Status)
VALUES
(101, 1, 1, '2023-01-15 10:00:00', 'Regular Checkup', 'Scheduled'),
(102, 2, 2, '2023-02-20 14:30:00', 'Knee Pain', 'Completed'),
(103, 3, 3, '2023-03-05 09:45:00', 'Child Vaccination', 'Scheduled');

-- Create Diagnosis table
DROP TABLE Diagnosis;
CREATE TABLE Diagnosis (
    DiagnosisID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    DiagnosisDate DATETIME,
    Description VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);
INSERT INTO Diagnosis (DiagnosisID, PatientID, DoctorID, DiagnosisDate, Description)
VALUES
(201, 1, 1, '2023-01-20', 'Healthy'),
(202, 2, 2, '2023-02-25', 'Strained Ligament'),
(203, 3, 3, '2023-03-10', 'Normal');


-- Create Medication table
DROP TABLE Medication;
CREATE TABLE Medication (
    MedicationID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    MedicationName VARCHAR(50),
    Dosage VARCHAR(50),
    Frequency VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);
INSERT INTO Medication (MedicationID, PatientID, DoctorID, MedicationName, Dosage, Frequency, StartDate, EndDate)
VALUES
(301, 1, 1, 'Aspirin', '1 tablet', 'Once a day', '2023-01-20', '2023-01-27'),
(302, 2, 2, 'Ibuprofen', '1 tablet', 'Twice a day', '2023-02-25', '2023-03-10'),
(303, 3, 3, 'Multivitamin', '1 tablet', 'Once a day', '2023-03-10', '2023-03-17');


-- Create TestResult table
DROP TABLE TestResult;
CREATE TABLE TestResult (
    TestResultID INT PRIMARY KEY,
    PatientID INT,
    TestDate DATETIME,
    TestName VARCHAR(50),
    Result VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);
INSERT INTO TestResult (TestResultID, PatientID, TestDate, TestName, Result)
VALUES
(401, 1, '2023-01-25', 'Blood Pressure', '120/80'),
(402, 2, '2023-03-01', 'X-Ray', 'Normal'),
(403, 3, '2023-03-15', 'Blood Test', 'Healthy');

-- Create Billing table
DROP TABLE Billing;
CREATE TABLE Billing (
    BillingID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentID INT,
    BillingDate DATETIME,
    TotalAmount DECIMAL(10, 2),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);
-- Insert data into Billing table
INSERT INTO Billing (BillingID, PatientID, DoctorID, AppointmentID, BillingDate, TotalAmount, PaymentStatus)
VALUES
(501, 1, 1, 101, '2023-01-15', 150.00, 'Paid'),
(502, 2, 2, 102, '2023-02-20', 200.00, 'Paid'),
(503, 3, 3, 103, '2023-03-05', 100.00, 'Unpaid');
-- Create Schedule table
DROP TABLE Schedule
create table Schedule(
	ScheduleID int Primary Key Not Null,
	DayofWeek varchar(10),
	StartTime Time,
	EndTime Time
);
-- Insert values into the Schedule table
INSERT INTO Schedule (ScheduleID, DayofWeek, StartTime, EndTime)
VALUES
(1, 'Monday', '09:00:00', '17:00:00'),
(2, 'Tuesday', '10:30:00', '18:30:00'),
(3, 'Wednesday', '08:00:00', '16:00:00');
-- Create DoctorSchedule table
DROP TABLE DoctorSchedule
create table DoctorSchedule(
	DoctorScheduleID int Primary Key Not Null,
	DoctorID int Foreign Key References Doctor,
	ScheduleID int Foreign Key References Schedule
);
-- Insert values into the DoctorSchedule table
INSERT INTO DoctorSchedule (DoctorScheduleID, DoctorID, ScheduleID)
VALUES
(1, 1, 1),  
(2, 2, 2),  
(3, 3, 3);


SELECT * FROM Patient;
SELECT * FROM Doctor;
SELECT * FROM Appointments;
SELECT * FROM Diagnosis;
SELECT * FROM Medication;
SELECT * FROM TestResult;
SELECT * FROM Billing;
SELECT * FROM Schedule;
SELECT * FROM DoctorSchedule;

--Find doctors with their specialties
SELECT DoctorID, Specialization FROM Doctor;


--2.Get all appointments with patient and doctor details:
SELECT AppointmentID, Patient.PatientID, Patient.FirstName, Doctor.DoctorID, Doctor.FirstName, AppointmentDate, Reason, Status
FROM Appointments
JOIN Patient ON Appointments.PatientID = Patient.PatientID
JOIN Doctor ON Appointments.DoctorID = Doctor.DoctorID;

--List all appointments along with corresponding doctor details:
SELECT Appointments.*, Doctor.FirstName AS DoctorFirstName, Doctor.LastName AS DoctorLastName, Doctor.Specialization
FROM Appointments
JOIN Doctor  ON Appointments.DoctorID = Doctor.DoctorID;


--List all diagnoses with patient and doctor information
SELECT DiagnosisID, Patient.PatientID, Patient.FirstName, Doctor.DoctorID, Doctor.FirstName, DiagnosisDate, Description
FROM Diagnosis
JOIN Patient ON Diagnosis.PatientID = Patient.PatientID
JOIN Doctor ON Diagnosis.DoctorID = Doctor.DoctorID;


--Retrieve test results with patient  details
SELECT TestResultID, Patient.PatientID, Patient.FirstName,TestDate, Result
FROM TestResult
JOIN Patient ON TestResult.PatientID = Patient.PatientID;

--Retrieve medications for a specific patient
SELECT MedicationID, Patient.PatientID, Patient.FirstName, Doctor.DoctorID, Doctor.FirstName, MedicationName, Dosage, Frequency, StartDate, EndDate
FROM Medication
JOIN Patient ON Medication.PatientID = Patient.PatientID
JOIN Doctor ON Medication.DoctorID = Doctor.DoctorID
WHERE Patient.PatientID = 1;

--Find billing information for a particular patient:
SELECT BillingID, Patient.PatientID, Patient.FirstName, BillingDate, TotalAmount, PaymentStatus
FROM Billing
JOIN Patient ON Billing.PatientID = Patient.PatientID
WHERE Patient.PatientID = 1;
--Retrieve the schedule for a specific doctor:
SELECT DoctorSchedule.DoctorScheduleID, Doctor.DoctorID, Doctor.FirstName, Schedule.DayOfWeek, Schedule.StartTime, Schedule.EndTime
FROM DoctorSchedule
JOIN Doctor ON DoctorSchedule.DoctorID = Doctor.DoctorID
JOIN Schedule ON DoctorSchedule.ScheduleID = Schedule.ScheduleID
WHERE Doctor.DoctorID = 2;
--List all appointments on a specific date:
SELECT AppointmentID, Patient.PatientID, Patient.FirstName, Doctor.DoctorID, Doctor.FirstName, AppointmentDate, Status
FROM Appointments
JOIN Patient ON Appointments.PatientID = Patient.PatientID
JOIN Doctor ON Appointments.DoctorID = Doctor.DoctorID
WHERE DATE(AppointmentDate) = '2024-01-05';
--Retrieve the total amount billed for all patients:
SELECT SUM(TotalAmount) AS TotalAmountBilled
FROM Billing;
