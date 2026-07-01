Use BankingDB;

CREATE VIEW Suspicious_Transactions
AS Select
TransactionID,CustomerID, TransactionType, Amount
From Transactions_2
Where Amount > 25000;

select * from Suspicious_Transactions;

INSERT INTO Transactions_2
(TransactionID, AccountID, CustomerID, TransactionDate, Amount, TransactionType)
VALUES
(313, 210, 105, '2024-11-01',  50000.00, 'Deposit'),
(314, 211, 101, '2025-12-06',  75000.00, 'Deposit');


Create Or Replace View Suspicious_Transaction As
select t.TransactionID,
concat(c.FirstName, ' ', c.lastName) As CustomerName, c.BranchName, t.TransactionType, t.amount
From Transactions_2 t
INNER JOIN Customers2 c
on t.CustomerID = c.CustomerID
Where t.Amount >25000;

Select * from Suspicious_Transaction;

Select TransactionID, CustomerName, BranchName, TransactionType, Amount
From Suspicious_Transaction
ORDER BY Amount DESC;