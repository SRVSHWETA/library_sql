UsE LibraryDB
SELECT *
From branch ;
---Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 
--'Classic',6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
Select *
From books;
Insert Into books(isbn,book_title,category,rental_price,status,author,publisher)
Values ('978-1-60129-456-2', 'To Kill a Mockingbird','Classic','6.00', 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')
DELETE FROM books
WHERE isbn = '978-1-60129-456-2'
  AND book_title = 'To Kill a Mockingbird'
  AND category = 'Classic'
  AND rental_price = '6.00'   -- if rental_price is still VARCHAR
  AND status = 'yes'
  AND author = 'Harper Lee'
  AND publisher = 'J.B. Lippincott & Co.';
--Task 2: Update an Existing Member's Address
Select *
From members
Update members
SET member_address = '125 Oak St'
WHERE member_id = 'C103';
Update members 
Set member_name = 'Shweta Srivastava'
Where member_address = '123 Main St'
--Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.
Select *
From issued_status
Delete From issued_status
Where issued_id = 'IS121'
--Task 4: Retrieve All Books Issued by a Specific Employee 
-- Objective: Select all books issued by the employee with emp_id = 'E101'.
Select *
From issued_status
Select *
From issued_status
Where issued_emp_id = 'E101';
--Task 5: List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.
Select issued_emp_id,
Count(issued_id) as total_bookissued
From issued_status
Group by issued_emp_id ;
. CTAS (Create Table As Select)
--Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results -
--each book and total book_issued_cnt**
 -- Create table using SELECT INTO in SSMS
SELECT 
  b.book_title,
  b.isbn,
  COUNT(st.issued_id) AS no_Issued
INTO Counts_Book
FROM books AS b
JOIN issued_status AS st
  ON st.issued_book_isbn = b.isbn
GROUP BY b.isbn, b.book_title;
SELECT * 
FROM Counts_Book;
--Task 7. Retrieve All Books in a Specific Category :
Select book_title
From Books 
Where category = 'Mystery'
SELECT COUNT(*) AS MysteryBookCount
FROM Books
WHERE category = 'Mystery';
Select * from books
Select category, Count(*) as totalbooks
From books
Group by category;
-- Q2: How many books has each author written?
Select author, Count(*) AS bookwritten
From books
Group By author ;
 -- Show only those authors who wrote more than 1 book.
Select author, Count(*) AS bookwritten
From books
Group By author
Having Count (*) > 1;
-- Find number of books per publisher. Only include publishers with at least 2 books.
Select publisher, Count(*) as totalcnt
From books
Group By publisher
Having count(*) >= 2;
--Q5: Show how many books exist in each category. 
--Only show categories that have less than 3 books.
Select count(*)as NoCount, category
From books
Group By category 
Having count(*) < 3; 
-- Q6Show each author and their publisher who have more than 1 book, 
--and sort the result by number of books (highest first).
Select author,publisher,Count(*) as TotalBooks
From books
Group by author,publisher
Having Count(*) > 1 ;
---- CTAS
-- Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - 
--each book and total book_issued_cnt**
 Select *
From issued_status;
Select *
From books b;
--SELECT 
 -- b.isbn,
  --b.book_title,
  --COUNT(st.issued_id) AS no_issued
---INTO book_counts
--FROM books b
--JOIN issued_status st
 -- ON b.isbn = st.issued_book_isbn
--GROUP BY b.isbn, b.book_title ;
Select *
From book_counts ;
---- Task 7. Retrieve All Books in a Specific Category:
Select *
From books
Where category = 'Classic'
----- Task 8: Find Total Rental Income by Category:
Select b.category,SUM(cast(rental_price as Float )) as TotalRentalRecd,
Count(*) AS Totalcnt
From books b
Join issued_status as st
On st.issued_book_isbn = b.isbn
Group by b.category ;
-- List Members Who Registered in the Last 180 Days:
 SELECT *
FROM members
WHERE reg_date >= CAST(GETDATE() - 180 AS DATE);
Insert Into members(member_id,member_name,member_address,reg_date)
Values 
('C120','Khalid','568 Walnut Street', '2025-01-06');
-- List Employees with Their Branch Manager's Name and their branch details:
Select *
From branch
Select *
From employees;
Select e.*,
b.branch_id,
e2.emp_name as manager
From branch b
Join employees e
On b.branch_id = e.branch_id
Join employees e2
On b.manager_id = e.emp_id;
---- Task 11. Create a Table of Books with Rental Price 
--Above a Certain Threshold 7USD:
Select * 
Into books_list
From books 
where rental_price > cast(7 as Float);
Select *
From books_list
---- Task 12: Retrieve the List of Books Not Yet Returned
Select *
From return_status
Select *
From issued_status
SELECT 
    DISTINCT ist.issued_book_name
FROM issued_status as ist
LEFT JOIN
return_status as rs
ON ist.issued_id = rs.issued_id
WHERE rs.return_id IS NULL






