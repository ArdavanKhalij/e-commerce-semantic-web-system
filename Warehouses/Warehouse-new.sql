--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5 (Ubuntu 13.5-2.pgdg20.04+1)
-- Dumped by pg_dump version 13.5 (Ubuntu 13.5-2.pgdg20.04+1)

-- Started on 2021-12-11 18:28:56 CET

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
-- TOC entry 201 (class 1259 OID 16479)
-- Name: Inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Inventory" (
    productsku_fk character varying(30) NOT NULL,  --this is a fk from product
    quantity numeric(5,0) NOT NULL,
    warehousebce_fk character varying(10) NOT NULL
);


ALTER TABLE public."Inventory" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16471)
-- Name: Warehouse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Warehouse" (
    bce character varying(10) NOT NULL,
    "companyName" character varying(128) NOT NULL,
    email character varying(256) NOT NULL,
    telephone character varying(20) NOT NULL,
    "addressCountry" character varying(3) NOT NULL,
    "addressCity" character varying(50) NOT NULL,
    "addressLocality" character varying(50) NOT NULL,
    "postalCode" character varying(25) NOT NULL,
    "streetAddress" character varying(256) NOT NULL
);


ALTER TABLE public."Warehouse" OWNER TO postgres;

--
-- TOC entry 3126 (class 0 OID 16479)
-- Dependencies: 201
-- Data for Name: Inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Inventory" (productsku_fk, quantity, warehousebce_fk) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 16471)
-- Dependencies: 200
-- Data for Name: Warehouse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Warehouse" (bce, "companyName", email, telephone, "addressCountry", "addressCity", "addressLocality", "postalCode", "streetAddress") FROM stdin;
\.


--
-- TOC entry 2993 (class 2606 OID 16478)
-- Name: Warehouse Warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Warehouse"
    ADD CONSTRAINT "Warehouse_pkey" PRIMARY KEY (bce);


--
-- TOC entry 2994 (class 2606 OID 16485)
-- Name: Inventory warehousebce_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Inventory"
    ADD CONSTRAINT warehousebce_fk FOREIGN KEY (warehousebce_fk) REFERENCES public."Warehouse"(bce) NOT VALID;


-- Completed on 2021-12-11 18:28:56 CET

--
-- PostgreSQL database dump complete
--
