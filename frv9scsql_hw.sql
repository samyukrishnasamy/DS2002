SELECT name 
FROM country 
WHERE Continent = "South America";

SELECT Population 
FROM country 
WHERE name = "Germany";

SELECT name 
FROM city 
WHERE CountryCode = "JPN";

SELECT name 
FROM country 
WHERE Continent = "Africa" 
ORDER BY Population DESC LIMIT 3;

SELECT name, LifeExpectancy 
FROM country 
WHERE Population BETWEEN “1” AND “5000000”;

SELECT country.name
FROM country
JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = "French" AND countrylanguage.IsOfficial = "T";

SELECT itle 
FROM Album 
JOIN Artist 
ON Artist.ArtistId = Album.ArtistId 
WHERE Artist.Name = "AC/DC";

SELECT FirstName, LastName, Email 
FROM Customer 
WHERE Country = "Brazil";

SELECT * FROM "Playlist"

SELECT COUNT(Track.Name) 
FROM Track 
JOIN Genre 
WHERE Genre.GenreId = Track.TrackId;

SELECT FirstName, LastName
FROM Employee
WHERE ReportsTo = (
    SELECT EmployeeID
	FROM Employee
    WHERE FirstName = "Nancy" AND LastName = "Edwards"
);

SELECT Customer.FirstName, Customer.LastName, SUM(Invoice.Total)
FROM Invoice
JOIN Customer
ON Invoice.CustomerID = Customer.CustomerId
GROUP BY Customer.FirstName, Customer.LastName;




CREATE DATABASE sephora;
USE sephora;


CREATE DATABASE sephora;
USE sephora;

CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    PhoneNumber VARCHAR(15)
);

CREATE TABLE Products(
	ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(50),
    Price VARCHAR(50),
    Category VARCHAR(15)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (FirstName, LastName, PhoneNumber) VALUES
("Samyu", "Krishnasamy", "123-456-7890"),
("Sabrina", "Carpenter", "246-801-3579"),
("Nessa", "Barrett", "000-000-0000"),
("Ariana", "Grande", "111-111-1111"),
("Maru", "Lee", "222-222-2222");

INSERT INTO Products (ProductName, Price, Category) VALUES
('Patrick Ta Blush', 38.99, 'Makeup'),
('Tatcha Moisturizer', 49.99, 'Skincare'),
('Milk Contour Stick', 24.00, 'Makeup'),
('Chanel Perfume', 100.00, 'Fragrance'),
('Gisou Hair Oil', 25.00, 'Haircare');

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2024-09-01', 38.99),
(2, '2024-09-02', 49.99),
(3, '2024-09-03', 24.00),
(4, '2024-09-04', 100.00),
(5, '2024-09-05', 149.99);

SELECT ProductName, Price
FROM Products
WHERE Category = "Makeup";

SELECT Customers.FirstName, Customers.LastName, Orders.OrderDate, Orders.TotalAmount
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderDate BETWEEN "2024-09-01" AND "2024-09-03";

SELECT Customers.FirstName, Customers.LastName, SUM(Orders.TotalAmount) AS TotalSales
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName
ORDER BY TotalSales DESC
LIMIT 3;