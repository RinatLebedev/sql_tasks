CREATE TABLE publisher
(
	publisher_id int PRIMARY KEY,
	org_name varchar(32) NOT NULL,
	org_address text NOT NULL
);

DROP TABLE IF EXISTS publisher  /* Удалить таблицу, если она существует */

INSERT INTO publisher 
VALUES
(1, 'Московское издательство' , 'г. Москва, ул. Пушкина 32'),
(2, 'Казанское издательство', 'г. Казань, ул. Лермонтова 33')

CREATE TABLE book
(
	book_id int PRIMARY KEY,
	title varchar(32) NOT NULL,
	isbn varchar(16) NOT NULL
);

DROP TABLE IF EXISTS book

INSERT INTO book 
VALUES
(1, 'Война и мир' , '123456789'),
(2, 'Мир и пир', '987654321'),
(3, 'Горе от ума', '0987656789')

/*Получение всех значений из таблицы*/	
SELECT * FROM publisher; 

/*Получение значений из конкретных столбцов столбцов*/
SELECT org_name, org_address FROM publisher;

SELECT * FROM book;

/*Добавление новой колонки в таблицу*/
ALTER TABLE book
ADD COLUMN	fk_publisher_id int;

/*Добавление FOREIGN KEY зависимости*/
ALTER TABLE book
ADD CONSTRAINT fk_book_publisher FOREIGN KEY(fk_publisher_id) REFERENCES publisher(publisher_id)
/*Получаем зависимость "Один ко многим" - одно издательство может опубликовать много книг */