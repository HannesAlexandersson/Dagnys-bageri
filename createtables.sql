-- SQLite

-- the city table holds the name of a city
CREATE TABLE IF NOT EXISTS Cities(
Id INTEGER PRIMARY KEY,
city VARCHAR(50) UNIQUE NOT NULL
);

-- the Postalcodes table holds the postal code and a reference to the city table
CREATE TABLE IF NOT EXISTS Postalcodes(
Id INTEGER PRIMARY KEY,
postalcode CHAR(5) UNIQUE NOT NULL,
city_id INTEGER NOT NULL,
CONSTRAINT fk_cities FOREIGN KEY(city_id) REFERENCES Cities(id)
);

-- the addresstype table holds the name of the addresstype
CREATE TABLE IF NOT EXISTS Addresstypes(
Id INTEGER PRIMARY KEY,
addresstype VARCHAR(60) NOT NULL UNIQUE
);

-- the address table holds the addressline, and references to the addresstype, postalcode
CREATE TABLE IF NOT EXISTS Addresses(
Id INTEGER PRIMARY KEY,
addresstype_id INTEGER NOT NULL,
addressline VARCHAR(60) NOT NULL,
postalcode_id INTEGER NOT NULL,
CONSTRAINT fk_addresstypes FOREIGN KEY(addresstype_id) REFERENCES Addresstypes(id),
CONSTRAINT fk_postalcodes FOREIGN KEY(postalcode_id) REFERENCES Postalcodes(id)
);

-- normally i wouldnt bother with an seperate table for only a name, but I think this could be built upon in the future and then this coild also hold refrences to contactways to the contactperson like phonenumber and email etc
CREATE TABLE IF NOT EXISTS Contactpersons(
Id INTEGER PRIMARY KEY,
name VARCHAR(150) NOT NULL
);

-- the suppliers table holds the name, phine and email and also refrences to the addresstable and the contactpersontable
CREATE TABLE IF NOT EXISTS Suppliers(
Id INTEGER PRIMARY KEY,
name VARCHAR(50) NOT NULL UNIQUE,
address_id INTEGER NOT NULL,
contactperson_id INTEGER,
phone VARCHAR(15) NOT NULL UNIQUE,
email VARCHAR(128) NOT NULL UNIQUE,
CONSTRAINT fk_addresses FOREIGN KEY(address_id) REFERENCES Addresses(id),
CONSTRAINT fk_contactpersons FOREIGN KEY(contactperson_id) REFERENCES Contactpersons(id)
);

-- supplies holds information about a supply like articklenumber, name and price aswell as reference to which supplier supplys the supply
CREATE TABLE IF NOT EXISTS Supplies(
Id INTEGER PRIMARY KEY,
artickelnumber VARCHAR(50) UNIQUE NOT NULL,
name VARCHAR(80) NOT NULL,
price_per_kg FLOAT NOT NULL,
supplier_id INTEGER NOT NULL,
CONSTRAINT fk_suppliers FOREIGN KEY(supplier_id) REFERENCES Suppliers(id)
);

-- the inventory table keeps track on how many of each supply the bakery ahve in its inventory and have references to the supply table
CREATE TABLE IF NOT EXISTS Inventorys(
Id INTEGER PRIMARY KEY,
supply_id INTEGER NOT NULL UNIQUE,
quantity_in_stock INTEGER NOT NULL,
CONSTRAINT fk_supplies FOREIGN KEY(supply_id) REFERENCES Supplies(id)
);

-- the oerders table holds information about the order with date and price (total price of entire order). a order is made up of multiple purchases
CREATE TABLE IF NOT EXISTS Orders(
Id INTEGER PRIMARY KEY,
orderdate DATE NOT NULL,
orderprice FLOAT NOT NULL
);

-- the purchase table hold information about the purchases, a purchase is a number of a supply, for example in a order the bakery can buy 10 milk, 5 flour, the the 10 milk is one purchase, the 5 flour is one purchase.
CREATE TABLE IF NOT EXISTS Purchases(
Id INTEGER PRIMARY KEY,
supply_id INTEGER NOT NULL,
order_id INTEGER NOT NULL,
quantity INTEGER NOT NULL,
purchaseprice FLOAT NOT NULL,
CONSTRAINT fk_supplies FOREIGN KEY (supply_id) REFERENCES Supplies(id),
CONSTRAINT fk_orders FOREIGN KEY (order_id) REFERENCES Orders(id)
);
