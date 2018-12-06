-- Corbett Weinberg - Term Project Part 3 - 


CREATE SCHEMA BOOKSDB_MVC;
GRANT ALL PRIVILEGES ON BOOKSDB_MVC.* to 'prospring5'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

show databases;

-- Assignment 3.1
USE BOOKSDB_MVC;

CREATE TABLE CATEGORY (
       ID INT (11) NOT NULL AUTO_INCREMENT
     , NAME VARCHAR(100) NOT NULL
     , PRIMARY KEY (ID)
);

CREATE TABLE BOOK (
       ID INT (11) NOT NULL AUTO_INCREMENT
     , CATEGORY_ID INT (11) NOT NULL
     , ISBN VARCHAR(13) NOT NULL
     , TITLE VARCHAR(500) NOT NULL
     , PRICE DECIMAL(4,2) NOT NULL	
  	 , UNIQUE UQ_BOOK_1 (ISBN, TITLE)
     , PRIMARY KEY (ID)
     , CONSTRAINT FK_CATEGORY FOREIGN KEY (CATEGORY_ID)
                  REFERENCES CATEGORY (ID)
);

show tables;

insert into category (name) values ('Business');
insert into category (name) values ('Finance');
insert into category (name) values ('Programming');
insert into category (name) values ('Health');

insert into book (CATEGORY_ID, ISBN, TITLE, PRICE) values (1, '9780307951', 'One hundred dollar startup', '1.99');
insert into book (CATEGORY_ID, ISBN, TITLE, PRICE) values (2, '0135058724', 'Trading Options at Expiration-Strategies and Models for Winning the Endgame', '59.99');
insert into book (CATEGORY_ID, ISBN, TITLE, PRICE) values (2, '0887308767', 'Pit bull : lessons from Wall Street\'s champion trader / Martin "Buzzy" Schwartz with Dave Morine and Paul Flint', '1.99');
insert into book (CATEGORY_ID, ISBN, TITLE, PRICE) values (3, '9781783987', 'Maven Build Customization [eBook]', '0.00');
insert into book (CATEGORY_ID, ISBN, TITLE, PRICE) values (4, '1403329974', 'THE AMAZING LIVER CLEANSE', '19.95');

-- Assignment 2.2
use books22db;

CREATE TABLE CATEGORY (
       ID INT (11) NOT NULL AUTO_INCREMENT
     , NAME VARCHAR(100) NOT NULL
     , PRIMARY KEY (ID)
);

CREATE TABLE BOOK (
       ID INT (11) NOT NULL AUTO_INCREMENT
     , CATEGORY_ID INT (11) NOT NULL
     , ISBN VARCHAR(13) NOT NULL
     , TITLE VARCHAR(500) NOT NULL
     , PRICE DECIMAL(4,2) NOT NULL  
     , VERSION INT(11) NOT NULL DEFAULT 0
     , UNIQUE UQ_BOOK_1 (ISBN, TITLE)
     , PRIMARY KEY (ID)
     , CONSTRAINT FK_CATEGORY FOREIGN KEY (CATEGORY_ID)
                  REFERENCES CATEGORY (ID)
);

CREATE TABLE AUTHOR (
       ID INT (11) NOT NULL AUTO_INCREMENT
     , FIRST_NAME VARCHAR (60) NOT NULL
     , LAST_NAME VARCHAR(60) NOT NULL
     , DESCRIPTION VARCHAR(1200) NOT NULL 
     , VERSION INT(11) NOT NULL DEFAULT 0
     , UNIQUE UQ_AUTHOR_1 (FIRST_NAME, LAST_NAME)
     , PRIMARY KEY (ID)
);

CREATE TABLE AUTHOR_BOOK (
       AUTHOR_ID INT (11) NOT NULL
     , BOOK_ID INT (11) NOT NULL
     , PRIMARY KEY (AUTHOR_ID, BOOK_ID)
     , CONSTRAINT FK_AUTHOR_BOOK_1 FOREIGN KEY (AUTHOR_ID)
              REFERENCES AUTHOR (ID) ON DELETE CASCADE
     , CONSTRAINT FK_AUTHOR_BOOK_2 FOREIGN KEY (BOOK_ID)
            REFERENCES BOOK (ID)
);

show tables;

insert into category (name) values ('Finance');
insert into category (name) values ('Business');
insert into category (name) values ('Health');
insert into category (name) values ('Programming');

