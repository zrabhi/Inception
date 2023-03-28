
--  checking if the database exists , if so we drop it
DROP DATABASE IF EXISTS wordpress; 
-- creating database
CREATE DATABASE wordpress;
--  checking if the user exists , if so we drop it
DROP USER IF EXISTS zac; 
-- creating user
CREATE USER 'zac'@'%' IDENTIFIED BY 'password1';
-- giveing the user privileges to our database
GRANT ALL PRIVILEGES ON wordpress.* TO 'zac'@'%' IDENTIFIED BY 'password1';
-- refresh the privileges once new ones have been awarded
FLUSH PRIVILEGES 
