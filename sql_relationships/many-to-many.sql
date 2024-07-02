DROP TABLE IF EXISTS book  /* Удалить таблицу, если она существует */
DROP TABLE IF EXISTS author
DROP TABLE IF EXISTS book_author

CREATE TABLE book
(
	book_id int PRIMARY KEY,
	title varchar(32) NOT NULL,
	isbn varchar(32) NOT NULL
);

INSERT INTO book 
VALUES
(1, 'Book 1', '123456'),
(2, 'Book 2', '5432'),
(3, 'Book 3', '654321'),
(4, 'Book 4', '124463')

CREATE TABLE author
(
	author_id int PRIMARY KEY,
	full_name varchar(32) NOT NULL,
	rating real
);

INSERT INTO author 
VALUES
(1, 'Bob', 4.50),
(2, 'Alice', 4.00),
(3, 'John', 4.70)

CREATE TABLE book_author
(
	book_id int REFERENCES book(book_id),
	author_id int REFERENCES author(author_id),

	CONSTRAINT book_authot_pkey PRIMARY KEY (book_id, author_id) --composite key
	/*PRIMARY KEY это пересечение двух значений - уникальность таблицы
	composite key - ключ, состоящий более чем из одной колонки*/
);

INSERT INTO book_author
VALUES
(1,1),
(2,1),
(3,1),
(3,2),
(4,1),
(4,2),
(4,3)

	
/*Получение всех значений из таблицы*/	
SELECT * FROM book; 

SELECT * FROM author;

SELECT * FROM book_author;

