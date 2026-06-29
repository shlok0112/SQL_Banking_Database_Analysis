Use BankingDB;

SELECT application_id,
customer_name, risk_score,
RANK() OVER (ORDER BY risk_score DESC) AS risk_rank
FROM loan_applications;

CREATE TABLE loan_applications (application_id INT PRIMARY KEY,
customer_name VARCHAR(100),
loan_amount DECIMAL(10,2),
risk_score INT
);

INSERT INTO loan_applications (application_id, customer_name, risk_score)
VALUES
(101, 'Amit Sharma', 95),
(102, 'Priya Patel', 88),
(103, 'Rahul Verma', 88),
(104, 'Sneha Joshi', 82),
(105, 'Karan Mehta', 75);

SELECT 
    application_id,
    customer_name,
    loan_type,
    risk_score,
    ROW_NUMBER() OVER (
        PARTITION BY loan_type
        ORDER BY risk_score DESC
    ) AS row_num
FROM loan_applications;

SELECT application_id,
       customer_name,
       loan_amount,
       risk_score,
       SUM(loan_amount) OVER (
           ORDER BY risk_score DESC
       ) AS running_total
FROM loan_applications;


SELECT application_id,
       customer_name,
       risk_score,
       LAG(risk_score) OVER 
       (ORDER BY risk_score DESC) 
       AS previous_risk_score
FROM loan_applications;


SELECT application_id,
       customer_name,
       risk_score,
       LEAD(risk_score) OVER 
       (ORDER BY risk_score DESC) 
       AS next_risk_score
FROM loan_applications;

