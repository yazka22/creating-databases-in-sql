USE DB_BOOKS;

/*
1) Displays information from the Deliveries table in the following order:
   Name_delivery, INN, Phone, Address.
*/

SELECT Name_delivery as 'Name of the person in charge', INN as 'taxpayer nomer', Phone as 'Phone', Address as 'Adress'
	FROM Deliveries;

/*
2) Lists of authors from (field Name_author) Authors table,
   Whose date of birth (field Birthday) is in the range 01.01.1900 – 01.01.2000.
*/

SELECT Name_author as 'Author'
	FROM Authors
	WHERE Authors.Birthday BETWEEN '1900-01-01' AND '2000-01-01';

/*
3) Displays a list of books ordered in ascending order by the number of pages.

SELECT * 
	FROM Books
	ORDER BY Pages;

/*
4) List book titles (field Title_book) from the Books table,
   which have the following price (in rubles): 250, 500, 750 (field from table Purchases).
*/

SELECT Title_book as 'Title of the book'
	FROM Books inner join Purchases ON Purchases.Code_book = Books.Code_book
	WHERE Purchases.Cost IN (250, 500, 750);

/*
5) Selects a list of books (field Title_book) from table Books,
   whose meanings begin with the word «Memoirs».
*/
SELECT Title_book as 'Title of the book'
	FROM Books 
	WHERE Books.Title_book LIKE 'Memoirs%';

/*
6) Lists the names of the supplying companies (field Name_company)
   and the corresponding total cost of book purchases (use Amount and Cost).
*/

SELECT Name_company, SUM(Cost*Amount) as 'Total cost of book purchases'
	FROM Purchases inner join Deliveries ON Deliveries.Code_delivery = Purchases.Code_delivery
	GROUP BY Name_company;

