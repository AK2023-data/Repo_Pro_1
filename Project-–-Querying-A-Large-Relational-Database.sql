--0987654WQ	- QWERTYUIOP[]\--PROJECT - 1

--a. Get all the details from the person table including email ID, phone number and phone number type.

--1. all details of person

select * from Person.Person ;
 
--2. email id 

select EmailAddress from Person.EmailAddress;

-- 3. phone number
 
select PhoneNumber from Person.PersonPhone

--4. Phone no type

select PhoneNumberTypeID from Person.PhoneNumberType

select p.*, e.EmailAddress, ph.PhoneNumber, pnt.PhoneNumberTypeID 
from person.person p join Person.EmailAddress e 
ON p.BusinessEntityID = e.BusinessEntityID
join person.PersonPhone ph 
on e.BusinessEntityID = ph.BusinessEntityID
join person.PhoneNumberType pnt
ON ph.PhoneNumberTypeID = pnt.PhoneNumberTypeID;

-------------------------------------------------------------------------------------------

--b. Get the details of the sales header order made in May 2011

select * from Sales.SalesOrderHeader where DATEPART(mm, OrderDate) = 5 and DATEPART(yy, OrderDate) = 2011
--or
select * from Sales.SalesOrderHeader where MONTH(OrderDate) = 5 and YEAR(OrderDate) = 2011
--or
select * from Sales.SalesOrderHeader where DATENAME(MONTH, OrderDate) = 'May' and DATEPART(yy, OrderDate) = 2011

-------------------------------------------------------------------------------------------

--c. Get the details of the sales details order made in the month of May 2011.

select * from Sales.SalesOrderDetail sod join Sales.SalesOrderHeader soh
ON sod.SalesOrderID = soh.SalesOrderID
where DATEPART(mm, OrderDate) = 5 and DATEPART(yy, OrderDate) = 2011

-------------------------------------------------------------------------------------------

--d. Get the total sales made in May 2011

select sum(TotalDue) from Sales.SalesOrderHeader SOH where MONTH(OrderDate) = 5 and YEAR(OrderDate) = 2011

--ANS: 567020.9498

-------------------------------------------------------------------------------------------

--e. Get the total sales made in the year 2011 by month order by increasing sales

select sum(TotalDue) Sales, MONTH(OrderDate) Month_name from Sales.SalesOrderHeader 
Where YEAR(OrderDate) = 2011
group by OrderDate 
order by sales;

-------------------------------------------------------------------------------------------

--f. Get the total sales made to the customer with FirstName='Gustavo' and LastName ='Achong'

select  sum(SOH.TotalDue), p.FirstName, p.LastName 
from Person.Person p join Sales.Customer c 
ON p.BusinessEntityID = c.PersonID
join Sales.SalesOrderHeader SOH 
ON c.CustomerID = SOH.CustomerID
join sales.SalesOrderDetail SOD
ON SOH.SalesOrderID = SOD.SalesOrderID
where FirstName = 'Gustavo' and LastName = 'Achong'
group by p.FirstName, p.LastName;

-------------------------------------------------------------------------------------------