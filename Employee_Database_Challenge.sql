SELECT employees.emp_no,
employees.first_name,
employees.last_name,
titles.title,
titles.from_date,
titles.to_date
INTO retiring_employees,
FROM employees
INNER JOIN titles
ON (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT DISTINCT ON (retiring_employees.emp_no), retiring_employees.emp_no,
retiring_employees.first_name, 
retiring_employees.last_name,
titles.title,

INTO unique_titles
FROM retiring_employees
WHERE to_date IS '1999-01-01' 
ORDER BY emp_no ASC, to_date DESC;

SELECT count(title), "count", title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT DISTINCT ON (emp_no) employees.emp_no,
employees.first_name,
employees.last_name,
employees.birth_date,
dept_emp.from_date,
dept_emp.to_date,
title.titles
INTO mentorship_program
FROM employees
JOIN dept_emp
ON (employees.emp_no = titles.emp_no)
WHERE (dept_emp.ro_date = '1999-01-01') AND (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY employees.emp_no;