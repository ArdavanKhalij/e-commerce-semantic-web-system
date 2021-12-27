--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

-- Started on 2021-12-23 15:34:02

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
-- TOC entry 2 (class 3079 OID 41054)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 3113 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 40980)
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    name character varying(30) NOT NULL,
    telephone character varying(20) NOT NULL,
    email character varying(30) NOT NULL
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- TOC entry 3114 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE admin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.admin IS 'contains the admins of the platform';


--
-- TOC entry 204 (class 1259 OID 40985)
-- Name: brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brand (
    name character varying(30) NOT NULL
);


ALTER TABLE public.brand OWNER TO postgres;

--
-- TOC entry 3115 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE brand; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.brand IS 'Contains the product brands';


--
-- TOC entry 209 (class 1259 OID 41117)
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    customer_email character varying(256) NOT NULL,
    product character varying(30) NOT NULL,
    date_added timestamp without time zone
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- TOC entry 3116 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE cart; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.cart IS 'Contains the shopping cart of a customer';


--
-- TOC entry 205 (class 1259 OID 40990)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE category; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.category IS 'Contains the product categories';


--
-- TOC entry 212 (class 1259 OID 74824)
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
-- TOC entry 201 (class 1259 OID 40970)
-- Name: customers_information; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers_information (
    first_name character varying(128) NOT NULL,
    email character varying(256) NOT NULL,
    phone_number character varying(20) NOT NULL,
    last_name character varying(128),
    delivery_kind character varying(128),
    birth_date date
);


ALTER TABLE public.customers_information OWNER TO postgres;

--
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE customers_information; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.customers_information IS 'Contains the customers on the platform.';


--
-- TOC entry 213 (class 1259 OID 74848)
-- Name: delivery_services_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_services_type (
    delivery_kind character varying(128) NOT NULL,
    price double precision NOT NULL,
    delivery_duration integer NOT NULL
);


ALTER TABLE public.delivery_services_type OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 74851)
-- Name: delivery_status_description; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_status_description (
    delivery_status character varying(128) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.delivery_status_description OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 41190)
-- Name: order_description; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_description (
    "order" character varying(15) NOT NULL,
    product character varying(30) NOT NULL,
    quantity integer NOT NULL,
    date_created timestamp without time zone NOT NULL
);


ALTER TABLE public.order_description OWNER TO postgres;

--
-- TOC entry 3119 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE order_description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.order_description IS 'Contains the oder details. Join of Order and Product';


--
-- TOC entry 210 (class 1259 OID 41173)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id character varying(15) NOT NULL,
    order_status character varying(128) NOT NULL,
    order_date timestamp without time zone NOT NULL,
    customer_address character varying(512) NOT NULL,
    customer_email character varying(256) NOT NULL,
    order_amount numeric(10,2) NOT NULL,
    delivery_service character varying(128) NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE orders; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.orders IS 'Contains the orders on the platform';


--
-- TOC entry 206 (class 1259 OID 40998)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    name character varying(200) NOT NULL,
    color character varying(20),
    model character varying(50),
    item_condition character varying(20) NOT NULL,
    description character varying(512),
    stock_quantity integer NOT NULL,
    location character varying(50) NOT NULL,
    date_added timestamp without time zone NOT NULL,
    brand character varying(30),
    category character varying(30),
    admin_seller character varying(30),
    supplier_seller character varying(10),
    price numeric(10,2) NOT NULL,
    sku character varying(30) NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 3121 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE product; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.product IS 'Contains the products of the platform';


--
-- TOC entry 207 (class 1259 OID 41036)
-- Name: product_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_images (
    product character varying(30) NOT NULL,
    image_url character varying NOT NULL
);


ALTER TABLE public.product_images OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 41090)
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    author character varying(256) NOT NULL,
    about character varying(30) NOT NULL,
    review_body text NOT NULL,
    review_rating_value bigint NOT NULL,
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- TOC entry 3122 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE reviews; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.reviews IS 'Contains the reviews on the platform';


--
-- TOC entry 202 (class 1259 OID 40975)
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    company_name character varying(100) NOT NULL,
    email character varying(250) NOT NULL,
    telephone character varying(30) NOT NULL,
    bce character varying(10) NOT NULL,
    url character varying(150),
    address_country character varying(30) NOT NULL,
    address_city character varying(50) NOT NULL,
    postal_code character varying(25) NOT NULL,
    address_locality character varying(50) NOT NULL,
    street_address character varying(250) NOT NULL
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- TOC entry 3123 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE supplier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.supplier IS 'Contains the suppliers of the platform';


--
-- TOC entry 3096 (class 0 OID 40980)
-- Dependencies: 203
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (name, telephone, email) FROM stdin;
Amadou Sarjo Jallow	+32466251959	amadou.sarjo.jallow@soko.com
Dave Sabonis	+79976625190	dave.sabonis@soko.com
Martha Brna	+32466251959	martin.brna@soko.com
\.


--
-- TOC entry 3097 (class 0 OID 40985)
-- Dependencies: 204
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brand (name) FROM stdin;
Apple
Asus
Samsung
Redmi
\.


--
-- TOC entry 3102 (class 0 OID 41117)
-- Dependencies: 209
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (customer_email, product, date_added) FROM stdin;
bhoggan0@eepurl.com	51235f3d-4fbe-402b-9bbc	2021-10-14 18:41:19
bhoggan0@eepurl.com	161ef15e-5908-45fa-b3d3	2021-10-14 18:41:19
bhoggan0@eepurl.com	e4f7d42f-2232-422d-91f1	2021-10-14 18:41:19
kklehn3@liveinternet.ru	51235f3d-4fbe-402b-9bbc	2021-10-14 18:41:19
hpudge6@mozilla.com	2c5311ac-aea1-443e-b15e	2021-10-14 18:41:19
hpudge6@mozilla.com	161ef15e-5908-45fa-b3d3	2021-10-14 18:41:19
adaud9@biglobe.ne.jp	51235f3d-4fbe-402b-9bbc	2021-10-14 18:41:19
awallentinc@sfgate.com	2c5311ac-aea1-443e-b15e	2021-10-14 18:41:19
awallentinc@sfgate.com	ff5d9d07-56fa-4cfa-905a	2021-10-14 18:41:19
emarf@desdev.cn	e4f7d42f-2232-422d-91f1	2021-10-14 18:41:19
abundy0@patch.com	71b399d0-8f8b-42eb-9b47	2021-10-14 18:41:19
abundy0@patch.com	4988825f-72da-44a1-9a01	2021-10-14 18:41:19
abundy0@patch.com	4cd04183-a0da-4bf3-aedb	2021-10-14 18:41:19
rsahlstrom5@bigcartel.com	21bca5f9-a789-48c9-82a0	2021-10-14 18:41:19
bfallowsa@nytimes.com	21bca5f9-a789-48c9-82a0	2021-10-14 18:41:19
cgianolof@surveymonkey.com	71b399d0-8f8b-42eb-9b47	2021-10-14 18:41:19
cgianolof@surveymonkey.com	4988825f-72da-44a1-9a01	2021-10-14 18:41:19
bcasillis0@dropbox.com	8d428fc2-d711-4905-a0ad	2021-10-14 18:41:19
bcasillis0@dropbox.com	97e94d6a-aea2-4695-9722	2021-10-14 18:41:19
glibbis5@ycombinator.com	97e94d6a-aea2-4695-9722	2021-10-14 18:41:19
lberminghama@jiathis.com	97e94d6a-aea2-4695-9722	2021-10-14 18:41:19
lberminghama@jiathis.com	8d428fc2-d711-4905-a0ad	2021-10-14 18:41:19
cbevansf@fda.gov	8d428fc2-d711-4905-a0ad	2021-10-14 18:41:19
kklehn3@liveinternet.ru	3aaaa278-1de4-480c-8baa	2021-10-14 18:41:19
kklehn3@liveinternet.ru	97e94d6a-aea2-4695-9722	2021-10-14 18:41:19
\.


