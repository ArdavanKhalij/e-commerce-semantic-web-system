-- Shows the position of the truck transporting the package with the given ID
-- If the package is not in transit, it shows its status
-- This shows feature 1 (Replace both '3's with the id of the package)
select
	CASE
		WHEN status = 'Lost' THEN 'Lost'
	    WHEN status = 'Arrived' THEN 'Delivered'
	    WHEN status = 'Preparation' THEN 'Not shipped'
		else (
			SELECT transportvehicle.position
			FROM Package
			LEFT JOIN
				DeliveryTrip
			ON
				DeliveryTrip.package = Package.ID
			LEFT join
				transportvehicle
			on
				transportvehicle.id = DeliveryTrip.truck
			where package.id = 3
		)
	end as position
	from package 
	where package.id = 3;

-- Derived attribute for TransportVehicle's load. Shows the weight of the packages in the truck
-- (Drops the weight of the lost/arrived/in preparation packages
-- Replace the '2' by the id of the truck
SELECT SUM(
	case 
		when package.status = 'Transit' then package.weight
		else 0
	end)
from deliverytrip
left join package on package.trip = deliverytrip.id
where deliverytrip.truck = 2
group by deliverytrip.truck


-- Derived attribute for DeliveryTrip's DeliveryTime. Shows the delivery time for an Arrived Package
-- Replace the '2' by the id of the deliverytrip
select
	case
		when package.status = 'Arrived' then deliverytrip.arrival_time::timestamp - deliverytrip.departure_time::timestamp
		else '0'
	end
from deliverytrip
left join package on package.trip = deliverytrip.id
where deliverytrip.id = 2

-- Average amount of delivery trip made or scheduled by each transport company PER warehouse
SELECT
	deli_qtty.company_name as company,
	avg(deli_qtty.delivery_amount) as average
FROM (
	SELECT
		c.name as company_name,
		count(*) as delivery_amount,
		p.warehouse as warehouse
	FROM
		DeliveryTrip d
	JOIN
		TransportVehicle v
	ON
		d.truck = v.id
	JOIN
		TransportCompany c
	ON
		v.company = c.id
	JOIN
		Package p
	ON
		d.package = p.id
	GROUP BY
		p.warehouse, c.name
) as deli_qtty
GROUP BY
	deli_qtty.company_name;

-- Average Packet Losses per company
SELECT
	losses.company_name as name,
	losses.losses / losses.trips as losses_percent
FROM
	(
		SELECT
			c.name as company_name,
			SUM(
				CASE
					WHEN p.status = 'Lost' THEN 1
					ELSE 0
				END
			)::float as losses,
			COUNT(*)::float as trips
		FROM
			Package p
		JOIN
			DeliveryTrip d
		ON
			p.trip = d.id
		JOIN
			TransportVehicle t
		ON
			d.truck = t.id
		JOIN
			TransportCompany c
		ON
			t.company = c.id
		GROUP BY
			c.name
) as losses;


-- I didn't see that the features should rely on the database only and could not
-- Write the requests three and four
