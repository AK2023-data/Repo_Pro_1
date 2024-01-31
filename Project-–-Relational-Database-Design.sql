
CREATE DATABASE ProjectRDBMS

USE ProjectRDBMS

--------------------------------------------------------------

CREATE TABLE User_account
(
id INT PRIMARY KEY,
user_name VARCHAR(100),
email VARCHAR(254),
password VARCHAR(200),
password_salt VARCHAR(50) DEFAULT NULL,
password_hash_algorithm VARCHAR(50)
)

INSERT INTO User_account VALUES
(145,'SMITH','smith@cnn.com','dksjfl',NULL,'lo5fa0s9djfo'),
(146,'ALLEN','allen@ubc.com','kosaid','923459ksdfe6','etw59ks54'),
(147,'DOYLE','doyle@nbc.com','0jasdlfk',NULL,'sdf59ksdfjee'),
(148,'DENNIS','dennis@got.com','j4r34ks','23459kssidouf','ksdfj7j');

------------------------------------------------------------
CREATE TABLE User_has_role
(
id INT PRIMARY KEY,
role_start_time TIME,
role_end_time TIME DEFAULT NULL,
user_account_id INT FOREIGN KEY (user_account_id) REFERENCES User_account(id),
role_id INT FOREIGN KEY (role_id) REFERENCES Role(id)
);

INSERT INTO User_has_role values
(122,'10:50:34','7:20:27',145,667),
(123,'0:10:44',NULL,146,668),
(124,'13:30:54','4:31:11',147,669),
(167,'2:51:04',NULL,148,670);
-----------------------------------------------------------------

CREATE TABLE User_has_status
(
id INT PRIMARY KEY,
status_start_time TIME,
status_end_time TIME DEFAULT NULL,
user_account_id INT FOREIGN KEY (user_account_id) REFERENCES user_account(id), 
status_id INT FOREIGN KEY (status_id) REFERENCES status(id)
);

INSERT INTO User_has_status VALUES
(88,'9:20:00','7:20:27',145,11),
(74,'2:10:12',NULL,146,45),
(60,'18:59:50','4:31:11',147,79),
(46,'11:49:28',NULL,148,113);

----------------------------------------------------------

CREATE TABLE Role
(
id INT PRIMARY KEY,
role_name VARCHAR(100)
)

INSERT INTO Role VALUES
(667,'Clerk'),
(668,'Staff'),
(669,'Analyst'),
(670,'Sales Person'),
(671,'Manager'),
(672,'President');

-----------------------------------------------------------

CREATE TABLE Status
(
id INT PRIMARY KEY,
status_name VARCHAR(100),
is_user_working BIT
)

INSERT INTO Status values
(11,'active',1),
(45,'inactive',0),
(79,'dormant',0),
(113,'new',1);

---------------------------------------------------------------------

--1. Insert data into each of the above tables. With at least two rows in each of the tables. Make sure that you have created respective foreign keys.

--I have inserted the data right below i have created the tables.

select * from role
select * from status
select * from User_account 
select * from user_has_status
select * from user_has_role

--2. Delete all the data from each of the tables.

delete from Role
delete from Status
delete from User_account
delete from user_has_role 
delete from user_has_status

---------------------------------------------------------------------
