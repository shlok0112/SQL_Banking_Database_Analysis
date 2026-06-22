CREATE DATABASE BankingDB;
USE BankingDB;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AccountCreationDate DATE
);
SHOW DATABASES;
DESC Customers;
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) );
    
    CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID) );
    
    CREATE TABLE Branches (
	BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches (
    AccountID INT,
    BranchID INT,
    AssignmentDate DATE,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

DESC Customers;
ALTER TABLE Customers
MODIFY Phone VARCHAR(20);
USE BankingDB;
DESC Customers;
ALTER TABLE Customers
MODIFY Phone VARCHAR(20);
DESC Customers;
ALTER TABLE Customers
ADD DateOfBirth DATE;
DESC Customers;
ALTER TABLE Customers
MODIFY Phone VARCHAR(20);
ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);
DESC Accounts;
DROP TABLE AccountBranches;
USE BankingDB;
CREATE TABLE AccountBranches (
    AccountID INT,
    BranchID INT,
    AssignmentDate DATE,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

ALTER TABLE Customers
ADD CONSTRAINT uq_Email UNIQUE (Email);
DESC customers;

INSERT INTO Customers
(CustomerID, Firstname, Lastname, Email, Phone, AccountcreationDate, DateofBirth)
VALUES
(101, 'Rahul', 'Sharma', 'rahul.sharma@gamil.com', '9999999999','2025-04-15', '1998-07-12'),
(102, 'Sneha', 'Kulkarni', 'sneha.kulkarni@gamil.com', '91234567891','2025-06-02', '1995-11-25');


INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201, 101, 'Savings', 25000);

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(202, 102, 'Current', 40000);


INSERT INTO Transactions
(TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES
(301, 201, '2025-06-01', 5000, 'Credit'),
(302, 202, '2025-06-02', 2000, 'Debit');

INSERT INTO Branches
(BranchID, BranchName, BranchAddress, BranchPhone)
VALUES
(401, 'Andheri Branch', 'Mumbai Andheri East', '9871111111'),
(402, 'Borivali Branch', 'Mumbai Borivali East', '9872222222')
(403, 'Thane Branch', 'Thane West', '9873333333'),
(404, 'Pune Branch', 'Pune shivajinagar', '9874444444'),
(405, 'Navi Mumbai Branch', 'Vashi ', '9875555555');

#ACCOUNT BRANCHES
INSERT INTO AccountBranches
(AccountID, BranchID, AssignmentDate)
VALUES
(201, 401, '2025-05-01'),
(202, 402, '2025-05-02');

INSERT INTO Loans
(LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES
(501, 101, 500000, 8.5, '2025-01-01', '2030-01-01'),
(502, 102, 300000, 9.0, '2025-02-01', '2029-02-01'),
(503, 101, 200000, 7.5, '2025-03-01', '2028-03-01'),
(504, 102, 150000, 8.0, '2025-04-01', '2027-04-01'),
(505, 101, 100000, 9.5, '2025-05-01', '2026-05-01');


SELECT * FROM AccountBranches;
Select * From Branches;
select * from Accounts;

#update
UPDATE Customers
SET Phone = '9769441617'
WHERE CustomerID = 102;
Select * from Customers;

UPDATE Customers
SET Phone = '9999999999'
Where CustomerID = 101;
select * from Customers Where CustomerID = 101;

UPDATE Customers
SET Email = 'priya.patil@gmail.com'
Where CustomerID = 102;



DELETE FROM Accounts
where AccountID = 202;

DELETE FROM Customers
where CustomerID = 102;
select * from Transactions;
select * from Accounts;
select * from Customers;
USE BankingDB;

INSERT INTO Customers
(CustomerID, Firstname, Lastname, Email, Phone, AccountcreationDate, DateofBirth)
VALUES
(103, 'Amit', 'Joshi', 'amit.joshi@gmail.com', '9123456780', '2025-06-01', '1995-03-15'),
(104, 'Priya', 'Patil', 'priya.patil@gamil.com', '9988776655','2025-05-03', '2000-09-20'),
(105, 'Rohit', 'Verma', 'rohit.verma@gmail.com', '9345678912', '2025-06-03', '1997-08-10'),
(106, 'Neha', 'Singh', 'neha.singh@gmail.com', '9456789123', '2025-06-04', '2001-02-18'),
(107, 'Karan', 'Mehta', 'karan.mehta@gmail.com', '9567891234', '2025-06-05', '1996-06-30');

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(203, 103, 'Savings', 30000),
(204, 104, 'Current', 45000),
(205, 105, 'Savings', 20000),
(206, 106, 'Current', 50000),
(207, 107, 'Savings', 35000);

INSERT INTO Transactions
(TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES
(303, 202, '2025-06-03', 10000, 'Credit'),
(304, 202, '2025-06-04', 3000, 'Debit'),
(305, 201, '2025-06-05', 1500, 'Debit');


INSERT INTO Branches
(BranchID, BranchName, BranchAddress, BranchPhone)
VALUES
(403, 'Thane Branch', 'Thane West', '9873333333'),
(404, 'Pune Branch', 'Pune shivajinagar', '9874444444'),
(405, 'Navi Mumbai Branch', 'Vashi ', '9875555555');

INSERT INTO AccountBranches
(AccountID, BranchID, AssignmentDate)
VALUES
(203, 403, '2025-05-03'),
(204, 404, '2025-05-04'),
(205, 405, '2025-05-05');

#DELETE
DELETE FROM Transactions
Where TransactionID = 302;

select * from Transactions;

DELETE FROM Transactions
Where AccountID = 202;

DELETE FROM AccountBranches
Where AccountID = 202;

select * from AccountBranches;

DELETE FROM Accounts
Where AccountID = 202;

select * from Accounts;

DELETE FROM Loans
WHERE CustomerID = 102;

DELETE FROM Customers
where CustomerID = 102;

select * from Customers;