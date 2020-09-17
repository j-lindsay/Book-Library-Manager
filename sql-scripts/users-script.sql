USE full_lib;

DROP TABLE IF EXISTS authenticated_users;

CREATE TABLE authenticated_users (
	id INT NOT NULL AUTO_INCREMENT,
	userText varchar(100),
	passText varchar(100),
	UNIQUE KEY unique_username (userText),
	PRIMARY KEY(id)
);

DROP PROCEDURE IF EXISTS addUser;
DELIMITER $$
CREATE PROCEDURE addUser(IN userText varchar(100), IN passText varchar(100))
BEGIN
	INSERT INTO authenticated_users(userText, passText) VALUES (userText, passText);
END $$
DELIMITER ;

CALL addUser("queenjauvier", "Cowtipper_21_42");
SELECT * FROM authenticated_users WHERE userText = "queenjauvier" AND passText = "Cowtipper_21_42";
