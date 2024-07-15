--
-- PostgreSQL database dump
--

-- Dumped from database version 13.7
-- Dumped by pg_dump version 13.7

-- Started on 2024-07-16 00:15:38

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
-- TOC entry 9 (class 2615 OID 55276)
-- Name: marketplace; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA marketplace;


ALTER SCHEMA marketplace OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 212 (class 1259 OID 55298)
-- Name: product; Type: TABLE; Schema: marketplace; Owner: postgres
--

CREATE TABLE marketplace.product (
    id_product integer NOT NULL,
    nama_product character varying(255) NOT NULL,
    deskripsi character varying(255),
    harga integer NOT NULL,
    id_merchant integer NOT NULL,
    stock integer NOT NULL
);


ALTER TABLE marketplace.product OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 55296)
-- Name: aproduct_id_product_seq; Type: SEQUENCE; Schema: marketplace; Owner: postgres
--

CREATE SEQUENCE marketplace.aproduct_id_product_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE marketplace.aproduct_id_product_seq OWNER TO postgres;

--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 211
-- Name: aproduct_id_product_seq; Type: SEQUENCE OWNED BY; Schema: marketplace; Owner: postgres
--

ALTER SEQUENCE marketplace.aproduct_id_product_seq OWNED BY marketplace.product.id_product;


--
-- TOC entry 214 (class 1259 OID 55314)
-- Name: customer; Type: TABLE; Schema: marketplace; Owner: postgres
--

CREATE TABLE marketplace.customer (
    id_customer integer NOT NULL,
    nama_customer character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    no_hp character varying(15) NOT NULL
);


ALTER TABLE marketplace.customer OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 55312)
-- Name: customer_id_customer_seq; Type: SEQUENCE; Schema: marketplace; Owner: postgres
--

CREATE SEQUENCE marketplace.customer_id_customer_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE marketplace.customer_id_customer_seq OWNER TO postgres;

--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 213
-- Name: customer_id_customer_seq; Type: SEQUENCE OWNED BY; Schema: marketplace; Owner: postgres
--

ALTER SEQUENCE marketplace.customer_id_customer_seq OWNED BY marketplace.customer.id_customer;


--
-- TOC entry 218 (class 1259 OID 55350)
-- Name: detil_transaksi; Type: TABLE; Schema: marketplace; Owner: postgres
--

CREATE TABLE marketplace.detil_transaksi (
    id_detil_transaksi integer NOT NULL,
    id_transaksi integer NOT NULL,
    id_product integer NOT NULL,
    jumlah_product integer NOT NULL,
    harga_detil_transaksi integer NOT NULL
);


ALTER TABLE marketplace.detil_transaksi OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 55348)
-- Name: detil_transaksi_id_detil_transaksi_seq; Type: SEQUENCE; Schema: marketplace; Owner: postgres
--

CREATE SEQUENCE marketplace.detil_transaksi_id_detil_transaksi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE marketplace.detil_transaksi_id_detil_transaksi_seq OWNER TO postgres;

--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 217
-- Name: detil_transaksi_id_detil_transaksi_seq; Type: SEQUENCE OWNED BY; Schema: marketplace; Owner: postgres
--

ALTER SEQUENCE marketplace.detil_transaksi_id_detil_transaksi_seq OWNED BY marketplace.detil_transaksi.id_detil_transaksi;


--
-- TOC entry 210 (class 1259 OID 55279)
-- Name: merchant; Type: TABLE; Schema: marketplace; Owner: postgres
--

CREATE TABLE marketplace.merchant (
    id_merchant integer NOT NULL,
    nama character varying(255) NOT NULL
);


ALTER TABLE marketplace.merchant OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 55277)
-- Name: merchant_id_merchant_seq; Type: SEQUENCE; Schema: marketplace; Owner: postgres
--

CREATE SEQUENCE marketplace.merchant_id_merchant_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE marketplace.merchant_id_merchant_seq OWNER TO postgres;

--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 209
-- Name: merchant_id_merchant_seq; Type: SEQUENCE OWNED BY; Schema: marketplace; Owner: postgres
--

