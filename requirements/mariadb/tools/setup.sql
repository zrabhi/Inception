
DROP DATABASE IF EXISTS wordpress;
CREATE DATABASE wordpress;
DROP USER IF EXISTS zac; 
CREATE USER 'zac@localhost' IDENTIFIED BY 'password1';
GRANT ALL PRIVILEGES ON wordpress.* TO 'zac'@localhost IDENTIFIED BY 'password1';
-- GRANT ALL PRIVILEGES ON 'wordpress' TO 'zac@localhost' IDENTIFIED BY 'password1';
FLUSH PRIVILEGES 
-- CREATE fSER "zrabhi" IF NOT EXIST
