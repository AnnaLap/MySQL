CREATE TABLE IF NOT EXISTS sales
( 
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count_product INT
);

-- Заполнение таблицы данными
INSERT sales(order_date, count_product)
VALUES 
	("2022-01-01", 156), -- id = 1
    ("2022-01-02", 180), -- id = 2
	("2022-01-03", 21), -- id = 3
    ("2022-01-04", 124), -- id = 4
    ("2022-01-05", 341); -- id = 5
    
-- 2. 
SELECT id, order_date, count_product,
IF (count_product < 100, 'Маленький заказ', 
  IF (count_product between 100 AND 300, 'Средний заказ', 
    IF (count_product > 300, 'Большой заказ', 'Не определено'))) 
AS order_type
FROM sales;

-- 3. 
CREATE TABLE IF NOT EXISTS orders
( 
    id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(5) NOT NULL,
    amount DECIMAL(20, 2) NOT NULL,
    order_status VARCHAR(45) NOT NULL
);

-- Заполнение таблицы данными
INSERT orders(employee_id, amount, order_status)
VALUES 
  ("e03",15.00,"OPEN"),
  ("e01",25.50,"OPEN"),
  ("e05",100.70,"CLOSED"),
  ("e02",22.18,"OPEN"),
  ("e04",9.50,"CANCELLED");
  
SELECT id, order_status,
CASE order_status
    WHEN "OPEN" THEN 'Order is in open state'
    WHEN "CLOSED" THEN 'Order is closed'
    ELSE 'Order is cancelled'
END AS order_summary
FROM orders;