--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.1

-- Started on 2021-12-11 21:54:52 CET

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
-- TOC entry 216 (class 1259 OID 16495)
-- Name: PaymentCard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PaymentCard" (
    "cardType" character varying(10) NOT NULL,
    "cardNumber" character varying(17) NOT NULL,
    "cardHolderName" character varying(100) NOT NULL,
    "cardExpiryDate" date NOT NULL,
    customer character varying(100) NOT NULL,
    "customerEmail" character varying(256) NOT NULL
);


ALTER TABLE public."PaymentCard" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16414)
-- Name: customer_receipt_connector; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_receipt_connector (
    email character varying(256) NOT NULL,
    receipt_id character varying(64) NOT NULL
);


ALTER TABLE public.customer_receipt_connector OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16453)
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
-- TOC entry 209 (class 1259 OID 16395)
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
-- TOC entry 210 (class 1259 OID 16409)
-- Name: delivery_services_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_services_type (
    delivery_kind character varying(128) NOT NULL,
    price double precision NOT NULL,
    delivery_duration integer NOT NULL
);


ALTER TABLE public.delivery_services_type OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16429)
-- Name: delivery_status_description; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_status_description (
    delivery_status character varying(128) NOT NULL,
    decription text NOT NULL
);


ALTER TABLE public.delivery_status_description OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16424)
-- Name: goods_in_receipt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.goods_in_receipt (
    receipt_id character varying(64) NOT NULL,
    good_id character varying(64) NOT NULL,
    numberof integer NOT NULL
);


ALTER TABLE public.goods_in_receipt OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16419)
-- Name: receipt_information; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receipt_information (
    receipt_id character varying(64) NOT NULL,
    date date NOT NULL,
    delivery_status character varying(128) NOT NULL,
    delivery_type character varying(128) NOT NULL,
    email character varying(256),
    "orderAmount" integer,
    address text
);


ALTER TABLE public.receipt_information OWNER TO postgres;

--
-- TOC entry 3628 (class 0 OID 16495)
-- Dependencies: 216
-- Data for Name: PaymentCard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PaymentCard" ("cardType", "cardNumber", "cardHolderName", "cardExpiryDate", customer, "customerEmail") FROM stdin;
\.


--
-- TOC entry 3623 (class 0 OID 16414)
-- Dependencies: 211
-- Data for Name: customer_receipt_connector; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_receipt_connector (email, receipt_id) FROM stdin;
ardavan.khalij@vub.be	1
harry.potter@hogwarts.uk	2
rick.sanchez@yahoo.com	3
\.


--
-- TOC entry 3627 (class 0 OID 16453)
-- Dependencies: 215
-- Data for Name: customers_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers_addresses (email, country, city, address) FROM stdin;
ardavan.khalij@vub.be	Belgium	Brussels	Kroonlaan 238
ardavan.khalij@vub.be	Iran	Tehran	Dibaji 10
ross.geller@gmail.com	USA	New York	Manhattan, 233, 23
monica.geller@gmail.com	USA	New York	Manhattan, 223, 3
rick.sanchez@yahoo.com	USA	Seattle	2, 10
harry.potter@hogwarts.uk	UK	London	Privet Drive 4
tonystark@gmail.com	USA	New York	Manhattan, Stark Tower
ted.mosby@gmail.com	USA	New York	Manhattan, 180, 44
\.


--
-- TOC entry 3621 (class 0 OID 16395)
-- Dependencies: 209
-- Data for Name: customers_information; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers_information (first_name, last_name, birth_date, delivery_kind, email, phone_number) FROM stdin;
Ardavan	Khalij	1998-11-15	Express	ardavan.khalij@vub.be	+32467842501
Ross	Geller	1968-10-25	Ordinary	ross.geller@gmail.com	+1342987444
Monica	Geller	1970-09-02	Fast	monica.geller@gmail.com	+1342987442
Rick	Sanchez	1958-11-15	Express	rick.sanchez@yahoo.com	+1467844325
Harry	Potter	1992-09-19	Super fast	harry.potter@hogwarts.uk	+44987823775
Tony	Stark	1976-01-05	Express	tonystark@gmail.com	+1637876787
Ted	Mosby	1978-01-24	Fast	ted.mosby@gmail.com	+1637873456
\.


--
-- TOC entry 3622 (class 0 OID 16409)
-- Dependencies: 210
-- Data for Name: delivery_services_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery_services_type (delivery_kind, price, delivery_duration) FROM stdin;
Super fast	30	25
Fast	25	35
Ordinary	20	45
Express	40	10
\.


--
-- TOC entry 3626 (class 0 OID 16429)
-- Dependencies: 214
-- Data for Name: delivery_status_description; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery_status_description (delivery_status, decription) FROM stdin;
Delivered	The purchase has deliverd to the customer.
Not Delivered	The purchase has not deliverd to the customer.
\.


