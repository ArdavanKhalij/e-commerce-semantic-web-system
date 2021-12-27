--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5 (Ubuntu 13.5-2.pgdg20.04+1)
-- Dumped by pg_dump version 13.5 (Ubuntu 13.5-2.pgdg20.04+1)

-- Started on 2021-12-21 16:24:42 CET

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 200 (class 1259 OID 16822)
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    name character varying(30) NOT NULL,
    telephone character varying(20) NOT NULL,
    email character varying(30) NOT NULL
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16825)
-- Name: brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brand (
    name character varying(30) NOT NULL
);


ALTER TABLE public.brand OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16828)
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    customer character varying(256) NOT NULL,
    product character varying(30) NOT NULL,
    dateadded timestamp without time zone
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16831)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16886)
-- Name: customer_receipt_connector; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_receipt_connector (
    email character varying(256) NOT NULL,
    receipt_id character varying(64) NOT NULL
);


ALTER TABLE public.customer_receipt_connector OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16889)
-- Name: customers_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers_addresses (
    email character varying(256) NOT NULL,
    country character varying(128) NOT NULL,
    city character varying(128) NOT NULL,
    address character varying(512) NOT NULL
);


ALTER TABLE public.customers_addresses OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16895)
-- Name: customers_information; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers_information (
    first_name character varying(128) NOT NULL,
    last_name character varying(128) NOT NULL,
    birth_date date,
    delivery_kind character varying(128) NOT NULL,
    email character varying(256) NOT NULL,
    phone_number character varying(20)
);


ALTER TABLE public.customers_information OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16901)
-- Name: delivery_services_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_services_type (
    delivery_kind character varying(128) NOT NULL,
    price double precision NOT NULL,
    delivery_duration integer NOT NULL
);


ALTER TABLE public.delivery_services_type OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16904)
-- Name: delivery_status_description; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_status_description (
    delivery_status character varying(128) NOT NULL,
    decription text NOT NULL
);


ALTER TABLE public.delivery_status_description OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16910)
-- Name: deliverytrip; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deliverytrip (
    id character varying(255) NOT NULL,
    departure_time timestamp without time zone,
    arrival_time timestamp without time zone,
    truck character varying(255) NOT NULL,
    starting_warehouse character varying(10) NOT NULL
);


ALTER TABLE public.deliverytrip OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16916)
-- Name: goods_in_receipt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.goods_in_receipt (
    receipt_id character varying(64) NOT NULL,
    good_id character varying(64) NOT NULL,
    numberof integer NOT NULL
);


ALTER TABLE public.goods_in_receipt OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16837)
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    productsku_fk character varying(30) NOT NULL,
    quantity numeric(5,0) NOT NULL,
    warehousecode_fk character varying(10) NOT NULL
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16840)
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    orderid character varying(15) NOT NULL,
    orderstatus character varying(128) NOT NULL,
    orderdate timestamp without time zone NOT NULL,
    customeremail character varying(256) NOT NULL,
    customeraddress character varying(512) NOT NULL,
    orderamount numeric(10,2) NOT NULL,
    deliveryservice character varying(128) NOT NULL
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16846)
-- Name: orderdescription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderdescription (
    "order" character varying(15) NOT NULL,
    product character varying(30) NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.orderdescription OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16849)
-- Name: paymentcard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paymentcard (
    cardtype character varying(10) NOT NULL,
    cardnumber character varying(17) NOT NULL,
    cardholdername character varying(100) NOT NULL,
    cardexpirydate date NOT NULL,
    customeremail character varying(256) NOT NULL
);


ALTER TABLE public.paymentcard OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16852)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    sku character varying(30) NOT NULL,
    name character varying(200) NOT NULL,
    color character varying(20),
    itemcondition character varying(20) NOT NULL,
    description character varying(512),
    stockquantity integer NOT NULL,
    location character varying(50) NOT NULL,
    dateadded timestamp without time zone NOT NULL,
    brand character varying(30),
    category character varying(30),
    adminseller character varying(30),
    supplierseller character varying(10),
    price numeric(10,2) NOT NULL,
    model character varying
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16858)
-- Name: productimages ; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."productimages " (
    product character varying(30) NOT NULL,
    imageurl character varying NOT NULL
);


