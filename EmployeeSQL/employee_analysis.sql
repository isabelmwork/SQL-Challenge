---1.List the employee number, last name, first name, sex, and salary of each employee

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
JOIN salaries as s 
	ON e.emp_no = s.emp_no;

---2.List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE DATE_PART('YEAR', hire_date) = 1986;

---https://www.commandprompt.com/education/how-to-extract-year-from-date-in-postgresql/#:~:text=Conclusion-,To%20extract%20a%20year%20from%20a%20date%2C%20the%20built%2Din,date%20fields%20will%20be%20extracted.

---3.List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT d_m.dept_no, d.dept_name, d_m.emp_no, e.last_name, e.first_name
FROM dept_manager as d_m
JOIN departments as d 
	ON d_m.dept_no = d.dept_no
JOIN employees as e
	ON d_m.emp_no = e.emp_no;

---4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT d_e.dept_no, d_e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as d_e
JOIN employees as e
	ON d_e.emp_no = e.emp_no
JOIN departments as d
	ON d_e.dept_no = d.dept_no;
	
---5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE (first_name = 'Hercules') AND (last_name LIKE 'B%');

---https://stackoverflow.com/questions/10156965/select-all-where-first-letter-starts-with-b

---6.List each employee in the Sales department, including their employee number, last name, and first name
SELECT d.dept_name, d_e.emp_no, e.last_name, e.first_name
FROM employees as e
JOIN dept_emp as d_e
	ON e.emp_no = d_e.emp_no
JOIN departments as d
	ON d_e.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

---7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT d.dept_name, d_e.emp_no, e.last_name, e.first_name
FROM employees as e
JOIN dept_emp as d_e
	ON e.emp_no = d_e.emp_no
JOIN departments as d
	ON d_e.dept_no = d.dept_no
WHERE (d.dept_name = 'Sales') OR (d.dept_name = 'Development');

---8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY "frequency" DESC;