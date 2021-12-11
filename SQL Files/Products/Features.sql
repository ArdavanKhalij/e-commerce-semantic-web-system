-- JOIN is refering to INNER JOIN since it is the default join in sql

-- 1.1 All orders placed on the platform and the corresponding customers who place them. 
 
SELECT "Product".name, "Order".customer,"Order"."customerEmail", "OrderDescription".quantity
  FROM public."OrderDescription"
  JOIN public."Order"
  ON "Order"."orderUUID" = "OrderDescription".order
  JOIN public."Product"
  ON "OrderDescription".product = "Product"."productUUID";

-- 1.2 The amount of orders placed on each product so far

SELECT "Product".name, COUNT("OrderDescription".product) AS "ordersPlaced"
 	FROM public."OrderDescription"
 	JOIN public."Product"
 	ON "OrderDescription".product = "Product"."productUUID"
 	GROUP BY "OrderDescription".product, "Product"."productUUID";

-- 2.1 Products in Brietta Hoggan's shopping cart.

SELECT "Product".name, "Product".price
 	FROM public."Cart"
 	JOIN public."Product"
	ON "Cart".product = "Product"."productUUID"
 	WHERE "Cart".customer = 'Brietta Hoggan' AND "Cart"."customerEmail" = 'bhoggan0@eepurl.com';

-- 2.2 Sum of products in Brietta Hoggan's shopping cart.

SELECT SUM("Product".price) AS cartTotal 
 	FROM public."Cart"
 	JOIN public."Product"
	ON "Cart".product = "Product"."productUUID"
 	WHERE "Cart".customer = 'Brietta Hoggan' AND "Cart"."customerEmail" = 'bhoggan0@eepurl.com';

-- 3.1 Profitable locations in descending order. Finding locations with most orders.

SELECT "Product".location, COUNT("OrderDescription".product) AS orderTotal 
 	FROM public."OrderDescription"
 	JOIN public."Product"
	ON "OrderDescription".product = "Product"."productUUID"
	GROUP BY "Product".location 
	ORDER BY orderTotal DESC;

-- 4.1 Customer filters through Mobiles category according to ratings in descending order and location.
   /*A customer in brussels searches for the higest rated mobile phones in brussels in descending order.
     Note "Apple AirPods Pro" is under the Mobiles category.I do not have sub categories nor 
     am i using many categories in my database since it is a test case.*/

SELECT "Product".name, COUNT("Reviews".about) AS "reviwedBy(no. of people)", CAST(AVG("Reviews"."reviewRatingValue") AS DECIMAL(2,1)) AS ratingAVG 
 	FROM public."Reviews"
 	JOIN public."Product"
	ON "Reviews".about = "Product"."productUUID"
	WHERE "Product".category = 'Mobiles' AND "Product".location = 'Brussels' 
	GROUP BY "Product"."productUUID"
	ORDER BY ratingAVG DESC;


-- 4.4 Admin filters through all products to find those with lower ratings

SELECT "Product".name, "Product".category, "Product".location, COUNT("Reviews".about) AS "reviwedBy(no. of people)", CAST(AVG("Reviews"."reviewRatingValue") AS DECIMAL(2,1)) AS ratingAVG 
 	FROM public."Reviews"
 	JOIN public."Product"
	ON "Reviews".about = "Product"."productUUID"
	GROUP BY "Product"."productUUID"
	ORDER BY ratingAVG DESC;

-- 5
   /*The assupmtion here is that the inventory stock will always reflect on the stockQuantity attribute      of the Product entity. So, the supplier or admin always updates the Product quantity already          advertised, when new stock arrives. So I will just project it from the Product entity rather than        the Inventory entity since for each product sold, the stockQuantity is decreased from the Product     relation and it cascades to the Inventory as well*/

-- 5.1 Finding the quantity of items or stock of a product.
-- the productUUID here is referencing the product "Apple AirPods Pro".

SELECT "Product".name, "Product"."stockQuantity"
 	FROM public."Product"
	WHERE "Product"."productUUID" = '51235f3d-4fbe-402b-9bbc-efc88604592b';

-- 5.2 Finding stockQuantity of all products by a supplier.

SELECT "Product".name, "Product"."stockQuantity"
 	FROM public."Product"
	WHERE "Product"."supplierSeller" = 'Asus Inc.';