insert into book (CATEGORY_ID, ISBN, TITLE, PRICE, VERSION) values ((select id from category where name = 'Business'), '0307951540', 'One hundred dollar startup', '1.99',0);
insert into book (CATEGORY_ID, ISBN, TITLE, PRICE, VERSION) values ((select id from category where name = 'Finance'), '0135058724', 'Trading Options at Expiration-Strategies and Models for Winning the Endgame', '59.99',0);
insert into book (CATEGORY_ID, ISBN, TITLE, PRICE, VERSION) values ((select id from category where name = 'Finance'), '0887308767', 'Pit bull : lessons from Wall Street\'s champion trader / Martin "Buzzy" Schwartz with Dave Morine and Paul Flint', '1.99',0);
insert into book (CATEGORY_ID, ISBN, TITLE, PRICE, VERSION) values ((select id from category where name = 'Programming'), '1783987221', 'Maven Build Customization [eBook]', '0.00',0);
insert into book (CATEGORY_ID, ISBN, TITLE, PRICE, VERSION) values ((select id from category where name = 'Health'), '1403329974', 'THE AMAZING LIVER CLEANSE', '19.95',0);
insert into book (CATEGORY_ID, ISBN, TITLE, PRICE, VERSION) values ((select id from category where name = 'Programming'), '0134757599', 'Refactoring: Improving the Design of Existing Code (2nd Edition)', '59.99',0);
insert into book (CATEGORY_ID, ISBN, TITLE, PRICE, VERSION) values ((select id from category where name = 'Programming'), '0321127420', 'Patterns of Enterprise Application Architecture', '69.99',0);

insert into author (first_name, last_name, description, version) values ('Jeff', 'Augen', 'Private investor and writer',0);
insert into author (first_name, last_name, description, version) values ('Chris', 'Guillebeau', 'Self made entrepreneur',0);
insert into author (first_name, last_name, description, version) values ('Martin', 'Schwartz', 'Champion trader',0);
insert into author (first_name, last_name, description, version) values ('Andreas', 'Moritz', 'Medical intuitive and practitioner of Ayurveda',0);
insert into author (first_name, last_name, description, version) values ('Giacomo', 'Veneri', 'Expert in computer-assisted diagnosis',0);
insert into author (first_name, last_name, description, version) values ('Lorenzo', 'Anardu', 'Developer and expert in optimization and high-performance computing',0);
insert into author (first_name, last_name, description, version) values ('Martin', 'Fowler', 'Chief Scientist at ThoughtWorks',0);

insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Chris' and last_name = 'Guillebeau'),
  (select id from book where isbn = '0307951540')
);
insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Jeff' and last_name = 'Augen'),
  (select id from book where isbn = '0135058724')
);
insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Martin' and last_name = 'Schwartz'),
  (select id from book where isbn = '0887308767')
);
insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Lorenzo' and last_name = 'Anardu'),
  (select id from book where isbn = '1783987221')
);
insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Giacomo' and last_name = 'Veneri'),
  (select id from book where isbn = '1783987221')
);
insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Andreas' and last_name = 'Moritz'),
  (select id from book where isbn = '1403329974')
);
insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Martin' and last_name = 'Fowler'),
  (select id from book where isbn = '0134757599')
);
insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Martin' and last_name = 'Fowler'),
  (select id from book where isbn = '0321127420')
);


-- Assignment 2.3
use books23db;


CREATE TABLE CATEGORY (
       ID INT (11) NOT NULL AUTO_INCREMENT
     , NAME VARCHAR(100) NOT NULL
     , PRIMARY KEY (ID)
);

CREATE TABLE BOOK (
       ID INT (11) NOT NULL AUTO_INCREMENT
     , CATEGORY_ID INT (11) NOT NULL
     , ISBN VARCHAR(13) NOT NULL
     , TITLE VARCHAR(500) NOT NULL
     , PRICE DECIMAL(4,2) NOT NULL  
     , VERSION INT(11) NOT NULL DEFAULT 0
     , UNIQUE UQ_BOOK_1 (ISBN, TITLE)
     , PRIMARY KEY (ID)
     , CONSTRAINT FK_CATEGORY FOREIGN KEY (CATEGORY_ID)
                  REFERENCES CATEGORY (ID)
);

CREATE TABLE AUTHOR (
       ID INT (11) NOT NULL AUTO_INCREMENT
     , FIRST_NAME VARCHAR (60) NOT NULL
     , LAST_NAME VARCHAR(60) NOT NULL
     , DESCRIPTION VARCHAR(1200) NOT NULL 
     , VERSION INT(11) NOT NULL DEFAULT 0
     , UNIQUE UQ_AUTHOR_1 (FIRST_NAME, LAST_NAME)
     , PRIMARY KEY (ID)
);