ALTER SEQUENCE marketplace.merchant_id_merchant_seq OWNED BY marketplace.merchant.id_merchant;


--
-- TOC entry 216 (class 1259 OID 55335)
-- Name: transaksi; Type: TABLE; Schema: marketplace; Owner: postgres
--

CREATE TABLE marketplace.transaksi (
    id_transaksi integer NOT NULL,
    id_customer integer NOT NULL,
    tanggal_order timestamp without time zone NOT NULL,
    is_gratis_ongkir boolean NOT NULL,
    is_diskon boolean NOT NULL,
    diskon_value integer DEFAULT 0,
    harga_ongkir integer DEFAULT 0,
    total_harga_product_sebelum_diskon integer NOT NULL,
    total_semuanya integer NOT NULL
);


ALTER TABLE marketplace.transaksi OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 55333)
-- Name: transaksi_id_transaksi_seq; Type: SEQUENCE; Schema: marketplace; Owner: postgres
--

CREATE SEQUENCE marketplace.transaksi_id_transaksi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE marketplace.transaksi_id_transaksi_seq OWNER TO postgres;

--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 215
-- Name: transaksi_id_transaksi_seq; Type: SEQUENCE OWNED BY; Schema: marketplace; Owner: postgres
--

ALTER SEQUENCE marketplace.transaksi_id_transaksi_seq OWNED BY marketplace.transaksi.id_transaksi;


--
-- TOC entry 2900 (class 2604 OID 55317)
-- Name: customer id_customer; Type: DEFAULT; Schema: marketplace; Owner: postgres
--

ALTER TABLE ONLY marketplace.customer ALTER COLUMN id_customer SET DEFAULT nextval('marketplace.customer_id_customer_seq'::regclass);


--
-- TOC entry 2904 (class 2604 OID 55353)
-- Name: detil_transaksi id_detil_transaksi; Type: DEFAULT; Schema: marketplace; Owner: postgres
--

ALTER TABLE ONLY marketplace.detil_transaksi ALTER COLUMN id_detil_transaksi SET DEFAULT nextval('marketplace.detil_transaksi_id_detil_transaksi_seq'::regclass);


--
-- TOC entry 2898 (class 2604 OID 55282)
-- Name: merchant id_merchant; Type: DEFAULT; Schema: marketplace; Owner: postgres
--

ALTER TABLE ONLY marketplace.merchant ALTER COLUMN id_merchant SET DEFAULT nextval('marketplace.merchant_id_merchant_seq'::regclass);


--
-- TOC entry 2899 (class 2604 OID 55301)
-- Name: product id_product; Type: DEFAULT; Schema: marketplace; Owner: postgres
--

ALTER TABLE ONLY marketplace.product ALTER COLUMN id_product SET DEFAULT nextval('marketplace.aproduct_id_product_seq'::regclass);


--
-- TOC entry 2901 (class 2604 OID 55338)
-- Name: transaksi id_transaksi; Type: DEFAULT; Schema: marketplace; Owner: postgres
--

ALTER TABLE ONLY marketplace.transaksi ALTER COLUMN id_transaksi SET DEFAULT nextval('marketplace.transaksi_id_transaksi_seq'::regclass);


--
-- TOC entry 3053 (class 0 OID 55314)
-- Dependencies: 214
-- Data for Name: customer; Type: TABLE DATA; Schema: marketplace; Owner: postgres
--

INSERT INTO marketplace.customer VALUES (1, 'adi', 'adi@gmail.com', '085972572938');
INSERT INTO marketplace.customer VALUES (2, 'budi', 'budi@gmail.com', '085972572939');
INSERT INTO marketplace.customer VALUES (3, 'yono', 'yono@gmail.com', '085972572930');


--
-- TOC entry 3057 (class 0 OID 55350)
-- Dependencies: 218
-- Data for Name: detil_transaksi; Type: TABLE DATA; Schema: marketplace; Owner: postgres
--

