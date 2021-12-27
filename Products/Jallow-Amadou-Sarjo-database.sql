--
-- PostgreSQL database dump
--
-- I got the customer data from mockaroo.com/
-- Products data from amazon.in

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

-- Started on 2021-11-14 11:39:30

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE soko;
--
-- TOC entry 3308 (class 1262 OID 16492)
-- Name: twitter; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE soko WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE soko OWNER TO postgres;

--
-- TOC entry 2 (class 3079 OID 41054)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 40980)
-- Name: Admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Admin" (
    name character varying(30) NOT NULL,
    telephone character varying(20) NOT NULL,
    email character varying(30) NOT NULL
);


ALTER TABLE public."Admin" OWNER TO postgres;

--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE "Admin"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Admin" IS 'contains the admins of the platform';


--
-- TOC entry 213 (class 1259 OID 41137)
-- Name: Area; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Area" (
    "addressCountry" character varying(30) NOT NULL,
    "addressRegion" character varying(30) NOT NULL
);


ALTER TABLE public."Area" OWNER TO postgres;

--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE "Area"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Area" IS 'Contains the Areas served by delivery services';


--
-- TOC entry 215 (class 1259 OID 41155)
-- Name: AreaServed; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AreaServed" (
    "deliveryService" character varying(30) NOT NULL,
    "addressCountry" character varying(30) NOT NULL,
    "addressRegion" character varying(30) NOT NULL
);


ALTER TABLE public."AreaServed" OWNER TO postgres;

--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE "AreaServed"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."AreaServed" IS 'join of deliveryService and Area.';


--
-- TOC entry 204 (class 1259 OID 40985)
-- Name: Brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Brand" (
    name character varying(30) NOT NULL
);


ALTER TABLE public."Brand" OWNER TO postgres;

--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE "Brand"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Brand" IS 'Contains the product brands';


--
-- TOC entry 211 (class 1259 OID 41117)
-- Name: Cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cart" (
    customer character varying(30) NOT NULL,
    "customerEmail" character varying(30) NOT NULL,
    product uuid NOT NULL,
    "dateAdded" timestamp without time zone
);


ALTER TABLE public."Cart" OWNER TO postgres;

--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE "Cart"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Cart" IS 'Contains the shopping cart of a customer';


--
-- TOC entry 205 (class 1259 OID 40990)
-- Name: Category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Category" (
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public."Category" OWNER TO postgres;

--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE "Category"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Category" IS 'Contains the product categories';


--
-- TOC entry 201 (class 1259 OID 40970)
-- Name: Customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Customer" (
    name character varying(30) NOT NULL,
    email character varying(30) NOT NULL,
    telephone character varying(20) NOT NULL,
    gender character varying(20),
    "addressCountry" character varying(20),
    "addressRegion" character varying(20),
    "postalCode" character varying(5),
    "addressLocality" character varying(20),
    "streetAddress" character varying(50)
);


ALTER TABLE public."Customer" OWNER TO postgres;

--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE "Customer"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Customer" IS 'Contains the customers on the platform.';


--
-- TOC entry 212 (class 1259 OID 41132)
-- Name: DeliveryService; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DeliveryService" (
    name character varying(30) NOT NULL,
    email character varying(30) NOT NULL,
    telephone character varying(20) NOT NULL
);


ALTER TABLE public."DeliveryService" OWNER TO postgres;

--
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE "DeliveryService"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."DeliveryService" IS 'Contains the delivery Services on the platform';


--
-- TOC entry 207 (class 1259 OID 41026)
-- Name: Image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Image" (
    url character varying(30) NOT NULL
);


ALTER TABLE public."Image" OWNER TO postgres;

--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE "Image"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Image" IS 'Contains the product images';


--
-- TOC entry 222 (class 1259 OID 41276)
-- Name: Inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Inventory" (
    warehouse character varying(5) NOT NULL,
    product uuid NOT NULL,
    "dateAdded" timestamp without time zone NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public."Inventory" OWNER TO postgres;

--
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE "Inventory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Inventory" IS 'Contains the warehouse stock inventory';


--
-- TOC entry 216 (class 1259 OID 41173)
-- Name: Order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Order" (
    "orderUUID" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "orderStatus" character varying(10) NOT NULL,
    "orderDate" timestamp without time zone NOT NULL,
    "modifiedDate" timestamp without time zone NOT NULL,
    refund character varying(1) NOT NULL,
    customer character varying(30) NOT NULL,
    "customerEmail" character varying(30) NOT NULL,
    "deliveryService" uuid NOT NULL,
    "orderAmount" numeric(10,2) NOT NULL
);


ALTER TABLE public."Order" OWNER TO postgres;

--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE "Order"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Order" IS 'Contains the orders on the platform';


--
-- TOC entry 217 (class 1259 OID 41190)
-- Name: OrderDescription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrderDescription" (
    "order" uuid NOT NULL,
    product uuid NOT NULL,
    quantity integer NOT NULL,
    "dateCreated" timestamp without time zone NOT NULL
);


ALTER TABLE public."OrderDescription" OWNER TO postgres;

--
-- TOC entry 3198 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE "OrderDescription"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."OrderDescription" IS 'Contains the oder details. Join of Order and Product';


--
-- TOC entry 209 (class 1259 OID 41080)
-- Name: PaymentCard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PaymentCard" (
    "cardType" character varying(30) NOT NULL,
    "cardNumber" character varying(20) NOT NULL,
    "cardHolderName" character varying(30) NOT NULL,
    "cardExpiryDate" date NOT NULL,
    customer character varying(30) NOT NULL,
    "customerEmail" character varying(30) NOT NULL
);


ALTER TABLE public."PaymentCard" OWNER TO postgres;

--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE "PaymentCard"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."PaymentCard" IS 'Contains customer card details';


--
-- TOC entry 221 (class 1259 OID 41249)
-- Name: Preferences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Preferences" (
    customer character varying(30) NOT NULL,
    "customerEmail" character varying(30) NOT NULL,
    "deliveryService" uuid NOT NULL
);


ALTER TABLE public."Preferences" OWNER TO postgres;

--
-- TOC entry 3200 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE "Preferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Preferences" IS 'Contains the preferences of customers';


--
-- TOC entry 206 (class 1259 OID 40998)
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product" (
    "productUUID" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(200) NOT NULL,
    color character varying(20),
    model character varying(50),
    "itemCondition" character varying(20) NOT NULL,
    description character varying(512),
    "stockQuantity" integer NOT NULL,
    sku character varying(30),
    location character varying(50) NOT NULL,
    "dateAdded" timestamp without time zone NOT NULL,
    brand character varying(30),
    category character varying(30),
    "adminSeller" character varying(30),
    "supplierSeller" character varying(30),
    price numeric(10,2) NOT NULL
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- TOC entry 3201 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE "Product"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Product" IS 'Contains the products of the platform';


--
-- TOC entry 208 (class 1259 OID 41036)
-- Name: ProductImages ; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductImages " (
    product uuid NOT NULL,
    "imageUrl" character varying NOT NULL
);


ALTER TABLE public."ProductImages " OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 41090)
-- Name: Reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Reviews" (
    author character varying(50) NOT NULL,
    "authorEmail" character varying(30) NOT NULL,
    about uuid NOT NULL,
    "reviewBody" text NOT NULL,
    "reviewRatingValue" bigint NOT NULL,
    "dateCreated" timestamp without time zone NOT NULL,
    "dateModified" timestamp without time zone NOT NULL
);


ALTER TABLE public."Reviews" OWNER TO postgres;

--
-- TOC entry 3202 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE "Reviews"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Reviews" IS 'Contains the reviews on the platform';


--
-- TOC entry 214 (class 1259 OID 41142)
-- Name: Service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Service" (
    "serviceUUID" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(30) NOT NULL,
    "expectedArrivalIn" integer NOT NULL,
    description character varying(512),
    "deliveryService" character varying(30) NOT NULL,
    "pricePerKg" numeric(10,2) NOT NULL
);


ALTER TABLE public."Service" OWNER TO postgres;

--
-- TOC entry 3203 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE "Service"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Service" IS 'Contains the  services offered by a delivery service';


--
-- TOC entry 218 (class 1259 OID 41220)
-- Name: Subscribers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Subscribers" (
    supplier character varying(30) NOT NULL,
    "deliveryService" uuid NOT NULL
);


ALTER TABLE public."Subscribers" OWNER TO postgres;

--
-- TOC entry 3204 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE "Subscribers"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Subscribers" IS 'Contains the subsciptions. Join of Supplier and DeliveryService';


--
-- TOC entry 202 (class 1259 OID 40975)
-- Name: Supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Supplier" (
    name character varying(30) NOT NULL,
    email character varying(30) NOT NULL,
    telephone character varying(20) NOT NULL,
    logo character varying(50),
    url character varying(50),
    "addressCountry" character varying(30) NOT NULL,
    "addressRegion" character varying(30) NOT NULL,
    "postalCode" character varying(5) NOT NULL,
    "addressLocality" character varying(30) NOT NULL,
    "streetAddress" character varying(50) NOT NULL
);


ALTER TABLE public."Supplier" OWNER TO postgres;

--
-- TOC entry 3205 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE "Supplier"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Supplier" IS 'Contains the suppliers of the platform';


--
-- TOC entry 220 (class 1259 OID 41241)
-- Name: Supplies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Supplies" (
    "supplyUUID" uuid NOT NULL,
    supplier character varying NOT NULL,
    warehouse character varying(5) NOT NULL,
    "dateCreated" timestamp without time zone NOT NULL,
    "deliveryService" uuid NOT NULL
);


