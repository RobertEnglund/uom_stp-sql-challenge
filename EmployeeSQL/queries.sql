
-- List the following details of each employee: 
-- employee number, last name, first name, sex, and salary
SELECT emp.ID, emp.Last_Name, emp.First_Name, emp.Gender, esal.Salary
FROM employee AS emp
INNER JOIN empsalary AS esal 
ON emp.ID = esal.EMP_ID;

-- List first name, last name, and hire date for employees who were hired in 1986
SELECT emp.First_Name, emp.Last_Name, emp.Hire_Date
FROM Employee AS emp
WHERE EXTRACT(YEAR FROM emp.Hire_Date) = 1986;

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name
SELECT dept.ID, dept.Dept_Name, emp.ID, emp.Last_Name, emp.First_Name
FROM Department AS dept
	INNER JOIN DeptMgr AS dm
	ON dept.ID = dm.Dept_ID
		INNER JOIN Employee as emp
		ON dm.Emp_ID = emp.ID;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name
SELECT emp.ID, emp.Last_Name, emp.First_Name, dept.Dept_Name
FROM Employee AS emp
	INNER JOIN EmpDept AS ed
	ON emp.ID = ed.Emp_ID
		INNER JOIN Department as dept
		ON ed.Dept_ID = dept.ID;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT emp.First_Name, emp.Last_Name,  emp.Gender
FROM employee AS emp
WHERE emp.First_Name = 'Hercules'
AND emp.Last_Name LIKE 'B%';

-- List all employees in the Sales department, including their: 
-- employee number, last name, first name, and department name
SELECT emp.ID, emp.Last_Name, emp.First_Name, dept.Dept_Name
FROM Employee AS emp
	INNER JOIN EmpDept AS ed
	ON emp.ID = ed.Emp_ID
		INNER JOIN Department as dept
		ON ed.Dept_ID = dept.ID
WHERE dept.Dept_Name = 'Sales';

-- List all employees in the Sales and Development departments, including their:
-- employee number, last name, first name, and department name
SELECT emp.ID, emp.Last_Name, emp.First_Name, dept.Dept_Name
FROM Employee AS emp
	INNER JOIN EmpDept AS ed
	ON emp.ID = ed.Emp_ID
		INNER JOIN Department as dept
		ON ed.Dept_ID = dept.ID
WHERE dept.Dept_Name = 'Sales'
OR dept.Dept_Name = 'Development';

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name
SELECT emp.Last_Name, COUNT(emp.Last_Name) AS "Employee Count"
FROM Employee AS emp
GROUP BY emp.Last_Name
ORDER BY "Employee Count" DESC, emp.Last_Name;


