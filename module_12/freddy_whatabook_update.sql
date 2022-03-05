/*
    Title: whatabook.init.sql
    Author: Professor Kramer
    Date: 19 February 2022
    Description: WhatABook database initialization script.
*/

-- drop test user if exists 
DROP USER IF EXISTS 'whatabook_user'@'localhost';

-- create whatabook_user and grant them all privileges to the whatabook database 
CREATE USER 'whatabook_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';

-- grant all privileges to the whatabook database to user whatabook_user on localhost 
GRANT ALL PRIVILEGES ON whatabook.* TO'whatabook_user'@'localhost';

-- drop contstraints if they exist
ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;

-- drop tables if they exist
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS user;

/*
    Create table(s)
*/
CREATE TABLE store (
    store_id    INT             NOT NULL    AUTO_INCREMENT,
    locale      VARCHAR(500)    NOT NULL,
    PRIMARY KEY(store_id)
);

CREATE TABLE book (
    book_id     INT             NOT NULL    AUTO_INCREMENT,
    book_name   VARCHAR(200)    NOT NULL,
    author      VARCHAR(200)    NOT NULL,
    details     VARCHAR(500),
    PRIMARY KEY(book_id)
);

CREATE TABLE user (
    user_id         INT         NOT NULL    AUTO_INCREMENT,
    first_name      VARCHAR(75) NOT NULL,
    last_name       VARCHAR(75) NOT NULL,
    PRIMARY KEY(user_id) 
);

CREATE TABLE wishlist (
    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,
    user_id         INT         NOT NULL,
    book_id         INT         NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
        REFERENCES book(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id)
        REFERENCES user(user_Id)
);

/*
    insert store record 
*/
INSERT INTO store(locale)
    VALUES('Brookstone, Store 19');

/*
    insert book records 
*/
INSERT INTO book(book_name, author, details)
    VALUES('Mr Hockey, My Story', 'Gordie Howe', 'Red Wings Classic');

INSERT INTO book(book_name, author, details)
    VALUES('Tough Guy, Life on the Edge', 'Bob Probert', 'Red Wings Classic 2');

INSERT INTO book(book_name, author, details)
    VALUES('99, Stories of the Game', 'Wayne Gretzky', "The Great One");

INSERT INTO book(book_name, author)
    VALUES('Yzerman, The Making of a Champion', 'Steve Yzerman');

INSERT INTO book(book_name, author)
    VALUES('My Last Fight', 'Darren McCarty');

INSERT INTO book(book_name, author)
    VALUES("The Final Call", 'Kerry Fraser');

INSERT INTO book(book_name, author)
    VALUES('Between The Pipes', 'Randi Druzzin');

INSERT INTO book(book_name, author)
    VALUES('Scotty, A Hockey Life Like No Other', 'Ken Dryden');

INSERT INTO book(book_name, author)
    VALUES('Orr, My Story', 'Bobby Orr');

/*
    insert user
*/ 
INSERT INTO user(first_name, last_name) 
    VALUES('Tom', 'Frederick');

INSERT INTO user(first_name, last_name)
    VALUES('Maggie', 'Frederick');

INSERT INTO user(first_name, last_name)
    VALUES('Cass', 'Frederick');

/*
    insert wishlist records 
*/
INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Tom'), 
        (SELECT book_id FROM book WHERE book_name = 'Mr Hockey, My Story')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Maggie'),
        (SELECT book_id FROM book WHERE book_name = 'Yzerman, The Making of a Champion')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Cass'),
        (SELECT book_id FROM book WHERE book_name = 'Tough Guy, Life on the Edge')
    );