ALTER TABLE public."Supplies" OWNER TO postgres;

--
-- TOC entry 3206 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE "Supplies"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Supplies" IS 'Contains the supplies from suppliers to be delivered to warehouses';


--
-- TOC entry 223 (class 1259 OID 41291)
-- Name: SuppliesStock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SuppliesStock" (
    supply uuid NOT NULL,
    name character varying(30) NOT NULL,
    sku character varying(30),
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public."SuppliesStock" OWNER TO postgres;

--
-- TOC entry 3207 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE "SuppliesStock"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."SuppliesStock" IS 'Contains the products in a supplies shipping';


--
-- TOC entry 219 (class 1259 OID 41235)
-- Name: Warehouse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Warehouse" (
    "warehouseCode" character varying(5) NOT NULL,
    email character varying(30) NOT NULL,
    telephone character varying(20) NOT NULL,
    "addressCountry" character varying(30) NOT NULL,
    "addressRegion" character varying(30) NOT NULL,
    "postalCode" character varying(5) NOT NULL,
    "addressLocality" character varying(30) NOT NULL,
    "streetAddress" character varying(30) NOT NULL
);


ALTER TABLE public."Warehouse" OWNER TO postgres;

--
-- TOC entry 3208 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE "Warehouse"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Warehouse" IS 'Contains the warehouses or fulfillment centers';


--
-- TOC entry 3160 (class 0 OID 40980)
-- Dependencies: 203
-- Data for Name: Admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Admin" (name, telephone, email) FROM stdin;
Amadou Sarjo Jallow	+32466251959	amadou.sarjo.jallow@soko.com
Dave Sabonis	+79976625190	dave.sabonis@soko.com
Martha Brna	+32466251959	martin.brna@soko.com
\.


--
-- TOC entry 3170 (class 0 OID 41137)
-- Dependencies: 213
-- Data for Name: Area; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Area" ("addressCountry", "addressRegion") FROM stdin;
Belgium	Brussels
Belgium	Antwerpen
Belgium	Ninove
Belgium	Mons
Belgium	Gent
Belgium	Charleroi
United States	Carlifonia
United States	Baton Rouge
United States	Miami
United States	San Diego
United States	El Paso
United States	Inglewood
United States	Saint Louis
United States	Bronx
United States	Philadelphia
United States	Houston
United States	Phoenix
United States	Cincinnati
United Kingdom	Glasgow
United Kingdom	London
United Kingdom	Liverpool
United Kingdom	Belfast
United Kingdom	Sutton
United Kingdom	Upton
United Kingdom	Birmingham
United Kingdom	Milton
\.


--
-- TOC entry 3172 (class 0 OID 41155)
-- Dependencies: 215
-- Data for Name: AreaServed; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AreaServed" ("deliveryService", "addressCountry", "addressRegion") FROM stdin;
UPS - Courier Service	Belgium	Brussels
UPS - Courier Service	Belgium	Antwerpen
UPS - Courier Service	Belgium	Ninove
UPS - Courier Service	Belgium	Gent
UPS - Courier Service	Belgium	Charleroi
Day By Day	Belgium	Brussels
Day By Day	Belgium	Antwerpen
Day By Day	Belgium	Mons
Day By Day	Belgium	Ninove
Gophr - Courier Service	United Kingdom	Glasgow
Gophr - Courier Service	United Kingdom	London
Gophr - Courier Service	United Kingdom	Liverpool
Gophr - Courier Service	United Kingdom	Birmingham
Gophr - Courier Service	United Kingdom	Milton
Delivered UK Ltd	United Kingdom	Milton
Delivered UK Ltd	United Kingdom	Birmingham
Delivered UK Ltd	United Kingdom	Upton
Delivered UK Ltd	United Kingdom	Sutton
Delivered UK Ltd	United Kingdom	Belfast
Delivered UK Ltd	United Kingdom	London
Delivered UK Ltd	United Kingdom	Glasgow
FedEx Corp.	United States	Carlifonia
FedEx Corp.	United States	Baton Rouge
FedEx Corp.	United States	Miami
FedEx Corp.	United States	San Diego
FedEx Corp.	United States	El Paso
FedEx Corp.	United States	Inglewood
FedEx Corp.	United States	Saint Louis
FedEx Corp.	United States	Bronx
FedEx Corp.	United States	Philadelphia
FedEx Corp.	United States	Houston
FedEx Corp.	United States	Phoenix
FedEx Corp.	United States	Cincinnati
DHL Inc.	United States	Carlifonia
DHL Inc.	United States	Baton Rouge
DHL Inc.	United States	Miami
DHL Inc.	United States	San Diego
DHL Inc.	United States	El Paso
DHL Inc.	United States	Inglewood
DHL Inc.	United States	Saint Louis
DHL Inc.	United States	Bronx
DHL Inc.	United States	Philadelphia
DHL Inc.	United States	Houston
DHL Inc.	United States	Phoenix
DHL Inc.	United States	Cincinnati
DoorDash	United States	Carlifonia
DoorDash	United States	Baton Rouge
DoorDash	United States	Miami
DoorDash	United States	San Diego
DoorDash	United States	Saint Louis
DoorDash	United States	Bronx
DoorDash	United States	Philadelphia
DoorDash	United States	Houston
DoorDash	United States	Phoenix
DoorDash	United States	Cincinnati
\.


--
-- TOC entry 3161 (class 0 OID 40985)
-- Dependencies: 204
-- Data for Name: Brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Brand" (name) FROM stdin;
Apple
Asus
Samsung
Redmi
\.


--
-- TOC entry 3168 (class 0 OID 41117)
-- Dependencies: 211
-- Data for Name: Cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Cart" (customer, "customerEmail", product, "dateAdded") FROM stdin;
Brietta Hoggan	bhoggan0@eepurl.com	51235f3d-4fbe-402b-9bbc-efc88604592b	2021-10-14 18:41:19
Brietta Hoggan	bhoggan0@eepurl.com	161ef15e-5908-45fa-b3d3-607dca6b9262	2021-10-14 18:41:19
Brietta Hoggan	bhoggan0@eepurl.com	e4f7d42f-2232-422d-91f1-2100ff79e0a0	2021-10-14 18:41:19
Karoline Klehn	kklehn3@liveinternet.ru	51235f3d-4fbe-402b-9bbc-efc88604592b	2021-10-14 18:41:19
Huey Pudge	hpudge6@mozilla.com	2c5311ac-aea1-443e-b15e-69ddddadcc27	2021-10-14 18:41:19
Huey Pudge	hpudge6@mozilla.com	161ef15e-5908-45fa-b3d3-607dca6b9262	2021-10-14 18:41:19
Aluino Daud	adaud9@biglobe.ne.jp	51235f3d-4fbe-402b-9bbc-efc88604592b	2021-10-14 18:41:19
Avril Wallentin	awallentinc@sfgate.com	2c5311ac-aea1-443e-b15e-69ddddadcc27	2021-10-14 18:41:19
Avril Wallentin	awallentinc@sfgate.com	ff5d9d07-56fa-4cfa-905a-4e96a3ea9f6d	2021-10-14 18:41:19
Erena Mar	emarf@desdev.cn	e4f7d42f-2232-422d-91f1-2100ff79e0a0	2021-10-14 18:41:19
Averil Bundy	abundy0@patch.com	71b399d0-8f8b-42eb-9b47-39cf0b9b9115	2021-10-14 18:41:19
Averil Bundy	abundy0@patch.com	4988825f-72da-44a1-9a01-19c6f5d122c7	2021-10-14 18:41:19
Averil Bundy	abundy0@patch.com	4cd04183-a0da-4bf3-aedb-60bd230d16fb	2021-10-14 18:41:19
Rosemarie Sahlstrom	rsahlstrom5@bigcartel.com	21bca5f9-a789-48c9-82a0-92a519b31d99	2021-10-14 18:41:19
Brook Fallows	bfallowsa@nytimes.com	21bca5f9-a789-48c9-82a0-92a519b31d99	2021-10-14 18:41:19
Concordia Gianolo	cgianolof@surveymonkey.com	71b399d0-8f8b-42eb-9b47-39cf0b9b9115	2021-10-14 18:41:19
Concordia Gianolo	cgianolof@surveymonkey.com	4988825f-72da-44a1-9a01-19c6f5d122c7	2021-10-14 18:41:19
Bren Casillis	bcasillis0@dropbox.com	8d428fc2-d711-4905-a0ad-d3535fd0e398	2021-10-14 18:41:19
Bren Casillis	bcasillis0@dropbox.com	97e94d6a-aea2-4695-9722-5283f26b829d	2021-10-14 18:41:19
Gweneth Libbis	glibbis5@ycombinator.com	97e94d6a-aea2-4695-9722-5283f26b829d	2021-10-14 18:41:19
Leland Bermingham	lberminghama@jiathis.com	97e94d6a-aea2-4695-9722-5283f26b829d	2021-10-14 18:41:19
Leland Bermingham	lberminghama@jiathis.com	8d428fc2-d711-4905-a0ad-d3535fd0e398	2021-10-14 18:41:19
Calypso Bevans	cbevansf@fda.gov	8d428fc2-d711-4905-a0ad-d3535fd0e398	2021-10-14 18:41:19
Karoline Klehn	kklehn3@liveinternet.ru	3aaaa278-1de4-480c-8baa-16392bfe344b	2021-10-14 18:41:19
Karoline Klehn	kklehn3@liveinternet.ru	97e94d6a-aea2-4695-9722-5283f26b829d	2021-10-14 18:41:19
\.


