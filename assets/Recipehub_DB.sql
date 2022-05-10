/*
    Tables Structure:

    - user [id, email, username, password, DoB, crDate, gender, country, city, picture, age]

    - restaurant [id, email, username, password, crDate, DoC, site]

    - res_location [resId, xCoord, yCoord]

    - res_phone [resId, phone]

    - menu [id, title]

    - product [id, userId, name, picture, crDate, price, catId]

    - recipe [id, prodId, userId, ingredients, time, cost, method, video, picture]

    - category [id, name, picture, region, country]

    - admin [id, email, username, password, picture, country]

    - favorite [userId, prodId]

    - comment [userId, proId, content]

    - like [userId, prodId]

    - follow_res [flwr_userId, flw_resId]
    
    - follow_usr [flwr_userId, flw_userId]

    - res_menu [resId, menuId, prodId]

*/
CREATE DATABASE recipehub;

USE recipehub;

CREATE TABLE user
    (
        user_id INT(9) UNSIGNED PRIMARY KEY,
        email VARCHAR(130) NOT NULL UNIQUE,
        username VARCHAR(130) NOT NULL,
        password VARCHAR(150) NOT NULL,
        birth_date TIMESTAMP NOT NULL,
        create_date TIMESTAMP NOT NULL,
        gender CHAR NOT NULL,
        country VARCHAR(52) NOT NULL,
        city VARCHAR(35) NOT NULL,
        picture VARCHAR(255) UNIQUE,
        age INT(3) NOT NULL
    );

CREATE TABLE restaurant
    (
        res_id INT(9) UNSIGNED PRIMARY KEY,
        email VARCHAR(130) NOT NULL UNIQUE,
        username VARCHAR(130) NOT NULL,
        password VARCHAR(150) NOT NULL,
        create_date TIMESTAMP NOT NULL,
        date_of_creation TIMESTAMP NOT NULL,
        picture VARCHAR(255) UNIQUE,
        site VARCHAR(255) UNIQUE
    );

CREATE TABLE res_location
    (
        res_id INT(9) UNSIGNED PRIMARY KEY,
        latitude DECIMAL(10, 7),
        longitude DECIMAL(10, 7),
        country VARCHAR(52) NOT NULL,
        city VARCHAR(35) NOT NULL,
        FOREIGN KEY(res_id) REFERENCES restaurant(res_id) ON DELETE CASCADE
    );

CREATE TABLE res_phone
    (
        res_id INT(9) UNSIGNED PRIMARY KEY,
        phone VARCHAR(20) NOT NULL UNIQUE,
        FOREIGN KEY(res_id) REFERENCES restaurant(res_id) ON DELETE CASCADE
    );

CREATE TABLE menu
    (
        menu_id INT(9) UNSIGNED PRIMARY KEY,
        title VARCHAR(200) NOT NULL
    );

CREATE TABLE category
    (
        cat_id INT(9) UNSIGNED PRIMARY KEY,
        name VARCHAR(200) NOT NULL,
        picture VARCHAR(255) UNIQUE,
        region VARCHAR(100),
        country VARCHAR(52)
    );

CREATE TABLE product
    (
        prod_id INT(9) UNSIGNED PRIMARY KEY,
        user_id INT(9) UNSIGNED,
        res_id INT(9) UNSIGNED,
        cat_id INT(9) UNSIGNED,
        name VARCHAR(200) NOT NULL,
        picture VARCHAR(255) UNIQUE,
        create_date TIMESTAMP NOT NULL,
        price DECIMAL(6, 2),
        FOREIGN KEY(user_id) REFERENCES user(user_id) ON DELETE CASCADE,
        FOREIGN KEY(res_id) REFERENCES restaurant(res_id) ON DELETE CASCADE,
        FOREIGN KEY(cat_id) REFERENCES category(cat_id) ON DELETE CASCADE
    );

