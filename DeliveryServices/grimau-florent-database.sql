CREATE DATABASE grimauflorentois
    WITH
    OWNER = postgres;

\connect grimauflorentois

--
-- Tables creation
--

BEGIN;

CREATE TABLE public.transportcompany(
    name            CHAR(50) NOT NULL UNIQUE,
    price_per_km    FLOAT DEFAULT 0,
    api_key         CHAR(50) DEFAULT 'missing'
);

ALTER TABLE public.transportcompany OWNER TO postgres;


CREATE TABLE public.transportvehicle(
    id              SERIAL NOT NULL,
    position        CHAR(50),

    company         CHAR(50) NOT NULL
);

ALTER TABLE public.transportvehicle OWNER TO postgres;


CREATE TABLE public.deliverytrip(
    id                  SERIAL NOT NULL,
    departure_time      TIMESTAMP,
    arrival_time        TIMESTAMP,

    truck               INTEGER NOT NULL,
    starting_warehouse  character varying(10) NOT NULL
);

ALTER TABLE public.deliverytrip OWNER TO postgres;


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


CREATE TABLE public.order (
    id                  SERIAL NOT NULL,
    email               CHAR(100),
    date                TIMESTAMP NOT NULL,
    address             CHAR(50),
    status              character varying(128) NOT NULL,
    delivery_type       character varying(128) NOT NULL,
    trip                INTEGER NOT NULL
);

ALTER TABLE public.order OWNER TO postgres;

--
-- Constraints
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (warehousecode);

ALTER TABLE ONLY public.transportvehicle
	ADD CONSTRAINT transportvehicle_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.deliverytrip
	ADD CONSTRAINT deliverytrip_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.transportcompany
	ADD CONSTRAINT transportcompany_pkey PRIMARY KEY (name);

ALTER TABLE ONLY public.order
	ADD CONSTRAINT order_pkey PRIMARY KEY (id);

ALTER TABLE public.transportvehicle ADD FOREIGN KEY(company) REFERENCES public.transportcompany(name) ON DELETE CASCADE;

ALTER TABLE public.deliverytrip ADD FOREIGN KEY(truck) REFERENCES public.transportvehicle(id) ON DELETE CASCADE;
ALTER TABLE public.deliverytrip ADD FOREIGN KEY(starting_warehouse) REFERENCES public.warehouse(warehousecode) ON DELETE CASCADE;

ALTER TABLE public.order ADD FOREIGN KEY(trip) REFERENCES public.deliverytrip(id) ON DELETE CASCADE;

COMMIT;

--
-- Data dump
--

BEGIN;

COPY public.warehouse (warehousecode, companyname, email, telephone, addresscountry, addresscity, addresslocality, postalcode, streetaddress) FROM stdin;
8358495063	DHLCONSOLIC	CONSOLIC@dhl.com	32027155050	BEL	Brussels	Vorst	1190	Brugmannlaan 113
4389754987	FedEx World Service Center	deketenGH@fedex.com	31206555260	NLD	Nederland	Eindhoven	5651	De Keten 2
\.

COPY public.transportcompany (name, price_per_km, api_key) FROM stdin;
BPost	3	thisisanawesomekey
PostNL	2	thisisanotherawesomekey
UPS	1	thiskeyisabsolutelyawesome
DHL	1	thiskeyisasecretverywellkept
\.

COPY public.transportvehicle (position, company) FROM stdin;
Namur	BPost
Anvers	PostNL
Mons	UPS
Enghien	DHL
Anvers	BPost
Mons	PostNL
Bruxelles	UPS
Bruxelles	DHL
\.

COPY public.deliverytrip (departure_time, arrival_time, truck, starting_warehouse) FROM stdin;
2021-11-02 12:34:36+0100	\N	1	8358495063
2021-11-02 12:34:36+0100	2021-11-03 10:14:15+0100	2	8358495063
\N	\N	2	4389754987
2021-11-02 12:34:36+0100	2021-11-05 14:26:18+0100	3	8358495063
2021-11-02 12:34:36+0100	\N	4	4389754987
2021-11-02 12:34:36+0100	\N	4	4389754987
\.


COPY public.order (email, date, address, status, delivery_type, trip) FROM stdin;
one@test.mail	2021-11-02 12:34:36+0100	Vermont Street 123	on the road	quick	1
another@test.mail	2021-08-07 09:23:36+0100	Vermont Street 123	delivered	quick	1
one_more@test.mail	2021-03-02 11:35:31+0100	Vermont Street 123	lost	quick	1
last@test.mail	2021-12-22 17:48:16+0100	Vermont Street 123	found	quick	1
\.

COMMIT;
