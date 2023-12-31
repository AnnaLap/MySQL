-- 1. Создание БД
CREATE DATABASE IF NOT EXISTS lesson3;

-- 2. Подключаемся к БД
USE lesson3;
DROP TABLE IF EXISTS staff;
CREATE TABLE IF NOT EXISTS staff 
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    post VARCHAR(45),
    seniority INT,
    salary DECIMAL(8,2), -- 100 000 . 00 - 8 - знаков всего, 2 - в дробной части
    age INT
);

-- 4. Заполнение таблицы данными
INSERT staff(first_name, last_name, post, seniority,salary,age)
VALUES ("Петр", "Петров", "Начальник", 8, 70000, 30); -- id = 1
INSERT staff (first_name, last_name, post, seniority, salary, age)
VALUES
  ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
  ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
  ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
  ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
  ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
  ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
  ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
  ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
  ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
  ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
  ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
  ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
  
SELECT * FROM staff;

-- 1.1 Отсортируйте данные по полю заработная плата (salary) в порядке: возрастания
SELECT *
FROM staff
ORDER BY salary; 

-- 1.2 Отсортируйте данные по полю заработная плата (salary) в порядке: убывания
SELECT *
FROM staff
ORDER BY salary DESC; 

-- 2. Выведите 5 максимальных заработных плат (salary)
SELECT 
	id,
    salary,
    CONCAT(first_name, " ", last_name) AS fullname -- "Петр Петров" 
FROM staff
ORDER BY salary DESC
LIMIT 5; 

-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT
	post,
    SUM(salary) AS summa
FROM staff
GROUP BY post;

-- 4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT 
    COUNT(id) AS id_count
FROM staff
WHERE post = 'Рабочий' AND 23 < age < 50;

-- 5. Найдите количество специальностей
SELECT 
    COUNT(DISTINCT post) AS post_count
FROM staff;

-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет включительно
SELECT
	post
FROM staff
GROUP BY post
HAVING AVG(age) <  31;
