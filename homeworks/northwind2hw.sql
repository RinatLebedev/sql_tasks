/*1. Выбрать все заказы из стран France, Austria, Spain

2. Выбрать все заказы, отсортировать по required_date (по убыванию)
и отсортировать по дате отгрузке (по возрастанию)

3. Выбрать минимальное кол-во  единиц товара среди тех продуктов, 
которых в продаже более 30 единиц.

4. Выбрать максимальное кол-во единиц товара среди тех продуктов, 
которых в продаже более 30 единиц.

5. Найти среднее значение дней уходящих на доставку с даты формирования заказа в USA

6. Найти сумму, на которую имеется товаров (кол-во * цену) причём таких, 
которые планируется продавать и в будущем (см. на поле discontinued)*/

--1
SELECT * FROM orders
WHERE ship_country = 'France' OR ship_country = 'Austria' OR ship_country = 'Spain'
-Либо можно
SELECT * FROM orders
WHERE ship_country IN('France','Austria','Spain')

--2
SELECT required_date, shipped_date 
FROM orders 
ORDER BY required_date DESC, shipped_date ASC

--3
SELECT MIN(units_in_stock)
FROM products
WHERE units_in_stock > 30

--4
SELECT MAX(units_in_stock)
FROM products
WHERE units_in_stock > 30

--5
SELECT AVG(shipped_date - order_date)
FROM orders
WHERE ship_country = 'USA'

--6
SELECT SUM(units_in_stock * unit_price)
FROM products
WHERE discontinued = 0
