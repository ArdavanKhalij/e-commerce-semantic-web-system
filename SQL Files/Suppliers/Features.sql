/* ----------------QUERYS--------------------------------
all data were generated by mockaroo and it was adjusted with excel functions. 
https://mockaroo.com/
*/
--Response time per supplier
SELECT B.cSupplierBce, B.cSupplierName, AVG(A.tOrderDelivered - A.tOrderDate) AS AVG_Response_Time, MAX(A.tOrderDelivered - A.tOrderDate) AS max_Response_Time FROM PURCHASE_ORDER A
INNER JOIN SUPPLIER B ON B.cSupplierBce = A.cSupplierBce GROUP BY B.cSupplierBce, B.cSupplierName
ORDER BY AVG_Response_Time DESC
--The supplier that gives more facilities (discounts), if you pay before "discountDays"
SELECT B.cSupplierBce, B.cSupplierName, AVG(A.nDiscount) AS avg_discount, MAX(A.nDiscountDays) AS discountDays FROM PURCHASE_ORDER A
INNER JOIN SUPPLIER B ON B.cSupplierBce = A.cSupplierBce GROUP BY B.cSupplierBce, B.cSupplierName
ORDER BY avg_discount DESC
--Maximum payment flexibility
SELECT B.cSupplierBce, B.cSupplierName, MAX(A.nPaymentLimit) AS limit_days_to_pay FROM PURCHASE_ORDER A
INNER JOIN SUPPLIER B ON B.cSupplierBce = A.cSupplierBce GROUP BY B.cSupplierBce, B.cSupplierName
ORDER BY limit_days_to_pay DESC
--Minimum, Maximum cost order by the most product requested to the least
SELECT A.cCategory, A.cProductName, A.nMajorityPrice, A.nUnitPrice, COUNT(C.nOrderUUID) AS number_orders, MIN(B.nPrice) AS min_price_payed, MAX(B.nPrice) AS max_price_payed FROM PRODUCT A
INNER JOIN PURCHASE_ORDER_DETAIL B ON B.cCategory = A.cCategory AND B.cProductName = A.cProductName
INNER JOIN PURCHASE_ORDER C ON C.nOrderUUID = B.nOrderUUID
GROUP BY A.cCategory, A.cProductName ORDER BY number_orders DESC
--Higher and lower delivery costs per supplier only in Belgium
SELECT B.cSupplierBce, B.cSupplierName, B.cPostalCode, MAX(A.nDeliveryCost) AS max_delivery_cost, MIN(A.nDeliveryCost) AS min_delivery_cost FROM PURCHASE_ORDER A
INNER JOIN SUPPLIER B ON B.cSupplierBce = A.cSupplierBce 
WHERE B.cCountry = 'BEL'
GROUP BY B.cSupplierBce, B.cSupplierName, B.cPostalCode
ORDER BY B.cpostalcode, max_delivery_cost DESC