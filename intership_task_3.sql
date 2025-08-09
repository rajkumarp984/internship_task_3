create table customer(customer_id int, emp_name varchar(255), order_id int, department varchar(255), salary int, hire_date int, total_sales int);
insert into customer values(101, 'Alice', '1', 'sales', 60000, 2022-01-15, '100000');
insert into customer values(102, 'Bob', '2', 'Marketing', 75000, 2021-03-10, '200000');
insert into customer values(103, 'charlie', '3', 'sales', 50000, 2020-07-23, '300000');
insert into customer values(104, 'david', '4', 'IT', 80000, 2019-11-05, '400000');

drop table customer;

select * from customer;
select * from employees;

# used select ,where,orderby,group by.
-- Total number of orders per customer
SELECT customer_id, COUNT(order_id) AS total_orders
FROM customer
GROUP BY customer_id
ORDER BY total_orders DESC;

# inner joins 
select customer_id,order_id from customer
inner join employees on
customer.hire_date = employees.hire_date

# left join
select
c.customer_id,
c.emp_name,
c.order_id,
a.emp_id,
a.emp_name,
a.salary
from customer c left join employees a
on c.emp_name = a.emp_name
order by c.emp_name;

# Right join
select
c.customer_id,
c.emp_name,
c.order_id,
a.emp_id,
a.emp_name,
a.salary
from customer c right join employees a
on c.emp_name = a.emp_name
order by c.emp_name;

# sub_query is a query nested inside another query
select * from employees
where emp_id in 
     (select customer_id from customer
     where order_id = 2);

# aggregate function(avg,sum)
select avg(hire_date) from customer;
select sum(hire_date) from employees;

# create views for analysis in sql
select * from employees;
create view employee_view as select emp_id,emp_name,department from employees
select * from employee_view

# optimize queries with indexes
create index My_Index1 on  employees(emp_name);
create index my_index2 on customer(emp_name, salary);