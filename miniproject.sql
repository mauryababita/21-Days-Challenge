
select * from order_details;

select * from orders;

select * from pizza_types;

select * from pizzas;

--1
select distinct category 
from pizza_types;

--2 
select pizza_type_id,name,
coalesce(ingredients,'no data') as ingredients
from pizza_types
limit 5;

--3
select * from pizzas
where price is null;

--phase 2

--1
select * from orders
where date = '2015-01-01';

--2
select * from pizzas
order by price desc;

--3
select * from pizzas
where size = 'XL'  or size = 'L';

--4
select * from pizzas
where price between 15 and 17;

--5
select * from pizza_types
where name like '%Chicken%';

--6 
select * from orders 
where date = '2015-02-15'
and time >= '20:00:00';

--------------Phase-3--------------
--1
select sum(quantity) as total
from order_details;

--2
select avg(price) as avg_price
from pizzas;

--3
select order_id,sum(quantity*price) as order_values
from order_details
inner join pizzas
on pizzas.pizza_id =order_details.pizza_id
group by order_details.order_id;

--4
SELECT 
    pizza_types.category,
    SUM(order_details.quantity) AS total_quantity
FROM pizza_types
INNER JOIN pizzas
    ON pizzas.pizza_type_id = pizza_types.pizza_type_id
INNER JOIN order_details
    ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category;

--5
select category ,
sum(quantity) as total_quant
from order_details
inner join pizzas
on order_details.pizza_id=pizzas.pizza_id
inner join pizza_types
on pizzas.pizza_type_id = pizza_types.pizza_type_id
group by category
having sum(quantity)>5000;

--6
SELECT pizzas.pizza_id, pizzas.pizza_type_id, pizzas.size, pizzas.price
FROM pizzas
LEFT JOIN order_details
    ON order_details.pizza_id = pizzas.pizza_id
WHERE order_details.order_id IS NULL;

--7
SELECT 
    p1.pizza_type_id,
    p1.size AS size_1,
    p2.size AS size_2,
    p1.price AS price_1,
    p2.price AS price_2,
    (p2.price - p1.price) AS price_difference
FROM pizzas p1
INNER JOIN pizzas p2
    ON p1.pizza_type_id = p2.pizza_type_id
    AND p1.size < p2.size;







