drop database IF EXISTS DB_BOOKS;
create database DB_BOOKS;

USE DB_BOOKS;

-- Tables 'Authors'
CREATE TABLE Authors 
(
	 Code_author INT PRIMARY KEY, -- Author code
	 Name_author CHAR(30), -- Name of the author
	 Birthday DATETIME -- Date of birth
 );

-- Tables 'Publishng houses'
CREATE TABLE Publishing_house 
(
	 Code_publish INT PRIMARY KEY, -- Publishing house code
	 Publish CHAR(30), -- Publishing house
	 City CHAR(20) -- City
 );

-- Table 'Books'
CREATE TABLE Books 
(
	 Code_book INT PRIMARY KEY, -- Book code
	 Title_book CHAR(40),  -- Title of the book   
	 Code_author INT, -- Author code
	 Pages INT, -- Number of pages
     Code_publish INT,  -- Publishing house code
     FOREIGN KEY (Code_author)  REFERENCES Authors (Code_author),
     FOREIGN KEY (Code_publish)  REFERENCES Publishing_house (Code_publish)
 );

-- Table 'Поставщики'
CREATE TABLE Deliveries 
(
	 Code_delivery INT PRIMARY KEY, -- Delivery code
	 Name_delivery CHAR(30), -- Name of the person in charge
	 Name_company CHAR(20), -- Delivery company name
	 Address VARCHAR(100), -- Address
	 Phone BIGINT, -- Phone
	 INN CHAR(13) -- Taxpayer Number
);

-- Table'Purchases'
CREATE TABLE Purchases 
(
	  Code_purchase INT PRIMARY KEY, -- Purchases code
	  Code_book INT, -- Code book
	  Date_order DATE, -- Data of the order book
	  Code_delivery INT, -- Delivery code
	  Type_purchase BIT, -- Type purchase 
	  Cost FLOAT, -- Cost of sales
	  Amount INT, -- Amount
      FOREIGN KEY (Code_book)  REFERENCES Books(Code_book),
      FOREIGN KEY (Code_delivery) REFERENCES Deliveries(Code_delivery)
);

-- Filling tables with data
INSERT INTO Authors VALUES 
		(1, 'Michael Dawson', '1983-11-18'),
		(2, 'Mikhail Labkovsky', '1961-06-17'),
		(3, 'George Orwell', '1853-06-25');


INSERT INTO Publishing_house VALUES
		(1, 'Publishing House ''Peter''', 'Saint Petersburg'),
		(2, 'AST', 'Moscow'),
		(3, 'Peace', 'Moscow');

INSERT INTO Deliveries VALUES
		(1, 'Popov Andrei', 'Read', '127322, c. Moscow, Garden passage, д.20, стр.27', 88004448444, '3668973340'),
		(2, 'Ivantsov Mikhail', 'Labirint', '129 626, c. Moscow, st. Malomoskowskaya, h. 22, room 62.', 74957339174, '7727563778'),
		(3, 'Kalinina Daria', '«Zao»', 'Presnenskaya Emb. 10, bld. C, Moscow, Russia, 123112', 74952321000, '5678223341');

INSERT INTO Books VALUES
		(1, 'Programming on Python', 1, 416, 1),
		(2, 'I want and I will.', 2, 320, 3),
		(3, 'Barnyard. Eseu', 3, 256, 2),
		(4, '1984', 3, 330, 2),
		(5, 'Memoirs. Orwell', 3, 500, 2);

INSERT INTO Purchases VALUES
		(1, 1, '2020-03-25', 2, 1, 250.00, 1),
		(2, 2, '2020-11-29', 3, 1, 500.0, 1),
		(3, 3, '2020-04-29', 3, 1, 257.0, 200),
		(4, 4, '2020-11-29', 1, 1, 399.99, 1),
		(5, 4, '2020-11-29', 3, 0, 350.00, 7);