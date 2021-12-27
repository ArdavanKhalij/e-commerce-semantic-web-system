--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.1

-- Started on 2021-11-14 11:50:19 CET

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

DROP DATABASE "Customers";
--
-- TOC entry 3632 (class 1262 OID 16394)
-- Name: Customers; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Customers" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE "Customers" OWNER TO postgres;

\connect "Customers"

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

--
-- TOC entry 3633 (class 0 OID 0)
-- Dependencies: 3632
-- Name: DATABASE "Customers"; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE "Customers" IS 'OIS Project';


SET default_tablespace = '';

SET default_table_access_method = heap;

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
-- TOC entry 216 (class 1259 OID 16453)
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
-- Name: delivery_servies_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_servies_types (
    delivery_kind character varying(128) NOT NULL,
    price double precision NOT NULL,
    delivery_duration integer NOT NULL
);


ALTER TABLE public.delivery_servies_types OWNER TO postgres;

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
    price double precision NOT NULL,
    numberof integer NOT NULL
);


ALTER TABLE public.goods_in_receipt OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16436)
-- Name: payment_status_description; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_status_description (
    payment_status character varying(128) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.payment_status_description OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16419)
-- Name: receipt_information; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receipt_information (
    receipt_id character varying(64) NOT NULL,
    date date NOT NULL,
    delivery_status character varying(128) NOT NULL,
    payment_status character varying(128) NOT NULL
);


ALTER TABLE public.receipt_information OWNER TO postgres;

--
-- TOC entry 3621 (class 0 OID 16414)
-- Dependencies: 211
-- Data for Name: customer_receipt_connector; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer_receipt_connector (email, receipt_id) VALUES ('ardavan.khalij@vub.be', '1');
INSERT INTO public.customer_receipt_connector (email, receipt_id) VALUES ('harry.potter@hogwarts.uk', '2');
INSERT INTO public.customer_receipt_connector (email, receipt_id) VALUES ('rick.sanchez@yahoo.com', '3');


--
-- TOC entry 3626 (class 0 OID 16453)
-- Dependencies: 216
-- Data for Name: customers_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customers_addresses (email, country, city, address) VALUES ('ardavan.khalij@vub.be', 'Belgium', 'Brussels', 'Kroonlaan 238');
INSERT INTO public.customers_addresses (email, country, city, address) VALUES ('ardavan.khalij@vub.be', 'Iran', 'Tehran', 'Dibaji 10');
INSERT INTO public.customers_addresses (email, country, city, address) VALUES ('ross.geller@gmail.com', 'USA', 'New York', 'Manhattan, 233, 23');
INSERT INTO public.customers_addresses (email, country, city, address) VALUES ('monica.geller@gmail.com', 'USA', 'New York', 'Manhattan, 223, 3');
INSERT INTO public.customers_addresses (email, country, city, address) VALUES ('rick.sanchez@yahoo.com', 'USA', 'Seattle', '2, 10');
INSERT INTO public.customers_addresses (email, country, city, address) VALUES ('harry.potter@hogwarts.uk', 'UK', 'London', 'Privet Drive 4');
INSERT INTO public.customers_addresses (email, country, city, address) VALUES ('tonystark@gmail.com', 'USA', 'New York', 'Manhattan, Stark Tower');
INSERT INTO public.customers_addresses (email, country, city, address) VALUES ('ted.mosby@gmail.com', 'USA', 'New York', 'Manhattan, 180, 44');


--
-- TOC entry 3619 (class 0 OID 16395)
-- Dependencies: 209
-- Data for Name: customers_information; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customers_information (first_name, last_name, birth_date, delivery_kind, email, phone_number) VALUES ('Ardavan', 'Khalij', '1998-11-15', 'Express', 'ardavan.khalij@vub.be', '+32467842501');
INSERT INTO public.customers_information (first_name, last_name, birth_date, delivery_kind, email, phone_number) VALUES ('Ross', 'Geller', '1968-10-25', 'Ordinary', 'ross.geller@gmail.com', '+1342987444');
INSERT INTO public.customers_information (first_name, last_name, birth_date, delivery_kind, email, phone_number) VALUES ('Monica', 'Geller', '1970-09-02', 'Fast', 'monica.geller@gmail.com', '+1342987442');
INSERT INTO public.customers_information (first_name, last_name, birth_date, delivery_kind, email, phone_number) VALUES ('Rick', 'Sanchez', '1958-11-15', 'Express', 'rick.sanchez@yahoo.com', '+1467844325');
INSERT INTO public.customers_information (first_name, last_name, birth_date, delivery_kind, email, phone_number) VALUES ('Harry', 'Potter', '1992-09-19', 'Super fast', 'harry.potter@hogwarts.uk', '+44987823775');
INSERT INTO public.customers_information (first_name, last_name, birth_date, delivery_kind, email, phone_number) VALUES ('Tony', 'Stark', '1976-01-05', 'Express', 'tonystark@gmail.com', '+1637876787');
INSERT INTO public.customers_information (first_name, last_name, birth_date, delivery_kind, email, phone_number) VALUES ('Ted', 'Mosby', '1978-01-24', 'Fast', 'ted.mosby@gmail.com', '+1637873456');


