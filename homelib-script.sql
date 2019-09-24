CREATE DATABASE IF NOT EXISTS homelib;

USE homelib;

DROP TABLE IF EXISTS books;
CREATE TABLE books (
	id INT,
	isbn VARCHAR(13),
	title VARCHAR(50),
	author VARCHAR(50),
	genre VARCHAR(50),
	loanStatus BOOLEAN,
	PRIMARY KEY(id)
);

DROP PROCEDURE IF EXISTS getOwnedBooks;
DELIMITER $$
CREATE PROCEDURE getOwnedBooks()
BEGIN
	SELECT 
		*
	FROM
		books
	WHERE
		loanStatus = FALSE;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS getLoanedBooks;
DELIMITER $$
CREATE PROCEDURE getLoanedBooks()
BEGIN
	SELECT 
		*
	FROM
		books
	WHERE
		loanStatus = TRUE;
END $$
DELIMITER ; 

DROP PROCEDURE IF EXISTS addBook;
DELIMITER $$
CREATE PROCEDURE addBook(
	IN id INT, IN isbn VARCHAR(13), IN title VARCHAR(50),
	IN author VARCHAR(50), IN genre VARCHAR(50), IN loanStatus BOOLEAN)
BEGIN 
	INSERT INTO books VALUE (id, isbn, title, author, genre, loanStatus);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteBook;
DELIMITER $$
CREATE PROCEDURE deleteBook(IN bookTitle VARCHAR(50))
BEGIN 
	DELETE FROM books WHERE title = bookTitle;
END $$ 
DELIMITER ;

DROP PROCEDURE IF EXISTS sortBooks_id;
DELIMITER $$
CREATE PROCEDURE sortBooks_id(IN listOrder INT)
BEGIN
	IF listOrder > 0 THEN
		SELECT * FROM books ORDER BY id ASC;
	ELSE 
		SELECT * FROM books ORDER BY id DESC;
	END IF;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sortBooks_isbn;
DELIMITER $$
CREATE PROCEDURE sortBooks_isbn(IN listOrder INT)
BEGIN
	IF listOrder > 0 THEN
		SELECT * FROM books ORDER BY isbn ASC;
	ELSE 
		SELECT * FROM books ORDER BY isbn DESC;
	END IF;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sortBooks_title;
DELIMITER $$
CREATE PROCEDURE sortBooks_title(IN listOrder INT)
BEGIN
	IF listOrder > 0 THEN
		SELECT * FROM books ORDER BY title ASC;
	ELSE 
		SELECT * FROM books ORDER BY title DESC;
	END IF;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sortBooks_author;
DELIMITER $$
CREATE PROCEDURE sortBooks_author(IN listOrder INT)
BEGIN
	IF listOrder > 0 THEN
		SELECT * FROM books ORDER BY author ASC;
	ELSE 
		SELECT * FROM books ORDER BY author DESC;
	END IF;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sortBooks_genre;
DELIMITER $$
CREATE PROCEDURE sortBooks_genre(IN listOrder INT)
BEGIN
	IF listOrder > 0 THEN
		SELECT * FROM books ORDER BY genre ASC;
	ELSE 
		SELECT * FROM books ORDER BY genre DESC;
	END IF;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sortBooks_ls;
DELIMITER $$
CREATE PROCEDURE sortBooks_ls(IN listOrder INT)
BEGIN
	IF listOrder > 0 THEN
		SELECT * FROM books ORDER BY loanStatus ASC;
	ELSE 
		SELECT * FROM books ORDER BY loanStatus DESC;
	END IF;
END $$
DELIMITER ;

/*CALL addBook(1000, "482376452160", "Foo", "Josh Lindsay", "American History", FALSE);
CALL addBook(1001, "243897691759", "Bar", "Phil Sharp", "Computer Science ", TRUE);
CALL addBook(1002, "248728952160", "Jazz", "Carson Daly", "Mathematics", TRUE);
CALL addBook(1003, "192971252160", "Switch", "James Clifford", "Chinese History", FALSE);

SELECT * FROM books;*/




	




