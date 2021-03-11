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