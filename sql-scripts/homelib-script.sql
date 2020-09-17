CREATE DATABASE IF NOT EXISTS full_lib;

USE full_lib;

DROP TABLE IF EXISTS books;

CREATE TABLE books (
	id INT NOT NULL AUTO_INCREMENT,
	addDate VARCHAR(20),
	lib_loc VARCHAR(50),
	isbn VARCHAR(13),
	title VARCHAR(50),
	edition INT,
	author VARCHAR(50),
	genre VARCHAR(50),
	loanStatus BOOLEAN,
	PRIMARY KEY(id)
);

DROP PROCEDURE IF EXISTS findQuantity;
DELIMITER $$
CREATE PROCEDURE findQuantity()
BEGIN
	SELECT 
		title, edition, author, COUNT(title)
	FROM 
		books
	GROUP BY
		title ,
		edition ,
		author 
	HAVING  COUNT(title) > 1
		AND COUNT(edition) > 1
		AND COUNT(author) > 1;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS booksByLib_Loc;
DELIMITER $$
CREATE PROCEDURE booksByLib_Loc(IN specLoc VARCHAR(50))
BEGIN
	SELECT * FROM books WHERE lib_loc = specLoc;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS booksByTitle;
DELIMITER $$
CREATE PROCEDURE booksByTitle(IN specTitle VARCHAR(50))
BEGIN
	SELECT * FROM books WHERE title = specTitle;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS booksByAuthor;
DELIMITER $$
CREATE PROCEDURE booksByAuthor(IN specAuthor VARCHAR(50))
BEGIN
	SELECT * FROM books WHERE author = specAuthor;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS booksByGenre;
DELIMITER $$
CREATE PROCEDURE booksByGenre(IN specGenre VARCHAR(50))
BEGIN
	SELECT * FROM books WHERE genre = specGenre;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS booksByLoan;
DELIMITER $$
CREATE PROCEDURE booksByLoan(IN loanState INT)
BEGIN
	IF loanState > 0 THEN
		SELECT * FROM books WHERE loanStatus = TRUE;
	ELSE
		SELECT * FROM books WHERE loanStatus = FALSE;
	END IF;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS addBook;
DELIMITER $$
CREATE PROCEDURE addBook(
	IN addDate VARCHAR(20), IN lib_loc VARCHAR(50), 
	IN isbn VARCHAR(13), IN title VARCHAR(50), IN edition INT,
	IN author VARCHAR(50), IN genre VARCHAR(50), IN loanStatus BOOLEAN)
BEGIN 
	INSERT INTO books (addDate, lib_loc, isbn, title, edition, author, genre, loanStatus) VALUES 
					  (addDate, lib_loc, isbn, title, edition, author, genre, loanStatus);
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

DROP PROCEDURE IF EXISTS sortBooks_addDate;
DELIMITER $$
CREATE PROCEDURE sortBooks_addDate(IN listOrder INT)
BEGIN
	IF listOrder > 0 THEN
		SELECT * FROM books ORDER BY addDate ASC;
	ELSE 
		SELECT * FROM books ORDER BY addDate DESC;
	END IF;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sortBooks_Loc;
DELIMITER $$
CREATE PROCEDURE sortBooks_Loc(IN listOrder INT)
BEGIN
	IF listOrder > 0 THEN
		SELECT * FROM books ORDER BY lib_loc ASC;
	ELSE 
		SELECT * FROM books ORDER BY lib_loc DESC;
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

DROP PROCEDURE IF EXISTS sortBooks_edition;
DELIMITER $$
CREATE PROCEDURE sortBooks_edition(IN listOrder INT)
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