--
-- TOC entry 3162 (class 0 OID 40990)
-- Dependencies: 205
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Category" (name, description) FROM stdin;
Computers	Computers and computer equipements
Men's Fashion	clothes, watches, shoes, hats...
Women's Fashion	Clothes, shoes, jewelery...
TV & Camera	\N
Appliances & Electronics	\N
Health & Beauty	\N
Grocery	\N
Books	\N
Video games	\N
Movies & Music	\N
Mobiles	Mobile devices, earphones, mobile accessories...
\.


--
-- TOC entry 3158 (class 0 OID 40970)
-- Dependencies: 201
-- Data for Name: Customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Customer" (name, email, telephone, gender, "addressCountry", "addressRegion", "postalCode", "addressLocality", "streetAddress") FROM stdin;
Brietta Hoggan	bhoggan0@eepurl.com	+32 249 749 6595	Genderfluid	Belgium	Antwerpen	2170	Shelley	456 Drewry Center
Yardley Doswell	ydoswell1@soundcloud.com	+32 969 287 6321	Genderfluid	Belgium	Ninove	9404	Northport	933 Bluestem Avenue
Liesa Perkins	lperkins2@imdb.com	+32 969 238 9774	Genderqueer	Belgium	Brussels	6834	Service	85 Macpherson Way
Karoline Klehn	kklehn3@liveinternet.ru	+32 758 456 3902	Genderfluid	Belgium	Brussels	7823	Sage	4 Sunbrook Way
Gonzales Landy	glandy4@google.co.uk	+32 186 389 1271	Genderqueer	Belgium	Brussels	1170	Hooker	25700 Oakridge Center
Sula Sotworth	ssotworth5@businessweek.com	+32 161 416 7354	Agender	Belgium	Mons	7032	Loftsgordon	6 Sunnyside Court
Huey Pudge	hpudge6@mozilla.com	+32 537 662 8128	Polygender	Belgium	Brussels	7604	Katie	80 Brickson Park Alley
Oberon Stockford	ostockford7@liveinternet.ru	+32 492 371 4657	Polygender	Belgium	Gent	9052	Eggendart	0 Hermina Street
Jo-anne Frankling	jfrankling8@people.com.cn	+32 954 757 0659	Male	Belgium	Charleroi	6042	Waubesa	3 Portage Plaza
Aluino Daud	adaud9@biglobe.ne.jp	+32 367 261 6687	Genderqueer	Belgium	Charleroi	6042	Lake View	1118 Roxbury Junction
Theresa Artz	tartza@ask.com	+32 792 311 5613	Genderfluid	Belgium	Ninove	9404	Clyde Gallagher	13 Moulton Lane
Caralie Elliot	celliotb@columbia.edu	+32 192 878 9487	Genderfluid	Belgium	Brussels	6834	American	9196 Hallows Terrace
Avril Wallentin	awallentinc@sfgate.com	+32 598 967 4686	Agender	Belgium	Antwerpen	2170	Sunfield	6600 Buhler Park
Jobina Melby	jmelbyd@wix.com	+32 183 884 2703	Genderfluid	Belgium	Brussels	7823	Butterfield	67 Granby Drive
Thornton Macvey	tmacveye@dmoz.org	+32 828 309 3511	Male	Belgium	Brussels	6594	Welch	31 Clemons Center
Erena Mar	emarf@desdev.cn	+32 490 406 5575	Bigender	Belgium	Ninove	9404	Memorial	58106 Hallows Way
Marcelline Keene	mkeeneg@csmonitor.com	+32 202 588 8663	Agender	Belgium	Brussels	7536	Oxford	9732 Manitowish Terrace
Alair Novello	anovelloh@blogtalkradio.com	+32 159 140 9091	Non-binary	Belgium	Brussels	6834	Dixon	07 Trailsway Parkway
Mose Solomonides	msolomonidesi@gnu.org	+32 879 807 6621	Agender	Belgium	Brussels	6834	Dexter	32542 Fieldstone Point
Melodie Dymick	mdymickj@sourceforge.net	+32 133 830 6223	Female	Belgium	Charleroi	6042	Holmberg	6 Dorton Center
Averil Bundy	abundy0@patch.com	+1 225 645 2213	Genderqueer	United States	Baton Rouge	70820	Cascade	66799 Ridgeway Alley
Tyler MacGowan	tmacgowan1@blogspot.com	+1 941 871 2462	Agender	United States	Carlifonia	34102	Buena Vista	9452 4th Trail
Annette Rosterne	arosterne2@usa.gov	+1 305 753 0510	Agender	United States	Miami	33175	High Crossing	61702 Atwood Plaza
Orville Cubberley	ocubberley3@craigslist.org	+1 619 207 4480	Male	United States	San Diego	92153	Straubel	58 Waxwing Place
Paul Enoch	penoch4@illinois.edu	+1 915 433 4095	Bigender	United States	El Paso	88541	Troy	132 Banding Terrace
Rosemarie Sahlstrom	rsahlstrom5@bigcartel.com	+1 952 695 2327	Bigender	United States	Carlifonia	55564	Judy	8335 Duke Avenue
Delly Lapthorn	dlapthorn6@phoca.cz	+1 571 674 5982	Non-binary	United States	Carlifonia	23272	Kings	8683 Golden Leaf Point
Jilly Bidnall	jbidnall7@shinystat.com	+1 310 905 9764	Polygender	United States	Inglewood	90398	Green Ridge	5036 Esch Park
Wolf Malzard	wmalzard8@nps.gov	+1 636 848 5425	Agender	United States	Saint Louis	63126	Ronald Regan	39352 Armistice Street
Jen Domegan	jdomegan9@opera.com	+1 917 544 4986	Male	United States	Bronx	10469	Springview	0820 Moose Junction
Brook Fallows	bfallowsa@nytimes.com	+1 862 836 2544	Male	United States	Carlifonia	07195	Sunbrook	856 Tennessee Street
Adriane Sire	asireb@wikispaces.com	+1 608 445 6164	Female	United States	Carlifonia	53710	Pine View	01778 Heffernan Trail
Julie Cox	jcoxc@nbcnews.com	+1 251 870 0126	Genderqueer	United States	Carlifonia	36689	Sunnyside	22183 Algoma Avenue
Sibley Faulds	sfauldsd@unicef.org	+1 215 672 4118	Female	United States	Philadelphia	19125	Towne	94810 Anthes Junction
Wallis Boule	wboulee@wp.com	+1 713 914 6195	Male	United States	Houston	77281	Anniversary	28 Columbus Point
Concordia Gianolo	cgianolof@surveymonkey.com	+1 602 974 3776	Non-binary	United States	Phoenix	85072	Holy Cross	96165 Bashford Pass
Felita Kemet	fkemetg@ebay.co.uk	+1 317 347 7286	Agender	United States	Carlifonia	46202	Basil	8 Fair Oaks Pass
Conn Apfler	capflerh@multiply.com	+1 314 723 1015	Genderqueer	United States	Carlifonia	63180	Oak	89173 Hudson Circle
Sally Bendan	sbendani@xinhuanet.com	+1 513 918 3398	Agender	United States	Cincinnati	45228	Pankratz	082 Golf Drive
Margarette Czapla	mczaplaj@pinterest.com	+1 941 756 2247	Genderqueer	United States	Carlifonia	34282	Havey	7 Corry Circle
Bren Casillis	bcasillis0@dropbox.com	+44 334 644 4906	Bigender	United Kingdom	Glasgow	G4	Village Green	44011 Pearson Hill
Jaine Bowlas	jbowlas1@sciencedirect.com	+44 985 232 3716	Polygender	United Kingdom	London	LN6	Porter	37 Logan Junction
Thedrick Arrell	tarrell2@shareasale.com	+44 762 120 8252	Bigender	United Kingdom	London	SN13	Truax	8649 Warner Hill
Roz Thurley	rthurley3@amazon.co.jp	+44 365 218 3559	Genderqueer	United Kingdom	Liverpool	L74	3rd	0 Susan Hill
Hazlett Jeannard	hjeannard4@yellowpages.com	+44 909 336 7421	Male	United Kingdom	Belfast	BT2	Magdeline	99 Carberry Plaza
Gweneth Libbis	glibbis5@ycombinator.com	+44 101 152 6354	Non-binary	United Kingdom	Sutton	RH5	Golf Course	87 Mandrake Junction
Cooper Bradbeer	cbradbeer6@hao123.com	+44 884 537 5911	Polygender	United Kingdom	London	SN1	Derek	6 Vernon Pass
Eddi Sealey	esealey7@samsung.com	+44 442 102 7707	Female	United Kingdom	London	BD23	Hudson	98 Anzinger Place
Joyce Long	jlong8@usatoday.com	+44 754 176 9922	Bigender	United Kingdom	London	CT16	Thompson	3 Carioca Plaza
Sigismondo Ormrod	sormrod9@tuttocitta.it	+44 414 230 1262	Polygender	United Kingdom	Upton	DN21	Ridgeway	09 Porter Trail
Leland Bermingham	lberminghama@jiathis.com	+44 787 452 7062	Genderfluid	United Kingdom	London	CB4	Farmco	8983 Granby Alley
Myrlene Alderwick	malderwickb@hp.com	+44 492 252 2026	Female	United Kingdom	London	GL54	Oneill	1817 Eagan Center
Karlik Sinnatt	ksinnattc@earthlink.net	+44 472 501 9419	Genderfluid	United Kingdom	Upton	WF9	Crownhardt	39 Kensington Plaza
Dinny Duckels	dduckelsd@google.pl	+44 153 684 5883	Genderfluid	United Kingdom	London	SY4	Dakota	338 Lake View Crossing
Joye Vigar	jvigare@printfriendly.com	+44 167 484 1914	Genderqueer	United Kingdom	Birmingham	B40	Hauk	48067 Oak Park
Calypso Bevans	cbevansf@fda.gov	+44 663 901 7157	Male	United Kingdom	Belfast	BT2	Anniversary	1964 Beilfuss Avenue
Mallory Shiel	mshielg@jimdo.com	+44 584 499 0980	Genderfluid	United Kingdom	London	BT66	Schlimgen	275 Stuart Trail
Aggy Purkins	apurkinsh@epa.gov	+44 488 258 9854	Genderfluid	United Kingdom	London	AB55	Chinook	318 5th Drive
Minor Scantleberry	mscantleberryi@google.de	+44 616 204 5820	Genderqueer	United Kingdom	London	CV35	Dwight	39014 Magdeline Lane
Bartram Bridden	bbriddenj@jiathis.com	+44 179 960 8621	Agender	United Kingdom	Milton	AB56	Eagle Crest	4 Dottie Way
\.


