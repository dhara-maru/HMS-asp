use HMSdhara


CREATE TABLE [User] (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    UserName NVARCHAR(100) NOT NULL,
    Password NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    MobileNo NVARCHAR(100) NOT NULL,
    IsActive BIT NOT NULL DEFAULT 1,
    Created DATETIME DEFAULT GETDATE(),
    Modified DATETIME NOT NULL
);

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(250),
    IsActive BIT NOT NULL DEFAULT 1,
    Created DATETIME NOT NULL DEFAULT GETDATE(),
    Modified DATETIME NOT NULL,
    UserID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES [User](UserID)
);

CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(20) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Qualification NVARCHAR(100) NOT NULL,
    Specialization NVARCHAR(100) NOT NULL,
    IsActive BIT NOT NULL DEFAULT 1,
    Created DATETIME NOT NULL DEFAULT GETDATE(),
    Modified DATETIME NOT NULL,
    UserID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES [User](UserID)
);

CREATE TABLE Patient (
    PatientID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    DateOfBirth DATETIME NOT NULL,
    Gender NVARCHAR(10) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(100) NOT NULL,
    Address NVARCHAR(250) NOT NULL,
    City NVARCHAR(100) NOT NULL,
    State NVARCHAR(100) NOT NULL,
    IsActive BIT NOT NULL DEFAULT 1,
    Created DATETIME NOT NULL DEFAULT GETDATE(),
    Modified DATETIME NOT NULL,
    UserID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES [User](UserID)
);

CREATE TABLE DoctorDepartment (
    DoctorDepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DoctorID INT NOT NULL,
    DepartmentID INT NOT NULL,
    Created DATETIME NOT NULL DEFAULT GETDATE(),
    Modified DATETIME NOT NULL,
    UserID INT NOT NULL,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (UserID) REFERENCES [User](UserID)
);
CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY IDENTITY(1,1),
    DoctorID INT NOT NULL,
    PatientID INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    AppointmentStatus NVARCHAR(20) NOT NULL,
    Description NVARCHAR(250) NOT NULL,
    SpecialRemarks NVARCHAR(100) NOT NULL,
    Created DATETIME NOT NULL DEFAULT GETDATE(),
    Modified DATETIME NOT NULL,
    UserID INT NOT NULL,
    TotalConsultedAmount DECIMAL(5,2) NULL,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (UserID) REFERENCES [User](UserID)
);


-- 1. [User] Table Procedures

-- Procedure to Insert a New User
CREATE PROCEDURE usp_User_Insert
    @UserName NVARCHAR(100),
    @Password NVARCHAR(100),
    @Email NVARCHAR(100),
    @MobileNo NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [User] (UserName, Password, Email, MobileNo, IsActive, Created, Modified)
    VALUES (@UserName, @Password, @Email, @MobileNo, 1, GETDATE(), GETDATE());
    SELECT SCOPE_IDENTITY() AS UserID; 
END;

-- Procedure to Update an Existing User
CREATE PROCEDURE usp_User_Update
    @UserID INT,
    @UserName NVARCHAR(100),
    @Password NVARCHAR(100),
    @Email NVARCHAR(100),
    @MobileNo NVARCHAR(100),
    @IsActive BIT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [User]
    SET
        UserName = @UserName,
        Password = @Password,
        Email = @Email,
        MobileNo = @MobileNo,
        IsActive = @IsActive,
        Modified = GETDATE()
    WHERE UserID = @UserID;
END;

--Procedure to Delete a User

CREATE PROCEDURE usp_User_Delete_Hard
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM [User]
    WHERE UserID = @UserID;
END;


-- 2. Department Table Procedures

-- Procedure to Insert a New Department
CREATE PROCEDURE usp_Department_Insert
    @DepartmentName NVARCHAR(100),
    @Description NVARCHAR(250),
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Department (DepartmentName, Description, IsActive, Created, Modified, UserID)
    VALUES (@DepartmentName, @Description, 1, GETDATE(), GETDATE(), @UserID);
    SELECT SCOPE_IDENTITY() AS DepartmentID;
END;


-- Procedure to Update an Existing Department
CREATE PROCEDURE usp_Department_Update
    @DepartmentID INT,
    @DepartmentName NVARCHAR(100),
    @Description NVARCHAR(250),
    @IsActive BIT,
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Department
    SET
        DepartmentName = @DepartmentName,
        Description = @Description,
        IsActive = @IsActive,
        Modified = GETDATE(),
        UserID = @UserID
    WHERE DepartmentID = @DepartmentID;
END;

-- SP to delete any department
CREATE PROCEDURE usp_Department_Delete_Hard
    @DepartmentID INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM Department
    WHERE DepartmentID = @DepartmentID;
END;

-- 3. Doctor Table Procedures

-- Procedure to Insert a New Doctor
CREATE PROCEDURE usp_Doctor_Insert
    @Name NVARCHAR(100),
    @Phone NVARCHAR(20),
    @Email NVARCHAR(100),
    @Qualification NVARCHAR(100),
    @Specialization NVARCHAR(100),
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Doctor (Name, Phone, Email, Qualification, Specialization, IsActive, Created, Modified, UserID)
    VALUES (@Name, @Phone, @Email, @Qualification, @Specialization, 1, GETDATE(), GETDATE(), @UserID);
    SELECT SCOPE_IDENTITY() AS DoctorID; 
END;


-- Procedure to Update an Existing Doctor
CREATE PROCEDURE usp_Doctor_Update
    @DoctorID INT,
    @Name NVARCHAR(100),
    @Phone NVARCHAR(20),
    @Email NVARCHAR(100),
    @Qualification NVARCHAR(100),
    @Specialization NVARCHAR(100),
    @IsActive BIT,
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Doctor
    SET
        Name = @Name,
        Phone = @Phone,
        Email = @Email,
        Qualification = @Qualification,
        Specialization = @Specialization,
        IsActive = @IsActive,
        Modified = GETDATE(),
        UserID = @UserID
    WHERE DoctorID = @DoctorID;
