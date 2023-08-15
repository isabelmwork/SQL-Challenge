CREATE TABLE titles(
	title_id VARCHAR(5),
	title CHAR(25),
	PRIMARY KEY(title_id)
);

SELECT * FROM titles;

CREATE TABLE employees(
	emp_no INT,
	emp_title_id VARCHAR(5),
	birth_date DATE,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	sex CHAR(1),
	hire_date DATE,
	PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_title_id) REFERENCES titles (title_id)
);

SELECT * FROM employees;

CREATE TABLE salaries(
	emp_no INT,
	salary INT,
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM salaries;

CREATE TABLE departments (
	dept_no VARCHAR(4),
	dept_name VARCHAR(50),
	PRIMARY KEY (dept_no)
);

SELECT * FROM departments;

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR(4),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

SELECT * FROM dept_emp;

CREATE TABLE dept_manager(
	dept_no VARCHAR(4),
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

SELECT * FROM dept_manager;
