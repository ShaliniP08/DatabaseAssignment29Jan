USE WFA3DotNet

--Create and Insert values into table TblCustomer
CREATE TABLE TblCustomer
(
CustomerID varchar(20) NOT NULL PRIMARY KEY,
CustomerName varchar(20),
DOB date,
City varchar(20)
)

INSERT into tblCustomer VALUES ('123456', 'David Letterman', '04-Apr-1949', 'Hartford');
INSERT into tblCustomer VALUES ('123457', 'Barry Sanders', '12-Dec-1967','Detroit');
INSERT into tblCustomer VALUES ('123458', 'Jean-Luc Picard', '9-Sep-1940', 'San Francisco');
INSERT into tblCustomer VALUES ('123459', 'Jerry Seinfeld', '23-Nov-1965','New York City');
INSERT into tblCustomer VALUES ('123460', 'Fox Mulder', '05-Nov-1962', 'Langley');
INSERT into tblCustomer VALUES ('123461', 'Bruce Springsteen', '29-Dec-1960','Camden');
INSERT into tblCustomer VALUES ('123462', 'Barry Sanders', '05-Aug-1974','Martha''s Vineyard');
INSERT into tblCustomer VALUES ('123463', 'Benjamin Sisko', '23-Nov-1955','San Francisco');
INSERT into tblCustomer VALUES ('123464', 'Barry Sanders', '19-Mar-1966','Langley');
INSERT into tblCustomer VALUES ('123465', 'Martha Vineyard', '19-Mar-1963','Martha''s Vineyard');

SELECT * FROM TblCustomer

--Create and insert values into table TblAccountType
CREATE TABLE TblAccountType
(
TypeCode int NOT NULL PRIMARY KEY,
TypeDesc varchar(20)
)

INSERT into tblAccountType VALUES (1, 'Checking');
INSERT into tblAccountType VALUES (2, 'Saving');
INSERT into tblAccountType VALUES (3, 'Money Market');
INSERT into tblAccountType VALUES (4, 'Super Checking');

SELECT * FROM TblAccountType

--Create and insert values into table TblAccount
CREATE table TblAccount
(
CustomerID varchar(20) FOREIGN KEY references TblCustomer(CustomerID),
AccountNumber varchar(20) NOT NULL PRIMARY KEY,
AccountTypeCode int FOREIGN KEY references TblAccountType(TypeCode),
DateOpened date DEFAULT getDate(),
Balance float
)

INSERT into tblAccount VALUES('123456', '123456-1', 1, '04-Apr-1993', 2200.33);
INSERT into tblAccount VALUES('123456', '123456-2', 2, '04-Apr-1993', 12200.99);
INSERT into tblAccount VALUES('123457', '123457-1', 3, '01-JAN-1998', 50000.00);
INSERT into tblAccount VALUES('123458', '123458-1', 1, '19-FEB-1991', 9203.56);
INSERT into tblAccount VALUES('123459', '123459-1', 1, '09-SEP-1990', 9999.99);
INSERT into tblAccount VALUES('123459', '123459-2', 1, '12-MAR-1992', 5300.33);
INSERT into tblAccount VALUES('123459', '123459-3', 2, '12-MAR-1992', 17900.42);
INSERT into tblAccount VALUES('123459', '123459-4', 3, '09-SEP-1998', 500000.00);
INSERT into tblAccount VALUES('123460', '123460-1', 1, '12-OCT-1997', 510.12);
INSERT into tblAccount VALUES('123460', '123460-2', 2, '12-OCT-1997', 3412.33);
INSERT into tblAccount VALUES('123461', '123461-1', 1, '09-MAY-1978', 1000.33);
INSERT into tblAccount VALUES('123461', '123461-2', 2, '09-MAY-1978', 32890.33);
INSERT into tblAccount VALUES('123461', '123461-3', 3, '13-JUN-1981', 51340.67);
INSERT into tblAccount VALUES('123462', '123462-1', 1, '23-JUL-1981', 340.67);
INSERT into tblAccount VALUES('123462', '123462-2', 2, '23-JUL-1981', 5340.67);
INSERT into tblAccount VALUES('123463', '123463-1', 1, '1-MAY-1998', 513.90);
INSERT into tblAccount VALUES('123463', '123463-2', 2, '1-MAY-1998', 1538.90);
INSERT into tblAccount VALUES('123464', '123464-1', 1, '19-AUG-1994', 1533.47);
INSERT into tblAccount VALUES('123464', '123464-2', 2, '19-AUG-1994', 8456.47);

SELECT * FROM TblAccount

--Assignment Questions :