CREATE TABLE AUTHOR_BOOK (
       AUTHOR_ID INT (11) NOT NULL
     , BOOK_ID INT (11) NOT NULL
     , PRIMARY KEY (AUTHOR_ID, BOOK_ID)
     , CONSTRAINT FK_AUTHOR_BOOK_1 FOREIGN KEY (AUTHOR_ID)
              REFERENCES AUTHOR (ID) ON DELETE CASCADE
     , CONSTRAINT FK_AUTHOR_BOOK_2 FOREIGN KEY (BOOK_ID)
            REFERENCES BOOK (ID)
);

show tables;

insert into category (name) values ('Finance');
insert into category (name) values ('Business');
insert into category (name) values ('Health');
insert into category (name) values ('Programming');

insert into book (CATEGORY_ID, ISBN, TITLE, PRICE, VERSION) values ((select id from category where name = 'Business'), '0307951540', 'One hundred dollar startup', '1.99',0);
insert into book (CATEGORY_ID, ISBN, TITLE, PRICE, VERSION) values ((select id from category where name = 'Finance'), '0135058724', 'Trading Options at Expiration-Strategies and Models for Winning the Endgame', '59.99',0);
insert into book (CATEGORY_ID, ISBN, TITLE, PRICE, VERSION) values ((select id from category where name = 'Finance'), '0887308767', 'Pit bull : lessons from Wall Street\'s champion trader / Martin "Buzzy" Schwartz with Dave Morine and Paul Flint', '1.99',0);
insert into book (CATEGORY_ID, ISBN, TITLE, PRICE, VERSION) values ((select id from category where name = 'Programming'), '1783987221', 'Maven Build Customization [eBook]', '0.00',0);
insert into book (CATEGORY_ID, ISBN, TITLE, PRICE, VERSION) values ((select id from category where name = 'Health'), '1403329974', 'THE AMAZING LIVER CLEANSE', '19.95',0);
insert into book (CATEGORY_ID, ISBN, TITLE, PRICE, VERSION) values ((select id from category where name = 'Programming'), '0134757599', 'Refactoring: Improving the Design of Existing Code (2nd Edition)', '59.99',0);
insert into book (CATEGORY_ID, ISBN, TITLE, PRICE, VERSION) values ((select id from category where name = 'Programming'), '0321127420', 'Patterns of Enterprise Application Architecture', '69.99',0);

insert into author (first_name, last_name, description, version) values ('Jeff', 'Augen', 'Private investor and writer',0);
insert into author (first_name, last_name, description, version) values ('Chris', 'Guillebeau', 'Self made entrepreneur',0);
insert into author (first_name, last_name, description, version) values ('Martin', 'Schwartz', 'Champion trader',0);
insert into author (first_name, last_name, description, version) values ('Andreas', 'Moritz', 'Medical intuitive and practitioner of Ayurveda',0);
insert into author (first_name, last_name, description, version) values ('Giacomo', 'Veneri', 'Expert in computer-assisted diagnosis',0);
insert into author (first_name, last_name, description, version) values ('Lorenzo', 'Anardu', 'Developer and expert in optimization and high-performance computing',0);
insert into author (first_name, last_name, description, version) values ('Martin', 'Fowler', 'Chief Scientist at ThoughtWorks',0);

insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Chris' and last_name = 'Guillebeau'),
  (select id from book where isbn = '0307951540')
);
insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Jeff' and last_name = 'Augen'),
  (select id from book where isbn = '0135058724')
);
insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Martin' and last_name = 'Schwartz'),
  (select id from book where isbn = '0887308767')
);
insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Lorenzo' and last_name = 'Anardu'),
  (select id from book where isbn = '1783987221')
);
insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Giacomo' and last_name = 'Veneri'),
  (select id from book where isbn = '1783987221')
);
insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Andreas' and last_name = 'Moritz'),
  (select id from book where isbn = '1403329974')
);
insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Martin' and last_name = 'Fowler'),
  (select id from book where isbn = '0134757599')
);
insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Martin' and last_name = 'Fowler'),
  (select id from book where isbn = '0321127420')
);

-- Assignment 2.4
use books24db;


CREATE TABLE CATEGORY (
       ID INT (11) NOT NULL AUTO_INCREMENT
     , NAME VARCHAR(100) NOT NULL
     , PRIMARY KEY (ID)
);

CREATE TABLE BOOK (
       ID INT (11) NOT NULL AUTO_INCREMENT
     , CATEGORY_ID INT (11) NOT NULL
     , ISBN VARCHAR(13) NOT NULL
     , TITLE VARCHAR(500) NOT NULL
     , PRICE DECIMAL(4,2) NOT NULL  
     , VERSION INT(11) NOT NULL DEFAULT 0
     , UNIQUE UQ_BOOK_1 (ISBN, TITLE)
     , PRIMARY KEY (ID)
     , CONSTRAINT FK_CATEGORY FOREIGN KEY (CATEGORY_ID)
                  REFERENCES CATEGORY (ID)
);

