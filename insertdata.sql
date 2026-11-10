INSERT INTO Cities(
city
) VALUES(
'Göteborg'
),(
'Stockholm'
),
(
'Umeå'
),
(
'Borås'
),
(
'Säffle'
),
(
'Malmö'
),
(
'Östersund'
)

INSERT INTO Postalcodes(
postalcode,
city_id
) VALUES (
'41653',
1
),(
'11217',
2
),(
'90582',
3
),(
'50110',
4
),('66112',5),('21233',6),('83190',7);

INSERT INTO Addresstypes(
addresstype
)VALUES(
'Billing'
),(
'Shipping'
),(
'Office'
);


INSERT INTO Addresses(
addresstype_id,
addressline,
postalcode_id
)VALUES(
3,
'Munkebäcksgatan 23 H',
1
),(
3,
'Vällingbygatan 34',
2
),(
3,
'Norrskensvägen 6',
3
),(
3,
'Göteborgsvägen 22',
4
),(
3,
'Körskolegatan 1',
5
),(
3,
'Snapphanens väg 42',
6
),(
3,
'Snöbägen1 ',
7
);

INSERT INTO Contactpersons(
name
) VALUES (
'Rune Andersson'
),(
'Bengt Svensson'
),(
'Zlatan Ibrahimovic'
),(
'Gösta Persson'
),(
'Arne Hägerfors'
),(
'Sune Andersson'
),(
'Rudolf Mjunsted'
);

INSERT INTO Suppliers(
name,
address_id,
contactperson_id,
phone,
email
) VALUES (
'Kålltorps Mjöl grossist',
1,
7,
'031-416537',
'mjöl4u@dummyemail.com'
),(
'Smör på lager',
2,
5,
'08-336688',
'smörpalager@gemail.com'
),(
'Kavelfabriken',
3,
1,
'033-132456',
'kvel@gemail.com'
),(
'Begagnade Bakplåtspapper AB',
4,
2,
'0701-711109',
'papper@gemail.com'
),(
'Sockerbetan AB',
5,
3,
'0533-112112',
'sweet@gemail.com'
),(
'Kryddimport och grossist AB',
6,
4,
'040-635241',
'kryddgross@gemail.com'
),(
'Formar för allt AB',
7,
6,
'0790-374016',
'form@gemail.com'
);

INSERT INTO Supplies(
artickelnumber,
name,
price_per_kg,
supplier_id
) VALUES (
'111-32165',
'Vetemjöl',
12,
1
),
(
'112-31266',
'Rågjöl',
10,
1
),(
'111-32166',
'Fin Vetemjöl',
15,
1
),(
'101-061656',
'Baksmör',
28.90,
2
),(
'326-55669',
'Bakplåtspapper för storugn',
50,
4
),(
'666-123456',
'Strösocker',
35,
5
),(
'666-32167',
'Råsocker',
25,
5
),(
'666-32169',
'Brunt farinsocker',
32,
5
),(
'3-12543',
'Kavel stor trä',
54,
3
),(
'2345-34553',
'Kardemumma',
54,
6
),(
'3532-4353',
'Kryddnejlika',
56,
6
),(
'3432-3223165',
'Saffran',
120,
6
),(
'1-23322',
'Bakform 25dm',
34,
7
);

INSERT INTO Inventorys(
supply_id,
quantity_in_stock
)VALUES(
13,
132
),(
10,
10
),(
2,
34
),(
1,
3
),(
3,
13
),(
12,
8
),(
9,
3
),(
8,
10
),(
7,
15
),(
6,
9
),(
5,
22
),(
4,
23
),(
11,
3
);

/* INSERT INTO Purchases(
supply_id,
dateofpurchase,
quantity,
totalprice
)VALUES (
    1,
    '2026-10-02',
    50,
    600
),(
    2,
   '2026-10-02',
    10,
    100
),(
    3,
   '2026-10-02',
    20,
    300
),(
    4,
   '2026-10-02',
    100,
    2890
),(
    5,
   '2026-10-02',
    20,
    1000
),(
    6,
   '2026-10-02',
    30,
    1050
),(
    7,
   '2026-10-02',
    10,
    250
),(
    8,
   '2026-10-02',
    10,
    320
),(
    9,
   '2026-10-02',
    1,
    54
),(
    10,
   '2026-10-02',
    2,
    108
),(
    11,
   '2026-10-02',
    1,
    56
),(
    12,
   '2026-10-02',
    5,
    600
),(
    13,
   '2026-10-02',
    1,
    34
),(
    1,
    '2026-06-02',
    50,
    600
),(
    2,
   '2026-06-02',
    10,
    100
),(
    3,
   '2026-06-02',
    20,
    300
),(
    4,
   '2026-06-02',
    100,
    2890
),(
    5,
   '2026-06-02',
    20,
    1000
),(
    6,
   '2026-06-02',
    30,
    1050
),(
    7,
   '2026-06-02',
    10,
    250
),(
    8,
   '2026-06-02',
    10,
    320
),(
    10,
   '2026-06-02',
    2,
    108
),(
    11,
   '2026-06-02',
    1,
    56
),(
    12,
   '2026-06-02',
    5,
    600
),(
1,
'2025-01-01',
8,
96
),
(
2,
'2025-01-01',
2,
20
),(
3,
'2025-01-01',
3,
45
),(
4,
'2025-01-01',
8,
231
),(
6,
'2025-01-01',
8,
280
);
 */

INSERT INTO Purchases(
    supply_id,
    order_id,
    quantity,
    totalprice
) VALUES
(1, 1, 50, 600),
(2, 1, 10, 100),
(3, 1, 20, 300),
(4, 1, 100, 2890),
(5, 1, 20, 1000),
(6, 1, 30, 1050),
(7, 1, 10, 250),
(8, 1, 10, 320),
(9, 1, 1, 54),
(10, 1, 2, 108),
(11, 1, 1, 56),
(12, 1, 5, 600),
(13, 1, 1, 34),
(1, 2, 50, 600),
(2, 2, 10, 100),
(3, 2, 20, 300),
(4, 2, 100, 2890),
(5, 2, 20, 1000),
(6, 2, 30, 1050),
(7, 2, 10, 250),
(8, 2, 10, 320),
(10, 2, 2, 108),
(11, 2, 1, 56),
(12, 2, 5, 600),
(1, 3, 8, 96),
(2, 3, 2, 20),
(3, 3, 3, 45),
(4, 3, 8, 231.20),
(6, 3, 8, 280);

INSERT INTO Orders(
    orderdate,
    orderprice
) VALUES (
    '2026-10-02',
    7362.00
),(
    '2026-06-02',
    7274.00
),(
    '2025-01-01',
    672.20
);