END;

--procedure to delete any doctor
CREATE PROCEDURE usp_Doctor_Delete_Hard
    @DoctorID INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM Doctor
    WHERE DoctorID = @DoctorID;
END;

-- 4. Patient Table Procedures

-- Procedure to Insert a New Patient
CREATE PROCEDURE usp_Patient_Insert
    @Name NVARCHAR(100),
    @DateOfBirth DATETIME,
    @Gender NVARCHAR(10),
    @Email NVARCHAR(100),
    @Phone NVARCHAR(100),
    @Address NVARCHAR(250),
    @City NVARCHAR(100),
    @State NVARCHAR(100),
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Patient (Name, DateOfBirth, Gender, Email, Phone, Address, City, State, IsActive, Created, Modified, UserID)
    VALUES (@Name, @DateOfBirth, @Gender, @Email, @Phone, @Address, @City, @State, 1, GETDATE(), GETDATE(), @UserID);
    SELECT SCOPE_IDENTITY() AS PatientID;
END;


-- Procedure to Update an Existing Patient
CREATE PROCEDURE usp_Patient_Update
    @PatientID INT,
    @Name NVARCHAR(100),
    @DateOfBirth DATETIME,
    @Gender NVARCHAR(10),
    @Email NVARCHAR(100),
    @Phone NVARCHAR(100),
    @Address NVARCHAR(250),
    @City NVARCHAR(100),
    @State NVARCHAR(100),
    @IsActive BIT,
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Patient
    SET
        Name = @Name,
        DateOfBirth = @DateOfBirth,
        Gender = @Gender,
        Email = @Email,
        Phone = @Phone,
        Address = @Address,
        City = @City,
        State = @State,
        IsActive = @IsActive,
        Modified = GETDATE(),
        UserID = @UserID
    WHERE PatientID = @PatientID;
END;


--procedure to delete a patient
CREATE PROCEDURE usp_Patient_Delete_Hard
    @PatientID INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM Patient
    WHERE PatientID = @PatientID;
END

-- 5. DoctorDepartment Table Procedures

-- Procedure to Insert a New Doctor-Department Link
CREATE PROCEDURE usp_DoctorDepartment_Insert
    @DoctorID INT,
    @DepartmentID INT,
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO DoctorDepartment (DoctorID, DepartmentID, Created, Modified, UserID)
    VALUES (@DoctorID, @DepartmentID, GETDATE(), GETDATE(), @UserID);
    SELECT SCOPE_IDENTITY() AS DoctorDepartmentID; -- Return the newly created DoctorDepartmentID
END;


-- Procedure to Update an Existing Doctor-Department Link
CREATE PROCEDURE usp_DoctorDepartment_Update
    @DoctorDepartmentID INT,
    @DoctorID INT,
    @DepartmentID INT,
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE DoctorDepartment
    SET
        DoctorID = @DoctorID,
        DepartmentID = @DepartmentID,
        Modified = GETDATE(),
        UserID = @UserID
    WHERE DoctorDepartmentID = @DoctorDepartmentID;
END;

-- Procedure to Delete a Doctor-Department Link 
CREATE PROCEDURE usp_DoctorDepartment_Delete
    @DoctorDepartmentID INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM DoctorDepartment
    WHERE DoctorDepartmentID = @DoctorDepartmentID;
END;

-- 6. Appointment Table Procedures

-- Procedure to Insert a New Appointment
CREATE PROCEDURE usp_Appointment_Insert
    @DoctorID INT,
    @PatientID INT,
    @AppointmentDate DATETIME,
    @AppointmentStatus NVARCHAR(20),
    @Description NVARCHAR(250),
    @SpecialRemarks NVARCHAR(100),
    @UserID INT,
    @TotalConsultedAmount DECIMAL(5,2) = NULL -- NULLable
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Appointment (DoctorID, PatientID, AppointmentDate, AppointmentStatus, Description, SpecialRemarks, Created, Modified, UserID, TotalConsultedAmount)
    VALUES (@DoctorID, @PatientID, @AppointmentDate, @AppointmentStatus, @Description, @SpecialRemarks, GETDATE(), GETDATE(), @UserID, @TotalConsultedAmount);
    SELECT SCOPE_IDENTITY() AS AppointmentID; -- Return the newly created AppointmentID
END;


-- Procedure to Update an Existing Appointment
CREATE PROCEDURE usp_Appointment_Update
    @AppointmentID INT,
    @DoctorID INT,
    @PatientID INT,
    @AppointmentDate DATETIME,
    @AppointmentStatus NVARCHAR(20),
    @Description NVARCHAR(250),
    @SpecialRemarks NVARCHAR(100),
    @UserID INT,
    @TotalConsultedAmount DECIMAL(5,2) = NULL -- NULLable
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Appointment
    SET
        DoctorID = @DoctorID,
        PatientID = @PatientID,
        AppointmentDate = @AppointmentDate,
        AppointmentStatus = @AppointmentStatus,
        Description = @Description,
        SpecialRemarks = @SpecialRemarks,
        Modified = GETDATE(),
        UserID = @UserID,
        TotalConsultedAmount = @TotalConsultedAmount
    WHERE AppointmentID = @AppointmentID;
END;


-- Procedure to Delete an Appointment
CREATE PROCEDURE usp_Appointment_Delete
    @AppointmentID INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM Appointment
    WHERE AppointmentID = @AppointmentID;
END;

use HMSdhara