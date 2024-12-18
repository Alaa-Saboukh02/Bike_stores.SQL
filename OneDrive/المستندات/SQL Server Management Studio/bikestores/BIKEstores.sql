use BikeStores
select * from production.products
select * from production.brands
select * from production.categories
select * from production.stocks
select * from sales.order_items
select * from sales.orders
select * from production.products
--Which bike is most expensive? What could be the motive behind pricing this 
--bike at the high price?
SELECT 
    product_name, 
    list_price
FROM 
    production.products
GROUP BY 
    product_name, list_price
-- How many total customers does BikeStore have? Would you consider 
--people with order status 3 as customers substantiate your answer? 
SELECT COUNT(DISTINCT customer_id) AS TotalCustomers
FROM sales.orders
WHERE order_status != 3;
--How many stores does BikeStore have?
SELECT COUNT(DISTINCT store_id) AS TotalStores
FROM production.stocks
-- What is the total price spent per order?
SELECT 
    order_id, 
    SUM(list_price * quantity * (1 - discount)) AS TotalPricePerOrder
FROM 
    sales.order_items

GROUP BY 
    order_id;
--	What’s the sales/revenue per store?
SELECT 
    s.store_id, 
    SUM(oi.list_price * oi.quantity * (1 - oi.discount)) AS SalesRevenuePerStore
FROM 
    sales.stores s, 
    sales.orders o, 
    sales.order_items oi
WHERE 
    s.store_id = o.store_id 
    AND o.order_id = oi.order_id
GROUP BY 
    s.store_id;

-- Which category is most sold?
SELECT 
    p.category_id, 
    SUM(oi.quantity) AS total_quantity_sold
FROM 
    sales.order_items oi
JOIN 
    production.products p 
    ON oi.product_id = p.product_id
GROUP BY 
    p.category_id
ORDER BY 
    total_quantity_sold DESC;

--Which category rejected more orders?
SELECT 
    p.category_id, 
    COUNT(o.order_id) AS rejected_orders_count
FROM 
    sales.orders o
JOIN 
    sales.order_items oi ON o.order_id = oi.order_id
JOIN 
    production.products p ON oi.product_id = p.product_id
WHERE 
    o.order_status = 3
GROUP BY 
    p.category_id
ORDER BY 
    rejected_orders_count DESC;
--Which bike is the least sold?
SELECT 
    p.product_name, 
    SUM(oi.quantity) AS total_sold
FROM 
    sales.order_items oi
JOIN 
    production.products p ON oi.product_id = p.product_id
GROUP BY 
    p.product_name
ORDER BY 
    total_sold ASC
--What’s the full name of a customer with ID 259?
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM 
    sales.customers
WHERE 
    customer_id = 259;
--What did the customer on question 9 buy and when? What’s the status of 
--this order
SELECT 
    o.order_id,
    p.product_name,
    o.order_date,
    o.order_status
FROM 
    sales.orders o
JOIN 
    sales.order_items oi ON o.order_id = oi.order_id
JOIN 
    production.products p ON oi.product_id = p.product_id
WHERE 
    o.customer_id = 259;
--Which staff processed the order of customer 259? And from which store?
SELECT 
    s.first_name + ' ' + s.last_name AS staff_name,
    st.store_name
FROM 
    sales.orders o
JOIN 
    sales.staffs s ON o.staff_id = s.staff_id
JOIN 
    sales.stores st ON o.store_id = st.store_id
WHERE 
    o.customer_id = 259;
--How many staff does BikeStore have? Who seems to be the lead Staff at 
--BikeStore?
SELECT 
    COUNT(*) AS total_staff
FROM 
    sales.staffs;
	SELECT 
    first_name + ' ' + last_name AS lead_staff_name
FROM 
    sales.staffs
WHERE 
    manager_id IS NULL;
--Which brand is the most liked?
SELECT 
    b.brand_name, 
    SUM(oi.quantity) AS total_sold
FROM 
    sales.order_items oi
JOIN 
    production.products p ON oi.product_id = p.product_id
JOIN 
    production.brands b ON p.brand_id = b.brand_id
GROUP BY 
    b.brand_name
