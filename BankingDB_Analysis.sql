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

INSERT INTO Customers
(CustomerID, Firstname, Lastname, Email, Phone, AccountcreationDate, DateofBirth)
VALUES
(109, 'Rehman', 'Dakait', 'rehman.dakait@gmail.com', '9876543211', '2025-04-16', '1999-05-22'),
(110, 'Paresh', 'Rawal', 'paresh.rawal@gmail.com', '9876543212', '2025-04-17', '1997-08-14'),
(111, 'Jethalal', 'Gada', 'jethalal.gada@gmail.com', '9876543213', '2025-04-18', '2000-01-09'),
(112, 'Popatlal', 'Pawar', 'atharva.pawar@gmail.com', '9876543214', '2025-04-19', '1996-11-25'),
(113, 'Neha', 'Joshi', 'neha.joshi@gmail.com', '9876543215', '2025-04-20', '1998-06-17'),
(114, 'Vikram', 'Singh', 'vikram.singh@gmail.com', '9876543216', '2025-04-21', '1995-09-30'),
(115, 'Pooja', 'Desai', 'pooja.desai@gmail.com', '9876543217', '2025-04-22', '1999-12-12'),
(116, 'charminder', 'Pawar', 'charminder.pawar@gmail.com', '9876543218', '2025-04-23', '1997-04-08'),
(117, 'Anjali', 'Nair', 'anjali.nair@gmail.com', '9876543219', '2025-04-24', '2001-02-19'),
(118, 'Suresh', 'Reddy', 'suresh.reddy@gmail.com', '9876543220', '2025-04-25', '1994-07-27'),
(119, 'Meera', 'Iyer', 'meera.iyer@gmail.com', '9876543221', '2025-04-26', '1998-10-05'),
(120, 'Arjun', 'Malhotra', 'arjun.malhotra@gmail.com', '9876543222', '2025-04-27', '1996-05-15'),
(121, 'Kavita', 'Chopra', 'kavita.chopra@gmail.com', '9876543223', '2025-04-28', '1999-08-22'),
(122, 'Nitin', 'Yadav', 'nitin.yadav@gmail.com', '9876543224', '2025-04-29', '1997-12-03'),
(123, 'Shweta', 'Mishra', 'shweta.mishra@gmail.com', '9876543225', '2025-04-30', '2000-06-29'),
(124, 'Deepak', 'Pandey', 'deepak.pandey@gmail.com', '9876543226', '2025-05-01', '1995-01-11'),
(125, 'Ritu', 'Agarwal', 'ritu.agarwal@gmail.com', '9876543227', '2025-05-02', '1998-09-18'),
(126, 'Manoj', 'Thakur', 'manoj.thakur@gmail.com', '9876543228', '2025-05-03', '1996-03-07'),
(127, 'Asha', 'Bhat', 'asha.bhat@gmail.com', '9876543229', '2025-05-04', '2001-11-23');


INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(208, 108, 'Savings', 25000),
(209, 109, 'Current', 45000),
(210, 110, 'Savings', 30000),
(211, 111, 'Current', 45000),
(212, 112, 'Savings', 20000),
(213, 113, 'Current', 50000),
(214, 114, 'Savings', 35000),
(215, 115, 'Current', 60000),
(216, 116, 'Savings', 20000),
(217, 117, 'Current', 42000),
(218, 118, 'Savings', 31000),
(219, 119, 'Current', 55000),
(220, 120, 'Savings', 27000),
(221, 121, 'Current', 48000),
(222, 122, 'Savings', 33000),
(223, 123, 'Current', 52000),
(224, 124, 'Savings', 29000),
(225, 125, 'Current', 46000),
(226, 126, 'Savings', 34000),
(227, 127, 'Current', 58000);


