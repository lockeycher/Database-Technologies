CREATE TABLE manufacturers (
   code number PRIMARY KEY NOT NULL,
   name varchar(50) NOT NULL 
);

CREATE TABLE products (
   code NUMBER PRIMARY KEY NOT NULL,
   name varchar(50) NOT NULL ,
   price real NOT NULL ,
   manufacturer number NOT NULL
      CONSTRAINT fk_manufacturers_code REFERENCES manufacturers(code)
);

INSERT INTO manufacturers(code,name) VALUES(1,'Sony');
INSERT INTO manufacturers(code,name) VALUES(2,'Creative Labs');
INSERT INTO manufacturers(code,name) VALUES(3,'Hewlett-Packard');
INSERT INTO manufacturers(code,name) VALUES(4,'Iomega');
INSERT INTO manufacturers(code,name) VALUES(5,'Fujitsu');
INSERT INTO manufacturers(code,name) VALUES(6,'Winchester');

INSERT INTO products(code,name,price,manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO products(code,name,price,manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO products(code,name,price,manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO products(code,name,price,manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO products(code,name,price,manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO products(code,name,price,manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO products(code,name,price,manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO products(code,name,price,manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO products(code,name,price,manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO products(code,name,price,manufacturer) VALUES(10,'DVD burner',180,2);

--Computer Store Answers
