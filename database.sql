CREATE TABLE item(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(1023) NOT NULL,
    price FLOAT NOT NULL,

    PRIMARY KEY(id)
) ENGINE=InnoDB;

CREATE TABLE item_image(
    id INT NOT NULL AUTO_INCREMENT,
    item_id INT NOT NULL,
    filename VARCHAR(255) NOT NULL,

    PRIMARY KEY(id),
    FOREIGN KEY(item_id) REFERENCES item(id) ON DELETE CASCADE
) ENGINE=InnoDB;


INSERT INTO item(name, description, price) VALUES('BMW 320', 'BMW 320 xDrive 124kW', 15000.000);
SET @item_id = LAST_INSERT_ID();
INSERT INTO item_image(item_id, filename) VALUES(@item_id, 'bmw.jpg');


INSERT INTO item(name, description, price) VALUES('Audi A3', 'Audi A3 Sportback 112kW', 30000.0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO item_image(item_id, filename) VALUES(@item_id, 'audi.jpg');


INSERT INTO item(name, description, price) VALUES('Mercedes CLS', 'Mercedes-Benz CLS-class 240kW', 65040.21);
SET @item_id = LAST_INSERT_ID();
INSERT INTO item_image(item_id, filename) VALUES(@item_id, 'mercedes.jpg');



CREATE TABLE user(
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    username VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,

    PRIMARY KEY(id)
) ENGINE=InnoDB;


CREATE TABLE cart_order(
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(id),
    FOREIGN KEY(user_id) REFERENCES user(id)
) ENGINE=InnoDB;

CREATE TABLE cart_order_item(
    id INT NOT NULL AUTO_INCREMENT,
    cart_order_id INT NOT NULL,
    item_id INT NOT NULL,

    PRIMARY KEY(id),
    FOREIGN KEY(cart_order_id) REFERENCES cart_order(id),
    FOREIGN KEY(item_id) REFERENCES item(id)
) ENGINE=InnoDB;
