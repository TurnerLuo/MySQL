-- Turner Luo
-- Lab 1

USE ap;

-- Part I - Exercise1 
SELECT vendor_name, vendor_contact_last_name, vendor_contact_first_name
FROM vendors
ORDER BY vendor_contact_last_name, vendor_contact_first_name;

-- Part I - Exercise 2 
SELECT CONCAT(vendor_contact_last_name, ', ', vendor_contact_first_name) AS full_name
FROM vendors
WHERE vendor_contact_last_name < 'D' OR vendor_contact_last_name LIKE 'E%'
ORDER BY vendor_contact_last_name, vendor_contact_first_name;

-- Part I - Exercise 3 
SELECT invoice_due_date AS "Due Date", 
       invoice_total AS "Invoice Total", 
       invoice_total / 10 AS "10%",
       invoice_total * 1.1 AS "Plus 10%"
FROM invoices
WHERE invoice_total >= 500 AND invoice_total <= 1000
ORDER BY invoice_due_date DESC;

-- Part I - Exercise 4
SELECT invoice_number,
       invoice_total,
       payment_total + credit_total AS payment_credit_total,
       invoice_total - payment_total - credit_total AS balance_due
FROM invoices
WHERE invoice_total - payment_total - credit_total > 50
ORDER BY balance_due DESC
LIMIT 5;

-- Part I - Exercise 5
SELECT invoice_number, 
       invoice_date, 
       invoice_total - payment_total - credit_total AS balance_due,
       payment_date
FROM invoices
WHERE payment_date IS NULL;

-- Part I - Exercise 6
SELECT DATE_FORMAT(CURRENT_DATE, '%m-%d-%Y') AS "current_date";

-- Part I - Exercise 7
SELECT 50000 AS starting_principle,
       50000 * .065 AS interest,
       (50000) + (50000 * .065) AS principle_plus_interest;

-- Part 2 - Exercise 1
USE farmers_market;

SELECT market_date, 
       customer_id, 
	   vendor_id,
       product_id,
       quantity, 
       quantity * cost_to_customer_per_qty AS price 
FROM farmers_market.customer_purchases
WHERE customer_id = 4
ORDER BY market_date, vendor_id, product_id
LIMIT 5;

-- Part 2 - Exercise 2
SELECT market_date, 
       customer_id, 
       vendor_id,
       product_id,
       quantity, 
	   quantity * cost_to_customer_per_qty AS price 
FROM customer_purchases
WHERE customer_id = 4
ORDER BY market_date, vendor_id, product_id
LIMIT 5;

-- Part 2 - Exercise 3
SELECT *
FROM customer_purchases 
WHERE vendor_id>= 8 
 AND vendor_id <= 10;
   
SELECT *
FROM customer_purchases 
WHERE vendor_id BETWEEN 8 AND 10;

-- PART 2 - Exercise 4
SELECT market_date,
	   customer_id,
       vendor_id,
       quantity * cost_to_customer_per_qty AS price
FROM customer_purchases
WHERE market_date NOT IN (
SELECT market_date
FROM market_date_info
WHERE market_rain_flag = 1 );

SELECT 
 market_date, 
 customer_id, 
 vendor_id, 
 quantity * cost_to_customer_per_qty AS price
FROM farmers_market.customer_purchases

WHERE market_date IN
 (
   
 SELECT market_date
 FROM farmers_market.market_date_info
 WHERE market_rain_flag = 0
   
 );

-- Part 3 - Exercise 1
USE hr;
SELECT DISTINCT department_id
FROM employees;

-- Part 3 - Exercise 2
SELECT *
FROM employees
ORDER BY first_name DESC;

-- Part 3 - Exercise 3
SELECT first_name,
       last_name,
       salary,
       salary * 0.15 AS PF
FROM employees;

-- Part 3 - Exercise 4
SELECT employee_id,
       first_name,
       last_name,
       salary
FROM employees
ORDER BY salary;

-- Part 3 - Exercise 5
SELECT 171 * 214 + 625;

-- Part 3 - Exercise 6
SELECT CONCAT (first_name, ' ', last_name) 'Employee Name'
FROM employees;

-- Part 3 - Exercise 7
SELECT employee_id,
       first_name
FROM employees
LIMIT 10;

-- Part 3 - Exercise 8
SELECT first_name,
       last_name,
       round(salary/12,2) AS 'Monthly Salary'
FROM employees;

-- Part 3 - Exercise 9 ?!
SELECT DATE_FORMAT (NOW(), '%W %D %Y');

SELECT DATE_FORMAT(NOW(), '%W %M %Y');

-- Part 3 - Exercise 10
SELECT RIGHT(phone_number, 4) as 'Ph.No.' 
FROM employees;

-- 11
DESCRIBE employees;

-- 12
SELECT first_name,
       last_name,
       salary
FROM employees
WHERE salary NOT BETWEEN 10000 AND 15000;

-- 13
SELECT first_name,
       last_name,
       department_id
FROM employees
WHERE department_id IN (30,100)
ORDER BY department_id ASC;

-- 14
SELECT first_name,
       last_name,
       hire_date
FROM employees
WHERE YEAR(hire_date) LIKE '1987%';

-- 15
SELECT first_name
FROM employees
WHERE first_name LIKE '%b%'
AND first_name LIKE '%c%';

-- 16
SELECT last_name,
       job_id,
       salary
FROM employees
WHERE job_id IN('IT_PROG','SH_CLERK')
AND salary NOT IN(4500, 10000, 15000);

-- 17
SELECT last_name
FROM employees
WHERE last_name LIKE '______';

-- 18
SELECT last_name 
FROM employees 
WHERE last_name LIKE '__e%';

-- 19
SELECT * 
FROM employees 
WHERE last_name IN('JONES', 'BLAKE', 'SCOTT', 'KING', 'FORD');








