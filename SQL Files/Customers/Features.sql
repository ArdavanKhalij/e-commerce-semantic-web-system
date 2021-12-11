-- Feature 1: List of total price of all receipts.
SELECT receipt_id, SUM(price * numberof) as total_prices
FROM goods_in_receipt
GROUP BY receipt_id;

-- Feature 2: Showing all the personal information of all users:
SELECT *
FROM customers_addresses
FULL JOIN customers_information
ON customers_addresses.email = customers_information.email;

-- Feature 3: Show the personal information of each users to him/her self:
SELECT *
FROM customers_addresses
FULL JOIN customers_information
ON customers_addresses.email = customers_information.email
WHERE customers_addresses.email = 'ardavan.khalij@vub.be';

-- Feature 4: Show the receipts of each customer to him/her self (General Information) + delivery date:
SELECT first_name, last_name, customers_information.email, receipt_information.receipt_id, date, delivery_status, payment_status
FROM customers_information
FULL JOIN customer_receipt_connector
ON customers_information.email = customer_receipt_connector.email
FULL JOIN receipt_information
ON receipt_information.receipt_id = customer_receipt_connector.receipt_id
WHERE customers_information.email = 'ardavan.khalij@vub.be';

-- Feature 5: Show the receipts deteil:
SELECT date, good_id, price, numberof, price*numberof AS total_price_of_good
FROM customers_information
FULL JOIN customer_receipt_connector
ON customers_information.email = customer_receipt_connector.email
FULL JOIN receipt_information
ON receipt_information.receipt_id = customer_receipt_connector.receipt_id
FULL JOIN goods_in_receipt
ON goods_in_receipt.receipt_id = receipt_information.receipt_id
WHERE customers_information.email = 'ardavan.khalij@vub.be' and receipt_information.receipt_id = '1';

-- Feature 6: Edit information of customer:
UPDATE public.customers_information
	SET first_name='Ardavan', last_name='Khalij', birth_date='1998-11-15',
   delivery_kind='Express', email='ardavan.khalij@vub.be', phone_number='+32467842501'
	WHERE first_name='Ardavan', last_name='Khalij', birth_date='1998-11-15',
   delivery_kind='Express', email='ardavan.khalij@vub.be', phone_number='+32467842501';
-- and also the other tables can be update the same.

-- Feature 7: See the not delivered orders:
SELECT *
FROM customers_information
FULL JOIN customer_receipt_connector
ON customers_information.email = customer_receipt_connector.email
FULL JOIN receipt_information
ON receipt_information.receipt_id = customer_receipt_connector.receipt_id

-- Feature 8: See the not paid orders:
SELECT *
FROM customers_information
FULL JOIN customer_receipt_connector
ON customers_information.email = customer_receipt_connector.email
FULL JOIN receipt_information
ON receipt_information.receipt_id = customer_receipt_connector.receipt_id
WHERE receipt_information.payment_status = 'Not Paid';

-- Feature 8: See the not paid orders of a user:
SELECT customer_receipt_connector.receipt_id, date, delivery_status
FROM customers_information
FULL JOIN customer_receipt_connector
ON customers_information.email = customer_receipt_connector.email
FULL JOIN receipt_information
ON receipt_information.receipt_id = customer_receipt_connector.receipt_id
WHERE receipt_information.payment_status = 'Not Paid' and customers_information.email = 'harry.potter@hogwarts.uk';

-- Feature 9: Delivery date of all paid receipts :
SELECT customer_receipt_connector.receipt_id, date AS paying_date,
delivery_status, payment_status, delivery_servies_types.delivery_kind,
date + delivery_duration * INTERVAL '1 day' as delivery_time
FROM customers_information
FULL JOIN customer_receipt_connector
ON customers_information.email = customer_receipt_connector.email
FULL JOIN receipt_information
ON receipt_information.receipt_id = customer_receipt_connector.receipt_id
FULL JOIN delivery_servies_types
ON customers_information.delivery_kind = delivery_servies_types.delivery_kind
Where receipt_information.payment_status = 'Paid';

-- Feature 10: Delivery date of all paid receipts for a user :
SELECT customer_receipt_connector.receipt_id, date AS paying_date,
delivery_status, payment_status, delivery_servies_types.delivery_kind,
date + delivery_duration * INTERVAL '1 day' as delivery_time
FROM customers_information
FULL JOIN customer_receipt_connector
ON customers_information.email = customer_receipt_connector.email
FULL JOIN receipt_information
ON receipt_information.receipt_id = customer_receipt_connector.receipt_id
FULL JOIN delivery_servies_types
ON customers_information.delivery_kind = delivery_servies_types.delivery_kind
Where customers_information.email = 'ardavan.khalij@vub.be' and receipt_information.payment_status = 'Paid';

-- Feature 11: Total price of each receipt of the user + price of delivery
SELECT first_name, last_name, customers_information.email,
receipt_information.receipt_id, date, delivery_status, payment_status, delivery_servies_types.price,
SUM(goods_in_receipt.price*numberof)+ delivery_servies_types.price AS final_price_of_goods_and_delivery
FROM customers_information
FULL JOIN customer_receipt_connector
ON customers_information.email = customer_receipt_connector.email
FULL JOIN receipt_information
ON receipt_information.receipt_id = customer_receipt_connector.receipt_id
FULL JOIN goods_in_receipt
ON goods_in_receipt.receipt_id = receipt_information.receipt_id
FULL JOIN delivery_servies_types
ON delivery_servies_types.delivery_kind = customers_information.delivery_kind
WHERE customers_information.email = 'ardavan.khalij@vub.be'
Group by first_name, last_name, customers_information.email,
receipt_information.receipt_id, date, delivery_status, payment_status, delivery_servies_types.price;
