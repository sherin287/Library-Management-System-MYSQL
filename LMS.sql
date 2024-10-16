--  Create the database
CREATE DATABASE library;

--  Use the database
USE library;

--  Create the tables

-- Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);
DESC Branch;

-- Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
DESC Employee;  

-- Books table
CREATE TABLE Books (
    ISBN VARCHAR(255) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'), 
    Author VARCHAR(255),
    Publisher VARCHAR(255)
    );
    DESC Books;
    
    -- Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

DESC Customer;

-- IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(255),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

DESC IssueStatus;

-- ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(255),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

DESC ReturnStatus;

-- Insert data into Branch table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1, 100, '123 Main St North City' , '39841975'),
(2, 101, '456 Gandhi St South City', '32039873'),
(3, 102, '789 Avenue St Town City', '323345678'),
(4, 103, '321 Mall St Down City', '32457861');

SELECT * FROM Branch;

-- Insert data into Employee table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(1, 'Alice Ann', 'Manager', 60000, 1),
(2, 'Smith John', 'Assistant Manager', 40000, 1),
(3, 'Cathyeline Bob', 'Clerk', 35000, 2),
(4, 'David Dane', 'Manager', 62000, 2),
(5, 'Eve Steve', 'Clerk', 32000, 3),
(6, 'Frank Mark', 'Librarian', 61000, 4),
(7, 'Grace Antony', 'Assistant Manager', 42000, 3),
(8,'Keerthy Arun','Clerk',30000,1),
(9,'Amal Jith','Assistant Manager',45000,4),
(10,'Wilson Thomas','Librarian',55000,1),
(11,'Mike Brown','Manager',65000,4),
(12,'Emily Emin','Librarian',54000,2),
(13,'Mary Simon','Assistant Manager',45000,2),
(14,'Jack Prince','Librarian',58000,3),
(15,'Hamilin James','Manager',65000,3),
(16,'Neha Ijaz','Clerk',34000,4),
(17,'Nancy Adam','Assistant Librarian',25000,1),
(18,'Lee Levis','Assistant Librarian',30000,2),
(19,'Rachel Paul','Assistant Librarian',38000,3),
(20,'Alwin Meel','Assistant Librarian',35000,4);

SELECT * FROM Employee;