ALTER TABLE public."productimages " OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16919)
-- Name: receipt_information; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receipt_information (
    receipt_id character varying(64) NOT NULL,
    date date NOT NULL,
    delivery_status character varying(128) NOT NULL,
    delivery_type character varying(128) NOT NULL,
    email character varying(256),
    orderamount integer,
    address text
);


ALTER TABLE public.receipt_information OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16864)
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    author character varying(256) NOT NULL,
    about character varying(30) NOT NULL,
    reviewbody text NOT NULL,
    reviewratingvalue bigint NOT NULL,
    datecreated timestamp without time zone NOT NULL,
    datemodified timestamp without time zone NOT NULL
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16925)
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    bce character varying(10) NOT NULL,
    companyname character varying(100) NOT NULL,
    email character varying(250) NOT NULL,
    telephone character varying(30) NOT NULL,
    url character varying(150),
    addresscountry character varying(3) NOT NULL,
    addresscity character varying(50),
    addresslocality character varying(50),
    postalcode character varying(25),
    streetaddress character varying(250)
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16931)
-- Name: supplies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplies (
    suppliesid integer NOT NULL,
    "supplierBce" character varying(10) NOT NULL,
    warehousecode character varying(10) NOT NULL,
    arrivaldate timestamp without time zone DEFAULT now() NOT NULL,
    "supplyState" character(1) DEFAULT 'A'::bpchar NOT NULL
);


ALTER TABLE public.supplies OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16936)
-- Name: supplies_suppliesid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplies_suppliesid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplies_suppliesid_seq OWNER TO postgres;

--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 225
-- Name: supplies_suppliesid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supplies_suppliesid_seq OWNED BY public.supplies.suppliesid;


--
-- TOC entry 211 (class 1259 OID 16870)
-- Name: suppliesstock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suppliesstock (
    supply integer NOT NULL,
    sku character varying(30) NOT NULL,
    name character varying(30) NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.suppliesstock OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16873)
-- Name: suppliesstock_supply_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suppliesstock_supply_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suppliesstock_supply_seq OWNER TO postgres;

--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 212
-- Name: suppliesstock_supply_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suppliesstock_supply_seq OWNED BY public.suppliesstock.supply;


--
-- TOC entry 213 (class 1259 OID 16875)
-- Name: transportcompany; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transportcompany (
    name character varying(50) NOT NULL,
    price_per_km double precision DEFAULT 0,
    api_key character varying(50) DEFAULT 'missing'::character varying
);


ALTER TABLE public.transportcompany OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16938)
-- Name: transportvehicle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transportvehicle (
    id character varying(255) NOT NULL,
    "position" character(50),
    company character varying(255) NOT NULL
);


ALTER TABLE public.transportvehicle OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16880)
-- Name: warehouse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouse (
    warehousecode character varying(10) NOT NULL,
    companyname character varying(128) NOT NULL,
    email character varying(256) NOT NULL,
    telephone character varying(20) NOT NULL,
    addresscountry character varying(3) NOT NULL,
    addresscity character varying(50) NOT NULL,
    addresslocality character varying(50) NOT NULL,
    postalcode character varying(25) NOT NULL,
    streetaddress character varying(256) NOT NULL
);


ALTER TABLE public.warehouse OWNER TO postgres;

--
-- TOC entry 3104 (class 2604 OID 16945)
-- Name: supplies suppliesid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies ALTER COLUMN suppliesid SET DEFAULT nextval('public.supplies_suppliesid_seq'::regclass);


--
-- TOC entry 3099 (class 2604 OID 16944)
-- Name: suppliesstock supply; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliesstock ALTER COLUMN supply SET DEFAULT nextval('public.suppliesstock_supply_seq'::regclass);


--
-- TOC entry 3316 (class 0 OID 16822)
-- Dependencies: 200
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (name, telephone, email) FROM stdin;
\.


--
-- TOC entry 3317 (class 0 OID 16825)
-- Dependencies: 201
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brand (name) FROM stdin;
\.


--
-- TOC entry 3318 (class 0 OID 16828)
-- Dependencies: 202
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (customer, product, dateadded) FROM stdin;
\.


--
-- TOC entry 3319 (class 0 OID 16831)
-- Dependencies: 203
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (name, description) FROM stdin;
\.


--
-- TOC entry 3331 (class 0 OID 16886)
-- Dependencies: 215
-- Data for Name: customer_receipt_connector; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_receipt_connector (email, receipt_id) FROM stdin;
\.


