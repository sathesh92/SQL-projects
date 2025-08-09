Task 1:Top 10 employees based on sales 
select e.emp_name,sum(s.amount) as total_sales from Employees e
join Sales s on e.emp_id=s.emp_id
group by emp_name
order by total_sales desc;


task 2:department wise total and average 
Select  d.dept_name,SUM(s.amount) as total_sales,ROUND(avg(s.amount),2) as avg_sales from Departments d
join Employees e on d.dept_id=e.dept_id
join Sales s on s.emp_id=e.emp_id
group by dept_name
order by total_sales;


task 3:employee not met target

select e.emp_name,
t.target_month,
t.target_amount,
coalesce (sum(s.amount),0) as act_sales,round(coalesce (sum(s.amount),0)*100/t.target_amount,2) as ach_percent
from employees e 
join Targets t on t.emp_id=e.emp_id
left join Sales s on s.emp_id=e.emp_id and STRFTIME('%Y-%m',s.sale_date)=STRFTIME('%Y-%m',t.target_month)
group by e.emp_name,
t.target_month,
t.target_amount 
Having coalesce (sum(s.amount),0)<t.target_amount
Order by ach_percent asc;


task 4:best 3rd product of the month 

with month_sal as ( select STRFTIME('%m',sale_date) as mon,p.product_name,sum(s.amount)as total_sales 
from Sales s 
join products p on s.product_id=p.product_id
group by mon,p.product_name),
pro_rank as (select mon,product_name,total_sales ,rank() over (partition by mon order by total_sales desc )
as rnk from month_sal)
select product_name,mon,total_sales,rnk from pro_rank where rnk=3
order by mon;



task 5:emp rank in depart

select d.dept_name,e.emp_name,sum(s.amount) as total_sales,rank() 
over (partition by d.dept_name order by sum(s.amount) desc) as rnk from Departments d
join Employees e on e.dept_id=d.dept_id
join sales s on s.emp_id=e.emp_id
group by emp_name,dept_name 
order by total_sales;

task6:sales growth month over month
SELECT STRFTIME('%Y-%m', sale_date) AS month,SUM(amount) AS total_sales,
LAG(SUM(amount)) OVER (ORDER BY STRFTIME('%Y-%m', sale_date)) 
AS prev_month_sales,
ROUND((SUM(amount) - LAG(SUM(amount)) OVER (ORDER BY STRFTIME('%Y-%m', sale_date))) * 100.0 /NULLIF(LAG(SUM(amount)) 
OVER (ORDER BY STRFTIME('%Y-%m', sale_date)), 0), 2) AS growth
FROM sales GROUP BY STRFTIME('%Y-%m', sale_date)
ORDER BY month;



task 7.creating view for emp

CREATE VIEW employee_performance as select e.emp_name,sum(s.amount) as total_sales,count(sale_id),d.dept_name
from employees e
join Departments d on e.dept_id=d.dept_id
left join sales s on e.emp_id=s.emp_id
group by d.dept_name,e.emp_name
order by total_sales



task 8:create procedure cannot work in sql lite can be worked in PostgreSQL 
but sql lite qw can pass a string as below,
select d.dept_name,e.emp_name,sum(s.amount) as total_sales from departments d
join employees e on e.dept_id=d.dept_id
join sales s on e.emp_id=s.emp_id
where STRFTIME('%y-%m',s.sale_date)='2025-10'
group by dept_name 
order by total_sales

Task 9:missing target

with perform as (
select e.emp_id,
e.emp_name,
t.target_month,
coalesce(SUM(s.amount),0) as actual_sales,
t.target_amount ,
case when 
coalesce(sum(s.amount),0)<
t.target_amount then 1 else 0 end as missed
from employees e
join Targets t on e.emp_id=t.emp_id
left join sales s on e.emp_id=s.emp_id and strftime('%y-%m',s.sale_date)=strftime('%y'-'%m',t.target_month)
group by e.emp_id,e.emp_name,t.target_amount,t.target_month )
select emp_name, count(*) as misses 
from perform 
where missed =1
group by emp_name
having count(*)>=1;

10:highest sales per quarter 
select strftime('%m',s.sale_date)||'-Q' || 
case when cast(strftime('%y',s.sale_date) as integer ) between 1 and 3 then '1' 
when cast(strftime('%y',s.sale_date) as integer ) between 4 and 6 then '2'
when cast(strftime('%y',s.sale_date) as integer ) between 7 and 9 then '3'
else '4' end as quarter,d.dept_name,sum(s.amount)as total_sales from sales s
join Employees e on e.emp_id=s.emp_id
join departments d on e.dept_id=d.dept_id
group by quarter,d.dept_name
order by quarter,total_sales desc;