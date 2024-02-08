/* a script to create the database from scratch */

USE master;
go 

if exists (select * from sys.databases where name = 'DbDe100Days') BEGIN
    ALTER DATABASE DbDe100Days SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DbDe100Days;
    PRINT 'DbDe100Days database dropped';
END

create database DbDe100Days;
GO

/* the table */
Use DbDe100Days;
GO

PRINT 'Creating the EmployeeDemographics table';
DROP table if exists dbo.EmployeeDemographics;
GO
Create table dbo.EmployeeDemographics
(
    EmployeeID int,
    FirstName nvarchar(50),
    LastName nvarchar(50),
    Age int,
    Gender nvarchar(10) 
);
GO

-- insert some data
PRINT 'Inserting data into the EmployeeDemographics table';
insert into dbo.EmployeeDemographics
values
(1, 'John', 'Doe', 12, 'M'),
(2, 'Jane', 'Doe', 13, 'F'),
(3, 'Jim', 'Doe', 14, 'M'),
(4, 'Jill', 'Doe', 15, 'F'),
(5, 'Jack', 'Doe', 16, 'M'),
(6, 'Jen', 'Doe', 17, 'F');



-- create the EmployeeSalary table
PRINT 'Creating the EmployeeSalary table';
drop table if exists dbo.EmployeeSalary;
GO
Create table dbo.EmployeeSalary
(
    EmployeeID int,
    JobTitle nvarchar(50),
    Salary int
);

-- insert some data
PRINT 'Inserting data into the EmployeeSalary table';
insert into dbo.EmployeeSalary
values
(1, 'Manager', 100000),
(2, 'Assistant Manager', 80000),
(3, 'Supervisor', 60000),
(4, 'Associate', 40000),
(5, 'Associate', 40000);