--
-- TOC entry 3332 (class 0 OID 16889)
-- Dependencies: 216
-- Data for Name: customers_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers_addresses (email, country, city, address) FROM stdin;
\.


--
-- TOC entry 3333 (class 0 OID 16895)
-- Dependencies: 217
-- Data for Name: customers_information; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers_information (first_name, last_name, birth_date, delivery_kind, email, phone_number) FROM stdin;
\.


--
-- TOC entry 3334 (class 0 OID 16901)
-- Dependencies: 218
-- Data for Name: delivery_services_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery_services_type (delivery_kind, price, delivery_duration) FROM stdin;
\.


--
-- TOC entry 3335 (class 0 OID 16904)
-- Dependencies: 219
-- Data for Name: delivery_status_description; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery_status_description (delivery_status, decription) FROM stdin;
\.


--
-- TOC entry 3336 (class 0 OID 16910)
-- Dependencies: 220
-- Data for Name: deliverytrip; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deliverytrip (id, departure_time, arrival_time, truck, starting_warehouse) FROM stdin;
\.


--
-- TOC entry 3337 (class 0 OID 16916)
-- Dependencies: 221
-- Data for Name: goods_in_receipt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.goods_in_receipt (receipt_id, good_id, numberof) FROM stdin;
\.


--
-- TOC entry 3320 (class 0 OID 16837)
-- Dependencies: 204
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory (productsku_fk, quantity, warehousecode_fk) FROM stdin;
74849305	3	8358495063
492354322345	402	8358495063
432890572	93	8358495063
43564678987	235	4389754987
43252	43	4389754987
8658675687	653	4389754987
76555546	243	4389754987
\.


--
-- TOC entry 3321 (class 0 OID 16840)
-- Dependencies: 205
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."order" (orderid, orderstatus, orderdate, customeremail, customeraddress, orderamount, deliveryservice) FROM stdin;
\.


--
-- TOC entry 3322 (class 0 OID 16846)
-- Dependencies: 206
-- Data for Name: orderdescription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderdescription ("order", product, quantity) FROM stdin;
\.


--
-- TOC entry 3323 (class 0 OID 16849)
-- Dependencies: 207
-- Data for Name: paymentcard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paymentcard (cardtype, cardnumber, cardholdername, cardexpirydate, customeremail) FROM stdin;
\.


--
-- TOC entry 3324 (class 0 OID 16852)
-- Dependencies: 208
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (sku, name, color, itemcondition, description, stockquantity, location, dateadded, brand, category, adminseller, supplierseller, price, model) FROM stdin;
74849305	q	\N	q	\N	1	q	2021-12-12 11:11:11	\N	\N	\N	\N	3.00	\N
492354322345	q	\N	q	\N	1	q	2021-12-12 11:11:11	\N	\N	\N	\N	3.00	\N
432890572	q	\N	q	\N	1	q	2021-12-12 11:11:11	\N	\N	\N	\N	3.00	\N
43564678987	q	\N	q	\N	1	q	2021-12-12 11:11:11	\N	\N	\N	\N	3.00	\N
43252	q	\N	q	\N	1	q	2021-12-12 11:11:11	\N	\N	\N	\N	3.00	\N
8658675687	q	\N	q	\N	1	q	2021-12-12 11:11:11	\N	\N	\N	\N	3.00	\N
76555546	q	\N	q	\N	1	q	2021-12-12 11:11:11	\N	\N	\N	\N	3.00	\N
\.


--
-- TOC entry 3325 (class 0 OID 16858)
-- Dependencies: 209
-- Data for Name: productimages ; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."productimages " (product, imageurl) FROM stdin;
\.


--
-- TOC entry 3338 (class 0 OID 16919)
-- Dependencies: 222
-- Data for Name: receipt_information; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.receipt_information (receipt_id, date, delivery_status, delivery_type, email, orderamount, address) FROM stdin;
\.


--
-- TOC entry 3326 (class 0 OID 16864)
-- Dependencies: 210
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (author, about, reviewbody, reviewratingvalue, datecreated, datemodified) FROM stdin;
\.


--
-- TOC entry 3339 (class 0 OID 16925)
-- Dependencies: 223
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (bce, companyname, email, telephone, url, addresscountry, addresscity, addresslocality, postalcode, streetaddress) FROM stdin;
\.


--
-- TOC entry 3340 (class 0 OID 16931)
-- Dependencies: 224
-- Data for Name: supplies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplies (suppliesid, "supplierBce", warehousecode, arrivaldate, "supplyState") FROM stdin;
\.