--
-- TOC entry 3098 (class 0 OID 40990)
-- Dependencies: 205
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (name, description) FROM stdin;
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
-- TOC entry 3105 (class 0 OID 74824)
-- Dependencies: 212
-- Data for Name: customers_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers_addresses (email, country, city, address) FROM stdin;
bhoggan0@eepurl.com	Belgium	Antwerpen	456 Drewry Center, 2170 Shelley, Antwerpen, Belgium
bhoggan0@eepurl.com	Belgium	Antwerpen	456 Drewry Center,2170\tShelley, Antwerpen, Belgium\t
ydoswell1@soundcloud.com	Belgium	Ninove	933 Bluestem Avenue,9404 Northport,Ninove,Belgium
lperkins2@imdb.com	Belgium	Brussels	85 Macpherson Way,6834\tService, Brussels,Belgium
kklehn3@liveinternet.ru	Belgium	Brussels	4 Sunbrook Way,7823 Sage,Brussels,Belgium
ssotworth5@businessweek.com	Belgium	Mons	6 Sunnyside Court,7032\tLoftsgordon,Mons,Belgium
hpudge6@mozilla.com	Belgium	Brussels	80 Brickson Park Alley,7604 Katie,Brussels,BelgiumBelgium
ostockford7@liveinternet.ru	Belgium	Gent	0 Hermina Street,9052 Eggendart,Gent,BelgiumBelgium
jfrankling8@people.com.cn	Belgium	Charleroi	3 Portage Plaza,6042 Waubesa,Charleroi,BelgiumBelgium
adaud9@biglobe.ne.jp	Belgium	Charleroi	1118 Roxbury Junction,6042 Lake View,Charleroi,Belgium
celliotb@columbia.edu	Belgium	Brussels	9196 Hallows Terrace,6834 American,Brussels,Belgium
awallentinc@sfgate.com	Belgium	Antwerpen	6600 Buhler Park,2170 Sunfield,Antwerpen,Belgium
tmacveye@dmoz.org	Belgium	Brussels	31 Clemons Center,6594\tWelch,Brussels,Belgium
emarf@desdev.cn	Belgium	Ninove	58106 Hallows Way,9404\tMemorial,Ninove,Belgium
mkeeneg@csmonitor.com	Belgium	Brussels	9732 Manitowish Terrace,7536\tOxford,Brussels,Belgium
anovelloh@blogtalkradio.com	Belgium	Brussels	07 Trailsway Parkway,6834\tDixon,Brussels,Belgium
msolomonidesi@gnu.org	Belgium	Brussels	32542 Fieldstone Point,6834\tDexter,Brussels,Belgium
mdymickj@sourceforge.net	Belgium	Charleroi	6 Dorton Center,6042 Holmberg,Charleroi,Belgium
abundy0@patch.com	United States	Baton Rouge	66799 Ridgeway Alley,70820\tCascada,Baton Rouge,United States
tmacgowan1@blogspot.com	United States	Carlifonia	39452 4th Trail,4102\tBuena Vista,Carlifonia,United States
ocubberley3@craigslist.org	United States	San Diego	92153\tStraubel 58 Waxwing Place,San Diego,United States
asireb@wikispaces.com	United States	Carlifonia	53710\tPine View\t01778 Heffernan Trail,Carlifonia,United States
jcoxc@nbcnews.com	United States	Carlifonia	36689\tSunnyside\t22183 Algoma Avenue,Carlifonia,United States
sfauldsd@unicef.org	United States	Philadelphia	19125\tTowne\t94810 Anthes Junction,Philadelphia,United States
wboulee@wp.com	United States	Houston	77281\tAnniversary\t28 Columbus Point,Houston,United States
cgianolof@surveymonkey.com	United States	Phoenix	85072\tHoly Cross\t96165 Bashford Pass,Phoenix,United States
fkemetg@ebay.co.uk	United States	Carlifonia	46202\tBasil\t8 Fair Oaks Pass,Carlifonia,United States
capflerh@multiply.com	United States	Carlifonia	63180\tOak\t89173 Hudson Circle,Carlifonia,United States
sbendani@xinhuanet.com	United States	Cincinnati	45228\tPankratz\t082 Golf Drive,Cincinnati,United States
mczaplaj@pinterest.com	United States	Carlifonia	34282\tHavey\t7 Corry Circle,Carlifonia,United States
tartza@ask.com	Belgium	Ninove	13 Moulton Lane,9404 Clyde Gallagher,Ninove,Belgium
arosterne2@usa.gov	United States	Miami	61702 Atwood Plaza,33175 High Crossing,Miami,United States
penoch4@illinois.edu	United States	El Paso	88541 Troy , 132 Banding Terrace,El Paso,United States
rsahlstrom5@bigcartel.com	United States	Carlifonia	55564 Judy, 8335 Duke Avenue,Carlifonia,United States
dlapthorn6@phoca.cz	United States	Carlifonia	23272\tKings, 8683 Golden Leaf Point,Carlifonia,United States
jbidnall7@shinystat.com	United States	Inglewood	90398\tGreen Ridge,\t5036 Esch Park,Inglewood,United States
wmalzard8@nps.gov	United States	Saint Louis	63126 Ronald Regan, 39352 Armistice Street,Saint Louis,United States
jdomegan9@opera.com	United States	Bronx	10469\tSpringview, 0820 Moose Junction,,United States
bfallowsa@nytimes.com	United States	Carlifonia	07195\tSunbrook, 856 Tennessee Street,Carlifonia,United States
bcasillis0@dropbox.com	United Kingdom	Glasgow	G4\tVillage Green, 44011 Pearson Hill,Glasgow,United Kingdom
jbowlas1@sciencedirect.com	United Kingdom	London	LN6\tPorter\t37 Logan Junction,London,United Kingdom
tarrell2@shareasale.com	United Kingdom	London	SN13\tTruax\t8649 Warner Hill,London,United Kingdom
rthurley3@amazon.co.jp	United Kingdom	Liverpool	L74\t3rd\t0 Susan Hill,Liverpool,United Kingdom
hjeannard4@yellowpages.com	United Kingdom	Belfast	BT2\tMagdeline\t99 Carberry Plaza,Belfast,United Kingdom
glibbis5@ycombinator.com	United Kingdom	Sutton	RH5\tGolf Course\t87 Mandrake Junction,,United Kingdom
cbradbeer6@hao123.com	United Kingdom	London	SN1\tDerek\t6 Vernon Pass,London,United Kingdom
esealey7@samsung.com	United Kingdom	London	BD23\tHudson\t98 Anzinger Place,London,United Kingdom
jlong8@usatoday.com	United Kingdom	London	CT16\tThompson\t3 Carioca Plaza,London,United Kingdom
sormrod9@tuttocitta.it	United Kingdom	Upton	DN21\tRidgeway\t09 Porter Trail,Upton,United Kingdom
lberminghama@jiathis.com	United Kingdom	London	CB4\tFarmco\t8983 Granby Alley,London,United Kingdom
malderwickb@hp.com	United Kingdom	London	GL54\tOneill\t1817 Eagan Center,London,United Kingdom
ksinnattc@earthlink.net	United Kingdom	Upton	WF9\tCrownhardt\t39 Kensington Plaza,Upton,United Kingdom
dduckelsd@google.pl	United Kingdom	London	SY4\tDakota\t338 Lake View Crossing,London,United Kingdom
jvigare@printfriendly.com	United Kingdom	Birmingham	B40\tHauk\t48067 Oak Park,Birmingham,United Kingdom
cbevansf@fda.gov	United Kingdom	Belfast	BT2\tAnniversary\t1964 Beilfuss Avenue,Belfast,United Kingdom
mshielg@jimdo.com	United Kingdom	London	BT66\tSchlimgen\t275 Stuart Trail,London,United Kingdom
apurkinsh@epa.gov	United Kingdom	London	AB55\tChinook\t318 5th Drive,London,United Kingdom
mscantleberryi@google.de	United	Dwight	39014 Magdeline Lane,,United Kingdom
bbriddenj@jiathis.com	United Kingdom	Milton	AB56\tEagle Crest\t4 Dottie Way,Milton,United Kingdom
glandy4@google.co.uk	Belgium	Brussels	25700 Oakridge Center,1170 Hooker,Brussels,Belgium
\.


