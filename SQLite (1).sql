-- total rows
SELECT count (*) as total_rows from retail;
--duplicate values
select c1, COUNT(*) as dupicate from retail
group by c1
HAVING dupicate > 1;
--columns
SELECT COUNT(*) AS no_of_columns
FROM pragma_table_info('retail');
--missing values
select count( * ) as not_null from retail
where c1 is not null;
--total revenue for completed orders
select c10 as order_status , sum (c9)  as total_revenue from retail
where c10 ='Completed';
--city wise total revenue
select c3, sum (c9)  as total_revenue from retail
where c10='Completed'
group by c3
order by total_revenue desc ;
--total completed revenue by category 
select c5, sum (c9)  as total_revenue from retail
where c10 ='Completed'
group by c5
order by total_revenue desc ;
--top 5 completed revenue by product
select c6,sum (c9)  as total_revenue from retail
where c10 ='Completed'
group by c6
order by total_revenue desc
limit 5;
--completed revenue for online and in store 
select c11, sum(c9) as total_revenue,count(c1) as order_count from retail 
where c10='Completed'
group by c11;
-- % and count of order status
select c10, count(c10), count(c10)*100/(select count(*) from retail ) as percentage  from retail
group by c10;
-- cancelled city order count and %
select c3 ,count(c10),  count(c10)*100/(select count(*) from retail ) as percentage  from retail
where c10 ='Cancelled';