ORDER BY 
    total_sold DESC
SELECT 
    b.brand_name, 
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_revenue
FROM 
    sales.order_items oi
JOIN 
    production.products p ON oi.product_id = p.product_id
JOIN 
    production.brands b ON p.brand_id = b.brand_id
GROUP BY 
    b.brand_name
ORDER BY 
    total_revenue DESC
-- How many categories does BikeStore have, and which one is the least 
--liked?
 SELECT 
    c.category_name, 
    SUM(oi.quantity) AS total_sold
FROM 
    sales.order_items oi
JOIN 
    production.products p ON oi.product_id = p.product_id
JOIN 
    production.categories c ON p.category_id = c.category_id
GROUP BY 
    c.category_name
ORDER BY 
    total_sold ASC
	SELECT 
    c.category_name, 
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_revenue
FROM 
    sales.order_items oi
JOIN 
    production.products p ON oi.product_id = p.product_id
JOIN 
    production.categories c ON p.category_id = c.category_id
GROUP BY 
    c.category_name
ORDER BY 
    total_revenue ASC

	--Which store still have more products of the most liked brand
	SELECT 
    b.brand_name, 
    SUM(oi.quantity) AS total_sold
FROM 
    sales.order_items oi
JOIN 
    production.products p ON oi.product_id = p.product_id
JOIN 
    production.brands b ON p.brand_id = b.brand_id
GROUP BY 
    b.brand_name
ORDER BY 
    total_sold DESC
-- Which state is doing better in terms of sales?
SELECT 
    st.state, 
    SUM(oi.quantity) AS total_quantity_sold
FROM 
    sales.order_items oi
JOIN 
    sales.orders o ON oi.order_id = o.order_id
JOIN 
    sales.stores st ON o.store_id = st.store_id
GROUP BY 
    st.state
ORDER BY 
    total_quantity_sold DESC
--What’s the discounted price of product id 259?
 SELECT 
    p.product_id,
    p.list_price,
    oi.discount,
    p.list_price * (1 - oi.discount) AS discounted_price
FROM 
    production.products p
JOIN 
    sales.order_items oi ON p.product_id = oi.product_id
WHERE 
    p.product_id = 259;
--What’s the product name, quantity, price, category, model year and brand 
--name of product number 44?
SELECT 
    p.product_name, 
    oi.quantity, 
    p.list_price, 
    c.category_name, 
    p.model_year, 
    b.brand_name
FROM 
    production.products p
JOIN 
    sales.order_items oi ON p.product_id = oi.product_id
JOIN 
    production.categories c ON p.category_id = c.category_id
JOIN 
    production.brands b ON p.brand_id = b.brand_id
WHERE 
    p.product_id = 44;
--What’s the zip code of CA?
SELECT 
    zip_code
FROM 
    sales.stores
WHERE 
    state = 'CA';
--How many states does BikeStore operate in?
SELECT 
    COUNT(DISTINCT state) AS total_states
FROM 
    sales.stores;
--How many bikes under the children category were sold in the last 8 
--months?
SELECT 
    SUM(oi.quantity) AS total_bikes_sold
FROM 
    sales.order_items oi
JOIN 
    production.products p ON oi.product_id = p.product_id
JOIN 
    production.categories c ON p.category_id = c.category_id
JOIN 
    sales.orders o ON oi.order_id = o.order_id
WHERE 
    c.category_name = 'Children'
    AND o.order_date >= DATEADD(MONTH, -8, GETDATE());
--What’s the shipped date for the order from customer 523SELECT 
    o.shipped_date
FROM 
    sales.orders o
WHERE 
    o.customer_id = 523;
--How many orders are still pending?
SELECT 
    COUNT(*) AS pending_orders
FROM 
    sales.orders
WHERE 
    order_status = 1
--What’s the names of category and brand does "Electra white water 3i -
--2018" fall under
SELECT 
    c.category_name, 
    b.brand_name
FROM 
    production.products p
JOIN 
    production.categories c ON p.category_id = c.category_id
JOIN 
    production.brands b ON p.brand_id = b.brand_id
WHERE 
    p.product_name = 'Electra white water 3i - 2018';












   