--
-- TOC entry 3094 (class 0 OID 40970)
-- Dependencies: 201
-- Data for Name: customers_information; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers_information (first_name, email, phone_number, last_name, delivery_kind, birth_date) FROM stdin;
Averil	abundy0@patch.com	+1 225 645 2213	Bundy	Normal	1996-07-27
Tyler	tmacgowan1@blogspot.com	+1 941 871 2462	MacGowan	Normal	1996-07-27
Annette	arosterne2@usa.gov	+1 305 753 0510	Rosterne	Normal	1996-07-27
Orville	ocubberley3@craigslist.org	+1 619 207 4480	Cubberley	Normal	1996-07-27
Paul	penoch4@illinois.edu	+1 915 433 4095	Enoch	Normal	1996-07-27
Rosemarie	rsahlstrom5@bigcartel.com	+1 952 695 2327	Sahlstrom	Normal	1996-07-27
Delly	dlapthorn6@phoca.cz	+1 571 674 5982	Lapthorn	Normal	1996-07-27
Jilly	jbidnall7@shinystat.com	+1 310 905 9764	Bidnall	Normal	1996-07-27
Wolf	wmalzard8@nps.gov	+1 636 848 5425	Malzard	Normal	1996-07-27
Jen	jdomegan9@opera.com	+1 917 544 4986	Domegan	Normal	1996-07-27
Brook	bfallowsa@nytimes.com	+1 862 836 2544	Fallows	Normal	1996-07-27
Adriane	asireb@wikispaces.com	+1 608 445 6164	Sire	Normal	1996-07-27
Julie	jcoxc@nbcnews.com	+1 251 870 0126	Cox	Normal	1996-07-27
Sibley	sfauldsd@unicef.org	+1 215 672 4118	Faulds	Normal	1996-07-27
Wallis	wboulee@wp.com	+1 713 914 6195	Boule	Normal	1996-07-27
Concordia	cgianolof@surveymonkey.com	+1 602 974 3776	Gianolo	Normal	1996-07-27
Felita	fkemetg@ebay.co.uk	+1 317 347 7286	Kemet	Normal	1996-07-27
Conn	capflerh@multiply.com	+1 314 723 1015	Apfler	Normal	1996-07-27
Sally	sbendani@xinhuanet.com	+1 513 918 3398	Bendan	Normal	1996-07-27
Margarette	mczaplaj@pinterest.com	+1 941 756 2247	Czapla	Normal	1996-07-27
Bren	bcasillis0@dropbox.com	+44 334 644 4906	Casillis	Normal	1996-07-27
Jaine	jbowlas1@sciencedirect.com	+44 985 232 3716	Bowlas	Normal	1996-07-27
Thedrick	tarrell2@shareasale.com	+44 762 120 8252	Arrell	Normal	1996-07-27
Roz	rthurley3@amazon.co.jp	+44 365 218 3559	Thurley	Normal	1996-07-27
Hazlett	hjeannard4@yellowpages.com	+44 909 336 7421	Jeannard	Normal	1996-07-27
Gweneth	glibbis5@ycombinator.com	+44 101 152 6354	Libbis	Normal	1996-07-27
Cooper	cbradbeer6@hao123.com	+44 884 537 5911	Bradbeer	Normal	1996-07-27
Eddi	esealey7@samsung.com	+44 442 102 7707	Sealey	Normal	1996-07-27
Joyce	jlong8@usatoday.com	+44 754 176 9922	Long	Normal	1996-07-27
Brietta	bhoggan0@eepurl.com	+32 249 749 6595	Hoggan	Normal	1996-07-27
Yardley	ydoswell1@soundcloud.com	+32 969 287 6321	Doswell	Normal	1996-07-27
Liesa	lperkins2@imdb.com	+32 969 238 9774	Perkins	Normal	1996-07-27
Karoline	kklehn3@liveinternet.ru	+32 758 456 3902	Klehn	Normal	1996-07-27
Gonzales	glandy4@google.co.uk	+32 186 389 1271	Landy	Normal	1996-07-27
Sula	ssotworth5@businessweek.com	+32 161 416 7354	Sotworth	Normal	1996-07-27
Huey	hpudge6@mozilla.com	+32 537 662 8128	Pudge	Normal	1996-07-27
Oberon	ostockford7@liveinternet.ru	+32 492 371 4657	Stockford	Normal	1996-07-27
Jo-anne	jfrankling8@people.com.cn	+32 954 757 0659	Frankling	Normal	1996-07-27
Aluino	adaud9@biglobe.ne.jp	+32 367 261 6687	Daud	Normal	1996-07-27
Theresa	tartza@ask.com	+32 792 311 5613	Artz	Normal	1996-07-27
Caralie	celliotb@columbia.edu	+32 192 878 9487	Elliot	Normal	1996-07-27
Avril	awallentinc@sfgate.com	+32 598 967 4686	Wallentin	Normal	1996-07-27
Jobina	jmelbyd@wix.com	+32 183 884 2703	Melby	Normal	1996-07-27
Thornton	tmacveye@dmoz.org	+32 828 309 3511	Macvey	Normal	1996-07-27
Erena	emarf@desdev.cn	+32 490 406 5575	Mar	Normal	1996-07-27
Marcelline	mkeeneg@csmonitor.com	+32 202 588 8663	Keene	Normal	1996-07-27
Alair	anovelloh@blogtalkradio.com	+32 159 140 9091	Novello	Normal	1996-07-27
Mose	msolomonidesi@gnu.org	+32 879 807 6621	Solomonides	Normal	1996-07-27
Melodie	mdymickj@sourceforge.net	+32 133 830 6223	Dymick	Normal	1996-07-27
Sigismondo	sormrod9@tuttocitta.it	+44 414 230 1262	Ormrod	Normal	1996-07-27
Leland	lberminghama@jiathis.com	+44 787 452 7062	Bermingham	Normal	1996-07-27
Myrlene	malderwickb@hp.com	+44 492 252 2026	Alderwick	Normal	1996-07-27
Karlik	ksinnattc@earthlink.net	+44 472 501 9419	Sinnatt	Normal	1996-07-27
Dinny	dduckelsd@google.pl	+44 153 684 5883	Duckels	Normal	1996-07-27
Joye	jvigare@printfriendly.com	+44 167 484 1914	Vigar	Normal	1996-07-27
Calypso	cbevansf@fda.gov	+44 663 901 7157	Bevans	Normal	1996-07-27
Mallory	mshielg@jimdo.com	+44 584 499 0980	Shiel	Normal	1996-07-27
Aggy	apurkinsh@epa.gov	+44 488 258 9854	Purkins	Normal	1996-07-27
Minor	mscantleberryi@google.de	+44 616 204 5820	Scantleberry	Normal	1996-07-27
Bartram	bbriddenj@jiathis.com	+44 179 960 8621	Bridden	Normal	1996-07-27
\.


