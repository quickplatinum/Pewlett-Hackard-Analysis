-- Deleiverable 1
-- Create a new table called retirement_titles
SELECT 
e.emp_no, e.first_name, e.last_name, 
t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, title;

--Show Result of retirement titles
SELECT * FROM retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) 
emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, title DESC;

--Show Result of unique titles
SELECT * FROM unique_titles

-- Addditon of all retiring employees using Count fucntion into new table 
SELECT COUNT(unique_titles), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count desc;

--Show Result of retiring titles
SELECT * FROM retiring_titles


