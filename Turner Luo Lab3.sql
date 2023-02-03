-- Turner Luo Lab 3
-- Chapter 6
use ap;
-- Ex1
select vendor_id, 
	   sum(invoice_total) as invoice_total_sum
from invoices
group by vendor_id;

-- Ex2
select vendor_name,
       sum(payment_total) as payment_total_sum
from vendors v join invoices i
on v.vendor_id = i.vendor_id
group by vendor_name
order by payment_total_sum desc;

-- Ex3
select vendor_name,
       count(*) as invoice_count,
       sum(invoice_total) as invoice_total_sum
from vendors v join invoices i
on v.vendor_id = i.vendor_id
group by vendor_name
order by invoice_count desc;

-- Ex4
select account_description,
       count(*) as line_item_count,
       sum(line_item_amount) as line_item_amount_sum
from general_ledger_accounts gl join invoice_line_items li
on gl.account_number = li.account_number
group by account_description
having line_item_count > 1
order by line_item_amount_sum desc;

-- Ex5
select account_description, 
       count(*) as line_item_count,
       sum(line_item_amount) as line_item_amount_sum
from general_ledger_accounts gl join invoice_line_items li 
on gl.account_number = li.account_number
join invoices i 
on li.invoice_id = i.invoice_id
where invoice_date between '2018-04-01' and '2018-06-30'
group by account_description
having line_item_count > 1
order by line_item_amount_sum desc; 

-- Ex6
select account_number,
       sum(line_item_amount) as line_item_sum
from invoice_line_items
group by account_number with rollup;

-- Ex7
select vendor_name,
       count(distinct li.account_number) as number_of_gl_accounts
from vendors v join invoices i 
on v.vendor_id = i.vendor_id
join invoice_line_items li
on i.invoice_id = li.invoice_id
group by vendor_name
having number_of_gl_accounts > 1
order by vendor_name;

-- Chapter 7
-- Ex1
select vendor_name
from vendors
where vendor_id in 
(select distinct vendor_id from invoices)
order by vendor_name;

-- Ex2
SELECT invoice_number, invoice_total
FROM invoices
WHERE payment_total >
     (SELECT AVG(payment_total)
      FROM invoices
      WHERE payment_total > 0)
ORDER BY invoice_total DESC;

-- Ex3
SELECT account_number, account_description
FROM general_ledger_accounts gl
WHERE NOT EXISTS
    (SELECT *
     FROM invoice_line_items
     WHERE account_number = gl.account_number)
ORDER BY account_number;

-- Ex4
SELECT vendor_name, i.invoice_id, invoice_sequence, line_item_amount
FROM vendors v JOIN invoices i
  ON v.vendor_id = i.vendor_id
JOIN invoice_line_items li
  ON i.invoice_id = li.invoice_id
WHERE i.invoice_id IN
      (SELECT DISTINCT invoice_id
       FROM invoice_line_items               
       WHERE invoice_sequence > 1)
ORDER BY vendor_name, i.invoice_id, invoice_sequence;
