--
-- TOC entry 3106 (class 0 OID 74848)
-- Dependencies: 213
-- Data for Name: delivery_services_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery_services_type (delivery_kind, price, delivery_duration) FROM stdin;
Normal	8	7
Premium	13	3
\.


--
-- TOC entry 3107 (class 0 OID 74851)
-- Dependencies: 214
-- Data for Name: delivery_status_description; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery_status_description (delivery_status, description) FROM stdin;
Delivered	lorem ipsum si dolor
notDelivered	lorem ipsum si dolor
\.


--
-- TOC entry 3104 (class 0 OID 41190)
-- Dependencies: 211
-- Data for Name: order_description; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_description ("order", product, quantity, date_created) FROM stdin;
ade78110-04f3	51235f3d-4fbe-402b-9bbc	1	2021-11-01 18:41:19
ade78110-04f3	b362f9f0-1f0d-4b2e-8e1d	1	2021-11-01 18:41:19
3e176920-b166	d695052e-d926-4d01-bb3b	1	2021-11-01 18:41:19
095da47b-c203	fc07b915-5f56-4e50-8600	1	2021-11-01 18:41:19
124d210e-a5d7	b1700344-d908-45e2-9bc4	1	2021-11-01 18:41:19
81dfc1d4-5078	cf490540-e13b-4588-86b2	1	2021-11-01 18:41:19
7add4332-46b3	161ef15e-5908-45fa-b3d3	1	2021-11-01 18:41:19
a2b72693-6dd6	b362f9f0-1f0d-4b2e-8e1d	1	2021-11-01 18:41:19
489510f4-a7e3	b1700344-d908-45e2-9bc4	1	2021-11-01 18:41:19
0b7deade-5fee	b1700344-d908-45e2-9bc4	1	2021-11-01 18:41:19
4abf8353-487f	b1700344-d908-45e2-9bc4	1	2021-11-01 18:41:19
1f126c2d-7852	4cd04183-a0da-4bf3-aedb	1	2021-11-01 18:41:19
df13c18d-6e93	21bca5f9-a789-48c9-82a0	1	2021-11-01 18:41:19
df13c18d-6e93	4cd04183-a0da-4bf3-aedb	1	2021-11-01 18:41:19
6bdf82b2-7e6d	21bca5f9-a789-48c9-82a0	1	2021-11-01 18:41:19
5ab6e3ca-f9c3	18903ea8-0f19-4e87-a0c9	1	2021-11-01 18:41:19
5ab6e3ca-f9c3	3b08e48f-9be1-454b-8374	1	2021-11-01 18:41:19
3cc735c1-74d4	4988825f-72da-44a1-9a01	1	2021-11-01 18:41:19
004e1dcf-7178	3b08e48f-9be1-454b-8374	1	2021-11-01 18:41:19
b30f3919-7595	4a0bec5b-f0c8-4e0c-8182	1	2021-11-01 18:41:19
0563a725-73da	71b399d0-8f8b-42eb-9b47	1	2021-11-01 18:41:19
0563a725-73da	4988825f-72da-44a1-9a01	1	2021-11-01 18:41:19
f1cb31a1-7912	4cd04183-a0da-4bf3-aedb	1	2021-11-01 18:41:19
7cf5ca33-0ec3	4cd04183-a0da-4bf3-aedb	1	2021-11-01 18:41:19
eb258842-6691	97e94d6a-aea2-4695-9722	1	2021-11-01 18:41:19
d4f8f116-d586	3aaaa278-1de4-480c-8baa	1	2021-11-01 18:41:19
d4f8f116-d586	8d428fc2-d711-4905-a0ad	1	2021-11-01 18:41:19
5ae48ea0-8dff	97e94d6a-aea2-4695-9722	1	2021-11-01 18:41:19
05ab0cd0-ab45	3aaaa278-1de4-480c-8baa	1	2021-11-01 18:41:19
05ab0cd0-ab45	97e94d6a-aea2-4695-9722	1	2021-11-01 18:41:19
42f3c02a-ec14	8d428fc2-d711-4905-a0ad	1	2021-11-01 18:41:19
949b0b3d-f6b9	8d428fc2-d711-4905-a0ad	1	2021-11-01 18:41:19
9b029c2f-0f52	8d428fc2-d711-4905-a0ad	1	2021-11-01 18:41:19
b0bf1fcf-295d	97e94d6a-aea2-4695-9722	1	2021-11-01 18:41:19
08772404-bc1b	97e94d6a-aea2-4695-9722	1	2021-11-01 18:41:19
f1cb31a1-7912	97e94d6a-aea2-4695-9722	1	2021-11-01 18:41:19
7cf5ca33-0ec3	97e94d6a-aea2-4695-9722	1	2021-11-01 18:41:19
7b87e34a-0191	8d428fc2-d711-4905-a0ad	1	2021-11-01 18:41:19
\.


