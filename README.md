# Dagnys bakery
![Database Visualisation](images/dbvisualisation.png)
## Grade requirements
"En normaliserad databas design enligt de regler som vi gått igenom. Korrekta
Primary Keys ska användas.
Relationer mellan tabeller ska existera."


1. Normalization — at least 3NF

<bold>First normal form (1NF)</bold>
Requirements:
- Each column contains a single value.
- No repeating groups.
- Each row can be uniquely identified by a primary key.
All my tables satisfy this with:
- Every table has an Id INTEGER PRIMARY KEY.
- I don't store multiple cities, addresses or supplies in any one column.
- I use separate rows for individual records.
- 
Second normal form (2NF)
Requirements:
- Must satisfy 1NF.
- Every non-key attribute must depend on the entire primary key.
My tables use single-column primary keys (Id), so there are no partial dependencies on composite keys.


Third normal form (3NF)
Requirements:
- Must satisfy 2NF.
- Non-key attributes must depend on the key, the whole key, and nothing but the key.
- No transitive dependencies between non-key attributes.
My address structure is a good example:
Addresses → Postalcodes → Cities

The city name is stored in Cities, not repeated in every address. Likewise, the postal code is stored in Postalcodes.

The supplier information is also separated from its contact person.

## 2. Primary keys and relationships
### Primary keys
All ten tables have a primary key:
Table	          Primary key
Cities	        Id
Postalcodes	    Id
Addresstypes	  Id
Addresses	      Id
Contactpersons	Id
Suppliers	      Id
Supplies	      Id
Inventorys	    Id
Purchases	      Id
Orders	        Id


### Relationships
Relationship	              Type
Cities → Postalcodes	      1:N
Postalcodes → Addresses	    1:N
Addresstypes → Addresses	  1:N
Addresses → Suppliers	      1:N
Contactpersons → Suppliers	1:N
Suppliers → Supplies	      1:N
Supplies → Inventorys	      1:1
Supplies → Purchases	      1:N
Orders → Purchases	        1:N

## 3. Foreign key constraints (for VG)
Most of my tables uses foreign keys constraints accordign to how we been taught. 

for example the Addresses table have both a foreign key to the addresstypes table and the postalcodes table where the Ids/the primary key of those tables are referenced as a integer in the addresses table.

