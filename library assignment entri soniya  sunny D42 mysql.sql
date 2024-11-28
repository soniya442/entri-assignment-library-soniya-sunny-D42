create database library ;

use library ;

create table branch (
branch_no int primary key,
manager_id int ,
branch_address varchar(255) ,
contact_no varchar(15)
) ;

create table employee (
emp_id int primary key ,
emp_name varchar (100) ,
position varchar (100) ,
salary decimal (10,2) ,
branch_no int ,
foreign key (branch_no) references branch (branch_no)
) ;

create table books (
ISBN varchar(20) primary key ,
book_title varchar(255) ,
category varchar (100) ,
rental_price decimal(10,2) ,
status varchar (3), 
author varchar (255) ,
publisher varchar (255)
) ;

create table customer (
customer_id int primary key ,
customer_name varchar (100) ,
customer_address varchar(255) ,
reg_date date
) ;

create table issuestatus (
issue_id int primary key ,
issued_cust int ,
issued_book_name varchar(255) ,
issue_date date ,
isbn_book varchar(20) ,
foreign key (issued_cust) references customer(customer_id),
foreign key (isbn_book) references books(ISBN)
) ;

create table Returnstatus (
Return_id int primary key ,
Return_cust int ,
Return_book_name  varchar(255) ,
Return_date date ,
Isbn_book2 varchar(20) ,
foreign key (Return_cust) references customer (customer_id) ,
foreign key (Isbn_book2) references books( ISBN)
) ;

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1, 101, 'MG Road, Bengaluru', '08012345678'),
(2, 102, 'Sector 18, Noida', '01204567890'),
(3, 103, 'Park Street, Kolkata', '03398765432'),
(4, 104, 'Andheri West, Mumbai', '02233445566'),
(5, 105, 'Banjara Hills, Hyderabad', '04022334455');

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(201, 'Rahul Sharma', 'Manager', 70000, 1),
(202, 'Sneha Verma', 'Librarian', 40000, 1),
(203, 'Amit Gupta', 'Assistant', 30000, 2),
(204, 'Priya Das', 'Manager', 65000, 2),
(205, 'Karan Mehta', 'Assistant', 32000, 3),
(206, 'Anjali Roy', 'Librarian', 45000, 3),
(207, 'Vivek Nair', 'Manager', 80000, 4),
(208, 'Swati Kapoor', 'Assistant', 35000, 4),
(209, 'Ramesh Yadav', 'Librarian', 47000, 5);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('978-1-56619-909-4', 'Introduction to Algorithms', 'Technology', 30.00, 'Yes', 'Thomas H. Cormen', 'MIT Press'),
('978-0-262-03384-8', 'Artificial Intelligence', 'Technology', 35.00, 'No', 'Stuart Russell', 'Pearson'),
('978-0-7432-7356-5', 'Sapiens: A Brief History of Humankind', 'History', 25.00, 'Yes', 'Yuval Noah Harari', 'Harper'),
('978-1-4028-9462-6', 'The History of India', 'History', 20.00, 'Yes', 'Romila Thapar', 'Penguin'),
('978-0-316-76948-6', 'The Road Less Traveled', 'Self-help', 15.00, 'No', 'M. Scott Peck', 'Simon & Schuster'),
('978-1-4767-4658-6', 'Becoming', 'Biography', 40.00, 'Yes', 'Michelle Obama', 'Crown'),
('978-1-5011-8174-2', 'Where the Crawdads Sing', 'Fiction', 28.00, 'Yes', 'Delia Owens', 'Putnam');

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(301, 'Arjun Kumar', 'Indiranagar, Bengaluru', '2021-05-10'),
(302, 'Meera Singh', 'Gurgaon', '2022-03-15'),
(303, 'Ravi Patel', 'Salt Lake, Kolkata', '2020-08-22'),
(304, 'Neha Sharma', 'Sector 12, Noida', '2023-01-10'),
(305, 'Vikas Chawla', 'MG Road, Pune', '2023-06-20'),
(306, 'Ankita Roy', 'Andheri West, Mumbai', '2021-07-15'),
(307, 'Sahil Khan', 'Banjara Hills, Hyderabad', '2020-12-25');

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(401, 301, 'Sapiens: A Brief History of Humankind', '2023-06-15', '978-0-7432-7356-5'),
(402, 302, 'Introduction to Algorithms', '2023-06-10', '978-1-56619-909-4'),
(403, 305, 'The History of India', '2023-06-18', '978-1-4028-9462-6'),
(404, 306, 'Becoming', '2023-07-05', '978-1-4767-4658-6'),
(405, 307, 'Where the Crawdads Sing', '2023-06-20', '978-1-5011-8174-2');

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(501, 302, 'Introduction to Algorithms', '2023-06-20', '978-1-56619-909-4'),
(502, 301, 'Sapiens: A Brief History of Humankind', '2023-06-25', '978-0-7432-7356-5'),
(503, 305, 'The History of India', '2023-07-01', '978-1-4028-9462-6'),
(504, 306, 'Becoming', '2023-07-15', '978-1-4767-4658-6'),
(505, 307, 'Where the Crawdads Sing', '2023-07-10', '978-1-5011-8174-2');

select * from books ;

select book_title,category,rental_price from books 
where status ='yes' ;

select * from employee ;

select emp_name,salary from employee order by salary desc ;

SELECT B.Book_title, C.Customer_name
FROM Books B
JOIN IssueStatus I ON B.ISBN = I.Isbn_book
JOIN Customer C ON I.Issued_cust = C.Customer_Id;

select category,count(*) as total_books
from books group by category ;

SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

SELECT C.Customer_name
FROM Customer C
LEFT JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE C.Reg_date < '2022-01-01' AND I.Issue_Id IS NULL;

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

select * from customer ;

SELECT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE MONTH(I.Issue_date) = 6 AND YEAR(I.Issue_date) = 2023;

SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

SELECT E.Emp_name, B.Branch_address
FROM Employee E
JOIN Branch B ON E.Emp_Id = B.Manager_Id;

SELECT DISTINCT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
JOIN Books B ON I.Isbn_book = B.ISBN
WHERE B.Rental_Price > 25;




















