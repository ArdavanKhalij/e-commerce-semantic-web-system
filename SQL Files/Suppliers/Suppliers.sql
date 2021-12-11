--supplier table
CREATE TABLE public."supplier"(
	bce character varying(10) NOT NULL,
	"companyName" character varying(100) NOT NULL,
	email character varying(250) NOT NULL,
	telephone character varying(30) NOT NULL,
	url character varying(150),
	"addressCountry" character varying(3) NOT NULL, --EX: BEL, PER, USA, 
	"addressCity" character varying(50), 
	"addressLocality" character varying(50),
	"postalCode" character varying(25),
	"streetAddress" character varying(250)
);
ALTER TABLE public."supplier"
ADD CONSTRAINT supplier_pk PRIMARY KEY (bce);

--supplies a product to a warehouse
CREATE TABLE public."supplies"(
	"suppliesID" SERIAL NOT NULL,
	"supplierBce" character varying(10) NOT NULL, -- FK supplier
	"warehouseCode" character varying(10) NOT NULL, --FK warehouse
	sku character varying(30) NOT NULL, --FK product
	"arrivalDate" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(), 
	quantity NUMERIC(5,0) NOT NULL, --units
	price NUMERIC(8,2) NOT NULL DEFAULT 0.00,
	"supplyState" CHARACTER(1) NOT NULL DEFAULT 'A'-- state of the order
);

--products in a supplies or inventory shipped to a warehouse
CREATE TABLE public."SuppliesStock"(
    supply SERIAL NOT NULL, -- fk supplies
    sku character varying(30), -- fk product just to differentiate
    name character varying(30) NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL
);
--SuppliesStock_pkey(supply, sku)
