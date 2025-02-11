/*1. Выбрать все данные из таблицы customers

2. Выбрать все записи из таблицы customers, но только колонки "имя контакта" и "город"

3. Выбрать все записи из таблицы orders, но взять две колонки: идентификатор заказа и колонку, значение в которой мы рассчитываем как разницу между датой отгрузки и датой формирования заказа.

4. Выбрать все уникальные города в которых "зарегестрированы" заказчики

5. Выбрать все уникальные сочетания городов и стран в которых "зарегестрированы" заказчики

6. Посчитать кол-во заказчиков

7. Посчитать кол-во уникальных стран в которых "зарегестрированы" заказчики*/

--1
SELECT * FROM customers
--2
SELECT contact_name, city FROM customers
--3
SELECT order_id, shipped_date - order_date FROM orders
--4
SELECT DISTINCT city FROM customers
--5
SELECT DISTINCT city, country FROM customers
--6
SELECT COUNT(*) FROM customers
--7
SELECT COUNT(DISTINCT country) FROM customers