-- Retrieve the total number of orders placed.
select count(order_id) as total_orders from orders; 
/* output: There are 21350 orders placed*/

-- Calculate the total revenue generated from pizza sales.
select 
round(sum(order_details.quantity* pizzas.price),2) as total_sales
from order_details join pizzas 
on pizzas.pizza_id=order_details.pizza_id
/* output: The total revenue generated from pizza sales is 817860 */


-- Identify the highest-priced pizza.
select pizza_types.name, pizzas.price
from pizza_types join pizzas
on pizza_types. pizza_type_id=pizzas.pizza_type_id
order by pizzas.price desc
limit 1; 
/* Output: The highest priced pizza is The greek pizza with price 35.95 */


-- Identify the most common pizza size ordered.
select pizzas.size, count(order_details.order_details_id) as order_count
from pizzas join order_details
on pizzas.pizza_id=order_details.pizza_id
group by pizzas.size 
order by order_count desc;
/* output: The most common pizza size ordered is L */


-- List the top 5 most ordered pizza types along with their quantities.
select pizza_types.name,
sum(order_details.quantity) as quantity
from pizza_types join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
join order_details
on order_details.pizza_id= pizzas.pizza_id
group by pizza_types.name
order by quantity desc
limit 5;