CREATE TABLE person
(
	person_id int PRIMARY KEY,
	first_name varchar(32) NOT NULL,
	last_name varchar(32) NOT NULL
);

DROP TABLE IF EXISTS person  /* Удалить таблицу, если она существует */

INSERT INTO person 
VALUES
(1, 'John' , 'Show'),
(2, 'Ned', 'Stark'),
(3, 'Rob' , 'Baratheon')

CREATE TABLE passport
(
	person_id int PRIMARY KEY,
	serial_number varchar(6) NOT NULL,
	registration varchar(32) NOT NULL,
	fk_person_id int UNIQUE REFERENCES person(person_id)
	
);

DROP TABLE IF EXISTS passport

INSERT INTO passport 
VALUES
('12345', 'New York', 1),
('54321', 'New York', 2),
('32145', 'LA', 3)

/*Получение всех значений из таблицы*/	
SELECT * FROM person; 

SELECT * FROM passport;

