-- =============================
-- STORED PROCEDURES FOR User
-- =============================

use HMSdhara;

-- 1. SelectAll
CREATE PROCEDURE [dbo].[PR_User_SelectAll]
AS
SELECT UserID, UserName, Password, Email, MobileNo, IsActive, Created, Modified
FROM [User]
ORDER BY UserName;

-- 2. SelectByPK
CREATE PROCEDURE [dbo].[PR_User_SelectByPK]
@UserID INT
AS
SELECT UserID, UserName, Password, Email, MobileNo, IsActive, Created, Modified
FROM [User]
WHERE UserID = @UserID;

-- 3. Insert
CREATE PROCEDURE [dbo].[PR_User_Insert]
@UserName NVARCHAR(100),
@Password NVARCHAR(100),
@Email NVARCHAR(100),
@MobileNo NVARCHAR(100),
@IsActive BIT,
@Modified DATETIME
AS
INSERT INTO [User](UserName, Password, Email, MobileNo, IsActive, Modified)
VALUES (@UserName, @Password, @Email, @MobileNo, @IsActive, @Modified);

-- 4. UpdateByPK
CREATE PROCEDURE [dbo].[PR_User_UpdateByPK]
@UserID INT,
@UserName NVARCHAR(100),
@Password NVARCHAR(100),
@Email NVARCHAR(100),
@MobileNo NVARCHAR(100),
@IsActive BIT,
@Modified DATETIME
AS
UPDATE [User]
SET UserName = @UserName,
    Password = @Password,
    Email = @Email,
    MobileNo = @MobileNo,
    IsActive = @IsActive,
    Modified = @Modified
WHERE UserID = @UserID;

-- 5. DeleteByPK
CREATE PROCEDURE [dbo].[PR_User_DeleteByPK]
@UserID INT
AS
DELETE FROM [User] WHERE UserID = @UserID;






-- =============================
-- STORED PROCEDURES FOR Department
-- =============================
-- 6. SelectAll
CREATE PROCEDURE [dbo].[PR_Department_SelectAll]
AS
SELECT D.DepartmentID, D.DepartmentName, D.Description, D.IsActive, D.Created, D.Modified, D.UserID, U.UserName
FROM Department D
INNER JOIN [User] U ON U.UserID = D.UserID
ORDER BY D.DepartmentName;

-- 7. SelectByPK
CREATE PROCEDURE [dbo].[PR_Department_SelectByPK]
@DepartmentID INT
AS
SELECT D.DepartmentID, D.DepartmentName, D.Description, D.IsActive, D.Created, D.Modified, D.UserID, U.UserName
FROM Department D
INNER JOIN [User] U ON U.UserID = D.UserID
WHERE D.DepartmentID = @DepartmentID;

-- 8. Insert
CREATE PROCEDURE [dbo].[PR_Department_Insert]
@DepartmentName NVARCHAR(100),
@Description NVARCHAR(250),
@IsActive BIT,
@Modified DATETIME,
@UserID INT
AS
INSERT INTO Department(DepartmentName, Description, IsActive, Modified, UserID)
VALUES (@DepartmentName, @Description, @IsActive, @Modified, @UserID);

-- 9. UpdateByPK
CREATE PROCEDURE [dbo].[PR_Department_UpdateByPK]
@DepartmentID INT,
@DepartmentName NVARCHAR(100),
@Description NVARCHAR(250),
@IsActive BIT,
@Modified DATETIME,
@UserID INT
AS
UPDATE Department
SET DepartmentName = @DepartmentName,
    Description = @Description,
    IsActive = @IsActive,
    Modified = @Modified,
    UserID = @UserID
WHERE DepartmentID = @DepartmentID;

-- 10. DeleteByPK
CREATE PROCEDURE [dbo].[PR_Department_DeleteByPK]
@DepartmentID INT
AS
DELETE FROM Department WHERE DepartmentID = @DepartmentID;







-- =============================
-- STORED PROCEDURES FOR Doctor
-- =============================
-- 11. SelectAll
CREATE PROCEDURE [dbo].[PR_Doctor_SelectAll]
AS
SELECT D.DoctorID, D.Name, D.Phone, D.Email, D.Qualification, D.Specialization, D.IsActive, D.Created, D.Modified, D.UserID, U.UserName
FROM Doctor D
INNER JOIN [User] U ON U.UserID = D.UserID
ORDER BY D.Name;

-- 12. SelectByPK
CREATE PROCEDURE [dbo].[PR_Doctor_SelectByPK]
@DoctorID INT
AS
SELECT D.DoctorID, D.Name, D.Phone, D.Email, D.Qualification, D.Specialization, D.IsActive, D.Created, D.Modified, D.UserID, U.UserName
FROM Doctor D
INNER JOIN [User] U ON U.UserID = D.UserID
WHERE D.DoctorID = @DoctorID;