--
-- TOC entry 3103 (class 0 OID 41173)
-- Dependencies: 210
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, order_status, order_date, customer_address, customer_email, order_amount, delivery_service) FROM stdin;
ade78110-04f3	Delivered	2021-11-01 18:41:19	85 Macpherson Way,6834\tService, Brussels,Belgium	lperkins2@imdb.com	2000.00	Normal
3e176920-b166	Delivered	2021-11-01 18:41:19	933 Bluestem Avenue,9404 Northport,Ninove,Belgium	ydoswell1@soundcloud.com	2000.00	Normal
095da47b-c203	Delivered	2021-11-01 18:41:19	456 Drewry Center, 2170 Shelley, Antwerpen, Belgium	bhoggan0@eepurl.com	2000.00	Normal
124d210e-a5d7	Delivered	2021-11-01 18:41:19	4 Sunbrook Way,7823 Sage,Brussels,Belgium	kklehn3@liveinternet.ru	2000.00	Normal
81dfc1d4-5078	Delivered	2021-11-01 18:41:19	25700 Oakridge Center,1170 Hooker,Brussels,Belgium	glandy4@google.co.uk	2000.00	Normal
7add4332-46b3	Delivered	2021-11-01 18:41:19	0 Hermina Street,9052 Eggendart,Gent,BelgiumBelgium	ostockford7@liveinternet.ru	2000.00	Normal
a2b72693-6dd6	Delivered	2021-11-01 18:41:19	3 Portage Plaza,6042 Waubesa,Charleroi,BelgiumBelgium	jfrankling8@people.com.cn	2000.00	Normal
489510f4-a7e3	Delivered	2021-11-01 18:41:19	1118 Roxbury Junction,6042 Lake View,Charleroi,Belgium	adaud9@biglobe.ne.jp	2000.00	Normal
0b7deade-5fee	Delivered	2021-11-01 18:41:19	13 Moulton Lane,9404 Clyde Gallagher,Ninove,Belgium	tartza@ask.com	2000.00	Normal
08772404-bc1b	Delivered	2021-11-01 18:41:19	DN21\tRidgeway\t09 Porter Trail,Upton,United Kingdom	sormrod9@tuttocitta.it	2000.00	Normal
4abf8353-487f	Delivered	2021-11-01 18:41:19	9196 Hallows Terrace,6834 American,Brussels,Belgium	celliotb@columbia.edu	2000.00	Normal
1f126c2d-7852	Delivered	2021-11-01 18:41:19	66799 Ridgeway Alley,70820\tCascada,Baton Rouge,United States	abundy0@patch.com	2000.00	Normal
df13c18d-6e93	Delivered	2021-11-01 18:41:19	39452 4th Trail,4102\tBuena Vista,Carlifonia,United States	tmacgowan1@blogspot.com	2000.00	Normal
6bdf82b2-7e6d	Delivered	2021-11-01 18:41:19	61702 Atwood Plaza,33175 High Crossing,Miami,United States	arosterne2@usa.gov	2000.00	Normal
5ab6e3ca-f9c3	Delivered	2021-11-01 18:41:19	92153\tStraubel 58 Waxwing Place,San Diego,United States	ocubberley3@craigslist.org	2000.00	Normal
3cc735c1-74d4	Delivered	2021-11-01 18:41:19	88541 Troy , 132 Banding Terrace,El Paso,United States	penoch4@illinois.edu	2000.00	Normal
004e1dcf-7178	Delivered	2021-11-01 18:41:19	55564 Judy, 8335 Duke Avenue,Carlifonia,United States	rsahlstrom5@bigcartel.com	2000.00	Normal
b30f3919-7595	Delivered	2021-11-01 18:41:19	23272\tKings, 8683 Golden Leaf Point,Carlifonia,United States	dlapthorn6@phoca.cz	2000.00	Normal
0563a725-73da	Delivered	2021-11-01 18:41:19	90398\tGreen Ridge,\t5036 Esch Park,Inglewood,United States	jbidnall7@shinystat.com	2000.00	Normal
f1cb31a1-7912	Delivered	2021-11-01 18:41:19	63126 Ronald Regan, 39352 Armistice Street,Saint Louis,United States	wmalzard8@nps.gov	2000.00	Normal
7cf5ca33-0ec3	Delivered	2021-11-01 18:41:19	10469\tSpringview\t0820 Moose Junction,,United States	jdomegan9@opera.com	2000.00	Normal
eb258842-6691	Delivered	2021-11-01 18:41:19	G4\tVillage Green, 44011 Pearson Hill,Glasgow,United Kingdom	bcasillis0@dropbox.com	2000.00	Normal
d4f8f116-d586	Delivered	2021-11-01 18:41:19	LN6\tPorter\t37 Logan Junction,London,United Kingdom	jbowlas1@sciencedirect.com	2000.00	Normal
5ae48ea0-8dff	Delivered	2021-11-01 18:41:19	SN13\tTruax\t8649 Warner Hill,London,United Kingdom	tarrell2@shareasale.com	2000.00	Normal
05ab0cd0-ab45	Delivered	2021-11-01 18:41:19	L74\t3rd\t0 Susan Hill,Liverpool,United Kingdom	rthurley3@amazon.co.jp	2000.00	Normal
42f3c02a-ec14	Delivered	2021-11-01 18:41:19	BT2\tMagdeline\t99 Carberry Plaza,Belfast,United Kingdom	hjeannard4@yellowpages.com	2000.00	Normal
7b87e34a-0191	Delivered	2021-11-01 18:41:19	RH5\tGolf Course\t87 Mandrake Junction,,United Kingdom	glibbis5@ycombinator.com	2000.00	Normal
949b0b3d-f6b9	Delivered	2021-11-01 18:41:19	SN1\tDerek\t6 Vernon Pass,London,United Kingdom	cbradbeer6@hao123.com	2000.00	Normal
9b029c2f-0f52	Delivered	2021-11-01 18:41:19	BD23\tHudson\t98 Anzinger Place,London,United Kingdom	esealey7@samsung.com	2000.00	Normal
b0bf1fcf-295d	Delivered	2021-11-01 18:41:19	CT16\tThompson\t3 Carioca Plaza,London,United Kingdom	jlong8@usatoday.com	2000.00	Normal
\.