--
-- TOC entry 3620 (class 0 OID 16409)
-- Dependencies: 210
-- Data for Name: delivery_servies_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.delivery_servies_types (delivery_kind, price, delivery_duration) VALUES ('Super fast', 30, 25);
INSERT INTO public.delivery_servies_types (delivery_kind, price, delivery_duration) VALUES ('Fast', 25, 35);
INSERT INTO public.delivery_servies_types (delivery_kind, price, delivery_duration) VALUES ('Ordinary', 20, 45);
INSERT INTO public.delivery_servies_types (delivery_kind, price, delivery_duration) VALUES ('Express', 40, 10);


--
-- TOC entry 3624 (class 0 OID 16429)
-- Dependencies: 214
-- Data for Name: delivery_status_description; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.delivery_status_description (delivery_status, decription) VALUES ('Delivered', 'The purchase has deliverd to the customer.');
INSERT INTO public.delivery_status_description (delivery_status, decription) VALUES ('Not Delivered', 'The purchase has not deliverd to the customer.');


--
-- TOC entry 3623 (class 0 OID 16424)
-- Dependencies: 213
-- Data for Name: goods_in_receipt; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.goods_in_receipt (receipt_id, good_id, price, numberof) VALUES ('1', '1', 3, 1);
INSERT INTO public.goods_in_receipt (receipt_id, good_id, price, numberof) VALUES ('1', '2', 10, 4);
INSERT INTO public.goods_in_receipt (receipt_id, good_id, price, numberof) VALUES ('1', '3', 30, 3);
INSERT INTO public.goods_in_receipt (receipt_id, good_id, price, numberof) VALUES ('1', '4', 8, 1);
INSERT INTO public.goods_in_receipt (receipt_id, good_id, price, numberof) VALUES ('2', '1', 3, 1);
INSERT INTO public.goods_in_receipt (receipt_id, good_id, price, numberof) VALUES ('2', '3', 30, 2);
INSERT INTO public.goods_in_receipt (receipt_id, good_id, price, numberof) VALUES ('3', '1', 3, 1);
INSERT INTO public.goods_in_receipt (receipt_id, good_id, price, numberof) VALUES ('3', '2', 10, 1);


--
-- TOC entry 3625 (class 0 OID 16436)
-- Dependencies: 215
-- Data for Name: payment_status_description; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.payment_status_description (payment_status, description) VALUES ('Paid', 'The customer paid the money.');
INSERT INTO public.payment_status_description (payment_status, description) VALUES ('Not Paid', 'The customer didny pay the money yet.');


--
-- TOC entry 3622 (class 0 OID 16419)
-- Dependencies: 212
-- Data for Name: receipt_information; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.receipt_information (receipt_id, date, delivery_status, payment_status) VALUES ('1', '2021-10-09', 'Delivered', 'Paid');
INSERT INTO public.receipt_information (receipt_id, date, delivery_status, payment_status) VALUES ('2', '2021-10-29', 'Not Delivered', 'Not Paid');
INSERT INTO public.receipt_information (receipt_id, date, delivery_status, payment_status) VALUES ('3', '2021-11-09', 'Not Delivered', 'Paid');


--
-- TOC entry 3462 (class 2606 OID 16418)
-- Name: customer_receipt_connector customer_receipt_connector_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_receipt_connector
    ADD CONSTRAINT customer_receipt_connector_pkey PRIMARY KEY (email, receipt_id);


--
-- TOC entry 3472 (class 2606 OID 16459)
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
-- Name: delivery_servies_types delivery_servies_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_servies_types
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
-- TOC entry 3470 (class 2606 OID 16442)
-- Name: payment_status_description payment_status_description_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_status_description
    ADD CONSTRAINT payment_status_description_pkey PRIMARY KEY (payment_status);


--
-- TOC entry 3464 (class 2606 OID 16423)
-- Name: receipt_information receipt_information_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_information
    ADD CONSTRAINT receipt_information_pkey PRIMARY KEY (receipt_id);


--
-- TOC entry 3473 (class 2606 OID 16465)
-- Name: customers_information delivery_kind; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_information
    ADD CONSTRAINT delivery_kind FOREIGN KEY (delivery_kind) REFERENCES public.delivery_servies_types(delivery_kind) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;


--
-- TOC entry 3476 (class 2606 OID 16490)
-- Name: receipt_information delivery_status; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_information
    ADD CONSTRAINT delivery_status FOREIGN KEY (delivery_status) REFERENCES public.delivery_status_description(delivery_status) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;


--
-- TOC entry 3474 (class 2606 OID 16443)
-- Name: customer_receipt_connector email; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_receipt_connector
    ADD CONSTRAINT email FOREIGN KEY (email) REFERENCES public.customers_information(email) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3479 (class 2606 OID 16460)
-- Name: customers_addresses email; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_addresses
    ADD CONSTRAINT email FOREIGN KEY (email) REFERENCES public.customers_information(email) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3477 (class 2606 OID 16485)
-- Name: receipt_information payment_status; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_information
    ADD CONSTRAINT payment_status FOREIGN KEY (payment_status) REFERENCES public.payment_status_description(payment_status) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;


--
-- TOC entry 3475 (class 2606 OID 16448)
-- Name: customer_receipt_connector receipt_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_receipt_connector
    ADD CONSTRAINT receipt_id FOREIGN KEY (receipt_id) REFERENCES public.receipt_information(receipt_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 3478 (class 2606 OID 16470)
-- Name: goods_in_receipt receipt_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goods_in_receipt
    ADD CONSTRAINT receipt_id FOREIGN KEY (receipt_id) REFERENCES public.receipt_information(receipt_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


-- Completed on 2021-11-14 11:50:19 CET

--
-- PostgreSQL database dump complete
--