-- 13. Insert
CREATE PROCEDURE [dbo].[PR_Doctor_Insert]
@Name NVARCHAR(100),
@Phone NVARCHAR(20),
@Email NVARCHAR(100),
@Qualification NVARCHAR(100),
@Specialization NVARCHAR(100),
@IsActive BIT,
@Modified DATETIME,
@UserID INT
AS
INSERT INTO Doctor(Name, Phone, Email, Qualification, Specialization, IsActive, Modified, UserID)
VALUES (@Name, @Phone, @Email, @Qualification, @Specialization, @IsActive, @Modified, @UserID);

-- 14. UpdateByPK
CREATE PROCEDURE [dbo].[PR_Doctor_UpdateByPK]
@DoctorID INT,
@Name NVARCHAR(100),
@Phone NVARCHAR(20),
@Email NVARCHAR(100),
@Qualification NVARCHAR(100),
@Specialization NVARCHAR(100),
@IsActive BIT,
@Modified DATETIME,
@UserID INT
AS
UPDATE Doctor
SET Name = @Name,
    Phone = @Phone,
    Email = @Email,
    Qualification = @Qualification,
    Specialization = @Specialization,
    IsActive = @IsActive,
    Modified = @Modified,
    UserID = @UserID
WHERE DoctorID = @DoctorID;

-- 15. DeleteByPK
CREATE PROCEDURE [dbo].[PR_Doctor_DeleteByPK]
@DoctorID INT
AS
DELETE FROM Doctor WHERE DoctorID = @DoctorID;






-- =============================
-- STORED PROCEDURES FOR Patient
-- =============================
-- 16. SelectAll
CREATE PROCEDURE [dbo].[PR_Patient_SelectAll]
AS
SELECT P.PatientID, P.Name, P.DateOfBirth, P.Gender, P.Email, P.Phone, P.Address, P.City, P.State, P.IsActive, P.Created, P.Modified, P.UserID, U.UserName
FROM Patient P
INNER JOIN [User] U ON U.UserID = P.UserID
ORDER BY P.Name;

-- 17. SelectByPK
CREATE PROCEDURE [dbo].[PR_Patient_SelectByPK]
@PatientID INT
AS
SELECT P.PatientID, P.Name, P.DateOfBirth, P.Gender, P.Email, P.Phone, P.Address, P.City, P.State, P.IsActive, P.Created, P.Modified, P.UserID, U.UserName
FROM Patient P
INNER JOIN [User] U ON U.UserID = P.UserID
WHERE P.PatientID = @PatientID;

-- 18. Insert
CREATE PROCEDURE [dbo].[PR_Patient_Insert]
@Name NVARCHAR(100),
@DateOfBirth DATETIME,
@Gender NVARCHAR(10),
@Email NVARCHAR(100),
@Phone NVARCHAR(100),
@Address NVARCHAR(250),
@City NVARCHAR(100),
@State NVARCHAR(100),
@IsActive BIT,
@Modified DATETIME,
@UserID INT
AS
INSERT INTO Patient(Name, DateOfBirth, Gender, Email, Phone, Address, City, State, IsActive, Modified, UserID)
VALUES (@Name, @DateOfBirth, @Gender, @Email, @Phone, @Address, @City, @State, @IsActive, @Modified, @UserID);

-- 19. UpdateByPK
CREATE PROCEDURE [dbo].[PR_Patient_UpdateByPK]
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
@Modified DATETIME,
@UserID INT
AS
UPDATE Patient
SET Name = @Name,
    DateOfBirth = @DateOfBirth,
    Gender = @Gender,
    Email = @Email,
    Phone = @Phone,
    Address = @Address,
    City = @City,
    State = @State,
    IsActive = @IsActive,
    Modified = @Modified,
    UserID = @UserID
WHERE PatientID = @PatientID;

-- 20. DeleteByPK
CREATE PROCEDURE [dbo].[PR_Patient_DeleteByPK]
@PatientID INT
AS
DELETE FROM Patient WHERE PatientID = @PatientID;






-- =============================
-- STORED PROCEDURES FOR DoctorDepartment
-- =============================
-- 21. SelectAll
CREATE PROCEDURE [dbo].[PR_DoctorDepartment_SelectAll]
AS
SELECT DD.DoctorDepartmentID, DD.DoctorID, D.Name AS DoctorName, DD.DepartmentID, DP.DepartmentName, DD.Created, DD.Modified, DD.UserID, U.UserName
FROM DoctorDepartment DD
INNER JOIN Doctor D ON D.DoctorID = DD.DoctorID
INNER JOIN Department DP ON DP.DepartmentID = DD.DepartmentID
INNER JOIN [User] U ON U.UserID = DD.UserID
ORDER BY DD.DoctorDepartmentID;

-- 22. SelectByPK
CREATE PROCEDURE [dbo].[PR_DoctorDepartment_SelectByPK]
@DoctorDepartmentID INT
AS
SELECT DD.DoctorDepartmentID, DD.DoctorID, D.Name AS DoctorName, DD.DepartmentID, DP.DepartmentName, DD.Created, DD.Modified, DD.UserID, U.UserName
FROM DoctorDepartment DD
INNER JOIN Doctor D ON D.DoctorID = DD.DoctorID
INNER JOIN Department DP ON DP.DepartmentID = DD.DepartmentID
INNER JOIN [User] U ON U.UserID = DD.UserID
WHERE DD.DoctorDepartmentID = @DoctorDepartmentID;

