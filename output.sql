Task 1:

emp_id|emp_name|total_sales|
------+--------+-----------+
     1|Alice   |       6800|
     4|David   |       6300|
     6|Frank   |       4900|
     8|Hank    |       4540|
     5|Eva     |       4400|
    10|Jack    |       4200|
     7|Grace   |       4100|
     9|Ivy     |       3900|
     3|Charlie |       3710|
     2|Bob     |       2540|

task 2:

dept_name |total_sales|avg_sales|
----------+-----------+---------+
Finance   |       4400|  1466.67|
Operations|       4900|  1633.33|
Marketing |       8250|   1375.0|
IT        |      10200|   2040.0|
Sales     |      13440|   1344.0|

task 3:employee not met target


emp_name|target_month|target_amount|act_sales|ach_percent|
--------+------------+-------------+---------+-----------+
Bob     |2023-01-01  |         3000|     1400|       46.0|
Charlie |2023-02-01  |         2000|     1000|       50.0|
David   |2023-03-01  |         1500|      900|       60.0|

task 4:best 3rd product of the month 


product_name|mon|total_sales|rnk|
------------+---+-----------+---+
Monitor     |06 |        500|  3|
Headphones  |07 |        960|  3|
Smartphone  |08 |        700|  3|
Smartphone  |09 |       1400|  3|
Headphones  |10 |        640|  3|


task 5:emp rank in depart

dept_name |emp_name|total_sales|rnk|
----------+--------+-----------+---+
Sales     |Bob     |       2540|  3|
Marketing |Charlie |       3710|  2|
IT        |Ivy     |       3900|  2|
Sales     |Grace   |       4100|  2|
Finance   |Eva     |       4400|  1|
Marketing |Hank    |       4540|  1|
Operations|Frank   |       4900|  1|
IT        |David   |       6300|  1|
Sales     |Alice   |       6800|  1|

task6:sales growth month over month



month  |total_sales|prev_month_sales|growth_percent|
-------+-----------+----------------+--------------+
2023-01|       4100|                |              |
2023-02|       3000|            4100|        -26.83|
2023-03|       1700|            3000|        -43.33|
2023-04|       4900|            1700|        188.24|
2023-05|       2700|            4900|         -44.9|
2023-06|       3000|            2700|         11.11|
2023-07|       4360|            3000|         45.33|
2023-08|       3550|            4360|        -18.58|
2023-09|       6500|            3550|          83.1|
2023-10|       5990|            6500|         -7.85|
2023-11|       3400|            5990|        -43.24|
2023-12|       2190|            3400|        -35.59|

task 7.creating view for emp


emp_name|total_sales|count(sale_id)|dept_name |
--------+-----------+--------------+----------+
Bob     |       2540|             3|Sales     |
Charlie |       3710|             3|Marketing |
Ivy     |       3900|             2|IT        |
Grace   |       4100|             3|Sales     |
Eva     |       4400|             3|Finance   |
Hank    |       4540|             3|Marketing |
Frank   |       4900|             3|Operations|
David   |       6300|             3|IT        |
Alice   |       6800|             4|Sales     |


task 8:create procedure cannot work in sql lite can be worked in PostgreSQL 
but sql lite qw can pass a string as below,
select d.dept_name,e.emp_name,sum(s.amount) as total_sales from departments d
join employees e on e.dept_id=d.dept_id
join sales s on e.emp_id=s.emp_id
where STRFTIME('%y-%m',s.sale_date)='2025-10'
group by dept_name 
order by total_sales

Task 9:missing target

emp_name|misses|
--------+------+
Alice   |     1|
Bob     |     1|
Charlie |     1|
David   |     1|
Eva     |     1|
Frank   |     1|
Grace   |     1|
Hank    |     1|
Ivy     |     1|
Jack    |     1|


10:highest sales per quarter 

quarter|dept_name |total_sales|
-------+----------+-----------+
01-Q4  |Sales     |       4100|
02-Q4  |Sales     |       2000|
02-Q4  |Marketing |       1000|
03-Q4  |IT        |        900|
03-Q4  |Finance   |        800|
04-Q4  |Operations|       2800|
04-Q4  |Sales     |       2100|
05-Q4  |Marketing |       1500|
05-Q4  |IT        |       1200|
06-Q4  |Sales     |       1200|
07-Q4  |IT        |       1800|
07-Q4  |Finance   |       1600|
07-Q4  |Marketing |        960|
08-Q4  |Marketing |       1600|
08-Q4  |Sales     |       1250|
08-Q4  |Operations|        700|
09-Q4  |IT        |       2700|
09-Q4  |Sales     |       1400|
10-Q4  |IT        |       3600|
10-Q4  |Marketing |       1750|
10-Q4  |Sales     |        640|
11-Q4  |Finance   |       2000|
11-Q4  |Operations|       1400|
12-Q4  |Marketing |       1440|
12-Q4  |Sales     |        750|