--
-- TOC entry 3099 (class 0 OID 40998)
-- Dependencies: 206
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (name, color, model, item_condition, description, stock_quantity, location, date_added, brand, category, admin_seller, supplier_seller, price, sku) FROM stdin;
ASUS VivoBook 14 (2021)	Transparent Silver	VivoBook 14 (2021)	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	154	Brussels	2021-10-06 18:41:19	Asus	Computers	\N	7946128330	700.00	fc07b915-5f56-4e50-8600
ASUS ROG Strix G17 (2021) 17.3-inch	Eclipse Gray	ROG Strix G17 (2021)	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	104	Brussels	2021-07-16 18:41:19	Asus	Computers	\N	7946128330	700.00	d695052e-d926-4d01-bb3b
Apple iPhone 11 (64GB) - White	White	IPhone 11	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	85	Brussels	2021-09-19 16:51:12	Apple	Mobiles	amadou.sarjo.jallow@soko.com	\N	450.00	2c5311ac-aea1-443e-b15e
Apple iPhone 11 (64GB) - White	White	IPhone 11	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	65	London	2021-09-04 13:51:12	Apple	Mobiles	amadou.sarjo.jallow@soko.com	\N	1000.00	8d428fc2-d711-4905-a0ad
ASUS VivoBook 14 (2021)	Transparent Silver	VivoBook 14 (2021)	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	55	Ghent	2021-11-06 18:41:19	Asus	Computers	\N	7946128330	1000.00	161ef15e-5908-45fa-b3d3
ASUS ROG Strix G17 (2021) 17.3-inch	Eclipse Gray	ROG Strix G17 (2021)	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	65	Ghent	2021-07-16 18:41:19	Asus	Computers	\N	7946128330	700.00	ff5d9d07-56fa-4cfa-905a
Apple AirPods Pro	Black	MBP22HN/A	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	84	Brussels	2021-10-11 16:51:12	Apple	Mobiles	amadou.sarjo.jallow@soko.com	\N	950.00	51235f3d-4fbe-402b-9bbc
Apple iPhone 10 (128GB) - White	White	IPhone 10	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	60	California	2021-10-09 16:53:01.428812	Apple	Mobiles	amadou.sarjo.jallow@soko.com	\N	700.00	3a62141b-933c-440c-a5b7
Samsung Galaxy Z Fold3 5G (Phantom Black, 12GB RAM, 512GB Storage)	Phantom Black	Samsung Galaxy Z Fold3 5G	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	115	Brussels	2021-07-16 18:41:19	Samsung	Mobiles	martin.brna@soko.com	\N	1500.00	076e2af4-37b2-4ec0-8c2e
Samsung Galaxy Z Fold3 5G (Phantom Black, 12GB RAM, 512GB Storage)	Phantom Black	Samsung Galaxy Z Fold3 5G	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	80	Ghent	2021-07-16 18:41:19	Samsung	Mobiles	martin.brna@soko.com	\N	1500.00	08749f5a-ed6c-493c-9f63
Samsung Galaxy Z Fold3 5G (Phantom Black, 12GB RAM, 512GB Storage)	Phantom Black	Samsung Galaxy Z Fold3 5G	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	100	London	2021-07-16 18:41:19	Samsung	Mobiles	martin.brna@soko.com	\N	1500.00	3aaaa278-1de4-480c-8baa
Samsung Galaxy Note 20 Ultra 5G with Snapdragon 865+	Mystic Black	Samsung Galaxy Note 20 Ultra 5G	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	100	London	2021-06-14 18:41:19	Samsung	Mobiles	martin.brna@soko.com	\N	1050.00	97e94d6a-aea2-4695-9722
Apple iPhone 11 (64GB) - White	White	IPhone 11	New	6.1-inch (15.5 cm diagonal) Liquid Retina HD LCD display\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tDual-camera system with 12MP Ultra Wide and Wide cameras; Night mode, Portrait mode, and 4K video up to 60fps\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t12MP TrueDepth front camera with Portrait mode, 4K video, and Slo-Mo\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tFace ID for secure authentication\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tFast-charge capable\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tWireless charging\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t	120	California	2021-10-09 16:40:36.317058	Apple	Mobiles	amadou.sarjo.jallow@soko.com	\N	1000.00	18903ea8-0f19-4e87-a0c9
Apple AirPods Pro	White	MWP22HN/A	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	85	California	2021-10-09 17:08:07.870954	Apple	Mobiles	amadou.sarjo.jallow@soko.com	\N	400.00	3b08e48f-9be1-454b-8374
Apple AirPods Pro	Black	MBP22HN/A	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	85	California	2021-10-11 16:51:12	Apple	Mobiles	amadou.sarjo.jallow@soko.com	\N	450.00	4988825f-72da-44a1-9a01
Apple iPhone 11 (64GB) - Black	Black	IPhone 11	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	94	Brussels	2021-09-04 13:51:12	Apple	Mobiles	amadou.sarjo.jallow@soko.com	\N	1100.00	b362f9f0-1f0d-4b2e-8e1d
Samsung Galaxy Z Fold3 5G (Phantom Black, 12GB RAM, 512GB Storage)	Phantom Black	Samsung Galaxy Z Fold3 5G	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	180	California	2021-07-16 18:41:19	Samsung	Mobiles	martin.brna@soko.com	\N	1500.00	4cd04183-a0da-4bf3-aedb
Samsung Galaxy Note 20 Ultra 5G with Snapdragon 865+	Mystic Black	Samsung Galaxy Note 20 Ultra 5G	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	105	Brussels	2021-06-14 18:41:19	Samsung	Mobiles	martin.brna@soko.com	\N	1050.00	e4f7d42f-2232-422d-91f1
Samsung Galaxy Note 20 Ultra 5G with Snapdragon 865+	Mystic Black	Samsung Galaxy Note 20 Ultra 5G	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	105	Ghent	2021-06-14 18:41:19	Samsung	Mobiles	martin.brna@soko.com	\N	1050.00	9fecf700-ddb6-4740-8e8f
Redmi Note 10 Pro (Vintage Bronze, 6GB RAM, 128GB Storage)	Vintage Bronze	Redmi Note 10 Pro	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	100	Ghent	2021-06-14 18:41:19	Redmi	Mobiles	dave.sabonis@soko.com	\N	300.00	cf490540-e13b-4588-86b2
Redmi Note 10 Pro (Vintage Bronze, 6GB RAM, 128GB Storage)	Vintage Bronze	Redmi Note 10 Pro	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	100	Brussels	2021-06-14 18:41:19	Redmi	Mobiles	dave.sabonis@soko.com	\N	300.00	b1700344-d908-45e2-9bc4
Apple iPhone 11 (64GB) - Black	Black	IPhone 11	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	120	California	2021-10-09 16:51:12.976426	Apple	Mobiles	amadou.sarjo.jallow@soko.com	\N	1100.00	71b399d0-8f8b-42eb-9b47
Apple iPhone 10 (128GB) - Black	Black	IPhone 10	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	70	California	2021-10-09 16:52:14.541691	Apple	Mobiles	amadou.sarjo.jallow@soko.com	\N	9150.00	4a0bec5b-f0c8-4e0c-8182
Samsung Galaxy Note 20 Ultra 5G with Snapdragon 865+	Mystic Black	Samsung Galaxy Note 20 Ultra 5G	New	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dictum purus. Vestibulum nisl risus, dapibus sit amet vestibulum dignissim, aliquet quis eros.	105	California	2021-06-14 18:41:19	Samsung	Mobiles	martin.brna@soko.com	\N	1050.00	21bca5f9-a789-48c9-82a0
\.