CREATE TABLE AUTHOR (
       ID INT (11) NOT NULL AUTO_INCREMENT
     , FIRST_NAME VARCHAR (60) NOT NULL
     , LAST_NAME VARCHAR(60) NOT NULL
     , DESCRIPTION VARCHAR(1200) NOT NULL 
     , VERSION INT(11) NOT NULL DEFAULT 0
     , UNIQUE UQ_AUTHOR_1 (FIRST_NAME, LAST_NAME)
     , PRIMARY KEY (ID)
);

CREATE TABLE AUTHOR_BOOK (
       AUTHOR_ID INT (11) NOT NULL
     , BOOK_ID INT (11) NOT NULL
     , PRIMARY KEY (AUTHOR_ID, BOOK_ID)
     , CONSTRAINT FK_AUTHOR_BOOK_1 FOREIGN KEY (AUTHOR_ID)
              REFERENCES AUTHOR (ID) ON DELETE CASCADE
     , CONSTRAINT FK_AUTHOR_BOOK_2 FOREIGN KEY (BOOK_ID)
            REFERENCES BOOK (ID)
);

show tables;

insert into category (name) values ('Finance');
insert into category (name) values ('Business');
insert into category (name) values ('Health');
insert into category (name) values ('Programming');

insert into book (CATEGORY_ID, ISBN, TITLE, PRICE, VERSION) values ((select id from category where name = 'Business'), '0307951540', 'One hundred dollar startup', '1.99',0);
insert into book (CATEGORY_ID, ISBN, TITLE, PRICE, VERSION) values ((select id from category where name = 'Finance'), '0135058724', 'Trading Options at Expiration-Strategies and Models for Winning the Endgame', '59.99',0);
insert into book (CATEGORY_ID, ISBN, TITLE, PRICE, VERSION) values ((select id from category where name = 'Finance'), '0887308767', 'Pit bull : lessons from Wall Street\'s champion trader / Martin "Buzzy" Schwartz with Dave Morine and Paul Flint', '1.99',0);
insert into book (CATEGORY_ID, ISBN, TITLE, PRICE, VERSION) values ((select id from category where name = 'Programming'), '1783987221', 'Maven Build Customization [eBook]', '0.00',0);
insert into book (CATEGORY_ID, ISBN, TITLE, PRICE, VERSION) values ((select id from category where name = 'Health'), '1403329974', 'THE AMAZING LIVER CLEANSE', '19.95',0);
insert into book (CATEGORY_ID, ISBN, TITLE, PRICE, VERSION) values ((select id from category where name = 'Programming'), '0134757599', 'Refactoring: Improving the Design of Existing Code (2nd Edition)', '59.99',0);
insert into book (CATEGORY_ID, ISBN, TITLE, PRICE, VERSION) values ((select id from category where name = 'Programming'), '0321127420', 'Patterns of Enterprise Application Architecture', '69.99',0);

insert into author (first_name, last_name, description, version) values ('Jeff', 'Augen', 'Private investor and writer',0);
insert into author (first_name, last_name, description, version) values ('Chris', 'Guillebeau', 'Self made entrepreneur',0);
insert into author (first_name, last_name, description, version) values ('Martin', 'Schwartz', 'Champion trader',0);
insert into author (first_name, last_name, description, version) values ('Andreas', 'Moritz', 'Medical intuitive and practitioner of Ayurveda',0);
insert into author (first_name, last_name, description, version) values ('Giacomo', 'Veneri', 'Expert in computer-assisted diagnosis',0);
insert into author (first_name, last_name, description, version) values ('Lorenzo', 'Anardu', 'Developer and expert in optimization and high-performance computing',0);
insert into author (first_name, last_name, description, version) values ('Martin', 'Fowler', 'Chief Scientist at ThoughtWorks',0);

insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Chris' and last_name = 'Guillebeau'),
  (select id from book where isbn = '0307951540')
);
insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Jeff' and last_name = 'Augen'),
  (select id from book where isbn = '0135058724')
);
insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Martin' and last_name = 'Schwartz'),
  (select id from book where isbn = '0887308767')
);
insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Lorenzo' and last_name = 'Anardu'),
  (select id from book where isbn = '1783987221')
);
insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Giacomo' and last_name = 'Veneri'),
  (select id from book where isbn = '1783987221')
);
insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Andreas' and last_name = 'Moritz'),
  (select id from book where isbn = '1403329974')
);
insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Martin' and last_name = 'Fowler'),
  (select id from book where isbn = '0134757599')
);
insert into author_book (author_id, book_id) values(
  (select id from author where first_name = 'Martin' and last_name = 'Fowler'),
  (select id from book where isbn = '0321127420')
);


