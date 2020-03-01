-- CHALLENGE 7
-- Current Retire eligable employee data table
SELECT e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
s.salary
INTO c_retire_emp_info
FROM employees as e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (de.to_date = '9999-01-01');

SELECT * FROM c_retire_emp_info;

--remove previous/extra titles
SELECT emp_no,first_name, last_name, title, from_date, salary
INTO c_retire_current_title
FROM
  (SELECT emp_no, first_name, last_name, title, from_date, salary,
     ROW_NUMBER() OVER 
(PARTITION BY (emp_no) ORDER BY from_date DESC) rn
   FROM c_retire_emp_info) tmp 
   WHERE rn = 1;

SELECT * FROM c_retire_current_title;

--count of titles
SELECT title, COUNT(emp_no) 
INTO c_retire_title_count
FROM c_retire_current_title 
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

SELECT * FROM c_retire_title_count;


--Employees Ready for Mentors
SELECT e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
de.to_date
INTO c_mentor_emp_info
FROM employees as e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	 AND (de.to_date = '9999-01-01');

--remove previous/extra titles for Mentees
SELECT emp_no,first_name, last_name, title, from_date, to_date
INTO c_mentee_current_title
FROM
  (SELECT emp_no, first_name, last_name, title, from_date, to_date,
     ROW_NUMBER() OVER 
(PARTITION BY (emp_no) ORDER BY from_date DESC) rn
   FROM c_mentor_emp_info) tmp 
   WHERE rn = 1;



	

	