INSERT INTO Transactions
(TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES
(306, 206, '2025-06-06', 5000, 'Credit'),
(307, 207, '2025-06-07', 2000, 'Debit'),
(308, 208, '2025-06-08', 7500, 'Credit'),
(309, 209, '2025-06-09', 3000, 'Debit'),
(310, 210, '2025-06-10', 4500, 'Credit'),
(311, 211, '2025-06-11', 2500, 'Debit'),
(312, 212, '2025-06-12', 10000, 'Credit'),
(313, 213, '2025-06-13', 5000, 'Debit'),
(314, 214, '2025-06-14', 3500, 'Credit'),
(315, 215, '2025-06-15', 1500, 'Debit'),
(316, 216, '2025-06-16', 8000, 'Credit'),
(317, 217, '2025-06-17', 4000, 'Debit'),
(318, 218, '2025-06-18', 6000, 'Credit'),
(319, 219, '2025-06-19', 2500, 'Debit'),
(320, 220, '2025-06-20', 9000, 'Credit'),
(321, 221, '2025-06-21', 3500, 'Debit'),
(322, 222, '2025-06-22', 7000, 'Credit'),
(323, 223, '2025-06-23', 2000, 'Debit'),
(324, 224, '2025-06-24', 8500, 'Credit'),
(325, 225, '2025-06-25', 4500, 'Debit');



INSERT INTO Branches
(BranchID, BranchName, BranchAddress, BranchPhone)
VALUES
(406, 'Ghatkopar Branch', 'Mumbai Ghatkopar East', '9876666666'),
(407, 'Vikhroli Branch', 'Mumbai Vikhroli West', '9877777777'),
(408, 'Dadar Branch', 'Mumbai Dadar West', '9878888888'),
(409, 'Kurla Branch', 'Mumbai Kurla East', '9879999999'),
(410, 'Chembur Branch', 'Mumbai Chembur East', '9861111111'),
(411, 'Mulund Branch', 'Mumbai Mulund West', '9862222222'),
(412, 'Kalyan Branch', 'Kalyan West', '9863333333'),
(413, 'Dombivli Branch', 'Dombivli East', '9864444444'),
(414, 'Panvel Branch', 'Panvel', '9865555555'),
(415, 'Nashik Branch', 'Nashik College Road', '9866666666'),
(416, 'Nagpur Branch', 'Nagpur Sitabuldi', '9867777777'),
(417, 'Aurangabad Branch', 'Aurangabad CIDCO', '9868888888'),
(418, 'Kolhapur Branch', 'Kolhapur Rajarampuri', '9869999999'),
(419, 'Solapur Branch', 'Solapur Railway Lines', '9851111111'),
(420, 'Sangli Branch', 'Sangli Vishrambag', '9852222222'),
(421, 'Satara Branch', 'Satara Camp Area', '9853333333'),
(422, 'Ratnagiri Branch', 'Ratnagiri Main Road', '9854444444'),
(423, 'Jalgaon Branch', 'Jalgaon Station Road', '9855555555'),
(424, 'Amravati Branch', 'Amravati Camp', '9856666666'),
(425, 'Latur Branch', 'Latur Main Market', '9857777777');

INSERT INTO AccountBranches
(AccountID, BranchID, AssignmentDate)
VALUES
(206, 406, '2025-05-06'),
(207, 407, '2025-05-07'),
(208, 408, '2025-05-08'),
(209, 409, '2025-05-09'),
(210, 410, '2025-05-10'),
(211, 411, '2025-05-11'),
(212, 412, '2025-05-12'),
(213, 413, '2025-05-13'),
(214, 414, '2025-05-14'),
(215, 415, '2025-05-15'),
(216, 416, '2025-05-16'),
(217, 417, '2025-05-17'),
(218, 418, '2025-05-18'),
(219, 419, '2025-05-19'),
(220, 420, '2025-05-20'),
(221, 421, '2025-05-21'),
(222, 422, '2025-05-22'),
(223, 423, '2025-05-23'),
(224, 424, '2025-05-24'),
(225, 425, '2025-05-25');

INSERT INTO Loans
(LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES
(506, 108, 500000, 8.5, '2025-06-01', '2030-06-01'),
(507, 109, 300000, 9.0, '2025-06-02', '2029-06-02'),
(508, 110, 200000, 7.5, '2025-06-03', '2028-06-03'),
(509, 111, 150000, 8.0, '2025-06-04', '2027-06-04'),
(510, 112, 100000, 9.5, '2025-06-05', '2026-06-05'),
(511, 113, 600000, 8.2, '2025-06-06', '2031-06-06'),
(512, 114, 250000, 8.8, '2025-06-07', '2029-06-07'),
(513, 115, 400000, 7.9, '2025-06-08', '2030-06-08'),
(514, 116, 175000, 9.1, '2025-06-09', '2028-06-09'),
(515, 117, 350000, 8.4, '2025-06-10', '2030-06-10'),
(516, 118, 225000, 8.7, '2025-06-11', '2029-06-11'),
(517, 119, 450000, 7.8, '2025-06-12', '2031-06-12'),
(518, 120, 275000, 8.9, '2025-06-13', '2029-06-13'),
(519, 121, 325000, 8.3, '2025-06-14', '2030-06-14'),
(520, 122, 150000, 9.2, '2025-06-15', '2028-06-15'),
(521, 123, 500000, 8.1, '2025-06-16', '2032-06-16'),
(522, 124, 200000, 8.6, '2025-06-17', '2029-06-17'),
(523, 125, 375000, 7.7, '2025-06-18', '2031-06-18'),
(524, 126, 125000, 9.3, '2025-06-19', '2027-06-19'),
(525, 127, 550000, 8.0, '2025-06-20', '2032-06-20');


