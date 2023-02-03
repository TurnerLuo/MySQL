-- Turner Luo Lab 4
-- Chapter 8
use ap;
-- Ex1
select invoice_total,
       format(invoice_total,1) as total_format,
       convert(invoice_total, signed) as total_convert,
       cast(invoice_total as signed) as total_cast
from invoices;

-- Ex2
select invoice_date,
       cast(invoice_date as datetime) as invoive_datetime,
       cast(invoice_date as char(7)) as invoice_char7
from invoices;

-- Chapter 9
-- Ex1
select invoice_total,
       round(invoice_total, 1) as one_digit,
       round(invoice_total, 0) as zero_digits_round,
       truncate(invoice_total, 0) as zero_digits_truncate
from invoices;

-- Ex2
use ex;
select * from date_sample;
select start_date,
       date_format(start_date, '%b/%d/%y') as format1,
       date_format(start_date, '%c/%e/%y') as format2,
       date_format(start_date, '%l:%i%p') as twelve_hour,
       date_format(start_date, '%c/%e/%y %l:%i %p') as format3
from date_sample;

-- Ex3
use ap;
select invoice_number,
       invoice_date,
       date_add(invoice_date, interval 30 day) as date_plus_30_days,
       payment_date,
       datediff(payment_date, invoice_date) as days_to_pay,
       month(invoice_date) as "month",
       year(invoice_date) as "year"
from invoices
where invoice_date > '2018-04-30' and invoice_date < '2018-06-01';




