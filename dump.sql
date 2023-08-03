--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    user_id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    short_url text NOT NULL,
    user_id integer NOT NULL,
    accesses integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, '3a8b8b0f-b1e6-483d-a496-58a79f0b8dc2', 1, '2023-08-02 12:21:40.834685');
INSERT INTO public.sessions VALUES (2, '87d0ff93-aa08-498d-ba10-fa41dab8e1b2', 1, '2023-08-02 23:49:00.146718');
INSERT INTO public.sessions VALUES (3, '76d507eb-9892-4233-9eb3-294d00d5785c', 2, '2023-08-03 02:58:39.97924');
INSERT INTO public.sessions VALUES (4, '2b84a49f-e09d-407e-bb54-845510a4a627', 3, '2023-08-03 04:25:41.571009');
INSERT INTO public.sessions VALUES (5, 'b9e2297e-07c2-4e17-a783-bce9e5955899', 4, '2023-08-03 04:25:59.574608');
INSERT INTO public.sessions VALUES (6, '3c0bf438-c507-483f-a418-141cbc9e5896', 10, '2023-08-03 04:26:03.649129');
INSERT INTO public.sessions VALUES (7, 'f3669a8d-2eb1-466f-a097-94282680e02a', 5, '2023-08-03 04:26:21.96717');
INSERT INTO public.sessions VALUES (8, 'f850ac8f-753c-4d9d-b72c-0dac90e11d0d', 6, '2023-08-03 04:26:25.00678');
INSERT INTO public.sessions VALUES (9, '908422fe-ca25-4489-bdc6-38d9bf8a7423', 7, '2023-08-03 04:26:29.057895');
INSERT INTO public.sessions VALUES (10, '176265fc-b2c5-442c-bd01-c94056d0729f', 8, '2023-08-03 04:26:32.685803');
INSERT INTO public.sessions VALUES (11, 'd5b9352a-b250-4df4-bccd-a5ec5df5ace0', 9, '2023-08-03 04:26:35.827595');
INSERT INTO public.sessions VALUES (12, 'd752f2d8-e6fa-4283-820a-ef3c111d3b46', 11, '2023-08-03 04:39:32.707869');
INSERT INTO public.sessions VALUES (13, 'c7309326-a529-4950-b885-8b12a9dc0257', 11, '2023-08-03 05:02:29.29851');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (3, 'https://www.driven.com.br', 'SITm1Z2K', 1, 3, '2023-08-03 00:27:56.240316');
INSERT INTO public.urls VALUES (8, 'https://www.driven.com.br', 'Z1Gw82Lj', 1, 0, '2023-08-03 02:09:31.548491');
INSERT INTO public.urls VALUES (9, 'https://www.driven.com.br', 'd0d5vyRQ', 1, 0, '2023-08-03 02:09:32.201143');
INSERT INTO public.urls VALUES (7, 'https://www.driven.com.br', 'OU7l1JZk', 1, 2, '2023-08-03 02:09:30.968278');
INSERT INTO public.urls VALUES (10, 'https://www.driven.com.br', 'TBa90r3m', 2, 0, '2023-08-03 02:58:59.785481');
INSERT INTO public.urls VALUES (11, 'https://www.driven.com.br', 'GtxL72Uk', 2, 0, '2023-08-03 02:59:00.332188');
INSERT INTO public.urls VALUES (22, 'https://www.driven.com.br', 'HY0eM1tL', 9, 1, '2023-08-03 04:29:14.965855');
INSERT INTO public.urls VALUES (21, 'https://www.driven.com.br', 'kZnSqSxM', 8, 1, '2023-08-03 04:29:08.739463');
INSERT INTO public.urls VALUES (20, 'https://www.driven.com.br', 'BYNjaNAv', 7, 1, '2023-08-03 04:28:57.142825');
INSERT INTO public.urls VALUES (19, 'https://www.driven.com.br', 'tgcKX7zH', 6, 1, '2023-08-03 04:28:48.492953');
INSERT INTO public.urls VALUES (18, 'https://www.driven.com.br', '-Fy27aBa', 5, 1, '2023-08-03 04:28:32.013788');
INSERT INTO public.urls VALUES (17, 'https://www.driven.com.br', 'lzbsUldc', 10, 1, '2023-08-03 04:28:24.948375');
INSERT INTO public.urls VALUES (16, 'https://www.driven.com.br', '-SzB-8dY', 4, 1, '2023-08-03 04:28:09.983149');
INSERT INTO public.urls VALUES (15, 'https://www.driven.com.br', 'YHH7F9aa', 3, 1, '2023-08-03 04:27:54.89562');
INSERT INTO public.urls VALUES (14, 'https://www.driven.com.br', 'GxOxGOua', 2, 2, '2023-08-03 03:32:29.043466');
INSERT INTO public.urls VALUES (12, 'https://www.driven.com.br', 'X90tH2Lm', 2, 1, '2023-08-03 02:59:00.883238');
INSERT INTO public.urls VALUES (23, 'https://www.driven.com.br', 'mx6yvLZI', 11, 0, '2023-08-03 04:39:46.098677');
INSERT INTO public.urls VALUES (24, 'https://www.driven.com.br', 'RPrAuPXk', 11, 0, '2023-08-03 05:02:54.480721');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'João', 'joao@driven.com.br', '$2b$10$546zsUTyT0RSOTJwBMsdiuxH5p7WE8voqFB47Zj0tUdeIY9YSVpKG', '2023-08-02 11:42:45.138872');
INSERT INTO public.users VALUES (2, 'João2', 'joao2@driven.com.br', '$2b$10$VDHj/sfU0orOR41TwkzMZeEssmN8WXHUAg5zbRI1GPc8m2Nr1tR0G', '2023-08-03 02:58:35.93934');
INSERT INTO public.users VALUES (3, 'Cleiton', 'Cleiton@driven.com.br', '$2b$10$SyOPotQo2JIjJpBDDdWHO.H5/lfFLbRUsXPaou./OXMUsKjEU1fnW', '2023-08-03 04:21:22.670353');
INSERT INTO public.users VALUES (4, 'Alguma Coisa', 'alguma@coisa.com.br', '$2b$10$PIDh0MzZHag7n8E6QsZ.SOOdQVvZ2UUzU81rDpTi0m0pHy2Af2dIa', '2023-08-03 04:21:48.419244');
INSERT INTO public.users VALUES (5, 'Alguma Coisa5', 'alguma5@coisa.com.br', '$2b$10$AgFHQsVkm4ADk0/l6zLJke6NUZNnDZH11RlaXglFcRiSsFBqlm.fC', '2023-08-03 04:21:54.972757');
INSERT INTO public.users VALUES (6, 'Alguma Coisa6', 'alguma6@coisa.com.br', '$2b$10$TyD.tH3j1DFl4gOSS5b/nOVArphMfBvAaR.jDUQb.wLpobXGBPRzS', '2023-08-03 04:22:00.70377');
INSERT INTO public.users VALUES (7, 'Alguma Coisa7', 'alguma7@coisa.com.br', '$2b$10$HWV1ZJWoZE9BMqHv2uzOAOnd0CmjjmYBka7A4XbHF5y5Kex0lcmMi', '2023-08-03 04:22:06.950577');
INSERT INTO public.users VALUES (8, 'Alguma Coisa8', 'alguma8@coisa.com.br', '$2b$10$NRrN4M6yRpKU3x1O.fFQJeiWdLWOU4cRhDGyNSKDi1EcF5TeEUt6m', '2023-08-03 04:22:13.833148');
INSERT INTO public.users VALUES (9, 'Alguma Coisa9', 'alguma9@coisa.com.br', '$2b$10$lGlvLqZc0CEGLjLI7D04GeCgLps3/wkXNezxYGORjAfHQTT9DOTeu', '2023-08-03 04:22:20.162951');
INSERT INTO public.users VALUES (10, 'Alguma Coisa0', 'alguma0@coisa.com.br', '$2b$10$RqSMDDl/R6v9eggOtZLVSOrN/d.HQqJieiIW9g/lMNvlnkAj5QHZO', '2023-08-03 04:24:22.273945');
INSERT INTO public.users VALUES (11, 'Nao era pra vc ta aki', 'alguma00@coisa.com.br', '$2b$10$d.FA1BYTG9gQQQUJquEeju4w154nwOlQzFP2NqdL59glkN1FkMyui', '2023-08-03 04:39:20.50092');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 13, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 24, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: urls urls_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