CREATE TABLE recipe
    (
        rec_id INT(9) UNSIGNED PRIMARY KEY,
        prod_id INT(9) UNSIGNED,
        user_id INT(9) UNSIGNED,
        res_id INT(9) UNSIGNED,
        ingredients TEXT(2500) NOT NULL,
        time INT(4),
        cost DECIMAL(6, 2),
        method TEXT(10000),
        video VARCHAR(255),
        picture VARCHAR(255),
        FOREIGN KEY(prod_id) REFERENCES product(prod_id) ON DELETE CASCADE,
        FOREIGN KEY(user_id) REFERENCES user(user_id) ON DELETE CASCADE,
        FOREIGN KEY(res_id) REFERENCES restaurant(res_id) ON DELETE CASCADE
    );

CREATE TABLE admin
    (
        admin_id INT(9) UNSIGNED PRIMARY KEY,
        email VARCHAR(130) NOT NULL UNIQUE,
        username VARCHAR(130) NOT NULL,
        password VARCHAR(150) NOT NULL,
        country VARCHAR(52) NOT NULL,
        picture VARCHAR(255) UNIQUE
    );

CREATE TABLE favorite
    (
        user_id INT(9) UNSIGNED,
        prod_id INT(9) UNSIGNED,
        FOREIGN KEY(user_id) REFERENCES user(user_id) ON DELETE CASCADE,
        FOREIGN KEY(prod_id) REFERENCES product(prod_id) ON DELETE CASCADE,
        CONSTRAINT pk_favorite PRIMARY KEY(user_id, prod_id)
    );

CREATE TABLE comment
    (
        user_id INT(9) UNSIGNED,
        prod_id INT(9) UNSIGNED,
        content TEXT(10000),
        FOREIGN KEY(user_id) REFERENCES user(user_id) ON DELETE CASCADE,
        FOREIGN KEY(prod_id) REFERENCES product(prod_id) ON DELETE CASCADE,
        CONSTRAINT pk_comment PRIMARY KEY(user_id, prod_id)
    );

CREATE TABLE likes
    (
        user_id INT(9) UNSIGNED,
        prod_id INT(9) UNSIGNED,
        FOREIGN KEY(user_id) REFERENCES user(user_id) ON DELETE CASCADE,
        FOREIGN KEY(prod_id) REFERENCES product(prod_id) ON DELETE CASCADE,
        CONSTRAINT pk_like PRIMARY KEY(user_id, prod_id)
    );

CREATE TABLE follow_res
    (
        flwr_user_id INT(9) UNSIGNED,
        flw_res_id INT(9) UNSIGNED,
        FOREIGN KEY(flwr_user_id) REFERENCES user(user_id) ON DELETE CASCADE,
        FOREIGN KEY(flw_res_id) REFERENCES restaurant(res_id) ON DELETE CASCADE,
        CONSTRAINT pk_follow PRIMARY KEY(flwr_user_id, flw_res_id)
    );

CREATE TABLE follow_usr
    (
        flwr_user_id INT(9) UNSIGNED,
        flw_user_id INT(9) UNSIGNED,
        FOREIGN KEY(flwr_user_id) REFERENCES user(user_id) ON DELETE CASCADE,
        FOREIGN KEY(flw_user_id) REFERENCES user(user_id) ON DELETE CASCADE,
        CONSTRAINT pk_follow PRIMARY KEY(flwr_user_id, flw_user_id)
    );

CREATE TABLE res_menu
    (
        res_id INT(9) UNSIGNED,
        menu_id INT(9) UNSIGNED,
        prod_id INT(9) UNSIGNED,
        FOREIGN KEY(res_id) REFERENCES restaurant(res_id) ON DELETE CASCADE,
        FOREIGN KEY(menu_id) REFERENCES menu(menu_id) ON DELETE CASCADE,
        FOREIGN KEY(prod_id) REFERENCES product(prod_id) ON DELETE CASCADE,
        CONSTRAINT pk_res_menu PRIMARY KEY(res_id, menu_id, prod_id)
    );
    
INSERT INTO user VALUES
	(
		1,
		"hmoomh15@gmail.com",
		"hmoomh15",
        "pass123",
		STR_TO_DATE("04-13-2000 11:30:00", "%m-%d-%Y %H:%i:%s"),
        STR_TO_DATE("05-07-2022 19:38:00", "%m-%d-%Y %H:%i:%s"),
        'M',
        "Egypt",
        "Alexandria",
        NULL,
        22
	);