-- Insert data into Books table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES

 ('978-3-16-148410-0', 'The Great Gatsby', 'Fiction', 4.99, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
    ('978-0-14-017739-8', 'Nineteen eighty four', 'History', 5.99, 'yes', 'George Orwell', 'Penguin Books'),
    ('978-0-452-28423-4', 'To Kill a Mockingbird', 'Fiction', 6.49, 'no', 'Harper Lee', 'J.B. Lippincott & Co.'),
    ('978-0-7432-7356-5', 'The Catcher in the Rye', 'Fiction', 5.79, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
    ('978-0-375-72451-6', 'The Road', 'Thriller', 6.99, 'yes', 'Cormac McCarthy', 'Knopf'),
    ('978-0-316-76948-0', 'The Shining', 'Horror', 7.99, 'no', 'Stephen King', 'Doubleday'),
    ('978-0-618-34624-3', 'The Hobbit', 'Fantasy', 8.49, 'yes', 'J.R.R. Tolkien', 'Houghton Mifflin'),
    ('978-0-15-101026-4', 'Life of Pi', 'Adventure', 7.49, 'yes', 'Yann Martel', 'Harcourt'),
    ('978-0-394-82852-7', 'Beloved', 'History', 6.99, 'no', 'Toni Morrison', 'Alfred A. Knopf'),
    ('978-0-345-39180-3', 'A Game of Thrones', 'Fantasy', 8.99, 'yes', 'George R.R. Martin', 'Bantam Books');
    
SELECT * FROM Books;

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
 ('978-1-5011-8774-7', 'The Silent Patient', 'Thriller', 5.49, 'yes', 'Alex Michaelides', 'Celadon Books'),
    ('978-0-06-235820-2', 'Where the Crawdads Sing', 'Mystery', 6.29, 'no', 'Delia Owens', 'G.P. Putnam\'s Sons'),
    ('978-0-345-39181-0', 'A Clash of Kings', 'Fantasy', 8.49, 'yes', 'George R.R. Martin', 'Bantam Books'),
    ('978-1-4767-6453-9', 'All the Light We Cannot See', 'History', 7.49, 'no', 'Anthony Doerr', 'Scribner'),
    ('978-0-7432-7357-2', 'Frankenstein', 'Science Fiction', 4.99, 'yes', 'Mary Shelley', 'Lackington, Hughes, Harding, Mavor & Jones'),
    ('978-1-4767-2726-8', 'The Nightingale', 'History', 7.19, 'yes', 'Kristin Hannah', 'St. Martin\'s Press'),
    ('978-0-14-044926-6', 'The Odyssey', 'Epic', 5.29, 'yes', 'Homer', 'Penguin Classics'),
    ('978-0-06-112008-4', 'Brave New World', 'Fiction', 6.49, 'no', 'Aldous Huxley', 'Chatto & Windus'),
    ('978-0-312-42289-9', 'The Hunger Games', 'Science Fiction', 6.99, 'yes', 'Suzanne Collins', 'Scholastic Press'),
    ('978-0-06-093546-7', 'The Alchemist', 'Philosophy', 5.99, 'yes', 'Paulo Coelho', 'HarperTorch');
SELECT * FROM Books;

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('978-0-345-39182-7', 'A Storm of Swords', 'Fantasy', 25.99, 'no', 'George R.R. Martin', 'Bantam Books'),
    ('978-0-671-02735-7', 'The Stand', 'Horror', 9.49, 'yes', 'Stephen King', 'Doubleday'),
    ('978-0-141-18771-9', 'Moby-Dick', 'Adventure', 27.79, 'yes', 'Herman Melville', 'Harper & Brothers'),
    ('978-0-7432-7358-9', 'Pride and Prejudice', 'Romance', 28.49, 'no', 'Jane Austen', 'T. Egerton'),
    ('978-0-312-24213-0', 'Catching Fire', 'Science Fiction', 6.99, 'yes', 'Suzanne Collins', 'Scholastic Press'),
    ('978-1-5011-6556-1', 'The Institute', 'Thriller', 7.49, 'yes', 'Stephen King', 'Scribner'),
    ('978-0-345-39183-4', 'A Feast for Crows', 'Fantasy', 30.99, 'no', 'George R.R. Martin', 'Bantam Books'),
    ('978-0-679-40310-6', 'The Handmaid\'s Tale', 'Fiction', 35.49, 'yes', 'Margaret Atwood', 'McClelland & Stewart'),
    ('978-0-06-231500-7', 'Educated', 'Memoir', 7.19, 'yes', 'Tara Westover', 'Random House'),
    ('978-0-06-085052-4', 'The Book Thief', 'History', 27.49, 'yes', 'Markus Zusak', 'Knopf Books');
 
 SELECT * FROM Books;
 
 INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
 ('978-0-452-28425-8', 'Slaughterhouse-Five', 'Science Fiction', 38.49, 'no', 'Kurt Vonnegut', 'Delacorte Press'),
    ('978-1-5011-8838-6', 'The Midnight Library', 'Fantasy', 6.79, 'yes', 'Matt Haig', 'Canongate Books'),
    ('978-0-14-303943-3', 'One Hundred Years of Solitude', 'Magical Realism', 5.99, 'yes', 'Gabriel García Márquez', 'Harper & Row'),
    ('978-0-446-31078-9', 'The Da Vinci Code', 'Thriller', 36.99, 'yes', 'Dan Brown', 'Doubleday'),
    ('978-0-15-601219-4', 'The Little Prince', 'Fable', 29.29, 'no', 'Antoine de Saint-Exupéry', 'Reynal & Hitchcock'),
    ('978-1-5011-7326-0', 'The Last House on Needless Street', 'Horror', 7.49, 'yes', 'Catriona Ward', 'Tor Nightfire'),
    ('978-0-14-118280-3', 'Crime and Punishment', 'History', 25.99, 'yes', 'Fyodor Dostoevsky', 'Penguin Classics'),
    ('978-0-14-243717-9', 'The Grapes of Wrath', 'Fiction', 28.49, 'yes', 'John Steinbeck', 'The Viking Press'),
    ('978-0-452-28426-5', 'Animal Farm', 'History', 4.99, 'no', 'George Orwell', 'Secker & Warburg'),
    ('978-1-5011-5686-7', 'Anxious People', 'Humor', 26.49, 'yes', 'Fredrik Backman', 'Atria Books');
 
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('978-1-250-00325-5', 'The Invisible Life of Addie LaRue', 'Fantasy', 27.99, 'yes', 'V.E. Schwab', 'Tor Books'),
    ('978-0-141-18025-5', 'Dracula', ' Horror', 5.49, 'no', 'Bram Stoker', 'Archibald Constable and Company'),
    ('978-0-670-81302-8', 'The Goldfinch', 'Fiction', 28.49, 'yes', 'Donna Tartt', 'Little, Brown and Company'),
    ('978-0-06-268697-7', 'The Song of Achilles', 'Fantasy', 26.99, 'yes', 'Madeline Miller', 'Bloomsbury Publishing'),
    ('978-0-316-76948-7', 'Pet Sematary', 'Horror', 27.49, 'no', 'Stephen King', 'Doubleday'),
    ('978-3-216-3212-8','An Autobiography','History',30.55,'yes','Jawarharlal Nehru','HW Publishers');
    INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('978-0-679-74472-6', 'The Rise and Fall of the Third Reich', 'History', 30.00, 'yes', 'William L. Shirer', 'Simon & Schuster'),
('978-0-14-303573-2', 'Guns, Germs, and Steel', 'History', 28.00, 'yes', 'Jared Diamond', 'W. W. Norton & Company'),
('978-0-375-75682-9', 'Team of Rivals: The Political Genius of Abraham Lincoln', 'History', 22.00, 'no', 'Doris Kearns Goodwin', 'Simon & Schuster'),
('978-0-06-231609-9', 'A People’s History of the United States', 'History', 17.50, 'yes', 'Howard Zinn', 'HarperCollins'),
('978-0-307-47293-7', '1776', 'History', 19.00, 'no', 'David McCullough', 'Simon & Schuster'),
('978-0-307-95781-3', 'The Wright Brothers', 'History', 21.00, 'yes', 'David McCullough', 'Simon & Schuster'),
('978-0-307-59480-5', 'The Great Bridge: The Epic Story of the Building of the Brooklyn Bridge', 'History', 20.00, 'yes', 'David McCullough', 'Simon & Schuster'),
('978-0-670-84660-3', 'Alexander Hamilton', 'History', 25.00, 'no', 'Ron Chernow', 'Penguin Press'),
('978-1-4767-7871-5', 'Sapiens: A Brief History of Humankind', 'History', 28.00, 'yes', 'Yuval Noah Harari', 'Harper'),
('978-0-307-29136-0', 'The Guns of August', 'History', 15.00, 'no', 'Barbara W. Tuchman', 'Random House');
    
SELECT* FROM Books;
-- Insert  data into Customer table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(001, 'Alex Tom', '999 Willow St, North City', '2021-08-20'),
(002, 'Mary Johnson', '1010 Oak Ave,South City ', '2022-09-01'),
(003, 'James Cameron', '333 Palm Dr, Downtown City', '2021-09-10'),
(004, 'Sophia Lee', '444 Redwood Rd, Avenues City', '2020-09-15'),
(005, 'George Martin', '555 Fir Ln, Mall City', '2022-09-20'),
(006, 'Davis DJ', '777 Aspen Pl, Downtown City', '2021-09-25'),
(007, 'Daniel Harris', '888 Cedar Cir, South City', '2021-09-30'),
(008, 'Emma Thompson', '999 Birch Blvd, North City', '2022-10-01'),
(009, 'Liam White', '1010 Maple St, Mall City', '2021-10-05'),
(010, 'Olivia Williams', '2020 Oakwood Dr, City Lane', '2021-10-10');
SELECT * FROM Customer;
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(011, 'Ethan Clark', '111 Lakeview Rd, North City', '2021-08-05'),
(012, 'Ava Patel', '222 Riverbank St, Mall street', '2023-08-15'),
(013, 'Noah Wright', '333 Hilltop Dr, Avenues Mall City', '2023-08-25'),
(014, 'Mia King', '444 Forest Ln, Nagar City', '2021-09-02'),
(015, 'Oliver Hall', '555 Park Ave, Downtown City', '2023-09-06'),
(016, 'Charlotte Scott', '666 Meadow Rd, City South', '2022-09-10'),
(017, 'Isabella Young', '777 Brookside Dr, Media City', '2023-09-18'),
(018, 'Lucas Baker', '888 Seaside St, City North', '2021-09-22'),
(019, 'Amelia Turner', '999 Mountain View Dr, Downtown City', '2023-09-28'),
(020, 'Mason Adams', '1010 Sunset Blvd, Mall Lane', '2020-09-30'),
(021, 'Harper Nelson', '1111 Oceanfront Rd, Galleria City', '2023-10-03'),
(022, 'Elijah Mitchell', '1212 Elmwood Ave, Dragon City', '2023-10-05'),
(023, 'Sophia Perez', '1313 Pineview Dr, Electronics City', '2019-10-07'),
(024, 'William Carter', '1414 Lakefront Cir, City Street', '2023-10-08'),
(025, 'Avery Morris', '1515 Valleyview St, Mall City', '2023-10-09'),
(026, 'Benjamin Reed', '1616 Highland Rd, Avenues City', '2022-10-10'),
(027, 'Lily Walker', '1717 Oakwood St, Mall Street', '2021-10-11'),
(028, 'James Bell', '1818 Maple Grove Ln, Downtown City', '2023-10-12'),
(029, 'Emily Ward', '1919 Birchwood Dr, Island City', '2021-10-13'),
(030, 'Michael Sanders', '2020 Redwood Ct, Festival City', '2023-10-14'),
(031, 'Abigail Barnes', '2121 Cedar Ridge Rd, Mall City', '2021-10-15');

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(039, 'Samuel Brooks', '2323 Willow St, City Festival', '2023-10-16'),
(040, 'Ella Howard', '2424 River Rd, City North', '2020-10-17'),
(041, 'Henry Parker', '2525 Sunset Dr, City Street', '2023-10-18'),
(042, 'Scarlett Bailey', '2626 Hillcrest Ave, City Town', '2023-10-19'),
(043, 'Jack Foster', '2727 Maple St, City L1', '2021-10-20'),
(044, 'Victoria Hayes', '2828 Cedar St, City Media', '2023-10-21'),
(045, 'Leo Cooper', '2929 Oak St, City N1', '2023-10-22'),
(046, 'Grace Brooks', '3030 Birch St, City Mall', '2021-10-23'),
(047, 'Owen Morris', '3131 Elm St, City South', '2023-10-24'),
(048, 'Lillian Henderson', '3232 Redwood St, City North', '2021-10-25');
Select * From Customer;

-- Insert data into IssueStatus table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(1001,002,'The silent patient','2023-06-01','978-1-5011-8774-7'),
(1002,012,'The Alchemist','2023-03-02','978-0-06-093546-7'),
(1003,015,'The Institute','2022-07-09','978-1-5011-6556-1'),
(1004,020,'A Clash of kings','2023-05-12','978-0-345-39181-0'),
(1005,022,'The Odyssey','2024-04-22','978-0-14-044926-6'),
(1006,007,'The Stand','2023-06-12','978-0-671-02735-7'),
(1007,024,'The Hunger Games','2023-06-25', '978-0-312-42289-9'),
(1008,005,'The Nightingale','2023-06-10','978-1-4767-2726-8'),
(1009,006,'Moby - Dick','2024-08-08','978-0-141-18771-9'),
(1010,003,'Catching Fire','2024-03-22','978-0-312-24213-0'),
(1011,025,'Educated','2023-06-20','978-0-06-231500-7'),
(1012,030,'The Great Gatsby','2023-06-13','978-3-16-148410-0'),
(1013,039,'Nineteen eighty four','2023-08-01','978-0-14-017739-8'),
(1014,041,'The Hobbit','2023-07-11','978-0-618-34624-3');

SELECT * FROM IssueStatus;
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(1015,047,'The Catcher in the Rye','2023-06-02','978-0-7432-7356-5'),
(1016,046,'The Road','2022-07-11','978-0-375-72451-6'),
(1017,045,'Life of Pi','2023-08-04','978-0-15-101026-4'),
(1018,043,'The Book Theif','2023-06-24','978-0-06-085052-4'),
(1019,042,'The Midnight Library','2023-06-15','978-1-5011-8838-6'),
(1020,004,'Anxious People','2023-04-03','978-1-5011-5686-7'),
(1021,009,'The Grape of wrath','2024-05-10','978-0-14-243717-9'),
(1022,010,'An Autobiography','2023-06-30','978-3-216-3212-8'),
(1023,018,'The Goldfinch','2023-06-11','978-0-670-81302-8'),
(1024,019,'Guns,Germs and Steel','2022-02-11','978-0-14-303573-2'),
(1025,016,'The Wright brothers','2023-06-02','978-0-307-95781-3'),
(1026,028,'Sapiens:A Brief History','2022-07-01','978-1-4767-7871-5'),
(1027,027,'The Great Bridge','2023-06-16','978-0-307-59480-5'),
(1028,028,'The Song of Achilles','2023-04-02','978-0-06-268697-7'),
(1029,029,'A Game of Thrones','2023-06-20','978-0-345-39180-3'),
(1030,013,'Frankenstein','2023-06-18','978-0-7432-7357-2');

SELECT * FROM IssueStatus;

-- Insert data into ReturnStatus table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(2000,020,'A Clash of kings','2023-06-13','978-0-345-39181-0'),
(2001,003,'Catching Fire','2024-04-23','978-0-312-24213-0'),
(2002,041,'The Hobbit','2023-08-12','978-0-618-34624-3'),
(2003,012,'The Alchemist','2023-04-03','978-0-06-093546-7'),
(2004,005,'The Nightingale','2023-07-11','978-1-4767-2726-8'),
(2005,030,'The Great Gatsby','2023-07-20','978-3-16-148410-0'),
(2006,046,'The Road','2022--6-12','978-0-375-72451-6'),
(2007,029,'A Game of Thrones','2023-06-20','978-0-345-39180-3'),
(2008,045,'Life of Pi','2023-07-03','978-0-15-101026-4'),
(2009,004,'Anxious people','2024-05-05','978-1-5011-5686-7'),
(2010,016,'The Wright Brothers','2023-07-01','978-0-307-95781-3'),
(2011,007,'The Stand','2023-07-20','978-0-671-02735-7'),
(2012,025,'Educated','2023-07-25','978-0-06-231500-7'),
(2013,010,'An Autobiography','2023-07-03','978-3-216-3212-8'),
(2014,027,'The Great Bridge','2023-07-02','978-0-307-59480-5'),
(2015,013,'Frankenstein','2023-07-19','978-0-7432-7357-2');

SELECT * FROM ReturnStatus;

-- 1.Retrieve book title, category, and rental price of all available books
SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';

-- 2.Retrieve employee names and their respective salaries in descending order of salary
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

-- 3.Retrieve book titles and the corresponding customers who issued them
SELECT B.Book_title, C.Customer_name
FROM IssueStatus I
JOIN Books B ON I.Isbn_book = B.ISBN
JOIN Customer C ON I.Issued_cust = C.Customer_Id;

-- 4.Retrieve the total count of books in each category
SELECT Category, COUNT(*) AS Total_Books FROM Books GROUP BY Category;

-- 5.Retrieve employee names and positions for employees with salaries above Rs. 50,000
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

-- 6.List customers who registered before 2022-01-01 and have not issued any books
SELECT C.Customer_name
FROM Customer C
LEFT JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE C.Reg_date < '2022-01-01'
  AND I.Issued_cust IS NULL;
  
  -- 7.Retrieve branch numbers and the total count of employees in each branch
SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no;


-- 8. Retrieve the names of customers who issued books in June 2023
SELECT Customer_name
FROM Customer
WHERE Customer_Id IN (
    SELECT Issued_cust
    FROM IssueStatus
    WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30'
);

-- 9.Retrieve book titles where the category contains 'history'
SELECT Book_title FROM Books WHERE Category ='history';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no HAVING COUNT(*) >=5;

-- 11 Retrieve names of employees who manage branches and their respective branch addresses
SELECT Emp_name, 
       (SELECT Branch_address 
        FROM Branch 
        WHERE Branch_no = Employee.Branch_no) AS Branch_address
FROM Employee
WHERE Position = 'Manager';

-- 12. Display the names of customers who have issued books with a rental price higher than Rs. 25. 
SELECT Customer_name
FROM Customer
WHERE Customer_Id IN (
    SELECT I.Issued_cust
    FROM IssueStatus I
    WHERE I.Isbn_book IN (
        SELECT B.ISBN
        FROM Books B
        WHERE B.Rental_Price > 25
    )
);