Use BankingDB;

SELECT
TransactionID,
CustomerID,
TransactionType,
Amount
FROM Transactions_2
WHERE Amount > (SELECT AVG(Amount)
    FROM Transactions_2);

SELECT
    t.TransactionID,
    t.CustomerID,
    (SELECT CONCAT(c.FirstName, ' ', c.LastName)
        FROM Customers2 c
        WHERE c.CustomerID = t.CustomerID) AS CustomerName,
    (SELECT c.BranchName
        FROM Customers2 c
        WHERE c.CustomerID = t.CustomerID) AS BranchName,
    t.TransactionType,
    t.Amount
FROM Transactions_2 t
ORDER BY BranchName, t.CustomerID; 

ALTER TABLE Customers2
ADD COLUMN BranchName VARCHAR(100);

INSERT INTO Customers2
(CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate, DateOfBirth,BranchName)
VALUES
(109, 'Shlok', 'Khandagale','shlok@gmail.com','9769441612', '2025-12-01', '2006-09-01','Ghatkopar'),
(110, 'Atharva', 'Kharade',   'atharva.kharade@gmail.com','1212121212', '2025-02-20', '2004-02-22','Kolad-Roha-raigad');


select * from customers2;

INSERT INTO Transactions_2
(TransactionID, AccountID, CustomerID, TransactionDate, Amount, TransactionType)
VALUES
(311, 209, 109, '2025-10-01',  5000.00, 'Deposit'),
(312, 210, 110, '2024-05-02',  2000.00, 'Withdrawal');

UPDATE Transactions_2
SET
    AccountID = 201,
    CustomerID = 101
WHERE TransactionID = 311;

UPDATE Transactions_2
SET
    AccountID = 202,
    CustomerID = 102
WHERE TransactionID = 312;

UPDATE Transactions_2
SET
    AccountID = 209,
    CustomerID = 109
WHERE TransactionID = 311;

UPDATE Transactions_2
SET
    AccountID = 210,
    CustomerID = 110
WHERE TransactionID = 312;