--
-- TOC entry 3327 (class 0 OID 16870)
-- Dependencies: 211
-- Data for Name: suppliesstock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suppliesstock (supply, sku, name, quantity, price) FROM stdin;
\.


--
-- TOC entry 3329 (class 0 OID 16875)
-- Dependencies: 213
-- Data for Name: transportcompany; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transportcompany (name, price_per_km, api_key) FROM stdin;
\.


--
-- TOC entry 3342 (class 0 OID 16938)
-- Dependencies: 226
-- Data for Name: transportvehicle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transportvehicle (id, "position", company) FROM stdin;
\.


--
-- TOC entry 3330 (class 0 OID 16880)
-- Dependencies: 214
-- Data for Name: warehouse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.warehouse (warehousecode, companyname, email, telephone, addresscountry, addresscity, addresslocality, postalcode, streetaddress) FROM stdin;
8358495063	DHLCONSOLIC	CONSOLIC@dhl.com	32027155050	BEL	Brussels	Vorst	1190	Brugmannlaan 113
4389754987	FedEx World Service Center	deketenGH@fedex.com	31206555260	NLD	Nederland	Eindhoven	5651	De Keten 2
\.


--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 225
-- Name: supplies_suppliesid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplies_suppliesid_seq', 1, false);


--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 212
-- Name: suppliesstock_supply_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suppliesstock_supply_seq', 1, false);


--
-- TOC entry 3106 (class 2606 OID 16947)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (email);


--
-- TOC entry 3108 (class 2606 OID 16949)
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (name);


--
-- TOC entry 3110 (class 2606 OID 16951)
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (customer, product);


--
-- TOC entry 3112 (class 2606 OID 16953)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (name);


--
-- TOC entry 3134 (class 2606 OID 16975)
-- Name: customer_receipt_connector customer_receipt_connector_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_receipt_connector
    ADD CONSTRAINT customer_receipt_connector_pkey PRIMARY KEY (email, receipt_id);


--
-- TOC entry 3136 (class 2606 OID 16977)
-- Name: customers_addresses customers_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_addresses
    ADD CONSTRAINT customers_addresses_pkey PRIMARY KEY (email, country, city, address);


--
-- TOC entry 3138 (class 2606 OID 16979)
-- Name: customers_information customers_information_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_information
    ADD CONSTRAINT customers_information_pkey PRIMARY KEY (email);


--
-- TOC entry 3140 (class 2606 OID 16981)
-- Name: delivery_services_type delivery_services_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_services_type
    ADD CONSTRAINT delivery_services_type_pkey PRIMARY KEY (delivery_kind);


--
-- TOC entry 3142 (class 2606 OID 16983)
-- Name: delivery_status_description delivery_status_description_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_status_description
    ADD CONSTRAINT delivery_status_description_pkey PRIMARY KEY (delivery_status);


--
-- TOC entry 3144 (class 2606 OID 16985)
-- Name: deliverytrip deliverytrip_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverytrip
    ADD CONSTRAINT deliverytrip_pkey PRIMARY KEY (id);


--
-- TOC entry 3146 (class 2606 OID 16987)
-- Name: goods_in_receipt goods_in_receipt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goods_in_receipt
    ADD CONSTRAINT goods_in_receipt_pkey PRIMARY KEY (receipt_id, good_id);


--
-- TOC entry 3114 (class 2606 OID 16955)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (productsku_fk, warehousecode_fk);


--
-- TOC entry 3116 (class 2606 OID 16959)
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (orderid);


--
-- TOC entry 3118 (class 2606 OID 16957)
-- Name: orderdescription orderdescription_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderdescription
    ADD CONSTRAINT orderdescription_pkey PRIMARY KEY ("order", product);


--
-- TOC entry 3120 (class 2606 OID 16961)
-- Name: paymentcard paymentcard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paymentcard
    ADD CONSTRAINT paymentcard_pkey PRIMARY KEY (cardtype, cardnumber);


--
-- TOC entry 3122 (class 2606 OID 16965)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (sku);


--
-- TOC entry 3124 (class 2606 OID 16963)
-- Name: productimages  productimages _pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."productimages "
    ADD CONSTRAINT "productimages _pkey" PRIMARY KEY (product, imageurl);


