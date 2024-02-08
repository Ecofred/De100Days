-- gonna use dbde100days database

USE DbDe100Days;
GO

select top 10 * from dbo.EmployeeDemographics;
select top 10 * from dbo.EmployeeSalary;


select ed.Age, es.Salary from dbo.EmployeeDemographics as ed 
JOIN dbo.EmployeeSalary as es
ON ed.EmployeeID = es.EmployeeID;

select ed.Age, es.Salary from dbo.EmployeeDemographics as ed 
FULL JOIN dbo.EmployeeSalary as es
ON ed.EmployeeID = es.EmployeeID;

