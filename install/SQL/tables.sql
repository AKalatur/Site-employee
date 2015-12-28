CREATE database sitebase;

CREATE TABLE users(
id int auto_increment, 
u_login varchar(50) NOT NULL, 
u_password varchar(50) NOT NULL, 
u_role enum('ROLE_ADMIN','ROLE_USER') default 'ROLE_USER', 
u_active enum('0','1') default '1', 
PRIMARY KEY(id));

CREATE TABLE employee(
id int auto_increment,
f_name varchar(20) NOT NULL,
s_name varchar(20) NOT NULL,
position varchar(20),
salary double,
PRIMARY KEY (id));