--
-- TOC entry 3169 (class 0 OID 41132)
-- Dependencies: 212
-- Data for Name: DeliveryService; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DeliveryService" (name, email, telephone) FROM stdin;
Gophr - Courier Service	contact@gophr.uk	+44 289 110 6494
Delivered UK Ltd	contact@delivered.uk	+44 689 410 6494
DoorDash	contact@doordash.com	+1 961 694 4321
DHL Inc.	business@dhl.com	+1 645 094 4321
UPS - Courier Service	contact@ups.be	+32 989 110 494
Day By Day	business@daybyday.be	+32 789 910 649
FedEx Corp.	info@fedex.com	+1 661 694 4321
\.


--
-- TOC entry 3164 (class 0 OID 41026)
-- Dependencies: 207
-- Data for Name: Image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Image" (url) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 41276)
-- Dependencies: 222
-- Data for Name: Inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Inventory" (warehouse, product, "dateAdded", quantity) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 41173)
-- Dependencies: 216
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Order" ("orderUUID", "orderStatus", "orderDate", "modifiedDate", refund, customer, "customerEmail", "deliveryService", "orderAmount") FROM stdin;
ade78110-04f3-4c39-a1f9-0da86e497d6f	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Liesa Perkins	lperkins2@imdb.com	81ddf6ee-62ca-417d-9b29-38108ad43ce0	2000.00
3e176920-b166-494a-b600-21f86bab597a	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Yardley Doswell	ydoswell1@soundcloud.com	81ddf6ee-62ca-417d-9b29-38108ad43ce0	2000.00
095da47b-c203-450e-ac46-e274444d0fb6	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Brietta Hoggan	bhoggan0@eepurl.com	81ddf6ee-62ca-417d-9b29-38108ad43ce0	2000.00
124d210e-a5d7-4c94-996a-86e98411d3ef	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Karoline Klehn	kklehn3@liveinternet.ru	81ddf6ee-62ca-417d-9b29-38108ad43ce0	2000.00
81dfc1d4-5078-4578-9319-24e4d32d9f01	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Gonzales Landy	glandy4@google.co.uk	81ddf6ee-62ca-417d-9b29-38108ad43ce0	2000.00
7add4332-46b3-499e-acdb-28f4132229de	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Oberon Stockford	ostockford7@liveinternet.ru	cc925074-6c0f-45d7-9327-c2838d709eb2	2000.00
a2b72693-6dd6-42fd-9476-044dada11cc6	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Jo-anne Frankling	jfrankling8@people.com.cn	cc925074-6c0f-45d7-9327-c2838d709eb2	2000.00
489510f4-a7e3-4311-bf02-cdf1a0705012	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Aluino Daud	adaud9@biglobe.ne.jp	cc925074-6c0f-45d7-9327-c2838d709eb2	2000.00
0b7deade-5fee-4791-85a6-5be728886043	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Theresa Artz	tartza@ask.com	f7100587-9f73-4dad-986d-5d9a0aef82c1	2000.00
4abf8353-487f-4d37-9527-ab4dc0b8e176	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Caralie Elliot	celliotb@columbia.edu	ce5205a4-3b07-4b27-9141-322e3475b6da	2000.00
1f126c2d-7852-4043-8839-8d964dbbad8f	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Averil Bundy	abundy0@patch.com	b70c2843-3859-443d-b240-462b4089d778	2000.00
df13c18d-6e93-4547-b4b6-185aa59c79c7	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Tyler MacGowan	tmacgowan1@blogspot.com	b70c2843-3859-443d-b240-462b4089d778	2000.00
6bdf82b2-7e6d-4fc6-b5f3-12095e238a1d	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Annette Rosterne	arosterne2@usa.gov	2a93b1cb-eeed-4bbd-a00f-46ddcb4eb5f3	2000.00
5ab6e3ca-f9c3-44dd-8e13-63d28513300f	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Orville Cubberley	ocubberley3@craigslist.org	38815f65-510d-4c9d-a87b-8da7b3056eb5	2000.00
3cc735c1-74d4-4d3a-ade2-9fe296f33988	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Paul Enoch	penoch4@illinois.edu	38815f65-510d-4c9d-a87b-8da7b3056eb5	2000.00
004e1dcf-7178-4380-bf6d-f9dbf7c11507	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Rosemarie Sahlstrom	rsahlstrom5@bigcartel.com	f8151b26-5de1-4a50-9f95-ee409f82a051	2000.00
b30f3919-7595-44e0-a506-56d5f96a5fda	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Delly Lapthorn	dlapthorn6@phoca.cz	f8151b26-5de1-4a50-9f95-ee409f82a051	2000.00
0563a725-73da-4686-bf68-e4c63b052ebc	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Jilly Bidnall	jbidnall7@shinystat.com	f8151b26-5de1-4a50-9f95-ee409f82a051	2000.00
f1cb31a1-7912-4b29-8bcc-2178e226503b	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Wolf Malzard	wmalzard8@nps.gov	090236f6-a247-4e7b-b813-534e11a67748	2000.00
7cf5ca33-0ec3-4695-892b-7b0f4fc7d9af	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Jen Domegan	jdomegan9@opera.com	090236f6-a247-4e7b-b813-534e11a67748	2000.00
eb258842-6691-4ea7-8f45-210d6544d20e	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Bren Casillis	bcasillis0@dropbox.com	ba37dcd5-00b3-4f79-8dcc-9d9a23499b4a	2000.00
d4f8f116-d586-41f6-85ea-23b90f6be22c	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Jaine Bowlas	jbowlas1@sciencedirect.com	ba37dcd5-00b3-4f79-8dcc-9d9a23499b4a	2000.00
5ae48ea0-8dff-4ee8-a533-b6a37e242b12	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Thedrick Arrell	tarrell2@shareasale.com	7b2b0e0f-c332-4d53-b0c4-f7a41a99e5be	2000.00
05ab0cd0-ab45-49cb-bc9d-9c2bd3a289b2	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Roz Thurley	rthurley3@amazon.co.jp	f16c8f82-52f6-4a49-9035-924d6467b695	2000.00
42f3c02a-ec14-4d16-bb0c-f93da2363caf	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Hazlett Jeannard	hjeannard4@yellowpages.com	f16c8f82-52f6-4a49-9035-924d6467b695	2000.00
7b87e34a-0191-437b-a447-a5b4a59b1af8	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Gweneth Libbis	glibbis5@ycombinator.com	f16c8f82-52f6-4a49-9035-924d6467b695	2000.00
949b0b3d-f6b9-442d-bee9-1b6021b4de84	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Cooper Bradbeer	cbradbeer6@hao123.com	e6ce8482-a8fe-4adb-8586-291d8ff64bce	2000.00
9b029c2f-0f52-4a8b-9254-b140d1574d54	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Eddi Sealey	esealey7@samsung.com	e6ce8482-a8fe-4adb-8586-291d8ff64bce	2000.00
b0bf1fcf-295d-4530-9667-2b98e1d98123	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Joyce Long	jlong8@usatoday.com	e6ce8482-a8fe-4adb-8586-291d8ff64bce	2000.00
08772404-bc1b-47c3-b9bd-d5c03f662e80	Fulfilled	2021-11-01 18:41:19	2021-11-06 18:41:19	0	Sigismondo Ormrod	sormrod9@tuttocitta.it	e6ce8482-a8fe-4adb-8586-291d8ff64bce	2000.00
\.


