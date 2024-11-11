--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0 (Ubuntu 17.0-1.pgdg24.04+1)
-- Dumped by pg_dump version 17.0 (Ubuntu 17.0-1.pgdg24.04+1)

-- Started on 2024-11-11 22:17:13 WIB

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 218 (class 1259 OID 98325)
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    id integer NOT NULL,
    name character varying(100),
    username character varying(100),
    password character varying(100)
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 98324)
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admins_id_seq OWNER TO postgres;

--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 217
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- TOC entry 220 (class 1259 OID 98332)
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    id integer NOT NULL,
    title character varying(100),
    category character varying(100),
    author character varying(100),
    price numeric(10,2),
    discount numeric(5,2),
    book_cover character varying(100),
    book_file character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.books OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 98331)
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_id_seq OWNER TO postgres;

--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 219
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- TOC entry 226 (class 1259 OID 122904)
-- Name: order_process; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_process (
    id integer NOT NULL,
    payment_id integer,
    amount numeric(10,2),
    status character varying(50),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted_at timestamp without time zone
);


ALTER TABLE public.order_process OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 122903)
-- Name: order_process_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_process_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_process_id_seq OWNER TO postgres;

--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 225
-- Name: order_process_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_process_id_seq OWNED BY public.order_process.id;


--
-- TOC entry 222 (class 1259 OID 98352)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    customer_name character varying(255) NOT NULL,
    order_number character varying(50) NOT NULL,
    order_status character varying(50) NOT NULL,
    order_date date NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 98351)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 221
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 224 (class 1259 OID 122881)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    photo character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 122880)
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_id_seq OWNER TO postgres;

--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 223
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- TOC entry 3274 (class 2604 OID 98328)
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- TOC entry 3275 (class 2604 OID 98335)
-- Name: books id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- TOC entry 3281 (class 2604 OID 122907)
-- Name: order_process id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_process ALTER COLUMN id SET DEFAULT nextval('public.order_process_id_seq'::regclass);


--
-- TOC entry 3279 (class 2604 OID 98355)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3280 (class 2604 OID 122884)
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- TOC entry 3443 (class 0 OID 98325)
-- Dependencies: 218
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins (id, name, username, password) FROM stdin;
1	Ahmad 1	user1	pass
\.


--
-- TOC entry 3445 (class 0 OID 98332)
-- Dependencies: 220
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.books (id, title, category, author, price, discount, book_cover, book_file, created_at, updated_at, deleted_at) FROM stdin;
6	coba2	Manga	gak tau	100000.00	10.00	\N	\N	2024-11-07 20:50:12.531386	2024-11-07 20:50:12.531386	2024-11-07 20:50:12.531386
7	coba3	Manga	gak tau	100000.00	10.00	\N	\N	2024-11-07 20:50:19.382446	2024-11-07 20:50:19.382446	2024-11-07 20:50:19.382446
8	coba4	Manga	gak tau	100000.00	10.00	\N	\N	2024-11-07 20:50:26.732952	2024-11-07 20:50:26.732952	2024-11-07 20:50:26.732952
9	coba5	Manga	gak tau	100000.00	10.00	\N	\N	2024-11-07 20:50:32.531962	2024-11-07 20:50:32.531962	2024-11-07 20:50:32.531962
10	coba6	Manga	gak tau	100000.00	10.00	\N	\N	2024-11-07 20:50:39.481704	2024-11-07 20:50:39.481704	2024-11-07 20:50:39.481704
11	coba7	Manga	gak tau	100000.00	10.00	\N	\N	2024-11-07 22:04:56.024337	2024-11-07 22:04:56.024337	2024-11-07 22:04:56.024337
12	coba8	Manga	gak tau	100000.00	10.00	\N	\N	2024-11-07 23:08:29.798021	2024-11-07 23:08:29.798021	2024-11-07 23:08:29.798021
\.


--
-- TOC entry 3451 (class 0 OID 122904)
-- Dependencies: 226
-- Data for Name: order_process; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_process (id, payment_id, amount, status, created_at, updated_at, deleted_at) FROM stdin;
4	2	150.00	\N	2024-11-11 22:08:14.976285	2024-11-11 22:08:14.976285	\N
\.


--
-- TOC entry 3447 (class 0 OID 98352)
-- Dependencies: 222
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, customer_name, order_number, order_status, order_date) FROM stdin;
1	Ahmad 1	P0001	Completed	2024-11-07
2	Ahmad 2	P0002	Completed	2024-11-07
3	Ahmad 3	P0003	Completed	2024-11-07
\.


--
-- TOC entry 3449 (class 0 OID 122881)
-- Dependencies: 224
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, name, photo, is_active, created_at, updated_at, deleted_at) FROM stdin;
2	tes	onepiece.jpg	t	2024-11-11 22:00:29.879682	2024-11-11 22:00:29.879682	\N
\.


--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 217
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admins_id_seq', 1, true);


--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 219
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_id_seq', 46, true);


--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 225
-- Name: order_process_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_process_id_seq', 4, true);


--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 221
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 3, true);


--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 223
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 2, true);


--
-- TOC entry 3285 (class 2606 OID 98330)
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- TOC entry 3287 (class 2606 OID 98342)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- TOC entry 3295 (class 2606 OID 122911)
-- Name: order_process order_process_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_process
    ADD CONSTRAINT order_process_pkey PRIMARY KEY (id);


--
-- TOC entry 3289 (class 2606 OID 98359)
-- Name: orders orders_order_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_order_number_key UNIQUE (order_number);


--
-- TOC entry 3291 (class 2606 OID 98357)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3293 (class 2606 OID 122888)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 3296 (class 2606 OID 122912)
-- Name: order_process fk_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_process
    ADD CONSTRAINT fk_payment FOREIGN KEY (payment_id) REFERENCES public.payments(id) ON DELETE SET NULL;


--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE admins; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.admins TO kryast;


--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 217
-- Name: SEQUENCE admins_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.admins_id_seq TO kryast;


--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE books; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.books TO kryast;


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 219
-- Name: SEQUENCE books_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.books_id_seq TO kryast;


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE order_process; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.order_process TO kryast;


--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 225
-- Name: SEQUENCE order_process_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.order_process_id_seq TO kryast;


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE orders; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.orders TO kryast;


--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 221
-- Name: SEQUENCE orders_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.orders_id_seq TO kryast;


--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE payments; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.payments TO kryast;


--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 223
-- Name: SEQUENCE payments_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.payments_id_seq TO kryast;


-- Completed on 2024-11-11 22:17:13 WIB

--
-- PostgreSQL database dump complete
--

