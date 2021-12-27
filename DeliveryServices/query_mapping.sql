-- Contains
SELECT t.id, t.starting_warehouse, o.id, o.address FROM public.order AS o LEFT JOIN public.deliverytrip AS t ON o.trip = t.id WHERE o.id = order_id AND t.id = delivery_trip_id

-- Is done by
SELECT t.id, t.starting_warehouse, v.id, v.company FROM public.deliverytrip AS t LEFT JOIN public.transportvehicle AS v ON t.truck = v.id

-- Owns
SELECT c.name, t.id FROM public.transportcompany AS c LEFT JOIN public.transportvehicle AS t ON t.company = c.name

-- Starts From
SELECT t.id, w.warehousecode FROM public.deliverytrip AS t LEFT JOIN public.warehouse AS w ON t.starting_warehouse = w.warehousecode