--
-- TOC entry 3174 (class 0 OID 41190)
-- Dependencies: 217
-- Data for Name: OrderDescription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OrderDescription" ("order", product, quantity, "dateCreated") FROM stdin;
ade78110-04f3-4c39-a1f9-0da86e497d6f	51235f3d-4fbe-402b-9bbc-efc88604592b	1	2021-11-01 18:41:19
ade78110-04f3-4c39-a1f9-0da86e497d6f	b362f9f0-1f0d-4b2e-8e1d-19811ccfb79a	1	2021-11-01 18:41:19
3e176920-b166-494a-b600-21f86bab597a	d695052e-d926-4d01-bb3b-1464e4fd8e60	1	2021-11-01 18:41:19
095da47b-c203-450e-ac46-e274444d0fb6	fc07b915-5f56-4e50-8600-74d37615fc4e	1	2021-11-01 18:41:19
124d210e-a5d7-4c94-996a-86e98411d3ef	b1700344-d908-45e2-9bc4-c6917ad7cbe3	1	2021-11-01 18:41:19
81dfc1d4-5078-4578-9319-24e4d32d9f01	cf490540-e13b-4588-86b2-bcbe1c93b432	1	2021-11-01 18:41:19
7add4332-46b3-499e-acdb-28f4132229de	161ef15e-5908-45fa-b3d3-607dca6b9262	1	2021-11-01 18:41:19
a2b72693-6dd6-42fd-9476-044dada11cc6	b362f9f0-1f0d-4b2e-8e1d-19811ccfb79a	1	2021-11-01 18:41:19
489510f4-a7e3-4311-bf02-cdf1a0705012	b1700344-d908-45e2-9bc4-c6917ad7cbe3	1	2021-11-01 18:41:19
0b7deade-5fee-4791-85a6-5be728886043	b1700344-d908-45e2-9bc4-c6917ad7cbe3	1	2021-11-01 18:41:19
4abf8353-487f-4d37-9527-ab4dc0b8e176	b1700344-d908-45e2-9bc4-c6917ad7cbe3	1	2021-11-01 18:41:19
1f126c2d-7852-4043-8839-8d964dbbad8f	4cd04183-a0da-4bf3-aedb-60bd230d16fb	1	2021-11-01 18:41:19
df13c18d-6e93-4547-b4b6-185aa59c79c7	21bca5f9-a789-48c9-82a0-92a519b31d99	1	2021-11-01 18:41:19
df13c18d-6e93-4547-b4b6-185aa59c79c7	4cd04183-a0da-4bf3-aedb-60bd230d16fb	1	2021-11-01 18:41:19
6bdf82b2-7e6d-4fc6-b5f3-12095e238a1d	21bca5f9-a789-48c9-82a0-92a519b31d99	1	2021-11-01 18:41:19
5ab6e3ca-f9c3-44dd-8e13-63d28513300f	18903ea8-0f19-4e87-a0c9-3a623b8acae9	1	2021-11-01 18:41:19
5ab6e3ca-f9c3-44dd-8e13-63d28513300f	3b08e48f-9be1-454b-8374-2b6c11ece3ed	1	2021-11-01 18:41:19
3cc735c1-74d4-4d3a-ade2-9fe296f33988	4988825f-72da-44a1-9a01-19c6f5d122c7	1	2021-11-01 18:41:19
004e1dcf-7178-4380-bf6d-f9dbf7c11507	3b08e48f-9be1-454b-8374-2b6c11ece3ed	1	2021-11-01 18:41:19
b30f3919-7595-44e0-a506-56d5f96a5fda	4a0bec5b-f0c8-4e0c-8182-c4921e2869ab	1	2021-11-01 18:41:19
0563a725-73da-4686-bf68-e4c63b052ebc	71b399d0-8f8b-42eb-9b47-39cf0b9b9115	1	2021-11-01 18:41:19
0563a725-73da-4686-bf68-e4c63b052ebc	4988825f-72da-44a1-9a01-19c6f5d122c7	1	2021-11-01 18:41:19
f1cb31a1-7912-4b29-8bcc-2178e226503b	4cd04183-a0da-4bf3-aedb-60bd230d16fb	1	2021-11-01 18:41:19
7cf5ca33-0ec3-4695-892b-7b0f4fc7d9af	4cd04183-a0da-4bf3-aedb-60bd230d16fb	1	2021-11-01 18:41:19
eb258842-6691-4ea7-8f45-210d6544d20e	97e94d6a-aea2-4695-9722-5283f26b829d	1	2021-11-01 18:41:19
d4f8f116-d586-41f6-85ea-23b90f6be22c	3aaaa278-1de4-480c-8baa-16392bfe344b	1	2021-11-01 18:41:19
d4f8f116-d586-41f6-85ea-23b90f6be22c	8d428fc2-d711-4905-a0ad-d3535fd0e398	1	2021-11-01 18:41:19
5ae48ea0-8dff-4ee8-a533-b6a37e242b12	97e94d6a-aea2-4695-9722-5283f26b829d	1	2021-11-01 18:41:19
05ab0cd0-ab45-49cb-bc9d-9c2bd3a289b2	3aaaa278-1de4-480c-8baa-16392bfe344b	1	2021-11-01 18:41:19
05ab0cd0-ab45-49cb-bc9d-9c2bd3a289b2	97e94d6a-aea2-4695-9722-5283f26b829d	1	2021-11-01 18:41:19
42f3c02a-ec14-4d16-bb0c-f93da2363caf	8d428fc2-d711-4905-a0ad-d3535fd0e398	1	2021-11-01 18:41:19
949b0b3d-f6b9-442d-bee9-1b6021b4de84	8d428fc2-d711-4905-a0ad-d3535fd0e398	1	2021-11-01 18:41:19
9b029c2f-0f52-4a8b-9254-b140d1574d54	8d428fc2-d711-4905-a0ad-d3535fd0e398	1	2021-11-01 18:41:19
b0bf1fcf-295d-4530-9667-2b98e1d98123	97e94d6a-aea2-4695-9722-5283f26b829d	1	2021-11-01 18:41:19
08772404-bc1b-47c3-b9bd-d5c03f662e80	97e94d6a-aea2-4695-9722-5283f26b829d	1	2021-11-01 18:41:19
f1cb31a1-7912-4b29-8bcc-2178e226503b	97e94d6a-aea2-4695-9722-5283f26b829d	1	2021-11-01 18:41:19
7cf5ca33-0ec3-4695-892b-7b0f4fc7d9af	97e94d6a-aea2-4695-9722-5283f26b829d	1	2021-11-01 18:41:19
7b87e34a-0191-437b-a447-a5b4a59b1af8	8d428fc2-d711-4905-a0ad-d3535fd0e398	1	2021-11-01 18:41:19
\.


