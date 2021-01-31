--Find Out Question
--Use of In-Built functions

use WFA3DotNet

CREATE TABLE ProductDetails (
		ProductId int not null IDENTITY(101,1),
		ProductName varchar(30) UNIQUE,
		SetQty int not null 
			CHECK (SetQty=1 OR SetQty =5 OR SetQty=10) ,
		Rate DECIMAL(10,5) null 
			CHECK (Rate >=51  AND Rate <=5000
)

SELECT * FROM ProductDetails

INSERT into ProductDetails VALUES('Vanilla',10,3777.899)
INSERT into ProductDetails VALUES('Chocolate',1,2300.470)
INSERT into ProductDetails VALUES('Black Currant',10,330.50)
INSERT into ProductDetails VALUES('ButterScotch',5,899.40)
INSERT into ProductDetails VALUES('Cookies & Cream',1,2989.180)
INSERT into ProductDetails VALUES('Mint Chocolate Chip',5,2870.333)
INSERT into ProductDetails VALUES('Strawberry',10,1955.99)
INSERT into ProductDetails VALUES('Mango',5,1736.56)
INSERT into ProductDetails VALUES('Bubble Gum',1,2203.414)
INSERT into ProductDetails VALUES('Snicker Bash',5,1785.26561)
INSERT into ProductDetails VALUES('Caramel Apple',10,1830.663)
INSERT into ProductDetails VALUES('Cotton Candy',10,1786.343)
INSERT into ProductDetails VALUES('Hazelnut',1,3835.25620)
INSERT into ProductDetails VALUES('Red Velvet',1,1399.55556)
INSERT into ProductDetails VALUES('Kiwi Delight',5,823.76)
INSERT into ProductDetails VALUES('Cherry Macaron',1,555.55435)
INSERT into ProductDetails VALUES('Black Walnut',5,3204.10433)
INSERT into ProductDetails VALUES('Black Raspberry',5,2060.9228)
INSERT into ProductDetails VALUES('Coconut',5,2083.82)
INSERT into ProductDetails VALUES('Nutty Fudge',5,903.2133)

--ASCII
SELECT Ascii('Nutty Fudge') AS AsciiValue

--COUNT
SELECT Count(ProductName) AS ProductCount
FROM ProductDetails

--LENGTH
SELECT ProductId, ProductName, LEN(ProductName) AS TotalLength
FROM ProductDetails

--UPPER
SELECT ProductName, 
UPPER(ProductName) ProductNameUpper
FROM ProductDetails

--LOWER
SELECT ProductName, 
LOWER(ProductName) ProductNameLower
FROM ProductDetails

--SUBSTRING
SELECT ProductName, 
SUBSTRING(ProductName, CHARINDEX(' ', ProductName)+1, 
LEN(ProductName)-CHARINDEX(' ', ProductName)) AS LastPart
FROM ProductDetails

--REVERSE
SELECT ProductName, REVERSE(ProductName) AS RevName
FROM ProductDetails

--REPLACE
UPDATE ProductDetails   
SET ProductName = REPLACE(ProductName, 'Hazelnut','Banana Pie')
WHERE ProductId = 113

--LIMIT
SELECT TOP 5 *
FROM ProductDetails

--IN
SELECT ProductId, ProductName
FROM ProductDetails
WHERE ProductName IN ('Chocolate', 'Coconut')

--NOT IN
SELECT * FROM ProductDetails
WHERE ProductName NOT IN ('Chocolate','Coconut')

--BETWEEN
SELECT * FROM ProductDetails
WHERE Rate BETWEEN '1000' AND '3000'

--AVERAGE
SELECT Avg(Rate) AS AverageRate 
FROM ProductDetails

--SUM
SELECT SetQty,SUM(SetQty) AS TotalQuantity
FROM ProductDetails
GROUP BY SetQty

--MAX
SELECT Max(Rate) AS MaxRate
FROM ProductDetails

--MIN
SELECT Min(Rate) AS MinRate
FROM ProductDetails

--FLOOR
SELECT ProductName, Floor(Rate) AS FloorRate
FROM ProductDetails

--CEILING
select ProductName, Ceiling(Rate) AS CeilingRate
FROM ProductDetails

--ROUNDOF
SELECT ProductName, ROUND(Rate,2) AS RoundValue
FROM ProductDetails

--DISTINCT
SELECT DISTINCT(ProductId)
FROM ProductDetails

--CONCATE
SELECT CONCAT(ProductId, ' ',ProductName) AS PDetails
FROM ProductDetails