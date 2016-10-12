-- 1. Get all customers and addresses
SELECT * FROM customers
JOIN addresses ON customers.id = addresses.customer_id;

-- 2. Get all orders and their line items
SELECT * FROM orders
JOIN line_items ON orders.id = line_items.order_id;

-- 3. Which warehouses have Cheetos?
SELECT products.id FROM products
JOIN warehouse_product ON product_id = warehouse_product.warehouse_id
JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
WHERE description = 'cheetos';

--4. which have diet pepsi?
SELECT products.id FROM products
JOIN warehouse_product ON product_id = warehouse_product.warehouse_id
JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
WHERE description = 'diet pepsi';

--5. Get the number of orders for each customer.
SELECT COUNT(orders.id), customers.first_name FROM orders
JOIN addresses ON addresses.id = orders.address_id
JOIN customers ON customers.id = addresses.customer_id
GROUP BY customers.first_name;

--6.How many customers do we have?
SELECT COUNT(id)
FROM customers;


--7. How many products do we carry?
SELECT COUNT(id)
FROM products;

-- 8. What is the total available on hand quantity of diet pepsi?
SELECT SUM(on_hand) FROM warehouse_product
JOIN products on products.id = warehouse_product.product_id
WHERE description = 'diet pepsi';