--
-- TOC entry 3166 (class 0 OID 41080)
-- Dependencies: 209
-- Data for Name: PaymentCard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PaymentCard" ("cardType", "cardNumber", "cardHolderName", "cardExpiryDate", customer, "customerEmail") FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 41249)
-- Dependencies: 221
-- Data for Name: Preferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Preferences" (customer, "customerEmail", "deliveryService") FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 40998)
-- Dependencies: 206
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product" ("productUUID", name, color, model, "itemCondition", description, "stockQuantity", sku, location, "dateAdded", brand, category, "adminSeller", "supplierSeller", price) FROM stdin;
2c5311ac-aea1-443e-b15e-69ddddadcc27	Apple iPhone 11 (64GB) - White	White	IPhone 11	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	85	AI9854WW11	Brussels	2021-09-19 16:51:12	Apple	Mobiles	Amadou Sarjo Jallow	\N	450.00
8d428fc2-d711-4905-a0ad-d3535fd0e398	Apple iPhone 11 (64GB) - White	White	IPhone 11	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	65	AI9854WW11	London	2021-09-04 13:51:12	Apple	Mobiles	Amadou Sarjo Jallow	\N	1000.00
51235f3d-4fbe-402b-9bbc-efc88604592b	Apple AirPods Pro	Black	MBP22HN/A	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	84	AA9853BBP2	Brussels	2021-10-11 16:51:12	Apple	Mobiles	Amadou Sarjo Jallow	\N	950.00
161ef15e-5908-45fa-b3d3-607dca6b9262	ASUS VivoBook 14 (2021)	Transparent Silver	VivoBook 14 (2021)	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	55	AV9854TS14	Ghent	2021-11-06 18:41:19	Asus	Computers	\N	Asus Inc.	1000.00
3a62141b-933c-440c-a5b7-eecd16d3e00c	Apple iPhone 10 (128GB) - White	White	IPhone 10	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	60	AI9853WW11	California	2021-10-09 16:53:01.428812	Apple	Mobiles	Amadou Sarjo Jallow	\N	700.00
ff5d9d07-56fa-4cfa-905a-4e96a3ea9f6d	ASUS ROG Strix G17 (2021) 17.3-inch	Eclipse Gray	ROG Strix G17 (2021)	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	65	AR9854EG17	Ghent	2021-07-16 18:41:19	Asus	Computers	\N	Asus Inc.	700.00
076e2af4-37b2-4ec0-8c2e-b015833a71df	Samsung Galaxy Z Fold3 5G (Phantom Black, 12GB RAM, 512GB Storage)	Phantom Black	Samsung Galaxy Z Fold3 5G	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	115	SG9854PBF3	Brussels	2021-07-16 18:41:19	Samsung	Mobiles	Martha Brna	\N	1500.00
08749f5a-ed6c-493c-9f63-d833a33d8244	Samsung Galaxy Z Fold3 5G (Phantom Black, 12GB RAM, 512GB Storage)	Phantom Black	Samsung Galaxy Z Fold3 5G	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	80	SG9854PBF3	Ghent	2021-07-16 18:41:19	Samsung	Mobiles	Martha Brna	\N	1500.00
3aaaa278-1de4-480c-8baa-16392bfe344b	Samsung Galaxy Z Fold3 5G (Phantom Black, 12GB RAM, 512GB Storage)	Phantom Black	Samsung Galaxy Z Fold3 5G	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	100	SG9854PBF3	London	2021-07-16 18:41:19	Samsung	Mobiles	Martha Brna	\N	1500.00
97e94d6a-aea2-4695-9722-5283f26b829d	Samsung Galaxy Note 20 Ultra 5G with Snapdragon 865+	Mystic Black	Samsung Galaxy Note 20 Ultra 5G	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	100	SG9854MBN20	London	2021-06-14 18:41:19	Samsung	Mobiles	Martha Brna	\N	1050.00
18903ea8-0f19-4e87-a0c9-3a623b8acae9	Apple iPhone 11 (64GB) - White	White	IPhone 11	New	6.1-inch (15.5 cm diagonal) Liquid Retina HD LCD display\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tDual-camera system with 12MP Ultra Wide and Wide cameras; Night mode, Portrait mode, and 4K video up to 60fps\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t12MP TrueDepth front camera with Portrait mode, 4K video, and Slo-Mo\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tFace ID for secure authentication\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tFast-charge capable\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tWireless charging\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t	120	AI9854WW11	California	2021-10-09 16:40:36.317058	Apple	Mobiles	Amadou Sarjo Jallow	\N	1000.00
3b08e48f-9be1-454b-8374-2b6c11ece3ed	Apple AirPods Pro	White	MWP22HN/A	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	85	AA9853WWP2	California	2021-10-09 17:08:07.870954	Apple	Mobiles	Amadou Sarjo Jallow	\N	400.00
4988825f-72da-44a1-9a01-19c6f5d122c7	Apple AirPods Pro	Black	MBP22HN/A	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	85	AA9853BBP2	California	2021-10-11 16:51:12	Apple	Mobiles	Amadou Sarjo Jallow	\N	450.00
fc07b915-5f56-4e50-8600-74d37615fc4e	ASUS VivoBook 14 (2021)	Transparent Silver	VivoBook 14 (2021)	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	154	AV9854TS14	Brussels	2021-10-06 18:41:19	Asus	Computers	\N	Asus Inc.	700.00
b362f9f0-1f0d-4b2e-8e1d-19811ccfb79a	Apple iPhone 11 (64GB) - Black	Black	IPhone 11	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	94	AI9854BB11	Brussels	2021-09-04 13:51:12	Apple	Mobiles	Amadou Sarjo Jallow	\N	1100.00
d695052e-d926-4d01-bb3b-1464e4fd8e60	ASUS ROG Strix G17 (2021) 17.3-inch	Eclipse Gray	ROG Strix G17 (2021)	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	104	AR9854EG17	Brussels	2021-07-16 18:41:19	Asus	Computers	\N	Asus Inc.	700.00
4cd04183-a0da-4bf3-aedb-60bd230d16fb	Samsung Galaxy Z Fold3 5G (Phantom Black, 12GB RAM, 512GB Storage)	Phantom Black	Samsung Galaxy Z Fold3 5G	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	180	SG9854PBF3	California	2021-07-16 18:41:19	Samsung	Mobiles	Martha Brna	\N	1500.00
e4f7d42f-2232-422d-91f1-2100ff79e0a0	Samsung Galaxy Note 20 Ultra 5G with Snapdragon 865+	Mystic Black	Samsung Galaxy Note 20 Ultra 5G	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	105	SG9854MBN20	Brussels	2021-06-14 18:41:19	Samsung	Mobiles	Martha Brna	\N	1050.00
9fecf700-ddb6-4740-8e8f-a5eac47591fe	Samsung Galaxy Note 20 Ultra 5G with Snapdragon 865+	Mystic Black	Samsung Galaxy Note 20 Ultra 5G	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	105	SG9854MBN20	Ghent	2021-06-14 18:41:19	Samsung	Mobiles	Martha Brna	\N	1050.00
cf490540-e13b-4588-86b2-bcbe1c93b432	Redmi Note 10 Pro (Vintage Bronze, 6GB RAM, 128GB Storage)	Vintage Bronze	Redmi Note 10 Pro	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	100	RN9854VBN10	Ghent	2021-06-14 18:41:19	Redmi	Mobiles	Dave Sabonis	\N	300.00
b1700344-d908-45e2-9bc4-c6917ad7cbe3	Redmi Note 10 Pro (Vintage Bronze, 6GB RAM, 128GB Storage)	Vintage Bronze	Redmi Note 10 Pro	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	100	RN9854VBN10	Brussels	2021-06-14 18:41:19	Redmi	Mobiles	Dave Sabonis	\N	300.00
71b399d0-8f8b-42eb-9b47-39cf0b9b9115	Apple iPhone 11 (64GB) - Black	Black	IPhone 11	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	120	AI9854BB11	California	2021-10-09 16:51:12.976426	Apple	Mobiles	Amadou Sarjo Jallow	\N	1100.00
4a0bec5b-f0c8-4e0c-8182-c4921e2869ab	Apple iPhone 10 (128GB) - Black	Black	IPhone 10	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	70	AI9853BB11	California	2021-10-09 16:52:14.541691	Apple	Mobiles	Amadou Sarjo Jallow	\N	9150.00
21bca5f9-a789-48c9-82a0-92a519b31d99	Samsung Galaxy Note 20 Ultra 5G with Snapdragon 865+	Mystic Black	Samsung Galaxy Note 20 Ultra 5G	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	105	SG9854MBN20	California	2021-06-14 18:41:19	Samsung	Mobiles	Martha Brna	\N	1050.00
\.


--
-- TOC entry 3165 (class 0 OID 41036)
-- Dependencies: 208
-- Data for Name: ProductImages ; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProductImages " (product, "imageUrl") FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 41090)
-- Dependencies: 210
-- Data for Name: Reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Reviews" (author, "authorEmail", about, "reviewBody", "reviewRatingValue", "dateCreated", "dateModified") FROM stdin;
Liesa Perkins	lperkins2@imdb.com	51235f3d-4fbe-402b-9bbc-efc88604592b	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
Liesa Perkins	lperkins2@imdb.com	b362f9f0-1f0d-4b2e-8e1d-19811ccfb79a	Lorem ipsum dolor sit amet	5	2021-11-01 18:41:19	2021-11-01 18:41:19
Yardley Doswell	ydoswell1@soundcloud.com	d695052e-d926-4d01-bb3b-1464e4fd8e60	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
Brietta Hoggan	bhoggan0@eepurl.com	fc07b915-5f56-4e50-8600-74d37615fc4e	Lorem ipsum dolor sit amet	3	2021-11-01 18:41:19	2021-11-01 18:41:19
Karoline Klehn	kklehn3@liveinternet.ru	b1700344-d908-45e2-9bc4-c6917ad7cbe3	Lorem ipsum dolor sit amet	5	2021-11-01 18:41:19	2021-11-01 18:41:19
Gonzales Landy	glandy4@google.co.uk	cf490540-e13b-4588-86b2-bcbe1c93b432	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
Oberon Stockford	ostockford7@liveinternet.ru	161ef15e-5908-45fa-b3d3-607dca6b9262	Lorem ipsum dolor sit amet	3	2021-11-01 18:41:19	2021-11-01 18:41:19
Jo-anne Frankling	jfrankling8@people.com.cn	b362f9f0-1f0d-4b2e-8e1d-19811ccfb79a	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
Aluino Daud	adaud9@biglobe.ne.jp	b1700344-d908-45e2-9bc4-c6917ad7cbe3	Lorem ipsum dolor sit amet	5	2021-11-01 18:41:19	2021-11-01 18:41:19
Theresa Artz	tartza@ask.com	b1700344-d908-45e2-9bc4-c6917ad7cbe3	Lorem ipsum dolor sit amet	5	2021-11-01 18:41:19	2021-11-01 18:41:19
Caralie Elliot	celliotb@columbia.edu	b1700344-d908-45e2-9bc4-c6917ad7cbe3	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
Averil Bundy	abundy0@patch.com	4cd04183-a0da-4bf3-aedb-60bd230d16fb	Lorem ipsum dolor sit amet	5	2021-11-01 18:41:19	2021-11-01 18:41:19
Tyler MacGowan	tmacgowan1@blogspot.com	21bca5f9-a789-48c9-82a0-92a519b31d99	Lorem ipsum dolor sit amet	2	2021-11-01 18:41:19	2021-11-01 18:41:19
Tyler MacGowan	tmacgowan1@blogspot.com	4cd04183-a0da-4bf3-aedb-60bd230d16fb	Lorem ipsum dolor sit amet	3	2021-11-01 18:41:19	2021-11-01 18:41:19
Annette Rosterne	arosterne2@usa.gov	21bca5f9-a789-48c9-82a0-92a519b31d99	Lorem ipsum dolor sit amet	3	2021-11-01 18:41:19	2021-11-01 18:41:19
Orville Cubberley	ocubberley3@craigslist.org	18903ea8-0f19-4e87-a0c9-3a623b8acae9	Lorem ipsum dolor sit amet	2	2021-11-01 18:41:19	2021-11-01 18:41:19
Orville Cubberley	ocubberley3@craigslist.org	3b08e48f-9be1-454b-8374-2b6c11ece3ed	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
Paul Enoch	penoch4@illinois.edu	4988825f-72da-44a1-9a01-19c6f5d122c7	Lorem ipsum dolor sit amet	2	2021-11-01 18:41:19	2021-11-01 18:41:19
Rosemarie Sahlstrom	rsahlstrom5@bigcartel.com	3b08e48f-9be1-454b-8374-2b6c11ece3ed	Lorem ipsum dolor sit amet	5	2021-11-01 18:41:19	2021-11-01 18:41:19
Delly Lapthorn	dlapthorn6@phoca.cz	4a0bec5b-f0c8-4e0c-8182-c4921e2869ab	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
Jilly Bidnall	jbidnall7@shinystat.com	71b399d0-8f8b-42eb-9b47-39cf0b9b9115	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
Jilly Bidnall	jbidnall7@shinystat.com	4988825f-72da-44a1-9a01-19c6f5d122c7	Lorem ipsum dolor sit amet	5	2021-11-01 18:41:19	2021-11-01 18:41:19
Wolf Malzard	wmalzard8@nps.gov	4cd04183-a0da-4bf3-aedb-60bd230d16fb	Lorem ipsum dolor sit amet	2	2021-11-01 18:41:19	2021-11-01 18:41:19
Jen Domegan	jdomegan9@opera.com	4cd04183-a0da-4bf3-aedb-60bd230d16fb	Lorem ipsum dolor sit amet	3	2021-11-01 18:41:19	2021-11-01 18:41:19
Bren Casillis	bcasillis0@dropbox.com	97e94d6a-aea2-4695-9722-5283f26b829d	Lorem ipsum dolor sit amet	3	2021-11-01 18:41:19	2021-11-01 18:41:19
Jaine Bowlas	jbowlas1@sciencedirect.com	3aaaa278-1de4-480c-8baa-16392bfe344b	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
Jaine Bowlas	jbowlas1@sciencedirect.com	8d428fc2-d711-4905-a0ad-d3535fd0e398	Lorem ipsum dolor sit amet	5	2021-11-01 18:41:19	2021-11-01 18:41:19
Thedrick Arrell	tarrell2@shareasale.com	97e94d6a-aea2-4695-9722-5283f26b829d	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
Roz Thurley	rthurley3@amazon.co.jp	3aaaa278-1de4-480c-8baa-16392bfe344b	Lorem ipsum dolor sit amet	3	2021-11-01 18:41:19	2021-11-01 18:41:19
Roz Thurley	rthurley3@amazon.co.jp	97e94d6a-aea2-4695-9722-5283f26b829d	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
Hazlett Jeannard	hjeannard4@yellowpages.com	8d428fc2-d711-4905-a0ad-d3535fd0e398	Lorem ipsum dolor sit amet	5	2021-11-01 18:41:19	2021-11-01 18:41:19
Gweneth Libbis	glibbis5@ycombinator.com	8d428fc2-d711-4905-a0ad-d3535fd0e398	Lorem ipsum dolor sit amet	3	2021-11-01 18:41:19	2021-11-01 18:41:19
Cooper Bradbeer	cbradbeer6@hao123.com	8d428fc2-d711-4905-a0ad-d3535fd0e398	Lorem ipsum dolor sit amet	3	2021-11-01 18:41:19	2021-11-01 18:41:19
Eddi Sealey	esealey7@samsung.com	8d428fc2-d711-4905-a0ad-d3535fd0e398	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
Joyce Long	jlong8@usatoday.com	97e94d6a-aea2-4695-9722-5283f26b829d	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
Sigismondo Ormrod	sormrod9@tuttocitta.it	97e94d6a-aea2-4695-9722-5283f26b829d	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
Wolf Malzard	wmalzard8@nps.gov	97e94d6a-aea2-4695-9722-5283f26b829d	Lorem ipsum dolor sit amet	3	2021-11-01 18:41:19	2021-11-01 18:41:19
Jen Domegan	jdomegan9@opera.com	97e94d6a-aea2-4695-9722-5283f26b829d	Lorem ipsum dolor sit amet	3	2021-11-01 18:41:19	2021-11-01 18:41:19
\.


