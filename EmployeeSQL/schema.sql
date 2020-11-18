CREATE TABLE Title (
	ID Char(5) Primary Key,
	Title_Name Varchar (30)
);

-- Table 2
CREATE TABLE Employee (
	ID Char(6) Primary Key,
	Title_ID Char(5),
	Birth_Date Date,
	First_Name Varchar(30),
	Last_Name Varchar(30),
	Gender Char(1),
	Hire_Date Date,
	FOREIGN KEY (Title_ID) REFERENCES Title (ID)
);

-- Table 3
CREATE TABLE Department (
	ID Char(4) Primary Key,
	Dept_Name Varchar(30)
);

-- Table 4
-- Appears to include history (multiple occurances of emp ID), but
-- no date provided in input.  Perhaps an emp can align to more than 
-- one dept at a time
CREATE TABLE EmpDept (
	Emp_ID Char(6),
	Dept_ID Char(4),
	FOREIGN KEY (Emp_ID)REFERENCES Employee (ID),
	FOREIGN KEY (Dept_ID) REFERENCES Department (ID),
	PRIMARY KEY (Emp_ID, Dept_ID)
);
	
-- Table 5
-- Also appears to include history but no date provided in input    
CREATE TABLE DeptMgr (
	Dept_ID Char(4),
	Emp_ID Char(6),
	FOREIGN KEY (Dept_ID) REFERENCES Department (ID),
	FOREIGN KEY (Emp_ID)REFERENCES Employee (ID),
	PRIMARY KEY (Dept_ID, Emp_ID)
);

-- Table 6
-- No duplicated Emp IDs in input.  Assuming this is last known
-- salary. 
CREATE TABLE EmpSalary (
	Emp_ID Char(6) Primary Key,
	Salary Int,
	FOREIGN KEY (Emp_ID)REFERENCES Employee (ID)
);