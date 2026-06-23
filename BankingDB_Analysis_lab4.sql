# DQL demonstration

use BankingDB;

select * from Customers;

select * from Accounts;

select * from Branches;

select * from Accountbranches;

select * from Loans;

select * from Transactions;

Create database SQL_Practice;

USE SQL_Practice;

Select * from Accounts
where AccountType = 'Savings';

Select * from Accounts
where Balance > 25000;

Select * from Transactions
where Amount >= 5000 AND Amount <= 20000;

select * from customers
where CustomerID IN (101,102,103);

Select * from Customers
where FirstName LIKE 'R%';

Select * from Customers
ORDER BY FirstName ASC;

Select * from Accounts
ORDER BY Balance DESC;

Select DISTINCT AccountType 
from Accounts;

Select * from Accounts
ORDER BY Balance DESC
LIMIT 3;

Select * from Transactions
LIMIT 5 OFFSET 2;

USE BankingDB;

INSERT INTO Customers
(CustomerID, Firstname, Lastname, Email, AccountcreationDate, DateofBirth)
VALUES
(108, 'Shlok', 'Khandagale', 'shlok.khandagale@gmail.com', '2025-12-01', '2006-09-01');

Select * from Customers
Where Phone IS NULL;

Select * from Customers
Where Email IS NOT NULL;

Select AccountID, Balance,
CASE
When Balance >= 50000 then 'Premium Account'
When Balance >= 20000 then 'Standard Account'
ELSE 'Basic Account'
END AS AccountCategory
FROM Accounts;

Select AccountID,
Balance,
RANK() OVER (ORDER BY Balance) AS BalanceRank
FROM Accounts;

SELECT TransactionID,
Amount,
SUM(Amount) OVER (ORDER BY TransactionDate) AS RunningTotal
FROM Transactions;

SELECT TransactionID,
Amount,
AVG(Amount) OVER () AS AverageTransaction
FROM Transactions;