--
-- TOC entry 3625 (class 0 OID 16424)
-- Dependencies: 213
-- Data for Name: goods_in_receipt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.goods_in_receipt (receipt_id, good_id, numberof) FROM stdin;
1	1	1
1	2	4
1	3	3
1	4	1
2	1	1
2	3	2
3	1	1
3	2	1
\.


--
-- TOC entry 3624 (class 0 OID 16419)
-- Dependencies: 212
-- Data for Name: receipt_information; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.receipt_information (receipt_id, date, delivery_status, delivery_type, email, "orderAmount", address) FROM stdin;
1	2021-10-09	Delivered	Paid	\N	\N	\N
2	2021-10-29	Not Delivered	Not Paid	\N	\N	\N
3	2021-11-09	Not Delivered	Paid	\N	\N	\N
\.


--
-- TOC entry 3472 (class 2606 OID 16499)
-- Name: PaymentCard PaymentCard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaymentCard"
    ADD CONSTRAINT "PaymentCard_pkey" PRIMARY KEY ("cardType", "cardNumber");


--
-- TOC entry 3462 (class 2606 OID 16418)
-- Name: customer_receipt_connector customer_receipt_connector_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_receipt_connector
    ADD CONSTRAINT customer_receipt_connector_pkey PRIMARY KEY (email, receipt_id);


--
-- TOC entry 3470 (class 2606 OID 16459)
-- Name: customers_addresses customers_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_addresses
    ADD CONSTRAINT customers_addresses_pkey PRIMARY KEY (email, country, city, address);


--
-- TOC entry 3458 (class 2606 OID 16401)
-- Name: customers_information customers_information_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_information
    ADD CONSTRAINT customers_information_pkey PRIMARY KEY (email);


--
-- TOC entry 3460 (class 2606 OID 16413)
-- Name: delivery_services_type delivery_servies_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_services_type
    ADD CONSTRAINT delivery_servies_types_pkey PRIMARY KEY (delivery_kind);


--
-- TOC entry 3468 (class 2606 OID 16435)
-- Name: delivery_status_description delivery_status_description_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_status_description
    ADD CONSTRAINT delivery_status_description_pkey PRIMARY KEY (delivery_status);


--
-- TOC entry 3466 (class 2606 OID 16428)
-- Name: goods_in_receipt goods_in_receipt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goods_in_receipt
    ADD CONSTRAINT goods_in_receipt_pkey PRIMARY KEY (receipt_id, good_id);


--
-- TOC entry 3464 (class 2606 OID 16423)
-- Name: receipt_information receipt_information_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_information
    ADD CONSTRAINT receipt_information_pkey PRIMARY KEY (receipt_id);


--
-- TOC entry 3481 (class 2606 OID 16505)
-- Name: PaymentCard customerEmail; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaymentCard"
    ADD CONSTRAINT "customerEmail" FOREIGN KEY ("customerEmail") REFERENCES public.customers_information(email) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3473 (class 2606 OID 16465)
-- Name: customers_information delivery_kind; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_information
    ADD CONSTRAINT delivery_kind FOREIGN KEY (delivery_kind) REFERENCES public.delivery_services_type(delivery_kind) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;


--
-- TOC entry 3476 (class 2606 OID 16490)
-- Name: receipt_information delivery_status; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_information
    ADD CONSTRAINT delivery_status FOREIGN KEY (delivery_status) REFERENCES public.delivery_status_description(delivery_status) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;


--
-- TOC entry 3478 (class 2606 OID 16524)
-- Name: receipt_information delivery_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_information
    ADD CONSTRAINT delivery_type FOREIGN KEY (delivery_type) REFERENCES public.delivery_services_type(delivery_kind) ON UPDATE SET NULL ON DELETE SET NULL NOT VALID;


--
-- TOC entry 3474 (class 2606 OID 16443)
-- Name: customer_receipt_connector email; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_receipt_connector
    ADD CONSTRAINT email FOREIGN KEY (email) REFERENCES public.customers_information(email) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3480 (class 2606 OID 16460)
-- Name: customers_addresses email; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_addresses
    ADD CONSTRAINT email FOREIGN KEY (email) REFERENCES public.customers_information(email) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3477 (class 2606 OID 16514)
-- Name: receipt_information email; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_information
    ADD CONSTRAINT email FOREIGN KEY (email) REFERENCES public.customers_information(email) NOT VALID;


--
-- TOC entry 3475 (class 2606 OID 16448)
-- Name: customer_receipt_connector receipt_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_receipt_connector
    ADD CONSTRAINT receipt_id FOREIGN KEY (receipt_id) REFERENCES public.receipt_information(receipt_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 3479 (class 2606 OID 16470)
-- Name: goods_in_receipt receipt_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goods_in_receipt
    ADD CONSTRAINT receipt_id FOREIGN KEY (receipt_id) REFERENCES public.receipt_information(receipt_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


-- Completed on 2021-12-11 21:54:52 CET

--
-- PostgreSQL database dump complete
--

