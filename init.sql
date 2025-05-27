CREATE DATABASE Hospital;
GO
USE Hospital;
GO
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    BirthDate DATE NOT NULL,
    Gender NVARCHAR(10) CHECK (Gender IN ('Муж', 'Жен')) NOT NULL,
    Address NVARCHAR(200),
    Phone NVARCHAR(20)
);


--Таблица «врачи»
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Specialty NVARCHAR(100),
    ExperienceYears INT CHECK (ExperienceYears >= 0),
    Phone NVARCHAR(20)
);




--Таблица «отделения»
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Floor INT CHECK (Floor >= 0),
    Phone NVARCHAR(20)
);
CREATE TABLE MedicalServices (
    ServiceID INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Cost DECIMAL(10,2) CHECK (Cost >= 0),
    Description NVARCHAR(300)
);
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT NOT NULL FOREIGN KEY REFERENCES Patients(PatientID) ON DELETE CASCADE,
    DoctorID INT NOT NULL FOREIGN KEY REFERENCES Doctors(DoctorID) ON DELETE NO ACTION,
    AppointmentDate DATETIME NOT NULL,
    Diagnosis NVARCHAR(200),
    Recommendations NVARCHAR(300)
);
CREATE TABLE ServiceAssignments (
    AssignmentID INT PRIMARY KEY,
    AppointmentID INT NOT NULL FOREIGN KEY REFERENCES Appointments(AppointmentID) ON DELETE CASCADE,
    ServiceID INT NOT NULL FOREIGN KEY REFERENCES MedicalServices(ServiceID),
    ExecutionDate DATETIME,
    Comment NVARCHAR(300)
);



