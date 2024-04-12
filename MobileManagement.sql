--Mobile
CREATE TABLE tbl_Mobile (
    mobileId VARCHAR(10) PRIMARY KEY,
    description VARCHAR(250) NOT NULL,
    price FLOAT,
    mobileName VARCHAR(20) NOT NULL,
    yearOfProduction INT,
    quantity INT,
    notSale BIT
);

INSERT INTO tbl_Mobile (mobileId, description, price, mobileName, yearOfProduction, quantity, notSale) 
VALUES 
    ('M001', 'Smartphone with high-resolution display', 599.99, 'Samsung Galaxy S20', 2020, 50, 0),
    ('M002', 'Budget-friendly smartphone with decent features', 299.99, 'Xiaomi Redmi Note 9', 2021, 100, 0),
    ('M003', 'Flagship smartphone with top-of-the-line camera', 999.99, 'iPhone 13 Pro', 2022, 30, 0),
    ('M004', 'Mid-range smartphone with long battery life', 499.99, 'Google Pixel 5', 2020, 40, 0),
    ('M005', 'Entry-level smartphone with basic features', 199.99, 'Nokia 2.4', 2020, 80, 0);

--User
CREATE TABLE tbl_User (
    userId VARCHAR(20) PRIMARY KEY,
    password INT NOT NULL,
    fullName VARCHAR(50) NOT NULL,
    role INT CHECK(role IN (0, 1, 2))
);

--
INSERT INTO tbl_User (userId, password, fullName, role)
VALUES
    ('bao', 123, 'JBao Nguyen', 0),  -- role 0: user
    ('moderator', 123, 'Moderator', 1), -- role 1: manager
    ('hao', 123, 'Hao Nguyen', 2), -- role 2:  admin
	('hoang', 123, 'Hoang Nguyen', 2); -- role 2:  admin

--Order
CREATE TABLE tbl_Order (
    orderId INT PRIMARY KEY IDENTITY(1,1),
    userId VARCHAR(20),
    CONSTRAINT FK_User_Order FOREIGN KEY (userId) REFERENCES tbl_User(userId)
);
--OrderItem
CREATE TABLE tbl_OrderItem (
    orderItemId INT PRIMARY KEY IDENTITY(1,1),
    orderId INT,
    mobileId VARCHAR(10),
    quantity INT,
    CONSTRAINT FK_Order_OrderItem FOREIGN KEY (orderId) REFERENCES tbl_Order(orderId),
    CONSTRAINT FK_Mobile_OrderItem FOREIGN KEY (mobileId) REFERENCES tbl_Mobile(mobileId)
);