--
-- TOC entry 3100 (class 0 OID 41036)
-- Dependencies: 207
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_images (product, image_url) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 41090)
-- Dependencies: 208
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (author, about, review_body, review_rating_value, date_created, date_modified) FROM stdin;
lperkins2@imdb.com	51235f3d-4fbe-402b-9bbc	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
lperkins2@imdb.com	b362f9f0-1f0d-4b2e-8e1d	Lorem ipsum dolor sit amet	5	2021-11-01 18:41:19	2021-11-01 18:41:19
ydoswell1@soundcloud.com	d695052e-d926-4d01-bb3b	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
bhoggan0@eepurl.com	fc07b915-5f56-4e50-8600	Lorem ipsum dolor sit amet	3	2021-11-01 18:41:19	2021-11-01 18:41:19
kklehn3@liveinternet.ru	b1700344-d908-45e2-9bc4	Lorem ipsum dolor sit amet	5	2021-11-01 18:41:19	2021-11-01 18:41:19
glandy4@google.co.uk	cf490540-e13b-4588-86b2	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
ostockford7@liveinternet.ru	161ef15e-5908-45fa-b3d3	Lorem ipsum dolor sit amet	3	2021-11-01 18:41:19	2021-11-01 18:41:19
jfrankling8@people.com.cn	b362f9f0-1f0d-4b2e-8e1d	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
adaud9@biglobe.ne.jp	b1700344-d908-45e2-9bc4	Lorem ipsum dolor sit amet	5	2021-11-01 18:41:19	2021-11-01 18:41:19
tartza@ask.com	b1700344-d908-45e2-9bc4	Lorem ipsum dolor sit amet	5	2021-11-01 18:41:19	2021-11-01 18:41:19
celliotb@columbia.edu	b1700344-d908-45e2-9bc4	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
abundy0@patch.com	4cd04183-a0da-4bf3-aedb	Lorem ipsum dolor sit amet	5	2021-11-01 18:41:19	2021-11-01 18:41:19
tmacgowan1@blogspot.com	21bca5f9-a789-48c9-82a0	Lorem ipsum dolor sit amet	2	2021-11-01 18:41:19	2021-11-01 18:41:19
tmacgowan1@blogspot.com	4cd04183-a0da-4bf3-aedb	Lorem ipsum dolor sit amet	3	2021-11-01 18:41:19	2021-11-01 18:41:19
arosterne2@usa.gov	21bca5f9-a789-48c9-82a0	Lorem ipsum dolor sit amet	3	2021-11-01 18:41:19	2021-11-01 18:41:19
ocubberley3@craigslist.org	18903ea8-0f19-4e87-a0c9	Lorem ipsum dolor sit amet	2	2021-11-01 18:41:19	2021-11-01 18:41:19
ocubberley3@craigslist.org	3b08e48f-9be1-454b-8374	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
penoch4@illinois.edu	4988825f-72da-44a1-9a01	Lorem ipsum dolor sit amet	2	2021-11-01 18:41:19	2021-11-01 18:41:19
rsahlstrom5@bigcartel.com	3b08e48f-9be1-454b-8374	Lorem ipsum dolor sit amet	5	2021-11-01 18:41:19	2021-11-01 18:41:19
dlapthorn6@phoca.cz	4a0bec5b-f0c8-4e0c-8182	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
jbidnall7@shinystat.com	71b399d0-8f8b-42eb-9b47	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
jbidnall7@shinystat.com	4988825f-72da-44a1-9a01	Lorem ipsum dolor sit amet	5	2021-11-01 18:41:19	2021-11-01 18:41:19
wmalzard8@nps.gov	4cd04183-a0da-4bf3-aedb	Lorem ipsum dolor sit amet	2	2021-11-01 18:41:19	2021-11-01 18:41:19
jdomegan9@opera.com	4cd04183-a0da-4bf3-aedb	Lorem ipsum dolor sit amet	3	2021-11-01 18:41:19	2021-11-01 18:41:19
bcasillis0@dropbox.com	97e94d6a-aea2-4695-9722	Lorem ipsum dolor sit amet	3	2021-11-01 18:41:19	2021-11-01 18:41:19
jbowlas1@sciencedirect.com	3aaaa278-1de4-480c-8baa	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
jbowlas1@sciencedirect.com	8d428fc2-d711-4905-a0ad	Lorem ipsum dolor sit amet	5	2021-11-01 18:41:19	2021-11-01 18:41:19
tarrell2@shareasale.com	97e94d6a-aea2-4695-9722	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
rthurley3@amazon.co.jp	3aaaa278-1de4-480c-8baa	Lorem ipsum dolor sit amet	3	2021-11-01 18:41:19	2021-11-01 18:41:19
rthurley3@amazon.co.jp	97e94d6a-aea2-4695-9722	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
hjeannard4@yellowpages.com	8d428fc2-d711-4905-a0ad	Lorem ipsum dolor sit amet	5	2021-11-01 18:41:19	2021-11-01 18:41:19
glibbis5@ycombinator.com	8d428fc2-d711-4905-a0ad	Lorem ipsum dolor sit amet	3	2021-11-01 18:41:19	2021-11-01 18:41:19
cbradbeer6@hao123.com	8d428fc2-d711-4905-a0ad	Lorem ipsum dolor sit amet	3	2021-11-01 18:41:19	2021-11-01 18:41:19
esealey7@samsung.com	8d428fc2-d711-4905-a0ad	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
jlong8@usatoday.com	97e94d6a-aea2-4695-9722	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
sormrod9@tuttocitta.it	97e94d6a-aea2-4695-9722	Lorem ipsum dolor sit amet	4	2021-11-01 18:41:19	2021-11-01 18:41:19
wmalzard8@nps.gov	97e94d6a-aea2-4695-9722	Lorem ipsum dolor sit amet	3	2021-11-01 18:41:19	2021-11-01 18:41:19
jdomegan9@opera.com	97e94d6a-aea2-4695-9722	Lorem ipsum dolor sit amet	3	2021-11-01 18:41:19	2021-11-01 18:41:19
\.


