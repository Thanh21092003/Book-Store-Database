DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS BookAuthors;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Stores;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Publishers;

CREATE TABLE Authors (
    authorid VARCHAR(10),
    author_name VARCHAR(255),
    PRIMARY KEY (authorid)
);

CREATE TABLE Categories (
    category_code VARCHAR(10),
    category_description VARCHAR(255),
    PRIMARY KEY (category_code)
);

CREATE TABLE Publishers (
    pub_code VARCHAR(10),
    pub_name VARCHAR(255),
    pub_address VARCHAR(255),
    PRIMARY KEY (pub_code)
);

CREATE TABLE Books (
    bkcode VARCHAR(10),
    bktitle VARCHAR(255),
    cost DECIMAL(10, 2),
    pub_year INT,
    reorder_point INT,
    category_code VARCHAR(10),
    pub_code VARCHAR(10),
    PRIMARY KEY (bkcode),
    FOREIGN KEY (category_code) REFERENCES Categories(category_code),
    FOREIGN KEY (pub_code) REFERENCES Publishers(pub_code)
);

CREATE TABLE Inventory (
    bkcode VARCHAR(10),
    in_stock_1 INT,
    in_stock_2 INT,
    in_stock_3 INT,
    in_stock_4 INT,
    in_stock_total INT,
    PRIMARY KEY (bkcode),
    FOREIGN KEY (bkcode) REFERENCES Books(bkcode)
);

CREATE TABLE BookAuthors (
    bkcode VARCHAR(10),
    authorid VARCHAR(10),
    PRIMARY KEY (bkcode, authorid),
    FOREIGN KEY (bkcode) REFERENCES Books(bkcode),
    FOREIGN KEY (authorid) REFERENCES Authors(authorid)
);

CREATE TABLE Stores (
    StoreID INT,
    Store_name VARCHAR(255),
    Street_address VARCHAR(255),
    pub_code VARCHAR(10),
    PRIMARY KEY (StoreID),
    FOREIGN KEY (pub_code) REFERENCES Publishers(pub_code)
);
