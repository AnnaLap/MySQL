
-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными
CREATE DATABASE IF NOT EXISTS lesson_1; -- Создал БД lesson_1, если ЕЕ не было раньше

-- Подключение к конкретной базе 
USE lesson_1; -- Выбрал БД для работы lesson_1

DROP TABLE IF EXISTS item; -- Удалить таблицу, если она существует
CREATE TABLE IF NOT EXISTS item
( 
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(45),
    manufacture VARCHAR(45), 
    price INT,
    quantity INT 
);

-- Заполнение таблицы данными
INSERT item(product_name,manufacture,quantity,price)
VALUES 
	("iPhone X", "Apple", 3, 76000), -- id = 1
    ("iPhone 8", "Apple", 2, 51000), -- id = 2
	("Galaxy S9", "Samsung", 2, 56000), -- id = 3
    ("Galaxy S8", "Samsung", 1, 41000), -- id = 4
    ("P20 Pro", "Huawei", 5, 36000); -- id = 5

SELECT * FROM item; -- Вывести все содержимое таблицы item

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT product_name,manufacture,price
FROM item
WHERE quantity > 2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT product_name,price,quantity
FROM item
WHERE manufacture = "Samsung";

-- 4. Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000
SELECT product_name,manufacture,quantity,price
FROM item
WHERE price*quantity < 145000 AND 100000 < price*quantity; 

-- 4.1 Товары, в которых есть упоминание "Iphone"
SELECT product_name,manufacture,quantity,price
FROM item
WHERE product_name LIKE "iPhone%";

-- 4.2 Товары, в которых есть упоминание "Galaxy"
SELECT product_name,manufacture,quantity,price
FROM item
WHERE product_name LIKE "Galaxy%";

-- 4.3 Товары, в которых есть ЦИФРЫ
SELECT product_name,manufacture,quantity,price
FROM item
WHERE product_name RLIKE "[0-9]";

-- 4.4 Товары, в которых есть ЦИФРА "8"
SELECT product_name,manufacture,quantity,price
FROM item
WHERE product_name RLIKE "[8]";