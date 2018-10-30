-- Student Name: Lavinia Wang
-- Studnet ID: 1473704

SELECT * FROM manufacturers;
-- code, name
SELECT * FROM products;
-- code, name, price, manufacturer

-- 1. Select the names of the products with a price less than or equal to $200
SELECT name, price
FROM products
WHERE price <= 200;

-- 2. Select all the products with a price between $60 and $120
SELECT name, price
FROM products
WHERE price >= 60 AND price <= 120
ORDER BY price;

-- 3. Select the name and price in cents (i.e., the price is in dollars). 
SELECT name, 100*price as price_in_cents
FROM products;

-- 4. Select the product name, price, and manufacturer name of all the products.
SELECT p.name, p.price, m.name AS manufacturer_name
FROM manufacturers m, products p
WHERE m.code = p.manufacturer;

-- 5. Select all manufactures who currently do not have any listed products.
SELECT name
FROM manufacturers
WHERE code NOT IN (SELECT manufacturer FROM products);

-- 6. Select the name of each manufacturer along with the name and price of its most expensive product.
SELECT m.name, p1.name, p1.price
FROM manufacturers m, products p1
WHERE p1.price IN 
    (SELECT MAX(price) 
    FROM products p2 
    WHERE p1.manufacturer = p2.manufacturer AND p2.manufacturer = m.code)
ORDER BY m.code;

-- 7. Select the names and average prices of manufacturer whose products have an average price larger than or equal to $150.	
SELECT m.name, avgprice
FROM manufacturers m 
JOIN (SELECT AVG(price) AS avgprice, p2.manufacturer
    FROM products p2, manufacturers 
    WHERE p2.manufacturer = manufacturers.code
    GROUP BY p2.manufacturer) pr ON m.code= pr.manufacturer
WHERE avgprice >= 150;