/*============================================================================================================*/
/*DDL Queries*/
/*============================================================================================================*/

/*Create tblUser*/
CREATE TABLE tblUser (
	UserID UNIQUEIDENTIFIER PRIMARY KEY,
	Name VARCHAR(60) NOT NULL,
	Phone VARCHAR(10) NOT NULL UNIQUE,
	Password VARCHAR(100) NOT NULL
)

/*Create tblAddress*/
CREATE TABLE tblAddress(
	AddressID UNIQUEIDENTIFIER PRIMARY KEY,
	UserID UNIQUEIDENTIFIER NOT NULL,
	Name VARCHAR(100) NOT NULL,
	Phone VARCHAR(10) NOT NULL UNIQUE,
	Pincode VARCHAR(10) NOT NULL,
	Address VARCHAR(200) NOT NULL,
	City VARCHAR(70) NOT NULL,
	State VARCHAR(70) NOT NULL
)

ALTER TABLE tblAddress
ADD CONSTRAINT FK_tblAddress_tblUser FOREIGN KEY (UserID)
REFERENCES tblUser(UserID)

/*Create tblCategory*/
CREATE TABLE tblCategory (
	CategoryID UNIQUEIDENTIFIER PRIMARY KEY,
	CategoryName VARCHAR(100) NOT NULL,
	IsActive BIT DEFAULT 'TRUE'
)

/*Create tblBrand*/
CREATE TABLE tblBrand (
	BrandID UNIQUEIDENTIFIER PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
	CategoryID UNIQUEIDENTIFIER NOT NULL,
	IsActive BIT DEFAULT 'TRUE'
)

ALTER TABLE tblBrand
ADD CONSTRAINT FK_tblBrand_tblCategory FOREIGN KEY (CategoryID)
REFERENCES tblCategory(CategoryID)


/*Create tblProduct*/
CREATE TABLE tblProduct (
	ProductID UNIQUEIDENTIFIER PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
	Image VARCHAR(100) NOT NULL,
	Stock INT NOT NULL DEFAULT 0,
	Price DECIMAL(11,4) NOT NULL,
	BrandID UNIQUEIDENTIFIER NOT NULL,
	CategoryID UNIQUEIDENTIFIER NOT NULL,
	IsActive BIT DEFAULT 'TRUE'
)

ALTER TABLE tblProduct
ADD CONSTRAINT FK_tblProduct_tblCategory FOREIGN KEY (CategoryID)
REFERENCES tblCategory(CategoryID)

ALTER TABLE tblProduct
ADD CONSTRAINT FK_tblProduct_tblBrand FOREIGN KEY (BrandID)
REFERENCES tblBrand(BrandID)


/*Create tblCart*/
CREATE TABLE tblCart (
	UserID UNIQUEIDENTIFIER NOT NULL,
	ProduuctID UNIQUEIDENTIFIER NOT NULL,
	Quantity INT NOT NULL
)


ALTER TABLE tblCart
ADD CONSTRAINT FK_tblCart_tblUser FOREIGN KEY (UserID)
REFERENCES tblUser(UserID)

ALTER TABLE tblCart
ADD CONSTRAINT FK_tblCart_tblProduct FOREIGN KEY (ProductID)
REFERENCES tblProduct(ProductID)


/*Create tblOrder*/
CREATE TABLE tblOrder (
	OrderID UNIQUEIDENTIFIER PRIMARY KEY,
	ProductID UNIQUEIDENTIFIER NOT NULL,
	Quantity INT NOT NULL
)

ALTER TABLE tblOrder
ADD CONSTRAINT FK_tblOrder_tblProduct FOREIGN KEY (ProductID)
REFERENCES tblProduct(ProductID)



/*Create tblOrderMap*/
CREATE TABLE tblOrderMap (
	OrderID UNIQUEIDENTIFIER NOT NULL,
	UserID UNIQUEIDENTIFIER NOT NULL,
	AddressID UNIQUEIDENTIFIER NOT NULL
)

ALTER TABLE tblOrderMap
ADD CONSTRAINT FK_tblOrderMap_tblOrder FOREIGN KEY (OrderID)
REFERENCES tblOrder(OrderID)

ALTER TABLE tblOrderMap
ADD CONSTRAINT FK_tblOrderMap_tblUser FOREIGN KEY (UserID)
REFERENCES tblUser(UserID)

ALTER TABLE tblOrderMap
ADD CONSTRAINT FK_tblOrderMap_tblAddress FOREIGN KEY (AddressID)
REFERENCES tblAddress(AddressID)



/*============================================================================================================*/
/*DML Queries*/
/*============================================================================================================*/

/*User Signup*/
INSERT INTO
	tblUser (UserID, Name, Phone, Password)
VALUES (
	NEWID(),
	'James Simmermon',
	'9922961765',
	'HashedStringOfPassword'
)

/*User SignIn*/
SELECT * FROM
	tblUser
WHERE
	Phone = '9922961765'


/*Create Address*/
INSERT INTO
	tblAddress (AddressID, UserID, Name, Phone, Pincode, Address, City, State)
VALUES (
	NEWID(),
	'ABC123',
	'Nick Leo',
	'9876543210',
	'422077',
	'Ram Baugh Colony, RajNagar',
	'Pune',
	'Maharashtra'
)

/*Read Address*/
SELECT * FROM
	tblAddress
WHERE
	UserID = 'ABC123'

/*Delete Address*/
DELETE FROM tblAddress
WHERE AddressID = 'XYZ987'


/*Create Category*/
INSERT INTO
	tblCategory (CategoryID, Name, IsActive)
VALUES (
	NEWID(),
	'Mobile',
	true
)

/*Read Category*/
SELECT *
FROM tblCategory
WHERE IsActive = true

/*Temporary disable category*/
UPDATE tblCategory
SET IsActive = false
WHERE CategoryID = 'LMN567'


/*Create Brand*/
INSERT INTO
	tblBrand (BrandID, Name, IsActive, CategoryID)
VALUES (
	NEWID(),
	'One Plus',
	true,
	'LMN567'
)

/*Read Brand*/
SELECT *
FROM tblBrand
WHERE IsActive = true

/*Read Brand with for Category*/
SELECT *
FROM tblBrand
WHERE CategoryID = 'LMN567' AND IsActive = true


/*Create Product*/
INSERT INTO
	tblProduct (ProductID, Name, Image, Stock, Price, BrandID, CategoryID, IsActive)
VALUES (
	NEWID(),
	'One Plus Nord',
	'/image/773343.jpg',
	77,
	35999,
	'GHJ567',
	'LMN567',
	true
)

/*Read Products*/
SELECT *
FROM tblProduct
WHERE IsActive = true

/*Read Products for a specific Category*/
SELECT *
FROM tblProduct
WHERE CategoryID = 'LMN567' AND IsActive = true


/*Add to Cart*/
INSERT INTO
	tblCart (UserID, ProductID, Quantity)
VALUES (
	'ABC123',
	'PROD334',
	2
)


/*Check out*/
INSERT INTO
	OrderMap (OrderID, UserID, AddressID)
VALUES (
	NEWID(),
	'ABC123',
	'XYZ987'
)

INSERT INTO
	Orders (OrderID, ProductID, Quantity)
VALUES (
	'ODDR678',
	'PROD334',
	2
)

-- Emptying the Cart after order is placed
DELETE FROM tblCart
WHERE UserID = 'ABC123'