--1) Print customer id and balance of customers who have at least $5000 in any of their accounts. 
			
	SELECT Cust.CustomerId, Acnt.Balance
	FROM TblCustomer Cust 
	JOIN TblAccount Acnt
	ON Cust.CustomerID = Acnt.CustomerID
	WHERE Balance <= 5000.0

--2) Print names of customers whose names begin with a ‘B’. 
			
	SELECT CustomerName
	FROM TblCustomer
	WHERE CustomerName LIKE 'B%'

--3) Print all the cities where the customers of this bank live. 
			
	SELECT City
	FROM TblCustomer

--4) Use IN [and NOT IN] clauses to list customers who live in [and don’t live in] San Francisco or Hartford. 
			
	SELECT CustomerName,City
	FROM TblCustomer 
	WHERE City IN('Hartford','San Francisco')

	SELECT CustomerName,City
	FROM TblCustomer 
	WHERE City NOT IN('Hartford','San Francisco')

--5) Show name and city of customers whose names contain the letter 'r' and who live in Langley. 
			
	SELECT CustomerName ,City
	FROM TblCustomer 
	WHERE CustomerName LIKE '%r%' AND City='Langley'

--6) How many account types does the bank provide? 
			
	SELECT Count(TypeDesc) AS TotalAccountTypes
	FROM TblAccountType

--7) Show a list of accounts and their balance for account numbers that end in '-1' 
			
	SELECT AccountNumber,Balance
	FROM TblAccount 
	WHERE AccountNumber LIKE '%-1'

--8) Show a list of accounts and their balance for accounts opened on or after July 1, 1990. 
				
	SELECT Acnt.AccountNumber, Acnt.Balance, Acnt.DateOpened
	FROM TblAccount Acnt
	JOIN  TblAccountType AcntType 
	ON Acnt.AccountTypeCode = AcntType.TypeCode
	WHERE Acnt.DateOpened >= '1-July-1990'

--9) If all the customers decided to withdraw their money, how much cash would the bank need? 
			
	SELECT Sum(Balance) AS TotalAmtNeeded
	FROM TblAccount

--10) List account number(s) and balance in accounts held by ‘David Letterman’. 
			
	SELECT Acnt.AccountNumber, Acnt.Balance
	FROM TblAccount Acnt
	JOIN TblCustomer Cust
	ON Acnt.CustomerID = Cust.CustomerID
	WHERE Cust.CustomerName = 'David Letterman'

--11) List the name of the customer who has the largest balance (in any account). 
			
	SELECT Cust.CustomerName, MAX(Acnt.Balance) AS HighestBalance
	FROM TblCustomer Cust
	JOIN TblAccount Acnt
	ON Cust.CustomerID = Acnt.CustomerID
	GROUP BY Cust.CustomerName
			
--12) List customers who have a ‘Money Market’ account. 

	SELECT Cust.CustomerName
	FROM TblCustomer Cust 
	JOIN TblAccount Acnt ON Cust.CustomerID = Acnt.CustomerID 
	JOIN TblAccountType AcntType ON AcntType.TypeCode = Acnt.AccountTypeCode
	WHERE AcntType.TypeDesc = 'Money Market'

--13) Produce a listing that shows the city and the number of people who live in that city. 
				
	SELECT Cust.City, Count(City) AS PeopleLivingInCity
	FROM TblCustomer Cust
	GROUP BY Cust.City

--14) Produce a listing showing customer name, the type of account they hold and the balance in that account.(Make use of Joins)
				
	SELECT Cust.CustomerName, AcntType.TypeDesc, Acnt.Balance
	FROM TblCustomer Cust
	JOIN TblAccount Acnt ON Cust.CustomerID = Acnt.CustomerID 
	JOIN TblAccountType AcntType ON AcntType.TypeCode = Acnt.AccountTypeCode

--15) Produce a listing that shows the customer name and the number of accounts they hold.(Make use of Joins)
				
	SELECT Cust.CustomerName, Count(Acnt.AccountNumber) AS AccountCustHolds
	FROM TblCustomer Cust
	JOIN TblAccount Acnt
	ON Cust.CustomerID = Acnt.CustomerID
	GROUP BY Cust.CustomerName

--16) Produce a listing that shows an account type and the average balance in accounts of that type.(Make use of Joins)
				
	SELECT AcntType.TypeDesc, Avg(Acnt.Balance) AS AvgBalance
	FROM TblAccount Acnt 
	JOIN TblAccountType AcntType
	ON Acnt.AccountTypeCode = AcntType.TypeCode
	GROUP BY AcntType.TypeDesc
