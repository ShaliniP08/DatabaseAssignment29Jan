use WFA3DotNet

--Assignment No.2 on TRIGGER

--Create table for Past Employee
CREATE TABLE PastEmployeeTable(
	EmpId int PRIMARY KEY,
	EmpName varchar(20),
	EmpSal float,
	EmpLeaving datetime DEFAULT GetDate()
)

--Trigger for updating record
ALTER TRIGGER TriggerUpdate 
ON Employee
AFTER update
AS 
DECLARE
@EmpId int,
@EmpName varchar(20),
@EmpSal float,
@EmpLeaving datetime

BEGIN
SELECT  @EmpId = inserted.EmpId, 
		@EmpName = inserted.EmpName, 
		@EmpSal = inserted.Salary,
		@EmpLeaving=GetDate() FROM inserted

INSERT INTO PastEmployeeTable(EmpId,EmpName,EmpSal, EmpLeaving) VALUES (@EmpId,@EmpName,@EmpSal,@EmpLeaving)
PRINT 'After update trigger fired on PastEmployeeTable' 
END

--Update value
UPDATE Employee 
SET Salary=2700.89
WHERE EmpId=4

-- For Employee table
SELECT * FROM Employee

--For PastEmployeeTable
SELECT * FROM PastEmployeeTable