--
-- TOC entry 3148 (class 2606 OID 16989)
-- Name: receipt_information receipt_information_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_information
    ADD CONSTRAINT receipt_information_pkey PRIMARY KEY (receipt_id);


--
-- TOC entry 3126 (class 2606 OID 16967)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (author, about);


--
-- TOC entry 3150 (class 2606 OID 16991)
-- Name: supplier supplier_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pk PRIMARY KEY (bce);


--
-- TOC entry 3152 (class 2606 OID 16993)
-- Name: supplies supplies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies
    ADD CONSTRAINT supplies_pkey PRIMARY KEY (suppliesid);


--
-- TOC entry 3128 (class 2606 OID 16969)
-- Name: suppliesstock suppliesstock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliesstock
    ADD CONSTRAINT suppliesstock_pkey PRIMARY KEY (supply, sku);


--
-- TOC entry 3130 (class 2606 OID 16971)
-- Name: transportcompany transportcompany_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportcompany
    ADD CONSTRAINT transportcompany_pkey PRIMARY KEY (name);


--
-- TOC entry 3154 (class 2606 OID 16995)
-- Name: transportvehicle transportvehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportvehicle
    ADD CONSTRAINT transportvehicle_pkey PRIMARY KEY (id);


--
-- TOC entry 3132 (class 2606 OID 16973)
-- Name: warehouse warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (warehousecode);


--
-- TOC entry 3170 (class 2606 OID 16996)
-- Name: reviews about_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT about_fkey FOREIGN KEY (about) REFERENCES public.product(sku) NOT VALID;


--
-- TOC entry 3165 (class 2606 OID 17001)
-- Name: product adminseller_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT adminseller_fkey FOREIGN KEY (adminseller) REFERENCES public.admin(email) NOT VALID;


--
-- TOC entry 3171 (class 2606 OID 17006)
-- Name: reviews author_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT author_fkey FOREIGN KEY (author) REFERENCES public.customers_information(email) NOT VALID;


--
-- TOC entry 3166 (class 2606 OID 17011)
-- Name: product brand_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT brand_fkey FOREIGN KEY (brand) REFERENCES public.brand(name) NOT VALID;


--
-- TOC entry 3167 (class 2606 OID 17016)
-- Name: product category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT category_fkey FOREIGN KEY (category) REFERENCES public.category(name) NOT VALID;


--
-- TOC entry 3185 (class 2606 OID 17021)
-- Name: transportvehicle company_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transportvehicle
    ADD CONSTRAINT company_fkey FOREIGN KEY (company) REFERENCES public.transportcompany(name) NOT VALID;


--
-- TOC entry 3155 (class 2606 OID 17026)
-- Name: cart customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT customer_fkey FOREIGN KEY (customer) REFERENCES public.customers_information(email) NOT VALID;


--
-- TOC entry 3159 (class 2606 OID 17031)
-- Name: order customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT customer_fkey FOREIGN KEY (customeremail) REFERENCES public.customers_information(email) NOT VALID;


--
-- TOC entry 3164 (class 2606 OID 17036)
-- Name: paymentcard customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paymentcard
    ADD CONSTRAINT customer_fkey FOREIGN KEY (customeremail) REFERENCES public.customers_information(email) NOT VALID;


--
-- TOC entry 3176 (class 2606 OID 17041)
-- Name: customers_information delivery_kind_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_information
    ADD CONSTRAINT delivery_kind_fkey FOREIGN KEY (delivery_kind) REFERENCES public.delivery_services_type(delivery_kind) NOT VALID;


--
-- TOC entry 3180 (class 2606 OID 17046)
-- Name: receipt_information delivery_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_information
    ADD CONSTRAINT delivery_status_fkey FOREIGN KEY (delivery_status) REFERENCES public.delivery_status_description(delivery_status) NOT VALID;


--
-- TOC entry 3160 (class 2606 OID 17051)
-- Name: order delivery_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT delivery_status_fkey FOREIGN KEY (orderstatus) REFERENCES public.delivery_status_description(delivery_status) NOT VALID;


--
-- TOC entry 3181 (class 2606 OID 17056)
-- Name: receipt_information delivery_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_information
    ADD CONSTRAINT delivery_type_fkey FOREIGN KEY (delivery_type) REFERENCES public.delivery_services_type(delivery_kind) NOT VALID;


--
-- TOC entry 3161 (class 2606 OID 17061)
-- Name: order delivery_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT delivery_type_fkey FOREIGN KEY (deliveryservice) REFERENCES public.delivery_services_type(delivery_kind) NOT VALID;


