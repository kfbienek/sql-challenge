--List the employee number, last name, first name, sex, and salary of each employee.

CREATE VIEW emp_sal AS
	SELECT s.salaries, e.emp_no, e.last_name, e.first_name, e.sex
	FROM salaries AS s
	JOIN employees AS e ON e.emp_no = s.emp_no;
	
SELECT * FROM emp_sal;

--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department along with their department number, department name,
--employee number, last name, and first name.


SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name 
FROM employees AS e
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
JOIN departments AS d ON DM.dept_no = d.dept_no;

--List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name.
CREATE VIEW v_dept_emp AS
	SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
	FROM departments AS d
	JOIN dept_emp AS de ON d.dept_no = de.dept_no
	JOIN employees AS e ON de.emp_no = e.emp_no;
	
SELECT * FROM v_dept_emp;

--List first name, last name, and sex of each employee whose first name is Hercules and 
--whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT emp_no, last_name, first_name
FROM v_dept_emp
WHERE dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.


SELECT emp_no, last_name, first_name, dept_name
FROM v_dept_emp
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name;


