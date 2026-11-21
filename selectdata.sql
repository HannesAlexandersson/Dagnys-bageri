SELECT * FROM Orders;

-- select all purchases of all orders
SELECT
    Orders.Id AS OrderId,
    Orders.orderdate,
    Supplies.name AS Supply,
    Purchases.quantity,
    Purchases.purchaseprice
FROM Orders
JOIN Purchases ON Orders.Id = Purchases.order_id
JOIN Supplies ON Purchases.supply_id = Supplies.Id
ORDER BY Orders.orderdate DESC;

-- select all purchases of a specfic order 
SELECT
    Orders.Id AS OrderId,
    Orders.orderdate,
    Supplies.name AS Supply,
    Purchases.quantity,
    Purchases.purchaseprice
FROM Orders
JOIN Purchases ON Orders.Id = Purchases.order_id
JOIN Supplies ON Purchases.supply_id = Supplies.Id
WHERE Orders.Id = 2
ORDER BY Orders.orderdate DESC;

-- test that the prices are correct, the total of all puchases in aorder should be the same as what the order column of orderprice says
SELECT
    Orders.Id,
    Orders.orderdate,
    SUM(Purchases.purchaseprice) AS total_price_of_purchases,
    Orders.orderprice
FROM Orders
JOIN Purchases ON Orders.Id = Purchases.order_id
GROUP BY Orders.Id;


SELECT * FROM Purchases;

-- get all purchase data from each of the three orders
SELECT
    Orders.Id AS OrderId,
    Orders.orderdate,
    Suppliers.name AS Supplier,
    Supplies.artickelnumber AS ArticleNumber,
    Supplies.name AS Supply,
    Supplies.price_per_kg AS PricePerKg,
    Purchases.quantity,
    Purchases.purchaseprice
FROM Purchases
INNER JOIN Orders
    ON Purchases.order_id = Orders.Id
INNER JOIN Supplies
    ON Purchases.supply_id = Supplies.Id
INNER JOIN Suppliers
    ON Supplies.supplier_id = Suppliers.Id
ORDER BY Orders.orderdate DESC;

-- fetch all purchases from a specific supplier
SELECT
    Suppliers.name AS Supplier,
    Orders.orderdate,
    Supplies.name AS Supply,
    Purchases.quantity,
    Supplies.price_per_kg,
    Purchases.purchaseprice
FROM Purchases
INNER JOIN Orders
    ON Purchases.order_id = Orders.Id
INNER JOIN Supplies
    ON Purchases.supply_id = Supplies.Id
INNER JOIN Suppliers
    ON Supplies.supplier_id = Suppliers.Id
WHERE Suppliers.name = 'Sockerbetan AB'
ORDER BY Orders.orderdate DESC;

-- calculate total purchases, or total spent  per supplier
SELECT
    Suppliers.name AS Supplier,
    COUNT(Purchases.Id) AS NumberOfPurchases,
    SUM(Purchases.quantity) AS TotalQuantity,
    SUM(Purchases.purchaseprice) AS TotalSpent
FROM Purchases
INNER JOIN Supplies
    ON Purchases.supply_id = Supplies.Id
INNER JOIN Suppliers
    ON Supplies.supplier_id = Suppliers.Id
GROUP BY Suppliers.Id
ORDER BY TotalSpent DESC;

-- calculate total spending per raw material
SELECT
    Supplies.name AS Supply,
    Suppliers.name AS Supplier,
    SUM(Purchases.quantity) AS TotalQuantityPurchased,
    SUM(Purchases.purchaseprice) AS TotalSpent
FROM Purchases
INNER JOIN Supplies
    ON Purchases.supply_id = Supplies.Id
INNER JOIN Suppliers
    ON Supplies.supplier_id = Suppliers.Id
GROUP BY Supplies.Id
ORDER BY TotalSpent DESC

-- test that I have inserted correct prcies, IE tests whether the purchaseprice values are consistent with the quantity and current price per kg
-- If i have inserted everything correctly this query should NOT return anything!
SELECT
    Purchases.Id AS PurchaseId,
    Supplies.name AS Supply,
    Purchases.quantity,
    Supplies.price_per_kg,
    Purchases.purchaseprice,
    Purchases.quantity * Supplies.price_per_kg AS CalculatedPrice
FROM Purchases
INNER JOIN Supplies
    ON Purchases.supply_id = Supplies.Id
WHERE ABS(
    Purchases.purchaseprice -
    (Purchases.quantity * Supplies.price_per_kg)
) > 0.01;

SELECT * FROM Addresses;

-- fetch the full addresses
SELECT
addressline as Street,
postalcodes.postalcode as Postalcode,
Cities.city as City,
 Addresstypes.addresstype as Address_type
FROM Addresses
INNER JOIN Postalcodes ON Addresses.postalcode_id = Postalcodes.Id
Inner JOIN Cities ON Postalcodes.city_id = Cities.Id
INNER JOIN Addresstypes ON Addresses.addresstype_id = Addresstypes.Id;


SELECT * FROM Suppliers;

-- fetch an specific suppliers address
SELECT
    Suppliers.name AS Supplier,
    Addresses.addressline,
    Postalcodes.postalcode,
    Cities.city,
    Contactpersons.name AS ContactPerson
FROM Suppliers
INNER JOIN Addresses
    ON Suppliers.address_id = Addresses.Id
INNER JOIN Postalcodes
    ON Addresses.postalcode_id = Postalcodes.Id
INNER JOIN Cities
    ON Postalcodes.city_id = Cities.Id
INNER JOIN Contactpersons
    ON Suppliers.contactperson_id = Contactpersons.Id
WHERE Suppliers.name = 'Sockerbetan AB';

-- fetch an suppliers contactpersons name
SELECT
    Suppliers.name AS Supplier,
    Contactpersons.name AS ContactPerson
FROM Suppliers
INNER JOIN Contactpersons
    ON Suppliers.contactperson_id = Contactpersons.Id
WHERE Suppliers.Id = 1;

-- query for what supplier supplies what supply :)
SELECT
    Suppliers.name AS Supplier,
    Supplies.name AS Supply
FROM Suppliers
LEFT JOIN Supplies
    ON Suppliers.Id = Supplies.supplier_id;

-- fetch an inventory items supplyname and its suppleier
SELECT
    Inventorys.Id AS InventoryId,
    Supplies.name AS Supply,
    Suppliers.name AS Supplier,
    Inventorys.quantity_in_stock
FROM Inventorys
INNER JOIN Supplies
    ON Inventorys.supply_id = Supplies.Id
INNER JOIN Suppliers
    ON Supplies.supplier_id = Suppliers.Id;