--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5 (Ubuntu 13.5-1.pgdg21.04+1)
-- Dumped by pg_dump version 13.5 (Ubuntu 13.5-1.pgdg21.04+1)

-- Started on 2021-11-14 23:46:41 CET

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
-- TOC entry 205 (class 1259 OID 16589)
-- Name: business; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.business (
    telephone_number integer NOT NULL,
    name character varying(128) NOT NULL,
    address character varying(128) NOT NULL,
    email character varying(128) NOT NULL
);


ALTER TABLE public.business OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16520)
-- Name: delivery_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_service (
    email character varying(128) NOT NULL,
    telephone_number integer NOT NULL,
    address character varying(128) NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE public.delivery_service OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16623)
-- Name: distributor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.distributor (
    shipment_id integer,
    delivery_service_name character varying(128),
    delivery_service_email character varying(128),
    delivery_service_address character varying(128),
    delivery_service_telephone_number integer
);


ALTER TABLE public.distributor OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16525)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employee_number integer NOT NULL,
    profession character varying(128),
    telephone_number integer,
    name character varying(128),
    surname character varying(128),
    business_telephone_number integer,
    business_address character varying(128),
    business_email character varying(128),
    business_name character varying(128)
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16486)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    name character varying(128),
    product_id integer NOT NULL,
    shipment_id integer,
    warehouse_address character varying(128),
    warehouse_name character varying(128),
    warehouse_email character varying(128),
    warehouse_telephone_number integer,
    amount_in_stock integer
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16515)
-- Name: shipment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipment (
    shipment_id integer NOT NULL,
    destination_address character varying(128)
);


ALTER TABLE public.shipment OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16478)
-- Name: warehouse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouse (
    email character varying(128) NOT NULL,
    telephone_number integer NOT NULL,
    address character varying(128) NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE public.warehouse OWNER TO postgres;

--
-- TOC entry 3197 (class 0 OID 16589)
-- Dependencies: 205
-- Data for Name: business; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.business (telephone_number, name, address, email) FROM stdin;
1234	bol	brusselsesteenweg 1	bol@gmail.com
2222	dhl	brusselsesteenweg 2	dhl@gmail.com
3333	agoodwarehouse	brusselsesteenweg 3	agw@gmail.com
4444	bpost	brusselsesteenweg 4	bpost@gmail.com
\.


--
-- TOC entry 3195 (class 0 OID 16520)
-- Dependencies: 203
-- Data for Name: delivery_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery_service (email, telephone_number, address, name) FROM stdin;
bpost@gmail.com	4444	brusselsesteenweg 4	bpost
dhl@gmail.com	2222	brusselsesteenweg 2	dhl
\.


--
-- TOC entry 3198 (class 0 OID 16623)
-- Dependencies: 206
-- Data for Name: distributor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.distributor (shipment_id, delivery_service_name, delivery_service_email, delivery_service_address, delivery_service_telephone_number) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 16525)
-- Dependencies: 204
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (employee_number, profession, telephone_number, name, surname, business_telephone_number, business_address, business_email, business_name) FROM stdin;
1	manager	1111	john	smith	1234	brusselsesteenweg 1	bol@gmail.com	bol
\.


--
-- TOC entry 3193 (class 0 OID 16486)
-- Dependencies: 201
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (name, product_id, shipment_id, warehouse_address, warehouse_name, warehouse_email, warehouse_telephone_number, amount_in_stock) FROM stdin;
macbook	1	1	brusselsesteenweg 1	bol	bol@gmail.com	1234	53
airpods	3	1	brusselsesteenweg 1	bol	bol@gmail.com	1234	99
smart tv	2	2	brusselsesteenweg 3	agoodwarehouse	agw@gmail.com	3333	0
\.


--
-- TOC entry 3194 (class 0 OID 16515)
-- Dependencies: 202
-- Data for Name: shipment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipment (shipment_id, destination_address) FROM stdin;
1	gentsesteenweg 1
2	leuvensesteenweg 2
\.


--
-- TOC entry 3192 (class 0 OID 16478)
-- Dependencies: 200
-- Data for Name: warehouse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.warehouse (email, telephone_number, address, name) FROM stdin;
bol@gmail.com	1234	brusselsesteenweg 1	bol
agw@gmail.com	3333	brusselsesteenweg 3	agoodwarehouse
\.


--
-- TOC entry 3054 (class 2606 OID 16593)
-- Name: business business_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_pkey PRIMARY KEY (telephone_number, name, address, email);


--
-- TOC entry 3050 (class 2606 OID 16524)
-- Name: delivery_service delivery_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_service
    ADD CONSTRAINT delivery_service_pkey PRIMARY KEY (email, telephone_number, address, name);


--
-- TOC entry 3052 (class 2606 OID 16529)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_number);


--
-- TOC entry 3046 (class 2606 OID 16490)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- TOC entry 3048 (class 2606 OID 16519)
-- Name: shipment shipment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipment
    ADD CONSTRAINT shipment_pkey PRIMARY KEY (shipment_id);


--
-- TOC entry 3044 (class 2606 OID 16510)
-- Name: warehouse warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (email, telephone_number, address, name);


--
-- TOC entry 3058 (class 2606 OID 16603)
-- Name: delivery_service business_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_service
    ADD CONSTRAINT business_fk FOREIGN KEY (telephone_number, email, address, name) REFERENCES public.business(telephone_number, email, address, name) NOT VALID;


--
-- TOC entry 3055 (class 2606 OID 16608)
-- Name: warehouse business_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT business_fk FOREIGN KEY (email, telephone_number, address, name) REFERENCES public.business(email, telephone_number, address, name) NOT VALID;


--
-- TOC entry 3059 (class 2606 OID 16613)
-- Name: employee business_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT business_fk FOREIGN KEY (business_telephone_number, business_address, business_email, business_name) REFERENCES public.business(telephone_number, address, email, name) NOT VALID;


--
-- TOC entry 3061 (class 2606 OID 16631)
-- Name: distributor delivery_service_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.distributor
    ADD CONSTRAINT delivery_service_fk FOREIGN KEY (delivery_service_name, delivery_service_email, delivery_service_address, delivery_service_telephone_number) REFERENCES public.delivery_service(name, email, address, telephone_number);


--
-- TOC entry 3056 (class 2606 OID 16570)
-- Name: product shipment_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT shipment_id_fk FOREIGN KEY (shipment_id) REFERENCES public.shipment(shipment_id) NOT VALID;


--
-- TOC entry 3060 (class 2606 OID 16626)
-- Name: distributor shipment_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.distributor
    ADD CONSTRAINT shipment_id_fk FOREIGN KEY (shipment_id) REFERENCES public.shipment(shipment_id);


--
-- TOC entry 3057 (class 2606 OID 16618)
-- Name: product warehouse_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT warehouse_fk FOREIGN KEY (warehouse_address, warehouse_name, warehouse_email, warehouse_telephone_number) REFERENCES public.warehouse(address, name, email, telephone_number) NOT VALID;


-- Completed on 2021-11-14 23:46:42 CET

--
-- PostgreSQL database dump complete
--

