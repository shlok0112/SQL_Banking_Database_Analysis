Use BankingDB;

Select SUM(Balance) as Total_Balance From Accounts;

Select SUM(Balance) as Total_Balance From Accounts
where AccountType = "Savings";

Select avg(Balance) as Average_Balance from Accounts;

Select max(Balance) as Highest_Balance from Accounts;

Select min(Balance) as Lowest_Balance from Accounts;

Select count(*) as Total_Customer from Customers;

Select AccountType,Sum(Balance) as Total_Balance from Accounts Group By AccountType;

Select AccountType, max(Balance) as Max_Balance , min(balance)
as Min_Balance from Accounts 
Group By AccountType;

select AccountType  , Balance from Accounts
where Balance >=25000;

Select AccountType , sum(Balance) as Total_Balance  from Accounts 
group by AccountType
having sum(Balance)>25000;