--
-- TOC entry 3095 (class 0 OID 40975)
-- Dependencies: 202
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (company_name, email, telephone, bce, url, address_country, address_city, postal_code, address_locality, street_address) FROM stdin;
Apple Inc.	business@apple.com	+19654892330	4946126393	apple.com	USA	California	8007	Silicon valley	Twin Pines Circle
Asus Inc.	business@asus.com	+329654892330	7946128330	asus.be	BEL	Brussels	1500	Ixelles	Boulevar General Jacques
Samsung Inc.	business@samsung.com	+459654892330	8146196691	samsung.skr	SKR	Seol	1831	Suwon-si	Geneva Building, Leonardo da Vincilaan 19
Appario Retail Private Ltd	contact@appario.com	+32956874213	9046126335	appario.com	BEL	Ghent	1600	gbesse	Boulevard General Dupont, 271
\.


--
-- TOC entry 2925 (class 2606 OID 74821)
-- Name: admin Admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT "Admin_pkey" PRIMARY KEY (email);


--
-- TOC entry 2927 (class 2606 OID 40989)
-- Name: brand Brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT "Brand_pkey" PRIMARY KEY (name);


--
-- TOC entry 2929 (class 2606 OID 40997)
-- Name: category Category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (name);


--
-- TOC entry 2939 (class 2606 OID 74901)
-- Name: orders Order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (order_id);


--
-- TOC entry 2933 (class 2606 OID 74781)
-- Name: product_images ProductImages _pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT "ProductImages _pkey" PRIMARY KEY (product, image_url);


--
-- TOC entry 2931 (class 2606 OID 74779)
-- Name: product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (sku);


--
-- TOC entry 2923 (class 2606 OID 74819)
-- Name: supplier Supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT "Supplier_pkey" PRIMARY KEY (bce);


--
-- TOC entry 2937 (class 2606 OID 74962)
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (customer_email, product);


--
-- TOC entry 2943 (class 2606 OID 74831)
-- Name: customers_addresses customers_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_addresses
    ADD CONSTRAINT customers_addresses_pkey PRIMARY KEY (email, country, city, address);


--
-- TOC entry 2921 (class 2606 OID 74838)
-- Name: customers_information customers_information_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_information
    ADD CONSTRAINT customers_information_pkey PRIMARY KEY (email);


--
-- TOC entry 2945 (class 2606 OID 74858)
-- Name: delivery_services_type delivery_services_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_services_type
    ADD CONSTRAINT delivery_services_type_pkey PRIMARY KEY (delivery_kind);


--
-- TOC entry 2947 (class 2606 OID 74865)
-- Name: delivery_status_description delivery_status_description_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_status_description
    ADD CONSTRAINT delivery_status_description_pkey PRIMARY KEY (delivery_status);


--
-- TOC entry 2941 (class 2606 OID 74938)
-- Name: order_description order_description_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_description
    ADD CONSTRAINT order_description_pkey PRIMARY KEY ("order", product);


--
-- TOC entry 2935 (class 2606 OID 74974)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (author, about);


--
-- TOC entry 2955 (class 2606 OID 74789)
-- Name: reviews about_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT about_fkey FOREIGN KEY (about) REFERENCES public.product(sku) NOT VALID;


--
-- TOC entry 2951 (class 2606 OID 74988)
-- Name: product admin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT admin_fkey FOREIGN KEY (admin_seller) REFERENCES public.admin(email) NOT VALID;


--
-- TOC entry 2954 (class 2606 OID 74975)
-- Name: reviews author_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT author_fkey FOREIGN KEY (author) REFERENCES public.customers_information(email) NOT VALID;


--
-- TOC entry 2949 (class 2606 OID 41006)
-- Name: product brand_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT brand_fk FOREIGN KEY (brand) REFERENCES public.brand(name);


--
-- TOC entry 2950 (class 2606 OID 41011)
-- Name: product category_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT category_fk FOREIGN KEY (category) REFERENCES public.category(name);


--
-- TOC entry 2956 (class 2606 OID 74963)
-- Name: cart customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT customer_fkey FOREIGN KEY (customer_email) REFERENCES public.customers_information(email) NOT VALID;


--
-- TOC entry 2958 (class 2606 OID 75008)
-- Name: orders customeremail_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT customeremail_fkey FOREIGN KEY (customer_email) REFERENCES public.customers_information(email) NOT VALID;


--
-- TOC entry 2948 (class 2606 OID 74998)
-- Name: customers_information delivery_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_information
    ADD CONSTRAINT delivery_fkey FOREIGN KEY (delivery_kind) REFERENCES public.delivery_services_type(delivery_kind) ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 2959 (class 2606 OID 75003)
-- Name: orders deliverykind_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT deliverykind_fkey FOREIGN KEY (delivery_service) REFERENCES public.delivery_services_type(delivery_kind) ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 2963 (class 2606 OID 74839)
-- Name: customers_addresses email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_addresses
    ADD CONSTRAINT email_fkey FOREIGN KEY (email) REFERENCES public.customers_information(email);


--
-- TOC entry 2961 (class 2606 OID 74939)
-- Name: order_description order_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_description
    ADD CONSTRAINT order_fkey FOREIGN KEY ("order") REFERENCES public.orders(order_id) NOT VALID;


--
-- TOC entry 2960 (class 2606 OID 74875)
-- Name: orders orderstatus_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orderstatus_fkey FOREIGN KEY (order_status) REFERENCES public.delivery_status_description(delivery_status) NOT VALID;


--
-- TOC entry 2953 (class 2606 OID 74782)
-- Name: product_images product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_fkey FOREIGN KEY (product) REFERENCES public.product(sku) NOT VALID;


--
-- TOC entry 2962 (class 2606 OID 74944)
-- Name: order_description product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_description
    ADD CONSTRAINT product_fkey FOREIGN KEY (product) REFERENCES public.product(sku) NOT VALID;


--
-- TOC entry 2957 (class 2606 OID 74968)
-- Name: cart product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT product_fkey FOREIGN KEY (product) REFERENCES public.product(sku) NOT VALID;


--
-- TOC entry 2952 (class 2606 OID 74993)
-- Name: product supplier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT supplier_fkey FOREIGN KEY (supplier_seller) REFERENCES public.supplier(bce) NOT VALID;


-- Completed on 2021-12-23 15:34:10

--
-- PostgreSQL database dump complete
--