INSERT INTO marketplace.detil_transaksi VALUES (1, 1, 1, 1, 60000);
INSERT INTO marketplace.detil_transaksi VALUES (7, 2, 3, 1, 20000);
INSERT INTO marketplace.detil_transaksi VALUES (8, 2, 2, 1, 15000);
INSERT INTO marketplace.detil_transaksi VALUES (9, 2, 3, 1, 20000);
INSERT INTO marketplace.detil_transaksi VALUES (10, 2, 2, 1, 15000);
INSERT INTO marketplace.detil_transaksi VALUES (11, 2, 3, 1, 20000);
INSERT INTO marketplace.detil_transaksi VALUES (12, 2, 2, 1, 15000);
INSERT INTO marketplace.detil_transaksi VALUES (13, 3, 3, 1, 20000);
INSERT INTO marketplace.detil_transaksi VALUES (14, 3, 2, 1, 15000);
INSERT INTO marketplace.detil_transaksi VALUES (15, 4, 3, 1, 20000);
INSERT INTO marketplace.detil_transaksi VALUES (16, 4, 2, 1, 15000);
INSERT INTO marketplace.detil_transaksi VALUES (17, 5, 3, 2, 40000);
INSERT INTO marketplace.detil_transaksi VALUES (18, 5, 2, 2, 30000);
INSERT INTO marketplace.detil_transaksi VALUES (19, 6, 3, 2, 40000);


--
-- TOC entry 3049 (class 0 OID 55279)
-- Dependencies: 210
-- Data for Name: merchant; Type: TABLE DATA; Schema: marketplace; Owner: postgres
--

INSERT INTO marketplace.merchant VALUES (1, 'warung ida');
INSERT INTO marketplace.merchant VALUES (2, 'warkop');
INSERT INTO marketplace.merchant VALUES (3, 'warmindo');


--
-- TOC entry 3051 (class 0 OID 55298)
-- Dependencies: 212
-- Data for Name: product; Type: TABLE DATA; Schema: marketplace; Owner: postgres
--

INSERT INTO marketplace.product VALUES (4, 'kopi susu', 'kopi susu', 5000, 2, 2);
INSERT INTO marketplace.product VALUES (5, 'teh', 'teh', 2000, 2, 6);
INSERT INTO marketplace.product VALUES (6, 'pensil', 'pensil warna', 1000, 1, 8);
INSERT INTO marketplace.product VALUES (7, 'buku', 'buku tulis', 6000, 1, 4);
INSERT INTO marketplace.product VALUES (9, 'nutrisari jeruk', 'jeruk perass', 1500, 3, 7);
INSERT INTO marketplace.product VALUES (1, ' indomie aceh', 'mie goreng', 60000, 3, 5);
INSERT INTO marketplace.product VALUES (2, 'indomie kari', 'mie kuah', 15000, 3, 10);
INSERT INTO marketplace.product VALUES (3, 'sarimi goreng', 'mie goreng', 20000, 3, 8);
INSERT INTO marketplace.product VALUES (10, 'ademsari', 'minuman penyegar', 1000, 3, 8);


--
-- TOC entry 3055 (class 0 OID 55335)
-- Dependencies: 216
-- Data for Name: transaksi; Type: TABLE DATA; Schema: marketplace; Owner: postgres
--

INSERT INTO marketplace.transaksi VALUES (1, 1, '2024-07-15 21:38:36.177955', false, true, 10, 10000, 60000, 54000);
INSERT INTO marketplace.transaksi VALUES (2, 3, '2024-07-15 15:18:39.81826', true, false, 0, 0, 35000, 35000);
INSERT INTO marketplace.transaksi VALUES (3, 3, '2024-07-15 15:20:12.13817', true, false, 0, 0, 35000, 35000);
INSERT INTO marketplace.transaksi VALUES (4, 3, '2024-07-15 15:20:37.459416', true, false, 0, 0, 35000, 35000);
INSERT INTO marketplace.transaksi VALUES (5, 3, '2024-07-15 15:21:02.704977', true, true, 10, 0, 70000, 63000);