--
-- TOC entry 3171 (class 0 OID 41142)
-- Dependencies: 214
-- Data for Name: Service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Service" ("serviceUUID", name, "expectedArrivalIn", description, "deliveryService", "pricePerKg") FROM stdin;
ba37dcd5-00b3-4f79-8dcc-9d9a23499b4a	Regular delivery	7	Lorem ipsum dolor sit amet, consectetur.	Gophr - Courier Service	5.00
7b2b0e0f-c332-4d53-b0c4-f7a41a99e5be	Express delivery	2	Lorem ipsum dolor sit amet, consectetur.	Gophr - Courier Service	9.00
f16c8f82-52f6-4a49-9035-924d6467b695	Regular delivery	6	Lorem ipsum dolor sit amet, consectetur.	Delivered UK Ltd	6.00
e6ce8482-a8fe-4adb-8586-291d8ff64bce	Express delivery	2	Lorem ipsum dolor sit amet, consectetur.	Delivered UK Ltd	9.00
b70c2843-3859-443d-b240-462b4089d778	Regular delivery	4	Lorem ipsum dolor sit amet, consectetur.	FedEx Corp.	6.00
2a93b1cb-eeed-4bbd-a00f-46ddcb4eb5f3	Express delivery	2	Lorem ipsum dolor sit amet, consectetur.	FedEx Corp.	9.00
38815f65-510d-4c9d-a87b-8da7b3056eb5	Regular delivery	5	Lorem ipsum dolor sit amet, consectetur.	DoorDash	6.00
1cfed0e6-b801-4c11-a6fd-407ba2f6ac90	Express delivery	2	Lorem ipsum dolor sit amet, consectetur.	DoorDash	10.00
f8151b26-5de1-4a50-9f95-ee409f82a051	Regular delivery	4	Lorem ipsum dolor sit amet, consectetur.	DHL Inc.	5.00
090236f6-a247-4e7b-b813-534e11a67748	Express delivery	2	Lorem ipsum dolor sit amet, consectetur.	DHL Inc.	9.00
81ddf6ee-62ca-417d-9b29-38108ad43ce0	Regular delivery	6	Lorem ipsum dolor sit amet, consectetur.	UPS - Courier Service	7.00
cc925074-6c0f-45d7-9327-c2838d709eb2	Speed delivery	2	Lorem ipsum dolor sit amet, consectetur.	UPS - Courier Service	10.00
f7100587-9f73-4dad-986d-5d9a0aef82c1	Regular delivery	7	Lorem ipsum dolor sit amet, consectetur.	Day By Day	7.00
ce5205a4-3b07-4b27-9141-322e3475b6da	Speed delivery	2	Lorem ipsum dolor sit amet, consectetur.	Day By Day	10.00
\.


--
-- TOC entry 3175 (class 0 OID 41220)
-- Dependencies: 218
-- Data for Name: Subscribers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Subscribers" (supplier, "deliveryService") FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 40975)
-- Dependencies: 202
-- Data for Name: Supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Supplier" (name, email, telephone, logo, url, "addressCountry", "addressRegion", "postalCode", "addressLocality", "streetAddress") FROM stdin;
Apple Inc.	business@apple.com	+19654892330	\N	apple.com	USA	California	8007	Silicon valley	Twin Pines Circle
Asus Inc.	business@asus.com	+329654892330	\N	asus.be	Belgium	Brussels	1500	Ixelles	Boulevar General Jacques
Samsung Inc.	business@samsung.com	+459654892330	\N	samsung.skr	South Korea	Seol	1831	Suwon-si	Geneva Building, Leonardo da Vincilaan 19
Appario Retail Private Ltd	contact@appario.com	+32956874213	\N	appario.com	Belgium	Ghent	1600	gbesse	Boulevard General Dupont, 271
\.


--
-- TOC entry 3177 (class 0 OID 41241)
-- Dependencies: 220
-- Data for Name: Supplies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Supplies" ("supplyUUID", supplier, warehouse, "dateCreated", "deliveryService") FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 41291)
-- Dependencies: 223
-- Data for Name: SuppliesStock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SuppliesStock" (supply, name, sku, quantity, price) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 41235)
-- Dependencies: 219
-- Data for Name: Warehouse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Warehouse" ("warehouseCode", email, telephone, "addressCountry", "addressRegion", "postalCode", "addressLocality", "streetAddress") FROM stdin;
\.


--
-- TOC entry 2961 (class 2606 OID 40984)
-- Name: Admin Admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_pkey" PRIMARY KEY (name);


--
-- TOC entry 2985 (class 2606 OID 41159)
-- Name: AreaServed AreaServed_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AreaServed"
    ADD CONSTRAINT "AreaServed_pkey" PRIMARY KEY ("deliveryService", "addressCountry", "addressRegion");


--
-- TOC entry 2981 (class 2606 OID 41141)
-- Name: Area Area_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Area"
    ADD CONSTRAINT "Area_pkey" PRIMARY KEY ("addressCountry", "addressRegion");


--
-- TOC entry 2963 (class 2606 OID 40989)
-- Name: Brand Brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Brand"
    ADD CONSTRAINT "Brand_pkey" PRIMARY KEY (name);


--
-- TOC entry 2977 (class 2606 OID 41121)
-- Name: Cart Cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cart"
    ADD CONSTRAINT "Cart_pkey" PRIMARY KEY (customer, "customerEmail", product);


--
-- TOC entry 2965 (class 2606 OID 40997)
-- Name: Category Category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (name);


--
-- TOC entry 2957 (class 2606 OID 40974)
-- Name: Customer Customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customer"
    ADD CONSTRAINT "Customer_pkey" PRIMARY KEY (name, email);


--
-- TOC entry 2979 (class 2606 OID 41136)
-- Name: DeliveryService DeliveryService_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DeliveryService"
    ADD CONSTRAINT "DeliveryService_pkey" PRIMARY KEY (name);


