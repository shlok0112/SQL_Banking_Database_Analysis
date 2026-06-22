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



