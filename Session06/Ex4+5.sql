CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products (product_id, product_name, price) VALUES
(1, 'Laptop Dell', 15000000),
(2, 'Chuột Logitech', 500000),
(3, 'Bàn phím cơ', 2000000),
(4, 'Màn hình LG', 4500000),
(5, 'Tai nghe Sony', 2500000);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(101, 1, 1),
(101, 2, 2),
(102, 3, 1),
(103, 4, 2),
(105, 5, 3);


SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;

SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity * p.price) AS revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;

SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity * p.price) AS revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(oi.quantity * p.price) > 5000000;

-- Ex5
SELECT
    c.customer_id,
    c.full_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent,
    AVG(o.total_amount) AS avg_order_value
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.status = 'completed'
GROUP BY c.customer_id, c.full_name
HAVING COUNT(o.order_id) >= 3
   AND SUM(o.total_amount) > 10000000
ORDER BY total_spent DESC;
