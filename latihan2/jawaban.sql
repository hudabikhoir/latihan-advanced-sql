--- UNIQUE CONSTRAINT
CREATE TABLE customers (customer_id SERIAL PRIMARY KEY, email varchar(100) UNIQUE, phone varchar(100));

-- CHECK CONSTRAINT
CREATE TABLE products (product_id SERIAL PRIMARY KEY, name varchar(100), price numeric(12, 2) NOT NULL CHECK (price > 0), stock INT NOT NULL CHECK (stock >= 0), created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW());

-- INDEX 
CREATE INDEX IF NOT EXISTS idx_customer_email_lower ON customers (lower(email));

-- COMPOSITE INDEX
CREATE TABLE orders (order_id SERIAL PRIMARY KEY, customer_id INT NOT NULL REFERENCES customers(customer_id) ON DELETE CASCADE, order_date TIMESTAMP WITH TIME ZONE DEFAULT NOW(), total_amount NUMERIC(12, 2) NOT NULL CHECK (total_amount >= 0), status varchar(100) NOT NULL DEFAULT 'pending');
CREATE INDEX IF NOT EXISTS idx_order_customer_orderdate ON orders (customer_id, order_date);

-- CREATE VIEW
CREATE VIEW customer_orders AS SELECT c.email, o.order_date, o.total_amount FROM customers c JOIN orders o ON c.customer_id = o.customer_id;

-- UPDATE VIEW COLUMN
CREATE OR REPLACE VIEW customer_orders AS SELECT c.email, o.order_date, o.total_amount, o.status from customers c JOIN orders o ON o.customer_id = c.customer_id;

-- SELECT VIEW
SELECT * FROM customer_orders;

-- DROP VIEW
DROP VIEW customer_orders;

-- CREATE PRODUCT LOGS
CREATE TABLE product_logs (log_id SERIAL PRIMARY KEY, product_id INT NOT NULL REFERENCES products(product_id) ON DELETE CASCADE, action varchar(50), change_time TIMESTAMP WITH TIME ZONE DEFAULT NOW(), old_price NUMERIC(12,2), new_price NUMERIC(12,2), old_name varchar(200), new_name varchar(200), old_stock INT, new_stock INT);

-- CREATE FUNCTION 
CREATE FUNCTION log_product_update() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO product_logs(product_id, action, change_time, old_price, new_price, old_name, new_name, old_stock, new_stock)
VALUES
(NEW.product_id, 'UPDATED', NOW(), OLD.price, NEW.price, OLD.name, NEW.name, OLD.stock, NEW.stock); 
RETURN NEW; 
END; $$ LANGUAGE plpgsql;

-- CREATE TRIGGER
CREATE TRIGGER trg_product_update AFTER UPDATE ON products FOR EACH ROW EXECUTE FUNCTION log_product_update();

-- DROP TRIGGER
DROP TRIGGER trg_product_update ON products;

-- DROP FUNCTION
DROP FUNCTION log_product_update();