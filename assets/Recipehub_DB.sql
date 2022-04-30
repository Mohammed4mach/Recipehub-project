/*

    - user [id, email, username, password, DoB, crDate, gender, country, city, picture, age]

    - restaurant [id, email, username, password, crDate, DoC, site]

    - res_location [resId, xCoord, yCoord]

    - res_phone [resId, phone]

    - menu [id, title]

    - product [id, userId, name, picture, crDate, price]

    - recipe [id, prodId, ingredients, time, cost, method, video]

    - category [id, prodId, name, picture, region, country]

    - admin [id, email, username, password, picture, country, city]

    - favorite [userId, prodId]

    - comment [userId, proId]

    - like [userId, prodId]

    - follow [userId, resId]

    - res_menu [resId, menuId, prodId]

*/

CREATE DATABASE recipehub

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
        site VARCHAR(255) UNIQUE
    );

CREATE TABLE res_location
    (
        resId INT(9) UNSIGNED PRIMARY KEY,
        xCoord

    );
