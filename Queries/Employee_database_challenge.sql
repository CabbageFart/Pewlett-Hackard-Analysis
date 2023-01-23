SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees AS e
LEFT JOIN titles as t
ON (e.emp_no = t.emp_no)
Where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date IN ('9999-01-01')
ORDER BY emp_no, to_date DESC
;

SELECT
	COUNT (title),
	title
INTO retiring_titles
FROM unique_titles
Group by title
ORDER BY count DESC;

--Have to filter by titles for to_date in order to get current titles. For some reason example in lesson
--doesnt do this. As you can see index 3 and 8
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
--INTO mentorship_eligibilty
FROM employees AS e
LEFT JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
LEFT JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (t.to_date = '9999-01-01') 
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
;

select * from departments
select * from salaries


SELECT DISTINCT ON (emp_no)emp_no,
	first_name,
	last_name,
	title
From mentorship_eligibilty
WHERE title IN ('Senior Engineer');

SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.gender,
	e.hire_date,
	s.salary,
	t.title
INTO gender_salaries
FROM employees AS e
LEFT JOIN salaries AS s
ON (e.emp_no = s.emp_no)
LEFT JOIN titles AS t
ON (e.emp_no = t.emp_no)
--WHERE title IN ('Senior Engineer');
	
select * from gender_salaries