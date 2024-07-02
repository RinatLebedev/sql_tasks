/*1. Найти заказчиков и обслуживающих их заказы сотрудников таких, 
что и заказчики и сотрудники из города London, а доставка идёт компанией Speedy Express. 
Вывести компанию заказчика и ФИО сотрудника.

2. Найти активные (см. поле discontinued) продукты из категории Beverages и Seafood, 
которых в продаже менее 20 единиц. Вывести наименование продуктов, кол-во единиц в продаже, 
имя контакта поставщика и его телефонный номер.

3. Найти заказчиков, не сделавших ни одного заказа. Вывести имя заказчика и order_id.

4. Переписать предыдущий запрос, использовав симметричный вид джойна (подсказка: речь о LEFT и RIGHT). */

--1 
SELECT customers.company_name, employees.first_name, employees.last_name, shippers.company_name
FROM orders
JOIN customers USING(customer_id)
JOIN employees USING(employee_id)
JOIN shippers ON orders.ship_via = shippers.shipper_id
WHERE customers.city = 'London' 
	AND employees.city = 'London' 
	AND shippers.company_name = 'Speedy Express'

--2 
SELECT products.product_name, products.units_in_stock, suppliers.contact_name, suppliers.phone
FROM products
JOIN suppliers USING(supplier_id)
JOIN categories USING(category_id)
WHERE products.discontinued <> 1 
	AND products.units_in_stock < 20
	AND (categories.category_name = 'Beverages'
	OR categories.category_name = 'Seafood')
 ORDER BY units_in_stock;

--3  
SELECT customers.contact_name, orders.order_id
FROM customers
LEFT JOIN orders USING(customer_id)
EXCEPT
SELECT customers.contact_name, orders.order_id
FROM orders
LEFT JOIN customers USING(customer_id)

--Этот вариант тоже подходит
SELECT DISTINCT contact_name, order_id
FROM customers
LEFT JOIN orders USING(customer_id)
WHERE order_id IS NULL
ORDER BY contact_name;

--4 
SELECT contact_name, order_id
FROM orders
RIGHT JOIN customers USING(customer_id)
WHERE order_id IS NULL
ORDER BY contact_name;