--
-- TOC entry 2969 (class 2606 OID 41030)
-- Name: Image Image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_pkey" PRIMARY KEY (url);


--
-- TOC entry 2999 (class 2606 OID 41280)
-- Name: Inventory Inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Inventory"
    ADD CONSTRAINT "Inventory_pkey" PRIMARY KEY (warehouse, product);


--
-- TOC entry 2989 (class 2606 OID 41194)
-- Name: OrderDescription OrderDescription_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderDescription"
    ADD CONSTRAINT "OrderDescription_pkey" PRIMARY KEY ("order", product);


--
-- TOC entry 2987 (class 2606 OID 41178)
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY ("orderUUID");


--
-- TOC entry 2973 (class 2606 OID 41084)
-- Name: PaymentCard PaymentCard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaymentCard"
    ADD CONSTRAINT "PaymentCard_pkey" PRIMARY KEY ("cardType", "cardNumber");


--
-- TOC entry 2997 (class 2606 OID 41253)
-- Name: Preferences Preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Preferences"
    ADD CONSTRAINT "Preferences_pkey" PRIMARY KEY (customer, "customerEmail", "deliveryService");


--
-- TOC entry 2971 (class 2606 OID 41043)
-- Name: ProductImages  ProductImages _pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductImages "
    ADD CONSTRAINT "ProductImages _pkey" PRIMARY KEY (product, "imageUrl");


--
-- TOC entry 2967 (class 2606 OID 41005)
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY ("productUUID");


--
-- TOC entry 2975 (class 2606 OID 41308)
-- Name: Reviews Reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Reviews"
    ADD CONSTRAINT "Reviews_pkey" PRIMARY KEY (author, about, "authorEmail");


--
-- TOC entry 2983 (class 2606 OID 41149)
-- Name: Service Service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Service"
    ADD CONSTRAINT "Service_pkey" PRIMARY KEY ("serviceUUID");


--
-- TOC entry 2991 (class 2606 OID 41270)
-- Name: Subscribers Subscribers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Subscribers"
    ADD CONSTRAINT "Subscribers_pkey" PRIMARY KEY ("deliveryService", supplier);


--
-- TOC entry 2959 (class 2606 OID 40979)
-- Name: Supplier Supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Supplier"
    ADD CONSTRAINT "Supplier_pkey" PRIMARY KEY (name);


--
-- TOC entry 3001 (class 2606 OID 41295)
-- Name: SuppliesStock SuppliesStock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SuppliesStock"
    ADD CONSTRAINT "SuppliesStock_pkey" PRIMARY KEY (supply, name);


--
-- TOC entry 2995 (class 2606 OID 41248)
-- Name: Supplies Supplies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Supplies"
    ADD CONSTRAINT "Supplies_pkey" PRIMARY KEY ("supplyUUID");


--
-- TOC entry 2993 (class 2606 OID 41239)
-- Name: Warehouse Warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Warehouse"
    ADD CONSTRAINT "Warehouse_pkey" PRIMARY KEY ("warehouseCode");


--
-- TOC entry 3009 (class 2606 OID 41112)
-- Name: Reviews about_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Reviews"
    ADD CONSTRAINT about_fkey FOREIGN KEY (about) REFERENCES public."Product"("productUUID") MATCH FULL;


--
-- TOC entry 3004 (class 2606 OID 41016)
-- Name: Product adminSeller_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "adminSeller_fk" FOREIGN KEY ("adminSeller") REFERENCES public."Admin"(name);


--
-- TOC entry 3002 (class 2606 OID 41006)
-- Name: Product brand_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT brand_fk FOREIGN KEY (brand) REFERENCES public."Brand"(name);


--
-- TOC entry 3003 (class 2606 OID 41011)
-- Name: Product category_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT category_fk FOREIGN KEY (category) REFERENCES public."Category"(name);


--
-- TOC entry 3008 (class 2606 OID 41085)
-- Name: PaymentCard customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaymentCard"
    ADD CONSTRAINT customer_fkey FOREIGN KEY (customer, "customerEmail") REFERENCES public."Customer"(name, email) MATCH FULL;


--
-- TOC entry 3016 (class 2606 OID 41179)
-- Name: Order customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT customer_fkey FOREIGN KEY (customer, "customerEmail") REFERENCES public."Customer"(name, email) MATCH FULL;


--
-- TOC entry 3023 (class 2606 OID 41254)
-- Name: Preferences customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Preferences"
    ADD CONSTRAINT customer_fkey FOREIGN KEY (customer, "customerEmail") REFERENCES public."Customer"(name, email) MATCH FULL;


--
-- TOC entry 3011 (class 2606 OID 41122)
-- Name: Cart customercart_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cart"
    ADD CONSTRAINT customercart_fkey FOREIGN KEY (customer, "customerEmail") REFERENCES public."Customer"(name, email) MATCH FULL;


--
-- TOC entry 3010 (class 2606 OID 41309)
-- Name: Reviews customerreviews_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Reviews"
    ADD CONSTRAINT customerreviews_fkey FOREIGN KEY (author, "authorEmail") REFERENCES public."Customer"(name, email) MATCH FULL;


--
-- TOC entry 3015 (class 2606 OID 41165)
-- Name: AreaServed deliveryarea_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AreaServed"
    ADD CONSTRAINT deliveryarea_fkey FOREIGN KEY ("addressCountry", "addressRegion") REFERENCES public."Area"("addressCountry", "addressRegion") MATCH FULL;


--
-- TOC entry 3024 (class 2606 OID 41259)
-- Name: Preferences deliveryservice_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Preferences"
    ADD CONSTRAINT deliveryservice_fkey FOREIGN KEY ("deliveryService") REFERENCES public."Service"("serviceUUID");


--
-- TOC entry 3017 (class 2606 OID 41264)
-- Name: Order deliveryservice_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT deliveryservice_fkey FOREIGN KEY ("deliveryService") REFERENCES public."Service"("serviceUUID") NOT VALID;


--
-- TOC entry 3022 (class 2606 OID 41301)
-- Name: Supplies deliveryservice_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Supplies"
    ADD CONSTRAINT deliveryservice_fkey FOREIGN KEY ("deliveryService") REFERENCES public."Service"("serviceUUID") NOT VALID;


--
-- TOC entry 3014 (class 2606 OID 41160)
-- Name: AreaServed deliveryservicearea_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AreaServed"
    ADD CONSTRAINT deliveryservicearea_fkey FOREIGN KEY ("deliveryService") REFERENCES public."DeliveryService"(name);


--
-- TOC entry 3021 (class 2606 OID 41271)
-- Name: Subscribers eliveryservice_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Subscribers"
    ADD CONSTRAINT eliveryservice_fkey FOREIGN KEY ("deliveryService") REFERENCES public."Service"("serviceUUID") NOT VALID;


--
-- TOC entry 3007 (class 2606 OID 41049)
-- Name: ProductImages  image_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductImages "
    ADD CONSTRAINT image_fkey FOREIGN KEY ("imageUrl") REFERENCES public."Image"(url);


--
-- TOC entry 3019 (class 2606 OID 41200)
-- Name: OrderDescription order_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderDescription"
    ADD CONSTRAINT order_fkey FOREIGN KEY ("order") REFERENCES public."Order"("orderUUID");


--
-- TOC entry 3006 (class 2606 OID 41044)
-- Name: ProductImages  product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductImages "
    ADD CONSTRAINT product_fkey FOREIGN KEY (product) REFERENCES public."Product"("productUUID");


--
-- TOC entry 3018 (class 2606 OID 41195)
-- Name: OrderDescription product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderDescription"
    ADD CONSTRAINT product_fkey FOREIGN KEY (product) REFERENCES public."Product"("productUUID");


--
-- TOC entry 3026 (class 2606 OID 41286)
-- Name: Inventory product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Inventory"
    ADD CONSTRAINT product_fkey FOREIGN KEY (product) REFERENCES public."Product"("productUUID");


--
-- TOC entry 3012 (class 2606 OID 41127)
-- Name: Cart productcart_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cart"
    ADD CONSTRAINT productcart_fkey FOREIGN KEY (product) REFERENCES public."Product"("productUUID") MATCH FULL;


--
-- TOC entry 3013 (class 2606 OID 41150)
-- Name: Service service_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Service"
    ADD CONSTRAINT service_fkey FOREIGN KEY ("deliveryService") REFERENCES public."DeliveryService"(name);


--
-- TOC entry 3005 (class 2606 OID 41021)
-- Name: Product supplierSeller_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "supplierSeller_fk" FOREIGN KEY ("supplierSeller") REFERENCES public."Supplier"(name);


--
-- TOC entry 3020 (class 2606 OID 41225)
-- Name: Subscribers supplier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Subscribers"
    ADD CONSTRAINT supplier_fkey FOREIGN KEY (supplier) REFERENCES public."Supplier"(name);


--
-- TOC entry 3027 (class 2606 OID 41296)
-- Name: SuppliesStock supply_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SuppliesStock"
    ADD CONSTRAINT supply_fkey FOREIGN KEY (supply) REFERENCES public."Supplies"("supplyUUID");


--
-- TOC entry 3025 (class 2606 OID 41281)
-- Name: Inventory warehouse_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Inventory"
    ADD CONSTRAINT warehouse_fkey FOREIGN KEY (warehouse) REFERENCES public."Warehouse"("warehouseCode");


-- Completed on 2021-11-14 11:39:30

--
-- PostgreSQL database dump complete
--

