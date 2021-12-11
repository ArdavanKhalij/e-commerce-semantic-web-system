--1 Product quantity:
--1a: this is a querry that gives the product quantities of all products of a certain warehouse 
SELECT product.name, amount_in_stock, warehouse.name  
FROM warehouse
	JOIN product
	ON product.warehouse_name = warehouse.name
WHERE warehouse.name = VARCHAR 'agoodwarehouse';
--1b: same as 1a but only returns something if the product is still in stock (amount_of_product is not zero)
SELECT product.name, amount_in_stock, warehouse.name  
FROM warehouse
	JOIN product
	ON product.warehouse_name = warehouse.name
WHERE warehouse.name = VARCHAR 'agoodwarehouse'
AND amount_in_stock > 0;


--2 Warehouse shipments:
--All the incoming and outgoing shipments of a warehouse
SELECT shipment_id, destination_address, product.name, warehouse.name
FROM shipment
	JOIN product
	USING (shipment_id)
	
	JOIN warehouse
	ON warehouse.name = VARCHAR 'bol';
	
--3 Shipment products:
--All the products of a shipment
SELECT product.name
FROM warehouse
	JOIN product
	ON product.warehouse_name = VARCHAR 'bol'
	
	JOIN shipment
	ON shipment.shipment_id = 1
WHERE warehouse.name = VARCHAR 'bol';

SELECT shipment_id, product.name, warehouse.name
FROM warehouse
	JOIN product
	ON product.warehouse_name = warehouse.name 
	AND product.warehouse_name = VARCHAR 'bol'
	
	JOIN shipment
	USING (shipment_id)
WHERE shipment.shipment_id = 1;

--4 Shipment delivery time: this is not possible
--/

--5 Business information:
--all the information about a certain business(delivery_service or warehouse)
SELECT *
FROM business
WHERE business.name = 'dhl';
