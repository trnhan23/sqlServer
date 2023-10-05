CREATE DATABASE QLTV;
GO

USE QLTV;
GO
ALTER TABLE Dept ADD dname char(30) NULL
insert into Dept values (3,200,1,'Toy')
DELETE FROM Dept WHERE dname = 'Toy';
CREATE TABLE dbo.Emp (
    eid INT PRIMARY KEY,
    ename CHAR(30) NULL,
    age INT NULL,
    salary REAL NULL
);
GO
insert into Emp values (2,'John Doe',32,15.000)

go

alter trigger AA on Emp 
for delete as declare @old int
select @old=ol.eid from deleted ol
if (@old >2) 
begin
print ('Notify Customer Relations');
rollback;
end

go

delete from Emp where Emp.eid=2

 Create table Q(A int , B int , C int, unique(C))



create table dbo.A(
	age int primary key,
	salary real
);
create table dbo.B(
	age int primary key,
	salary real
);


Create trigger BB on A
instead of insert as
Declare @newA int, @newB real
Select @newA = n.age, @newB = n.salary From Inserted n
Insert into B values(@newA, @newB)


Insert into A values (1,15)

UPDATE Emp SET salary = salary + salary *0.1
CREATE TABLE dbo.Dept(
	did INT PRIMARY KEY,
	budget REAL NULL,
	managerid INT REFERENCES Emp(eid)
);
ALTER TABLE Dept ADD CONSTRAINT CHK_ManagerNotNull CHECK (managerid IS NOT NULL)
go 
insert into Dept values (2, 200, NULL)
GO
CREATE TABLE dbo.Works (
	pct_time INT NULL,
	eid INT REFERENCES Emp(eid),
	did INT REFERENCES Dept(did), 
	PRIMARY KEY (eid,did)
);
GO 
DECLARE @emp_over_salaray_manager TABLE (
	eid INT,
	managerid INT, 
	did INT
)
INSERT INTO @emp_over_salaray_manager
SELECT E.eid, M.managerid, W.did
FROM Emp E JOIN Works W ON E.eid = W.eid
JOIN (SELECT DD.managerid, DD.did, EE.salary manager_salary
FROM Dept DD 
JOIN Emp EE ON DD.managerid = EE.eid) M ON W.did = M.did
WHERE E.salary > M.manager_salary

UPDATE Dept 
SET managerid = null
WHERE did IN (
SELECT did 
FROM @emp_over_salaray_manager
WHERE managerid = eid
)

DELETE 
FROM Works
WHERE eid, did IN (
SELECT eid, did 
FROM @emp_over_salaray_manager
)

DELETE 
FROM Emp
WHERE eid IN (
SELECT eid
FROM @emp_over_salaray_manager
)
 

 Trong nhan

insert 