-- 23. Insert
CREATE PROCEDURE [dbo].[PR_DoctorDepartment_Insert]
@DoctorID INT,
@DepartmentID INT,
@Modified DATETIME,
@UserID INT
AS
INSERT INTO DoctorDepartment(DoctorID, DepartmentID, Modified, UserID)
VALUES (@DoctorID, @DepartmentID, @Modified, @UserID);

-- 24. UpdateByPK
CREATE PROCEDURE [dbo].[PR_DoctorDepartment_UpdateByPK]
@DoctorDepartmentID INT,
@DoctorID INT,
@DepartmentID INT,
@Modified DATETIME,
@UserID INT
AS
UPDATE DoctorDepartment
SET DoctorID = @DoctorID,
    DepartmentID = @DepartmentID,
    Modified = @Modified,
    UserID = @UserID
WHERE DoctorDepartmentID = @DoctorDepartmentID;

-- 25. DeleteByPK
CREATE PROCEDURE [dbo].[PR_DoctorDepartment_DeleteByPK]
@DoctorDepartmentID INT
AS
DELETE FROM DoctorDepartment WHERE DoctorDepartmentID = @DoctorDepartmentID;





-- =============================
-- STORED PROCEDURES FOR Appointment
-- =============================
-- 26. SelectAll
CREATE PROCEDURE [dbo].[PR_Appointment_SelectAll]
AS
SELECT A.AppointmentID, A.DoctorID, D.Name AS DoctorName, A.PatientID, P.Name AS PatientName, A.AppointmentDate, A.AppointmentStatus,
       A.Description, A.SpecialRemarks, A.Created, A.Modified, A.UserID, U.UserName, A.TotalConsultedAmount
FROM Appointment A
INNER JOIN Doctor D ON D.DoctorID = A.DoctorID
INNER JOIN Patient P ON P.PatientID = A.PatientID
INNER JOIN [User] U ON U.UserID = A.UserID
ORDER BY A.AppointmentDate DESC;

-- 27. SelectByPK
CREATE PROCEDURE [dbo].[PR_Appointment_SelectByPK]
@AppointmentID INT
AS
SELECT A.AppointmentID, A.DoctorID, D.Name AS DoctorName, A.PatientID, P.Name AS PatientName, A.AppointmentDate, A.AppointmentStatus,
       A.Description, A.SpecialRemarks, A.Created, A.Modified, A.UserID, U.UserName, A.TotalConsultedAmount
FROM Appointment A
INNER JOIN Doctor D ON D.DoctorID = A.DoctorID
INNER JOIN Patient P ON P.PatientID = A.PatientID
INNER JOIN [User] U ON U.UserID = A.UserID
WHERE A.AppointmentID = @AppointmentID;

-- 28. Insert
CREATE PROCEDURE [dbo].[PR_Appointment_Insert]
@DoctorID INT,
@PatientID INT,
@AppointmentDate DATETIME,
@AppointmentStatus NVARCHAR(20),
@Description NVARCHAR(250),
@SpecialRemarks NVARCHAR(100),
@Modified DATETIME,
@UserID INT,
@TotalConsultedAmount DECIMAL(5,2)
AS
INSERT INTO Appointment(DoctorID, PatientID, AppointmentDate, AppointmentStatus, Description, SpecialRemarks, Modified, UserID, TotalConsultedAmount)
VALUES (@DoctorID, @PatientID, @AppointmentDate, @AppointmentStatus, @Description, @SpecialRemarks, @Modified, @UserID, @TotalConsultedAmount);

-- 29. UpdateByPK
CREATE PROCEDURE [dbo].[PR_Appointment_UpdateByPK]
@AppointmentID INT,
@DoctorID INT,
@PatientID INT,
@AppointmentDate DATETIME,
@AppointmentStatus NVARCHAR(20),
@Description NVARCHAR(250),
@SpecialRemarks NVARCHAR(100),
@Modified DATETIME,
@UserID INT,
@TotalConsultedAmount DECIMAL(5,2)
AS
UPDATE Appointment
SET DoctorID = @DoctorID,
    PatientID = @PatientID,
    AppointmentDate = @AppointmentDate,
    AppointmentStatus = @AppointmentStatus,
    Description = @Description,
    SpecialRemarks = @SpecialRemarks,
    Modified = @Modified,
    UserID = @UserID,
    TotalConsultedAmount = @TotalConsultedAmount
WHERE AppointmentID = @AppointmentID;

-- 30. DeleteByPK
CREATE PROCEDURE [dbo].[PR_Appointment_DeleteByPK]
@AppointmentID INT
AS
DELETE FROM Appointment WHERE AppointmentID = @AppointmentID;