--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 211
-- Name: aproduct_id_product_seq; Type: SEQUENCE SET; Schema: marketplace; Owner: postgres
--

SELECT pg_catalog.setval('marketplace.aproduct_id_product_seq', 10, true);


--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 213
-- Name: customer_id_customer_seq; Type: SEQUENCE SET; Schema: marketplace; Owner: postgres
--

SELECT pg_catalog.setval('marketplace.customer_id_customer_seq', 3, true);


--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 217
-- Name: detil_transaksi_id_detil_transaksi_seq; Type: SEQUENCE SET; Schema: marketplace; Owner: postgres
--

SELECT pg_catalog.setval('marketplace.detil_transaksi_id_detil_transaksi_seq', 25, true);


--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 209
-- Name: merchant_id_merchant_seq; Type: SEQUENCE SET; Schema: marketplace; Owner: postgres
--

SELECT pg_catalog.setval('marketplace.merchant_id_merchant_seq', 3, true);


--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 215
-- Name: transaksi_id_transaksi_seq; Type: SEQUENCE SET; Schema: marketplace; Owner: postgres
--

SELECT pg_catalog.setval('marketplace.transaksi_id_transaksi_seq', 5, true);


--
-- TOC entry 2908 (class 2606 OID 55306)
-- Name: product aproduct_pkey; Type: CONSTRAINT; Schema: marketplace; Owner: postgres
--

ALTER TABLE ONLY marketplace.product
    ADD CONSTRAINT aproduct_pkey PRIMARY KEY (id_product);


--
-- TOC entry 2910 (class 2606 OID 55322)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: marketplace; Owner: postgres
--

ALTER TABLE ONLY marketplace.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id_customer);


--
-- TOC entry 2914 (class 2606 OID 55355)
-- Name: detil_transaksi detil_transaksi_pkey; Type: CONSTRAINT; Schema: marketplace; Owner: postgres
--

ALTER TABLE ONLY marketplace.detil_transaksi
    ADD CONSTRAINT detil_transaksi_pkey PRIMARY KEY (id_detil_transaksi);


--
-- TOC entry 2906 (class 2606 OID 55284)
-- Name: merchant merchant_pkey; Type: CONSTRAINT; Schema: marketplace; Owner: postgres
--

ALTER TABLE ONLY marketplace.merchant
    ADD CONSTRAINT merchant_pkey PRIMARY KEY (id_merchant);


--
-- TOC entry 2912 (class 2606 OID 55342)
-- Name: transaksi transaksi_pkey; Type: CONSTRAINT; Schema: marketplace; Owner: postgres
--

ALTER TABLE ONLY marketplace.transaksi
    ADD CONSTRAINT transaksi_pkey PRIMARY KEY (id_transaksi);


--
-- TOC entry 2915 (class 2606 OID 55307)
-- Name: product aproduct_id_merchant_fkey; Type: FK CONSTRAINT; Schema: marketplace; Owner: postgres
--

ALTER TABLE ONLY marketplace.product
    ADD CONSTRAINT aproduct_id_merchant_fkey FOREIGN KEY (id_merchant) REFERENCES marketplace.merchant(id_merchant);


--
-- TOC entry 2917 (class 2606 OID 55361)
-- Name: detil_transaksi detil_transaksi_id_product_fkey; Type: FK CONSTRAINT; Schema: marketplace; Owner: postgres
--

ALTER TABLE ONLY marketplace.detil_transaksi
    ADD CONSTRAINT detil_transaksi_id_product_fkey FOREIGN KEY (id_product) REFERENCES marketplace.product(id_product);


--
-- TOC entry 2916 (class 2606 OID 55343)
-- Name: transaksi transaksi_id_customer_fkey; Type: FK CONSTRAINT; Schema: marketplace; Owner: postgres
--

ALTER TABLE ONLY marketplace.transaksi
    ADD CONSTRAINT transaksi_id_customer_fkey FOREIGN KEY (id_customer) REFERENCES marketplace.customer(id_customer);


-- Completed on 2024-07-16 00:15:39

--
-- PostgreSQL database dump complete
--

