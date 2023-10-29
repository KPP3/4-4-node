CREATE TABLE users(
    id SERIAL NOT NULL,
	username VARCHAR(255) NOT NULL,
	password VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	firstName VARCHAR(50) NULL,
	lastName VARCHAR(100) NULL,
	PRIMARY KEY (id)
);

CREATE TABLE countries (
	id SERIAL NOT NULL,
	name VARCHAR(100) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE addresses (
	id SERIAL NOT NULL,
	user_id int NOT NULL,
	country_id int NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) 
        REFERENCES users(id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
	FOREIGN KEY (country_id) 
        REFERENCES countries(id)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

INSERT INTO users (username, password, email, firstName, lastName)
SELECT 'keyur1', 'password1', 'keyur1@gmail.com', 'Keyur1', 'Patel1'
UNION
SELECT 'keyur2', 'password2', 'keyur2@gmail.com', 'Keyur2', 'Patel2'

INSERT INTO countries (name)
SELECT 'Canada'
UNION
SELECT 'Australia'
UNION
SELECT 'India'

INSERT INTO addresses (user_id, country_id)
SELECT 1, 1
UNION
SELECT 2, 1
UNION
SELECT 2, 3

SELECT * FROM countries
SELECT email FROM users
SELECT firstName from users WHERE firstName LIKE '%e%'
SELECT a.user_id, c.* FROM addresses a
JOIN countries c on a.country_id = c.id
WHERE a.user_id = 2