--
-- TOC entry 3173 (class 2606 OID 17066)
-- Name: customer_receipt_connector email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_receipt_connector
    ADD CONSTRAINT email_fkey FOREIGN KEY (email) REFERENCES public.customers_information(email) NOT VALID;


--
-- TOC entry 3175 (class 2606 OID 17071)
-- Name: customers_addresses email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_addresses
    ADD CONSTRAINT email_fkey FOREIGN KEY (email) REFERENCES public.customers_information(email) NOT VALID;


--
-- TOC entry 3182 (class 2606 OID 17076)
-- Name: receipt_information email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_information
    ADD CONSTRAINT email_fkey FOREIGN KEY (email) REFERENCES public.customers_information(email) NOT VALID;


--
-- TOC entry 3162 (class 2606 OID 17081)
-- Name: orderdescription order_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderdescription
    ADD CONSTRAINT order_fkey FOREIGN KEY ("order") REFERENCES public."order"(orderid) NOT VALID;


--
-- TOC entry 3169 (class 2606 OID 17086)
-- Name: productimages  product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."productimages "
    ADD CONSTRAINT product_fkey FOREIGN KEY (product) REFERENCES public.product(sku) NOT VALID;


--
-- TOC entry 3156 (class 2606 OID 17091)
-- Name: cart product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT product_fkey FOREIGN KEY (product) REFERENCES public.product(sku) NOT VALID;


--
-- TOC entry 3163 (class 2606 OID 17096)
-- Name: orderdescription product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderdescription
    ADD CONSTRAINT product_fkey FOREIGN KEY (product) REFERENCES public.product(sku) NOT VALID;


--
-- TOC entry 3157 (class 2606 OID 17101)
-- Name: inventory productsku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT productsku_fkey FOREIGN KEY (productsku_fk) REFERENCES public.product(sku) NOT VALID;


--
-- TOC entry 3174 (class 2606 OID 17106)
-- Name: customer_receipt_connector receipt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_receipt_connector
    ADD CONSTRAINT receipt_id_fkey FOREIGN KEY (receipt_id) REFERENCES public.receipt_information(receipt_id) NOT VALID;


--
-- TOC entry 3179 (class 2606 OID 17111)
-- Name: goods_in_receipt receipt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goods_in_receipt
    ADD CONSTRAINT receipt_id_fkey FOREIGN KEY (receipt_id) REFERENCES public.receipt_information(receipt_id) NOT VALID;


--
-- TOC entry 3183 (class 2606 OID 17121)
-- Name: supplies supplier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies
    ADD CONSTRAINT supplier_fkey FOREIGN KEY ("supplierBce") REFERENCES public.supplier(bce) NOT VALID;


--
-- TOC entry 3168 (class 2606 OID 17116)
-- Name: product supplierseller_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT supplierseller_fkey FOREIGN KEY (supplierseller) REFERENCES public.supplier(bce) NOT VALID;


--
-- TOC entry 3172 (class 2606 OID 17126)
-- Name: suppliesstock supply_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliesstock
    ADD CONSTRAINT supply_fkey FOREIGN KEY (supply) REFERENCES public.supplies(suppliesid) NOT VALID;


--
-- TOC entry 3177 (class 2606 OID 17131)
-- Name: deliverytrip truck_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverytrip
    ADD CONSTRAINT truck_fkey FOREIGN KEY (truck) REFERENCES public.transportvehicle(id) NOT VALID;


--
-- TOC entry 3184 (class 2606 OID 17136)
-- Name: supplies warehouse_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies
    ADD CONSTRAINT warehouse_fkey FOREIGN KEY (warehousecode) REFERENCES public.warehouse(warehousecode) NOT VALID;


--
-- TOC entry 3178 (class 2606 OID 17141)
-- Name: deliverytrip warehouse_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverytrip
    ADD CONSTRAINT warehouse_fkey FOREIGN KEY (starting_warehouse) REFERENCES public.warehouse(warehousecode) NOT VALID;


--
-- TOC entry 3158 (class 2606 OID 17146)
-- Name: inventory warehousecode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT warehousecode_fkey FOREIGN KEY (warehousecode_fk) REFERENCES public.warehouse(warehousecode) NOT VALID;


-- Completed on 2021-12-21 16:24:43 CET

--
-- PostgreSQL database dump complete
--

