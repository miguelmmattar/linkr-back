--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-2.pgdg20.04+2)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: heroku_ext; Type: SCHEMA; Schema: -; Owner: u1sh767n7i1rat
--

CREATE SCHEMA heroku_ext;


ALTER SCHEMA heroku_ext OWNER TO u1sh767n7i1rat;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: hashtags; Type: TABLE; Schema: public; Owner: skgowwxrypwfbv
--

CREATE TABLE public.hashtags (
    id integer NOT NULL,
    hashtag text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.hashtags OWNER TO skgowwxrypwfbv;

--
-- Name: hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: skgowwxrypwfbv
--

CREATE SEQUENCE public.hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hashtags_id_seq OWNER TO skgowwxrypwfbv;

--
-- Name: hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skgowwxrypwfbv
--

ALTER SEQUENCE public.hashtags_id_seq OWNED BY public.hashtags.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: skgowwxrypwfbv
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "postId" integer NOT NULL,
    "userId" integer NOT NULL
);


ALTER TABLE public.likes OWNER TO skgowwxrypwfbv;

--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: skgowwxrypwfbv
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.likes_id_seq OWNER TO skgowwxrypwfbv;

--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skgowwxrypwfbv
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: skgowwxrypwfbv
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "userId" integer NOT NULL,
    url text NOT NULL,
    description text
);


ALTER TABLE public.posts OWNER TO skgowwxrypwfbv;

--
-- Name: postsHashtags; Type: TABLE; Schema: public; Owner: skgowwxrypwfbv
--

CREATE TABLE public."postsHashtags" (
    id integer NOT NULL,
    "postId" integer NOT NULL,
    "hashtagId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."postsHashtags" OWNER TO skgowwxrypwfbv;

--
-- Name: postsHashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: skgowwxrypwfbv
--

CREATE SEQUENCE public."postsHashtags_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."postsHashtags_id_seq" OWNER TO skgowwxrypwfbv;

--
-- Name: postsHashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skgowwxrypwfbv
--

ALTER SEQUENCE public."postsHashtags_id_seq" OWNED BY public."postsHashtags".id;


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: skgowwxrypwfbv
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO skgowwxrypwfbv;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skgowwxrypwfbv
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: skgowwxrypwfbv
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    token text NOT NULL,
    "closedAt" timestamp without time zone
);


ALTER TABLE public.sessions OWNER TO skgowwxrypwfbv;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: skgowwxrypwfbv
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO skgowwxrypwfbv;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skgowwxrypwfbv
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: userPicture; Type: TABLE; Schema: public; Owner: skgowwxrypwfbv
--

CREATE TABLE public."userPicture" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    url text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."userPicture" OWNER TO skgowwxrypwfbv;

--
-- Name: userPicture_id_seq; Type: SEQUENCE; Schema: public; Owner: skgowwxrypwfbv
--

CREATE SEQUENCE public."userPicture_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."userPicture_id_seq" OWNER TO skgowwxrypwfbv;

--
-- Name: userPicture_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skgowwxrypwfbv
--

ALTER SEQUENCE public."userPicture_id_seq" OWNED BY public."userPicture".id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: skgowwxrypwfbv
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    password text NOT NULL,
    email text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO skgowwxrypwfbv;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: skgowwxrypwfbv
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO skgowwxrypwfbv;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skgowwxrypwfbv
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: hashtags id; Type: DEFAULT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.hashtags ALTER COLUMN id SET DEFAULT nextval('public.hashtags_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: postsHashtags id; Type: DEFAULT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public."postsHashtags" ALTER COLUMN id SET DEFAULT nextval('public."postsHashtags_id_seq"'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: userPicture id; Type: DEFAULT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public."userPicture" ALTER COLUMN id SET DEFAULT nextval('public."userPicture_id_seq"'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: hashtags; Type: TABLE DATA; Schema: public; Owner: skgowwxrypwfbv
--

COPY public.hashtags (id, hashtag, "createdAt") FROM stdin;
1	#teste	2022-10-20 17:14:40.776005
3	#teste2	2022-10-20 17:25:27.151241
5	#teste3	2022-10-20 17:37:17.386547
6	#teste4	2022-10-20 18:09:19.041017
7	#teste5	2022-10-20 18:09:19.346777
8	#teste6	2022-10-20 19:15:54.941993
9	#teste7	2022-10-20 19:16:56.170183
10	#teste10	2022-10-20 19:23:43.456945
11	#teste12	2022-10-20 21:23:45.854073
12	#teste13	2022-10-20 21:25:07.565423
13	#teste8	2022-10-21 00:33:04.800028
14	#teste9	2022-10-21 00:33:05.103436
15	#teste11	2022-10-21 00:33:05.551476
16	#teste14	2022-10-21 00:33:06.009934
17	#teste15	2022-10-21 00:33:06.313168
18	#teste16	2022-10-21 00:33:37.017785
19	#testando1	2022-10-21 15:25:29.273434
20	#testando2	2022-10-21 15:25:29.608576
21	#testando22222	2022-10-21 15:25:29.921547
22	#top	2022-10-21 17:32:22.394669
23	#topzera	2022-10-21 17:32:22.703407
24	#saveiro	2022-10-21 18:38:44.435208
25	#rebaixada	2022-10-21 18:38:44.726241
26	#massa	2022-10-22 17:05:07.541084
27	#abarela	2022-10-23 17:49:36.87623
28	#sabeiro	2022-10-23 17:58:22.063326
29	#vortei	2022-10-23 20:09:37.010469
30	#teste\n	2022-10-23 20:23:29.645759
31	#fumetsu	2022-10-23 22:50:27.25372
32	#otakufedido	2022-10-23 22:50:27.548716
33	#otakufedido\n\n	2022-10-23 22:50:59.640167
34	#otaku	2022-10-23 23:26:18.666169
35	#otaku\n	2022-10-23 23:28:49.488879
36	#otaku2	2022-10-23 23:34:15.223149
37	#testesmaisumavez	2022-10-24 14:50:43.01605
38	#massa\n	2022-10-24 19:13:47.343337
39	#testepr	2022-10-24 19:45:21.387717
40	#editada	2022-10-24 19:46:42.802024
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: skgowwxrypwfbv
--

COPY public.likes (id, "createdAt", "postId", "userId") FROM stdin;
72	2022-10-23 01:16:00.943097	75	74
80	2022-10-23 17:21:15.432561	76	70
81	2022-10-23 17:21:19.253115	75	70
83	2022-10-23 17:21:24.875094	73	70
84	2022-10-23 17:21:26.575069	58	70
85	2022-10-23 17:21:29.075579	57	70
86	2022-10-23 17:21:32.079733	54	70
95	2022-10-23 17:30:56.973671	74	70
99	2022-10-23 22:13:24.170468	89	74
102	2022-10-23 23:45:47.485614	100	70
103	2022-10-23 23:45:53.643608	104	70
104	2022-10-24 01:22:45.336079	102	73
105	2022-10-24 14:45:50.341441	109	74
106	2022-10-24 14:58:14.173367	101	69
107	2022-10-24 16:55:57.04041	89	70
109	2022-10-24 17:49:06.629098	113	70
110	2022-10-24 17:49:08.276623	112	70
111	2022-10-24 17:49:10.064126	111	70
113	2022-10-24 17:49:22.684128	110	70
114	2022-10-24 18:32:23.806674	113	74
115	2022-10-24 18:32:23.808361	113	74
116	2022-10-24 18:32:23.810411	113	74
117	2022-10-24 18:51:30.079563	111	74
118	2022-10-24 18:51:30.08121	111	74
119	2022-10-24 18:51:30.097877	111	74
120	2022-10-24 19:46:18.373369	115	74
121	2022-10-24 19:46:23.454946	116	74
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: skgowwxrypwfbv
--

COPY public.posts (id, "createdAt", "userId", url, description) FROM stdin;
3	2022-10-20 01:57:28.044054	8	http://youtube.com	mds como #react3 da trabalho
4	2022-10-20 01:57:35.159444	8	http://youtube.com	mds como #react4 da trabalho
5	2022-10-20 01:57:38.7238	8	http://youtube.com	mds como #react5 da trabalho
6	2022-10-20 01:57:42.824809	8	http://youtube.com	mds como #react6 da trabalho
7	2022-10-20 01:57:50.499082	8	http://youtube.com	mds como #react7 da trabalho
8	2022-10-20 01:57:54.967814	8	http://youtube.com	mds como #react8 da trabalho
9	2022-10-20 01:57:59.998677	8	http://youtube.com	mds como #react9 da trabalho
10	2022-10-20 01:58:03.691198	8	http://youtube.com	mds como #react10 da trabalho
11	2022-10-20 02:00:39.417232	8	http://youtube.com	mds como #react10 da trabalho
12	2022-10-20 02:00:46.671611	8	http://youtube.com	mds como #react11 da trabalho
13	2022-10-20 02:00:50.883848	8	http://youtube.com	mds como #react11 da trabalho
14	2022-10-20 02:00:56.826609	8	http://youtube.com	mds como #react12 da trabalho
15	2022-10-20 02:00:58.529604	8	http://youtube.com	mds como #react12 da trabalho
16	2022-10-20 02:00:59.944109	8	http://youtube.com	mds como #react12 da trabalho
17	2022-10-20 02:01:23.97464	8	http://youtube.com	mds como #react12 da trabalho #maisuma
18	2022-10-20 02:46:21.516467	8	http://youtube.com	mds como react da trabalho
19	2022-10-20 02:46:33.117946	8	http://youtube.com	mds como react da trabalho#
20	2022-10-20 02:46:37.997602	8	http://youtube.com	mds como react da trabalho #
23	2022-10-20 21:28:56.859773	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
24	2022-10-20 21:29:46.121323	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
25	2022-10-20 21:30:20.538945	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
26	2022-10-20 21:36:02.47679	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
27	2022-10-20 21:36:14.686228	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
28	2022-10-20 21:36:40.590014	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
29	2022-10-20 21:36:53.751086	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
30	2022-10-20 21:42:02.777639	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
31	2022-10-20 21:42:05.34877	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
32	2022-10-20 21:43:41.716195	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
33	2022-10-20 21:44:09.888376	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
34	2022-10-20 21:45:45.327303	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
35	2022-10-20 21:46:11.648423	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
36	2022-10-20 21:46:25.733495	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
37	2022-10-20 21:47:14.428026	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
38	2022-10-20 22:12:25.815611	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
39	2022-10-20 22:12:42.792377	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
40	2022-10-20 23:17:17.851993	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
41	2022-10-20 23:19:04.596559	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
42	2022-10-20 23:23:33.99046	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
43	2022-10-20 23:26:16.829977	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
45	2022-10-20 23:27:31.511471	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
46	2022-10-20 23:32:12.697795	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
47	2022-10-20 23:32:47.801873	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
48	2022-10-20 23:33:14.151775	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
49	2022-10-21 00:16:36.79406	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
50	2022-10-21 00:18:09.469895	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
51	2022-10-21 00:33:06.466284	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
52	2022-10-21 00:33:15.721417	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
53	2022-10-21 00:33:37.173784	6	https://youtube.com	kfpewkfopewk #teste #teste #teste2 #teste3 #teste4 #teste5 #teste12
54	2022-10-21 12:22:54.217186	69	https://www.youtube.com/watch?v=tuCB7nEqnLk	Olha esse vídeo super legal pra aumentar a autoestima da sua calopsita!
55	2022-10-21 12:22:54.373065	69	https://www.youtube.com/watch?v=tuCB7nEqnLk	Olha esse vídeo super legal pra aumentar a autoestima da sua calopsita!
56	2022-10-21 13:31:12.405949	69	https://www.manual.com.br/queda-de-cabelo/products/finasterida-plan?gclid=Cj0KCQjwhsmaBhCvARIsAIbEbH6OV8COsoZr6ejDR2KcJ1nEqL4IoKw2-wRsmtmjuGJsvqFLOutSLMcaArx9EALw_wcB	Agora ninguém mais fica sem pena!
57	2022-10-21 13:31:12.549952	69	https://www.manual.com.br/queda-de-cabelo/products/finasterida-plan?gclid=Cj0KCQjwhsmaBhCvARIsAIbEbH6OV8COsoZr6ejDR2KcJ1nEqL4IoKw2-wRsmtmjuGJsvqFLOutSLMcaArx9EALw_wcB	Agora ninguém mais fica sem pena!
58	2022-10-21 13:38:41.995515	69	https://www.manual.com.br/queda-de-cabelo/products/finasterida-plan?gclid=Cj0KCQjwhsmaBhCvARIsAIbEbH6OV8COsoZr6ejDR2KcJ1nEqL4IoKw2-wRsmtmjuGJsvqFLOutSLMcaArx9EALw_wcB	Agora ninguém mais fica sem pena!
59	2022-10-21 13:38:42.147734	69	https://www.manual.com.br/queda-de-cabelo/products/finasterida-plan?gclid=Cj0KCQjwhsmaBhCvARIsAIbEbH6OV8COsoZr6ejDR2KcJ1nEqL4IoKw2-wRsmtmjuGJsvqFLOutSLMcaArx9EALw_wcB	Agora ninguém mais fica sem pena!
60	2022-10-21 15:25:30.24091	15	https://meusitemaneirissimo.com.br	oi oi oi oi oi #testando1 #testando2 #testando22222 #testando2
61	2022-10-21 15:25:30.394229	15	https://meusitemaneirissimo.com.br	oi oi oi oi oi #testando1 #testando2 #testando22222 #testando2
62	2022-10-21 15:31:09.750691	15	https://meusitemaneirissimo.com.br	oi oi oi oi oi #testando1 #testando2 #testando22222 #testando2
2	2022-10-20 01:57:04.624029	67	http://youtube.com	saveiro massa #saveiro #rebaixada
63	2022-10-21 15:31:09.912734	15	https://meusitemaneirissimo.com.br	oi oi oi oi oi #testando1 #testando2 #testando22222 #testando2
64	2022-10-21 15:36:47.841106	15	https://meusitemaneirissimo.com.br	oi oi oi oi oi #testando1 #testando2 #testando22222 #testando2
65	2022-10-21 15:36:48.008893	15	https://meusitemaneirissimo.com.br	oi oi oi oi oi #testando1 #testando2 #testando22222 #testando2
66	2022-10-21 15:38:14.407757	15	https://meusitemaneirissimo.com.br	oi oi oi oi oi #testando1 #testando2 #testando22222 #testando2
67	2022-10-21 15:38:14.557289	15	https://meusitemaneirissimo.com.br	oi oi oi oi oi #testando1 #testando2 #testando22222 #testando2
68	2022-10-21 15:38:29.486715	15	https://meusitemaneirissimo.com.br	oi oi oi oi oi #testando1 #testando2 #testando22222 #testando2
69	2022-10-21 15:38:29.642568	15	https://meusitemaneirissimo.com.br	oi oi oi oi oi #testando1 #testando2 #testando22222 #testando2
72	2022-10-21 15:52:57.764993	15	https://meusitemaneirissimo.com.br	agora vaiiiii
73	2022-10-21 16:35:46.966612	69	https://www.driven.com.br/	Bora ficar rico!
74	2022-10-21 16:35:47.115705	69	https://www.driven.com.br/	Bora ficar rico!
75	2022-10-21 17:32:22.856411	73	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMoGa30hJlJI5wR44CeQzuUVxVSWCCpBtL8Q&usqp=CAU	iomagem mt topzera #top #topzera
1	2022-10-20 01:56:40.765643	67	https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.carrosdub.com.br%2Ffotos%2F2019%2F22-mar-19%2Fsaveiro-rebaixada-aro17-01.jpg&f=1&nofb=1&ipt=53fc1937dd1cd1403b5dbedb1957496f4d9c1a5b3bd3da91b38a6f5a64c59b25&ipo=images	saveiro massa #saveiro #rebaixada
76	2022-10-22 08:34:56.71696	70	https://www.omelete.com.br/mangas-animes/chainsaw-man-corte-2-ep	dica do otaquinho
83	2022-10-23 20:09:37.16097	73	http://pm1.narvii.com/7630/4513bdff138e115b64901c97243afb192115d14br1-540-540v2_uhq.jpg	opa #vortei
84	2022-10-23 20:23:29.791021	73	http://pm1.narvii.com/7630/4513bdff138e115b64901c97243afb192115d14br1-540-540v2_uhq.jpg	#teste\n
89	2022-10-23 21:56:49.667697	74	https://www.youtube.com/watch?v=EztZqbq2hEI	sabeiro #rebaixada
95	2022-10-23 23:26:18.813188	70	https://animefire.net/animes/fumetsu-no-anata-e-todos-os-episodios	#otaku
97	2022-10-23 23:26:51.738087	70	https://animefire.net/animes/fumetsu-no-anata-e-todos-os-episodios	#otaku
100	2022-10-23 23:28:49.637892	70	https://animefire.net/animes/fumetsu-no-anata-e-todos-os-episodios	#otaku\n
101	2022-10-23 23:29:07.736498	70	https://animefire.net/animes/fumetsu-no-anata-e-todos-os-episodios	#otaku
102	2022-10-23 23:29:48.815171	70	https://animefire.net/animes/fumetsu-no-anata-e-todos-os-episodios	#otaku
103	2022-10-23 23:34:15.393406	73	https://pbs.twimg.com/media/D_nex0hWkAARqZo.jpg	#otaku2
104	2022-10-23 23:34:33.157975	73	https://pbs.twimg.com/media/D_nex0hWkAARqZo.jpg	#otaku2
105	2022-10-23 23:34:47.698062	73	https://pbs.twimg.com/media/D_nex0hWkAARqZo.jpg	#otaku2
107	2022-10-24 00:24:48.920919	74	https://www.youtube.com/watch?v=1lDee3QTGok	sabeiro 
108	2022-10-24 00:25:39.944393	74	https://www.youtube.com/watch?v=1lDee3QTGok	sabeiro
109	2022-10-24 00:38:12.432067	73	https://pbs.twimg.com/media/D_nex0hWkAARqZo.jpg	#otaku2 testando #otaku testando testando
111	2022-10-24 14:47:33.998487	69	https://www.driven.com.br/	Testando
113	2022-10-24 14:53:15.189078	69	https://www.npmjs.com/package/react-tooltip	Teste!
110	2022-10-24 14:38:55.710247	74	https://www.youtube.com/watch?v=EztZqbq2hEI	sabeiro ediatada novamente asdasdsad
115	2022-10-24 19:13:47.4959	74	https://www.youtube.com/watch?v=EztZqbq2hEI	saveiro #massa\n
112	2022-10-24 14:50:43.16505	70	https://www.w3schools.com/jsref/jsref_trim_string.asp#:~:text=The%20trim()%20method%20removes,not%20change%20the%20original%20string.	calopsitas calvas são tudo de bom
116	2022-10-24 19:14:14.373738	74	https://www.youtube.com/watch?v=EztZqbq2hEI	saveiro #massa #editada
\.


--
-- Data for Name: postsHashtags; Type: TABLE DATA; Schema: public; Owner: skgowwxrypwfbv
--

COPY public."postsHashtags" (id, "postId", "hashtagId", "createdAt") FROM stdin;
1	43	1	2022-10-20 23:26:17.135829
2	43	1	2022-10-20 23:26:17.445336
3	43	3	2022-10-20 23:26:17.750593
4	45	1	2022-10-20 23:27:31.842578
5	45	1	2022-10-20 23:27:32.165336
6	45	3	2022-10-20 23:27:32.496663
7	48	1	2022-10-20 23:33:14.494021
8	48	1	2022-10-20 23:33:14.800528
9	48	3	2022-10-20 23:33:15.109033
10	49	1	2022-10-21 00:16:37.122067
11	49	1	2022-10-21 00:16:37.442053
12	49	3	2022-10-21 00:16:37.767298
13	50	1	2022-10-21 00:18:09.764893
14	50	1	2022-10-21 00:18:10.057168
15	50	3	2022-10-21 00:18:10.35202
16	50	5	2022-10-21 00:18:10.644523
17	50	6	2022-10-21 00:18:10.944778
18	51	1	2022-10-21 00:33:06.767433
19	51	1	2022-10-21 00:33:07.070036
20	51	3	2022-10-21 00:33:07.392914
21	51	5	2022-10-21 00:33:07.690661
22	51	6	2022-10-21 00:33:07.988906
23	51	7	2022-10-21 00:33:08.294426
24	51	12	2022-10-21 00:33:08.59779
25	51	8	2022-10-21 00:33:08.896078
26	51	9	2022-10-21 00:33:09.19948
27	51	13	2022-10-21 00:33:09.510393
28	51	14	2022-10-21 00:33:09.81693
29	51	10	2022-10-21 00:33:10.122528
30	51	15	2022-10-21 00:33:10.423306
31	51	11	2022-10-21 00:33:10.75981
32	51	16	2022-10-21 00:33:11.061045
33	51	17	2022-10-21 00:33:11.36091
34	52	1	2022-10-21 00:33:16.021916
35	52	1	2022-10-21 00:33:16.325152
36	52	3	2022-10-21 00:33:16.62903
37	52	5	2022-10-21 00:33:16.93192
38	52	6	2022-10-21 00:33:17.237893
39	52	7	2022-10-21 00:33:17.541164
40	52	12	2022-10-21 00:33:17.84194
41	52	8	2022-10-21 00:33:18.145038
42	52	9	2022-10-21 00:33:18.443312
43	52	13	2022-10-21 00:33:18.740908
44	52	14	2022-10-21 00:33:19.063472
45	52	10	2022-10-21 00:33:19.360224
46	52	15	2022-10-21 00:33:19.663438
47	52	11	2022-10-21 00:33:19.968912
48	52	16	2022-10-21 00:33:20.267303
49	52	17	2022-10-21 00:33:20.567306
50	53	1	2022-10-21 00:33:37.479786
51	53	1	2022-10-21 00:33:37.785784
52	53	3	2022-10-21 00:33:38.092386
53	53	5	2022-10-21 00:33:38.392823
54	53	6	2022-10-21 00:33:38.696031
55	53	7	2022-10-21 00:33:39.027928
56	53	12	2022-10-21 00:33:39.32778
57	53	8	2022-10-21 00:33:39.631308
58	53	9	2022-10-21 00:33:39.93403
59	53	13	2022-10-21 00:33:40.234528
60	53	14	2022-10-21 00:33:40.551781
61	53	10	2022-10-21 00:33:40.855666
62	53	15	2022-10-21 00:33:41.184801
63	53	11	2022-10-21 00:33:41.487912
64	53	16	2022-10-21 00:33:41.785022
65	53	17	2022-10-21 00:33:42.08854
66	53	18	2022-10-21 00:33:42.422404
67	67	19	2022-10-21 15:38:14.869461
68	67	20	2022-10-21 15:38:15.16117
69	67	21	2022-10-21 15:38:15.456174
70	67	20	2022-10-21 15:38:15.757285
71	69	19	2022-10-21 15:38:29.954198
72	69	20	2022-10-21 15:38:30.277606
73	69	21	2022-10-21 15:38:30.589724
74	69	20	2022-10-21 15:38:30.897447
75	75	22	2022-10-21 17:32:23.204386
76	75	23	2022-10-21 17:32:23.510684
77	1	24	2022-10-21 18:38:45.163623
78	1	25	2022-10-21 18:38:45.453535
82	83	29	2022-10-23 20:09:37.478094
83	84	30	2022-10-23 20:23:30.07989
84	89	25	2022-10-23 21:56:49.965198
85	2	24	2022-10-23 22:48:23.58045
86	2	25	2022-10-23 22:48:23.877582
93	95	34	2022-10-23 23:26:19.103177
95	97	34	2022-10-23 23:26:52.032563
98	100	35	2022-10-23 23:28:49.933883
99	101	34	2022-10-23 23:29:08.038491
100	102	34	2022-10-23 23:29:49.118497
101	103	36	2022-10-23 23:34:15.712589
102	104	36	2022-10-23 23:34:33.472454
103	105	36	2022-10-23 23:34:48.012822
105	109	36	2022-10-24 00:38:12.749321
106	109	34	2022-10-24 00:38:13.080432
107	112	37	2022-10-24 14:50:43.451042
108	115	38	2022-10-24 19:13:47.796468
109	116	26	2022-10-24 19:14:14.673469
111	116	26	2022-10-24 19:46:43.246012
112	116	40	2022-10-24 19:46:43.542663
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: skgowwxrypwfbv
--

COPY public.sessions (id, "userId", "createdAt", token, "closedAt") FROM stdin;
7	69	2022-10-21 12:19:11.966226	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjY5LCJpYXQiOjE2NjYzNjYyNDh9.JtQDjoH8Y3VPnXnb50VMrsagXQrcLXrzpygutDWonOU	\N
9	71	2022-10-21 16:22:41.112355	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcxLCJpYXQiOjE2NjYzNjkzNjB9.zz8FhqRDmGlaGciGVdsq2h6waW8ofOVT18b0Niwr3ec	\N
1	15	2022-10-20 15:37:35.959956	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjE1LCJpYXQiOjE2NjYyODI5MjZ9.dAFHaPIvq1Q0lPHlIOrBEtiygLPtFyk7HeuwuIvVqBQ	2022-10-20 16:23:53.052296
20	70	2022-10-22 14:41:59.034619	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0NDk3MTh9.4AODas3PYWO0Wqmj4GF0sVIlMcnPTW4aqaxoX-EVvqA	2022-10-22 16:38:52.547465
2	15	2022-10-20 16:24:16.680688	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjE1LCJpYXQiOjE2NjYyODMyNDZ9.zjqipG1sejaghvF5PCIsOQ2AnY5AYRBlU4nVzDLwRk4	\N
22	70	2022-10-22 16:39:06.80296	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0NTY3NDZ9.bgwgZexz7-REmuMPYX7GqPXODALoUMWpTdg3txnhZKU	2022-10-22 16:48:34.827272
3	26	2022-10-20 16:44:51.769544	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjI2LCJpYXQiOjE2NjYyODg2MDR9.ZDv_20jzOJyyfg4V65RGcI7n0yUNAqgYHtIaGi0fiQg	2022-10-20 18:55:13.229686
4	65	2022-10-20 21:55:15.187054	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjY1LCJpYXQiOjE2NjYzMDI5MTR9.USdg44zzlyF50cH0KBWxSbj5xjNMl9B2I-qf3nfM1kQ	2022-10-20 21:55:57.36982
5	67	2022-10-20 23:19:10.513681	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjY3LCJpYXQiOjE2NjYzMDc5NTB9.BF5n8hTm-vW1xVj1GT8Lmu0m41jMtIDWm8vE0rNQq2c	\N
27	76	2022-10-24 20:05:46.438152	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjc2LCJpYXQiOjE2NjY2NDE5NDZ9.lercFYZrd1O11MtwT5Zec2crcrEjtFpM-6d8Kiqq1Wo	\N
23	70	2022-10-22 16:52:03.347643	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0NTc1MjN9.wq1AGGaMv7_5noIMoUo1431-8GKd8vJa8y3WN6SKecs	2022-10-22 16:52:24.316165
8	70	2022-10-21 14:40:06.955665	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0MzEwMjV9.shdgEe-Vry3pfIIZQkew4JVKLOtKmKqB6hI3EquS3xg	2022-10-22 09:33:44.946076
11	70	2022-10-22 09:34:42.927907	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0MzEyODJ9._bARUqwAvVJtdcsdvLwrL-hg-SfLGw1utAZfbHyGpB8	2022-10-22 09:34:55.55446
6	68	2022-10-21 00:45:18.050228	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjY4LCJpYXQiOjE2NjYzMTUyMDV9.MAXGFY5kJ_v3OEoi-YQ2u0ELURmVlVD8MAuOhsnnFVA	\N
12	70	2022-10-22 09:44:08.067136	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0MzE4NDd9.gi9XvMDa3b2gsH2IRiM9eRWZ35hYXCNZCAg7klpmHuA	2022-10-22 09:44:18.404133
13	70	2022-10-22 09:53:05.026862	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0MzIzODR9.Ku4MkJCOcwlx9wzMtGtsGjBxeaNUrQoH2AiYML3ZeHE	2022-10-22 09:53:31.645445
14	70	2022-10-22 10:04:42.538731	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0MzMwODJ9.GxAs2iWOOHAAoDnzBITxLt_VKKAKkhSNQcev6G7-lO4	2022-10-22 12:34:41.872864
15	70	2022-10-22 12:35:03.537446	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0NDIxMDN9.ds99T90oUgn9SSKQu65vrQUMUkAId7whNCMs9nQFvwk	2022-10-22 12:36:58.025839
16	70	2022-10-22 12:45:54.248474	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0NDQ1Njh9.XZ5mjZuhnqousYU6L4E55GoZY94s8KlSzUApQuFnR88	2022-10-22 13:16:45.331067
24	70	2022-10-23 17:20:44.578216	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY1NDYwMTh9.gksF_VhJjVsSFQCrHfLzJ-HylpuFpCcVLHAdLixLm3c	2022-10-23 17:31:34.571493
17	70	2022-10-22 13:19:37.800197	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0NDQ3Nzd9.CbgJF6lHitSsOfig99nkGXp8sWcLxPEWiZmDK_MXAP4	2022-10-22 13:19:43.098146
18	70	2022-10-22 13:27:00.883569	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0NDUyMjB9.OexL7Twx0WOgCEcZHhuylxixeqvp4J8GCIyCE7cHSt0	2022-10-22 13:31:14.017432
19	70	2022-10-22 13:32:44.494032	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0NDU1NjR9.ovYDPNpyET-NJML8KaN1zZ55PKAygij4W1opxulIOxc	2022-10-22 13:32:48.521047
10	73	2022-10-21 17:26:29.99406	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjczLCJpYXQiOjE2NjY1NzY1MjJ9.-k8-cUtfv8SJFmiaoBLSJuneiSidT7-StBLJS0j4M_Q	\N
25	70	2022-10-23 17:34:56.477901	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY1NjcxODZ9.xtFyes6mx7lHNqohKSN0WvyV27hnG_zq13WcehRQhHM	2022-10-24 17:41:27.941511
21	74	2022-10-22 15:04:36.680803	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjc0LCJpYXQiOjE2NjY2NDA5NDl9.seKow9qdFTG6NOvV3K3pnoFpoqEG3gqVDlTURdpnsTE	\N
26	70	2022-10-24 17:45:48.38568	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY2NDA4OTd9.GEjNylCZ9sjJvP5ylZ5F9T9IR47xaytRy54PyHH6cr4	2022-10-24 20:03:04.701851
\.


--
-- Data for Name: userPicture; Type: TABLE DATA; Schema: public; Owner: skgowwxrypwfbv
--

COPY public."userPicture" (id, "userId", url, "createdAt") FROM stdin;
4	58	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiYKoOF_oHcHuC6Gs_BjWH__wM7UgW3MGvh41Iec_jvQ&s	2022-10-20 21:37:05.908563
5	59	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiYKoOF_oHcHuC6Gs_BjWH__wM7UgW3MGvh41Iec_jvQ&s	2022-10-20 21:37:27.205534
6	60	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiYKoOF_oHcHuC6Gs_BjWH__wM7UgW3MGvh41Iec_jvQ&s	2022-10-20 21:38:47.199605
7	61	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiYKoOF_oHcHuC6Gs_BjWH__wM7UgW3MGvh41Iec_jvQ&s	2022-10-20 21:42:03.714292
8	62	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiYKoOF_oHcHuC6Gs_BjWH__wM7UgW3MGvh41Iec_jvQ&s	2022-10-20 21:42:48.131254
9	63	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiYKoOF_oHcHuC6Gs_BjWH__wM7UgW3MGvh41Iec_jvQ&s	2022-10-20 21:47:33.052354
10	64	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiYKoOF_oHcHuC6Gs_BjWH__wM7UgW3MGvh41Iec_jvQ&s	2022-10-20 21:49:10.728883
11	65	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiYKoOF_oHcHuC6Gs_BjWH__wM7UgW3MGvh41Iec_jvQ&s	2022-10-20 21:54:48.901286
12	66	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiYKoOF_oHcHuC6Gs_BjWH__wM7UgW3MGvh41Iec_jvQ&s	2022-10-20 21:55:36.743872
13	68	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiYKoOF_oHcHuC6Gs_BjWH__wM7UgW3MGvh41Iec_jvQ&s	2022-10-21 00:44:22.448916
14	69	https://i.pinimg.com/originals/90/6e/45/906e45ea50f1cb57739b2759322d3d35.jpg	2022-10-21 12:18:40.561577
15	70	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiYKoOF_oHcHuC6Gs_BjWH__wM7UgW3MGvh41Iec_jvQ&s	2022-10-21 14:38:36.75275
16	71	data:image/jpeg;base64,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	2022-10-21 16:22:26.215341
17	72	https://static.remove.bg/remove-bg-web/c05ac62d076574fad1fbc81404cd6083e9a4152b/assets/start-1abfb4fe2980eabfbbaaa4365a0692539f7cd2725f324f904565a9a744f8e214.jpg	2022-10-21 17:21:20.532717
18	73	https://i.pinimg.com/736x/ff/fd/24/fffd24bad642469377d2ba71f89661c4.jpg	2022-10-21 17:22:32.753827
19	74	https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.VbItU9VILWoRrpfCCbvBJwHaFJ%26pid%3DApi&f=1&ipt=1485f617cc206a32618aeee4f3340db954026d9ed0649bc3c099b4196602e66e&ipo=images	2022-10-22 15:04:21.548559
20	75	https://www.google.com/imgres?imgurl=https%3A%2F%2Fontheworldmap.com%2Fnew-zealand%2Fcity%2Fwellington%2Fwellington-location-on-the-new-zealand-map-min.jpg&imgrefurl=https%3A%2F%2Fontheworldmap.com%2Fnew-zealand%2Fcity%2Fwellington%2F&tbnid=3yCu3BOoYqUB8M&vet=12ahUKEwj_t6rSh_n6AhVyNrkGHQphDBsQMygTegUIARDoAQ..i&docid=1izo7bJFJemobM&w=409&h=595&q=wellington%20mapa&ved=2ahUKEwj_t6rSh_n6AhVyNrkGHQphDBsQMygTegUIARDoAQ	2022-10-24 14:19:40.503129
21	76	data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUVEhgSFBYYGRgZHB4ZGBgYGhgYGRoZGBgaGRgYGRgcIy4lHB4rHxkYJzgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QHhISHjQkJSs0NDY0NDQ0NDQ0NDQxNDQ0NDQ0NDQ0NDQxNDE0NDQ0NDE0NDE0NDQ0NDQ0NDQ0NDU0NP/AABEIALUBFwMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAEAAIDBQYHAQj/xAA+EAACAQIDBAcFBgYCAwEBAAABAgADEQQhMQUSQVEGIjJhcYGhEzORscEjQlJictEHFIKS4fCi8RWywkMk/8QAGgEAAwEBAQEAAAAAAAAAAAAAAAECAwQFBv/EACQRAQEAAgICAgIDAQEAAAAAAAABAhEhMQMSBEEiUROxwTIF/9oADAMBAAIRAxEAPwB0UUUoFHAxsfSpljYeNzkABqSeAk5ZTGbvQk2loIWNh4knIADUk8BJ3qi24nZ4nix5nkOQkFSqANxOzxOhcjieQ5D6yw2Jsl8Q+WSL235flXm3y+eeMuV9suvqf7VW64j3ZuCaq1hko7TfQd81uDAQBFFgP9z75Dh6CoWRBZQbAeQ+Mnp6zRKwWrG1X3haNE9gSsfY9MkkqLme4bZKU23kFjLGeGLUNIlWwjjiBICJ5aMkjVYkqgSK0VoAQtcQHaO3sNRNqtVEP4Sw3vJBn6TAdLulVZ8Q2Dwr7iplUqr2i33lU/dA0uMyfWowGDRcwLsdXbN2PEknORl5Ji0w8dydGTpdhSbb7+Ps6lvjuy5wuPpuN5HVhzUg27jyPcZzGlhTe98pZ4RXRw6NutwNsj3Ov3l7vMEGZ4+aW8tMvBZNx0T2y841qotrKrAYsVFNxuutg6a2J0IPFTwPyIIBRE3jCpXcbsjwZ3Qb84wiKMnuPYFY09kRtbsxx7IipxXbR4QnD8PAQbaHCE4bh4CR9q+lnhdIDi/fJDKMBxHvUlEPMe3ZjIhoY4VNpjKTxuHGUfUgRrRTxooByeKKPpUyx3Rr6AcSTwEdsk3Tk2VKmWO6P2AA1JPASSrUAG4nZ+82hcj5LyHnFVqADcTT7zcXI+S8h5z3DYYueQGp+g75lMbnfbLr6n+1VvrxHmGw5c9w1P0HfOlbIpKlFVUWAGnzPjMZRQBAB3/ObbAe7HhNEK777/q+gklLWRjtv+r6CSUtYAaIohEYB5FFFAPJ5PZ4YG8jK9TdRn/Cpb4C8kmd6S7fpU1qYdt7eNMm4F1zHZyzvbu4iFuhJb05rhaJ69Q5lyTfnc3PqZbbPpEkQfAOj4ZdbjeGfdofDSeUNt0EIV3tzYAkA99tPOc/kxtvDq8dmM5aujhdIR7Ai2UZsxldRUR1dTpY3hu82hFplMGtyEYdN2olQc/Zv3q46t+8OFt+pucuTKfDsS6JzZT4bh3v/mXBnZj04s/+jDPI4zyUhHW7MceyJ5W7M9bsiKmr9ocITh+HgILtDhCsPw8vlI+1LClAsR71IbSMDr+9WUQ2NByMcY06GBVJhT1ZLUMhwnZk7jKMkTHKKeNpFEHKI9ahClRode+2gvy7oyH7M2a1Uk6Ivab/AOV5n5R2S9nEOEwhcngo1P0HfLLDKApA0v8ASGOgQFVFgBkIJSbI+P0jKnBup8fnNrgD9mPCYlT1Pj85t8B7seEQVydt/wBX0ElpayFO2/6voJNS1gBgiiEUYeTyezyAKeT2eQBTnnTKkDi9zesX3LA94Kn/ANR6zocoekewf5grUVwjIM7gneCnfUZHLO/93dIyx3F4ZetYI4QBzQGgyzvn4xUthFTd3cgg3UNZc72O7plfS3DzhdPEAYhzbs9o633Ra/wHpHY/ba2sALXt3gXzNhMLcpbp04zGybedG0KO6DsqLi2XDj/vGAY/DV6lUsyOwXMGlUKspz0Fjc6Zcb6iaHowqtvVAVIa6jMWt/vzljTdGqFTkynja5GlwRqJONsu1ZSXg/o/XcCiHG81mTeNwWFgQxB0IXevnlnrNSZW7NoDeL6hck7rjrft5yxM6sd65cuet8GmeT0xspmbW0jm7Ija3Zjm7IhTVu0NRC8Pw8vlBcfwhWHOnl8pnO1D6UBre9WHUoFiPepKIdI2ORkkifjAk2E7MneD4Y9WENAIX0iifSewDNp0fw/4W/ub95Y1aKpTCIAFAsAI9Isb2YGoK+rQFFyPjDnObQJdD4/SOEauS/H5zcYAfZjwmGv1fj85u9n+7HhGStp9p/1fQSalrIU7b/q+ghFGnxvACRFHJTvxnr07cYAyeSE1jyiSrc6QCa88jymVybDmdJV4rbuEpht/E0gV1AdWbLhurck91oBYiZraPS/DpV/l0u5Lezd1ICI5BO5vffeykkDIWzINgcr0o6bvVvRwu8lM5NUOTvfUL+Be/U93ELaGywmCwxUW3XDt+p6b3PqB5CLK6m1YzdRYTGg1X3vv7w46g3X/AK7p7h8FSd2R3KluzvKWQknQkZrxzP0mfasadQFtAwa/0mrw+F3mVkORA0zz7zMcuOW+PPFWGH2KtKm25US2ZCpULFyMjuqFvnaR4PDu1RHPV3Tbd3t7Vc1vbmR/bLGhTcZM29kbX4c+F+XwlrsTZRdxVOSA5fmI+n+IpPbo8spivMJS3KapyGfidfWSkyX2HfEcP3zo4cvKAzyJ8okF4A2t2Y5uyJHXbK0e3ZEArtoaCE4bh4CDbQ4QrD8PASPtf0sKUCxHvUhtKA4j3qSiWEhcayWRONYglw2kntIMMOrCCYEY6ZRSSKLQVCaz3G9mNp6x2O7EZs7UObQUHI+P0hNQ5tBBofH6RwjPuj/eM3mB7A8Jhb9Uf7xm4wJ6g8IwApdp/wBX0Enpaweh2n/V9BJ6WsCFCQ4vFJTptUdrIgux7h8zwtJhMr/EV7YIi9rsPOwJ/wB8IBnto/xJcsVw9JAAe1UuzEc91SAPiZUYnpbjqn/7bgPBFVP+Vt71mVQ53llQTK3+21jkM+tVqVM6ju5/O7N8zImS5C5/E6DP9oQFkTtusGt1QCDbUXsb246R6LZhpZzo74L2mFNO2e4GQd6AEDzAI85gwRYEEG4ytobjLPlOjbKrXWm/NEPxURZTcOXV2wm0NnBqYNtJNshK6oNxlYKdHvcd4I/aarauBC1GW3UqDeXz7S+R+YlfgsAUJIJsdRrpxvOS5WcV1amXMGYVHKXdhbju30GZz4iVHScPSqlqTujKbHcYoT1Ra9tdYYMeHxlHBpndt9/0IN4L5sE8pB0uF8RUXvA/4JN/BzLWHl4siPA9NMUlg7K4/OBe36lt63mjwPTii+VVXQ8x119M/Sc73Ix2ymukOzYTG06q79N1cc1N7eI1HnCJyfoVWIxKWNuuAe8MGBE6xFoqZW7MceyIyt2Y89kRBXbR4QnDcPAQbaHCE4bh4CT9qWNOAYn3qQ+nK/Fe9TxjJYxjHWPkbjIxU0tFurJTIaB6skYwJIDFGloobCopHOe7QbqRlM5xY89SClIwyaAB8iO/6Q9FJDWF57sjZ3tHYuMgdOZtHCqruSoABPhnxm7wHux4R1HAIosFEdXqBFMZKzD9p/1fSEUtYFs+rvhn5sYbS1gQmc0/ijtE+0TDqcgoZhyJJ+lp0sThfSbFe2x1ape4L2HgoCgekYisVP3/AMyywv0B9SPpBvZ3GWo0/aOwr2qAflt8Cf3jgo8rIQnXAOYKkgHmCL+OvpCSsjcWdD3kfFT9bSg8dch3Gb7Y+dCjb8AHwy+kxDpOjdFUBwdM8bMDzydpNCbF4Z3AVgAFzVhm1/kBrlMv0kxD0uogJZh1RbMk5W9JuSd0fvATs4VXWs4AABCc91rXPIE2HlfnMssJkvHO4szjuj5oYZxSN6rJd6qmzsbXsrjNU7gRKbbL79RmJJbLPjfcW/qJ0XaVlpkADSw8hlOWK7HfDnrBiD5aelprhJEW75qJdPCAYhrGG0218f3lftFrER0Rb9Gsqgb8LKfgf+52C/Gck2XZKYJIG8dT3d3HWdQ2VX36KNe+Vie9cj8oWcF9iK3Zj27Ikdbsx7dkSTV+0eEJw3DwEG2jwhGF4eAkfalikr8T71PGH05X4n3qeMolnIHqWuJPK3GG28ZNODKT5CSVWzEr8I53BJsVVs6DneAGOcp5Iqj5T2IlbTOc9x56sIrOiGxtInxCHlHo9iNm4MKmYzOsKVFTSDLtBALXjKmNU8ZZCf5oXtANoVN4GQvUBN7xtVxunwi2ekexPd+csaesr9i+785YU9Y0g+ke1hhsOapF7sqeG+d3ePcBc+U4hh2u1zmefPv8Z13p+qtgXRjYll3fEXPyvORYenpe48IQ50tBTBX6iVm+RWW/L6y0TeC8/C3ylDvk4gAi2RlUmnGYEHxJtun86+rW+smwzcJDtAfZk8ut/bn9JSRbCb/o2+7hKYZTbrEHxdjMHe4nR+jyj+UpA/g+ZMnLo4L3A4ya45Seib00t+EfIQVl3H7jCMK49mp7h/iSaHFJdTfScmFYPUrMuhdrHuBsD6Tp23ah9mUGRYG/hx/acqRN13Uc44HpYDK/3rehgWKTeqALmeQhYpBrg/iGmV8jCaVhko+H78Ywe9NroBkAvmLk8eE6L0WYfywA0UkA88gb/Emc1xLj2hBJyAFuGgPzM2XRDaNm9kxNm7IJNr+fhHeg1G0KjJTZ0QuyglUBALEDJQTkCe+e4PGpWpLUQmxyIIKsrDVHU5qw4gx9bSDKB7d7ZfZoX/MS1QIT3gIwvyI5CQDdo8IRhuHgINtDhCcNw8BJMekAxPvk8Ycsr8Sftk8YwtZV489qWkpNqg7zHwipwRgvdrPcf7xPONwHYWP2h7yn5/KAE1DlPJ5VOUURKnaTXeCWhWO7cgEqnDLTy0knhiCO5japO6fCSSOt2T4GBjej/uRKXpD04p4OoENJ33iwDKwUXQhXGY4MSPKXewPcics/ipgzTxi1N8kOm8q2sE3TZgLa3JJvrn3R1MW23umgxuE3UpGn1yl2YMSAgLkWGXaUf1HlKDA1LCwAv6yrA3VRPwAKc79Y9Z/+RPlaFYYm944di2FQngZRYsD+YVhrY3HmJdANbXI/GUmNb7e35R6k/tKqVzhqmkKxC7yEcwfWVeGqWGcsw91lQqdh3vTU81B9BOodHj//ACUf0L6i85XhG+ztyLD4Mbelp1XZKbtCkOSIP+Ak5dGIxw6l+WckoqBTXuUD4CRY43pv+k/KPqHqW7hJCq2k91Zzx08OE5hVYio/ebzpu0c0InN9qJu1SO4H/k0cCBRkCeZ9P+4XRN2EEHAefxP+IsVWKU2Ydq3V8SMpYDYPFB6rs4AG/dTfUEmw8gBLzZld3rhkBVEIbetmxByAEzGzUAFgwLAAnIkC/LMfGXGF2q9G+8h3TqycO/dIv8LxS/sV2F2uoI0OfxzlPhts0va10ZusKgQAAt1Up082sOqN9nEpqPS2m6UqaElQi+0cXvvG4RF/M1vpztDsTDNTDs12qOzOd7Xedi2Y5De87d85/J5PXiNvH4vabrW7Q0EIw3DwEqqZC0wGdmc5kXJtnwHAHOWuHGngJWGUyRljcRyytxXvqfiZYrK3FH7an4n5S0LiUm1G6zjwl1M9td7VCPD5RGOwXu1jtoe8TzjMCb01M92tXRN2o5sBfx8BzMWVkm6JzdCKxyimHx+3atRyVZkXRVBIy5m2pnk83P8A9HxzLjbpnxr+2jxp65kMExOP36gCZg8RmI6s7KJ6VrnkEXnhlS+0WHCD/wDlnv2TFs9L0mQ1m6p8IBgcWz1AhBF5pTstChvy5xkg6P8AuRMD/FemDicJcXBD736VdC3oTOhbHTdplRoDaYv+KdO/8u27c/aL3HeNPdXzNj/TKTGIrOrsfZpZbkgHrt5nS8LoobXLbvdZbD4rBMPQdiVXO3aI0HcWHyGkKSgFbdDbz8FUZ+V84RR9aoy2DEZ6GxTL1U/ESoxa2rE3vcA+A0A9Jetg3RftKbqhIA30ZBcnK1xa8ztRbVXGep1+UdSOFSWOAqXFpUqtoTs1+uV844B9B7Bxya481B+d52HD5Kq8gB8BOOYUb1c0/wAe5b+4qfmJ2dgDFlQGx4bcKj73V+PHyFz5SVnJ4R33gOGZ+Q+pg+MxQGSxbGgmPbLdGvGc86Ri1YD8o/8AZpvqw3ULud1fU9wE5htXFM+JdiN0ZBV5AX174Qzy4/3u/wBMrds4gsUppqcyeQEmLGVGJY77nwUeGp+UdokEpUKXVNT2mNie6/Lwj/5xgM3J8LDLjnK85KFHHM/t8pNRoltCBYXJOg+pi2qRpaKFqaVEte6m18mtYgHW1jYhtQQDnax12wtqvVBdxvVDkLqFAX7pIGWlvPunO8P7SnTLIx3GazEC671tLnNS2mXGa/YbMgUUyaiEC7aGnurYgk66Wy5Tm8ksb4WVqsM25c5lz2mOmfPv7v8AEu8ExsN7X/bSgwRJOWQNjbj6+U0VHh5R+HtHms6FC/MD1lZir+2p58Tw7pO7m+sCqG9ancnXnOhgvir/AIh5r/mZ7aj3qEMLHLvGmoMvXIFrMb3Ate97kXy8LnLlMzt+uFrMToLeqn62it12a0pYpKdAVHNlA8zyAHEzG7Y2s+IfeOSjsJyHM8z3wXHY96hAbJVyVeA7/EwYGeF8z5d8l9cev7d3h8Xr+V7SAzyeAxTzdOllKW07dlmXwNpbYXbtVt2mlQl3ZUXeOQLMFF/jMQbxCowzBIINwRqCMwRPrtR5O30Zhui6KgR3d3t1nJtc8bDQDumE2tXbD16lHtbjW3uYsCPOxh/RDpnjsTT9mtJGqIhbfZyFcrYDqAX3iTztM7XxTVftmuzP1mNvvHXLhHZxspeVhgdqMzA7pFpucO7vTvfhOfbJw9RmsiE8SbWA85s8LjnVChRyQPuqW+QhDqw2KCKeet5QdP1vRpm17VkXyfX0BHnL/YzfZ9bI3zByI8QZn/4jm2Cy7QqIVHE5lSQONt68pLna7RL4n2NMAUUD7iWIFR1RgjVCpu933SRe1ieJJLdlUsViQtSrVdKRsAlNvZqQL33aaWVRlrb4wbo/gWbEhr2ppZ3cGwCE2HxIHkG5Td4CoEdVdV3WuVKgAZ9oW4EWAtyA75l5MtcRr48fa7obozhaPtN1UQK28pKg3OZBDMbk3txPGO6T9EqYqCpRdgW1BG8uWnW1GXjJKQXDYkKvZa7L5m59TJNu7YQVDTd1RkNxyZGAZDYZ3sfnMZll9N7hj9sNtDDPRO662vcqRmrC+ZU/TWT7Kp5FzrNLtzALU2d7YEEoyurE5KrsFa1tQQV4agTO0WPs7Bl/5ftOnx32m65vJj63QrZK3x1DvcDlkGDf/M697ew0JPdb45TjmyVvi6W9ZteqL3JKm1rjnOj4dXVgR1er945WvpfnKqFqarPU3FystyT3kftJFwoXPU/WV5r2qB7hSFIZs91lJGVuYOd+HnJ2xqt2XHdqfOLQQ7SzuBmQMzwUd05RtOupxRVMwL9bgTfhz8Z0PaOKXcZN7Maix63eZzbHVftLBQMzc3uTke6M4kfUQR9lvUpVq6XYUmX2igZhHDWqeAKkHkDfQGOJYntf78JY9HekbYE1mFEVfaBRcvuBdzf4BSWvv92kVUzCPceVoThMVuHMXByPh3RuKxCVHaoKS09433EJCA8d1SDYd17crSAr4+h+sk17T6yGlRZXDsHZADvWpguoKsLEltwAC99M4Rga9TDK4qv7JkQN7NlLOxbRRY7t8vvWbTIjOZ2kBcXfdz1s2VtD1bzR4To/hKy777RoIxJJD7ym/E7rkAk8wbd3CFkvY3ptOhBqvRetWYsWfcUaKqoMwo8WzPdNtR4eAmc2K1Clhkp+3VlW5NRVZUYsb7wfNePM6S4o7Uw5sEr0mPIVEJ+F4bk4ibu3Yp1uYFUA9qnjD1qg9kqfC0C2lUSmhqubbuhubk8AtjrFc5OymNWuJxdOkhqOQoHG1r9w5nunN9s7RevVapbdX7q3GgyBOeZgmO2m9VizkkXJAYkgX5C9uUHD9wnlfK+T/J+ON4/t2eLxevN7SXM9vI97wnoM8/LV4jeJQYowGezHS3OIiJ4GivPrXktr/DLHumLQKLrch+5HFifJt0zb7Hp+xx+Kwmi73tUH5H6+XcCxH9M5p0IxRp4oVPuWIcnQX0v5zo+29ohKuD2mlmV1ag4BsGK7zKL+IqfARxNX+3doPQwNSqgzUZkagE2LeWs5Hhtu1FYulVwTqQxz8ec6ngum2BrA06hamTdStRbqeB6y3FvG0yPSb+H1PcfFYGqCubbgIZLa2Rhp4Z+UNbOKnDdKK6Xs97m5vnnPdpdInxCCnVtbPTvt+3rMfXWrSNnBHGNGMaTo2mwOIFMkpazG7A8eXzPxhwxwtuFbpwF80PDdJmRpbQIhK7QEm47VMrGmp7SZ3TfW4QllItcnkRy/aO2jisPiavtaqNTayr1kLiy8ypy1PCZ6njV5yZMfbQxTHR3P2mq1K9E6DoAMWoRusET2zC/MoBa/lH0ehtNRYYlz4YTEN62Er9ldIMTVqJhkquN4hRZ2FhfhY8p2jBYUIgUksQMyxJJ8SZrLEV8+4bCCrWSk2QYgE2vYFguh45zVt0HqpnSxrp3XdR6Pb0mm6fbHRQuNRQro6ByBbeUuLE94Ns+Rlgz3yEd5LphG2PtVGATFI+RsGsxtlcdZPDjIa3/lKZu9BGtxWwJ/tY/KdCr1gm78L+I/cSKrUDDMRaPbnGO2xiHXdq4RwRo6E3HkVsfjIqnR+zkumK/qp4Wlw/PXM2+Juh+s5/tqkRiGP4rHXLjCHsWNjpqVcfrxeET0RXntDZGGZ91vZZ88XUqHT8NOivzlKKZtrBQGSpkQCRcG/GGxy1tfYeFQXC0T4rjX9PaKIMtPDLqKPlhAfWtXMz1auzDMi+mpNxzzMiPLeHO8NjV/bV4OrQNQKhF/y4bAIAOJLWYgd801XcQdV6rZX6lYILf0KBOZnEAU1RTZmN3NjpbqKLeJJ7/CW2z8ZW3SiVKlrW6umoNmvrF7aFxt6dIwFJCntBvnMqQ7mpa3e+ksTgaZtdEPiimY/otXqA1KbsxzDqc7Wa4IB8QMuF5rsRj0ooalRrKNOZNslUcTIyyndEl6Mx2Bw1OmalVEVByUZk8FA1JmBx+KDjeVQibzbqi5sLLa556+s921td8S+85so7CA5KPq3MwKk9rg5g687jQjvzPxM8vz/J/k/HHiOrx+P15vYhCd0bn9VrXvc68bWt3es9u/f8ZBuDg48wwPnkfnHBR+Iev7TlbJiTbOIGRADmPWO3pnf3TiQGKNBimOls5h+jQY2NQ/2j95BX2ZTp3J3ntwJtf4CeRT6uvJgNsYbgKAqBh1BocwczxnWtsYNf8AxuKQZCmaeIp2Ft1jusyjuJDZ/nM9ih9w/oLRwNKvSVqlMElRmMm/uGcfgNlDDsxpu26wzU2OmmfnFFLnab0zvTrBqaIqaEXAt3Zic+GkUUznS6UV4ooyeCoY/wBsYooBZdGcc1PG0KgzIqqPG5sfnPqGmbgRRQvQZD+Jlcrgio+86gnuF2+aiSIOMUUqdJobHjqsfw6eWcIr0xnFFAlPtDsTn22c6n9I+bRRQXiGIzkO0MMDum9jFFFVRa4Xo8j0w5dwSAeru20voQZOejdIFRvOeeYzsPCKKCRSdHqCtugNYg36xztYj1AhOyKSLdAgtuE6nUG155FMs2mH20mDoILELbITKbW2i9Z95sgLhVGigfM98UU4fl2ySNvFPyoCKKKea3eiOBiiiqjxHCexSaDgYoopJv/Z	2022-10-24 20:05:30.248767
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: skgowwxrypwfbv
--

COPY public.users (id, name, password, email, "createdAt") FROM stdin;
6	maria	"123123	maria@email.com	2022-10-20 01:36:08.168069
8	lucas	lucasdosualdo@gmail.com	123	2022-10-20 01:54:41.643244
9	junin	123123	junin@email.com	2022-10-20 02:10:12.615359
10	pedrin	123123	pedrin@email.com	2022-10-20 02:12:12.814381
13	claudin	$2b$10$oNzz6j7MLawWmVe0PCfsruTMFBFMuV.qb6CBMS.vcHrmWRygHOHxW	claudin@email.com	2022-10-20 02:14:17.803035
14	claudin	$2b$10$lkWRv5g1xtStzm6Qr3zee.EB5IAYRop3qQh6JFV7ystccsI1SkLX.	clovin@email.com	2022-10-20 02:18:05.882783
15	cleitin	$2b$10$KYBeGpp.o9x8OecqSNgKD.GmmnXsdcaD6VNMDWM0e0C0dbsVuDLo2	cleitin@email.com	2022-10-20 14:02:10.090025
16	cleitin	$2b$10$8RA97al..jzX0iioRezLnOt7vNjLHhAVh4DSCmUjlb5b5ei7NZcq2	cleitintin@email.com	2022-10-20 16:33:50.96041
26	jorgin	$2b$10$B7kIFog85.vt8JYtuCWR/uBLiQ66CxwU3fYX8HQgL22Wq05JRNmOW	jorgin@email.com	2022-10-20 16:40:18.931395
34	stefany	$2b$10$w0H.KHvTUs2kyZYacqvGYOZAhMvCjLlx3UBZ8W499abLrT/dJEkC6	stefany@email.com	2022-10-20 21:03:38.228267
35	stefany	$2b$10$uEYFIASjh8faUQ2dw7TIm.UcfkOfaM2yEd7DL6ke3KvL8jfYktrUK	stefanyy@email.com	2022-10-20 21:04:36.167013
36	stefany	$2b$10$.PrF1sbBxTBW5IMZWnHnEOCXKBifxdDh.bv36qWp6jqOjJIT9gKj.	stefanyyy@email.com	2022-10-20 21:05:01.901634
37	stefany	$2b$10$MIGMS3cpH5VSUpkQw/FFkOATZ.0SLPZsntntNJafbU1A87lciQODS	stefanyyyy@email.com	2022-10-20 21:09:45.645917
38	stefany	$2b$10$OH8MS4pcgoQa6Y0Vz2Dhxub8sTXPJrlXXizNfPIak0KSHuWHmYmmS	stefanyyyuy@email.com	2022-10-20 21:10:31.237808
39	stefany	$2b$10$EyrzPUhnvXnJ1Vuvt8sLsuCnV4lnGxvMNSwgMjNkhR7SJmgCeA./2	stefanyyyuey@email.com	2022-10-20 21:11:10.272289
40	stefany	$2b$10$E6aXL/aJp3JWU0BRp//3.ucrby2bVa8DZXUniWvw/AYhL1rcbQNYC	stefanayyyuey@email.com	2022-10-20 21:11:37.888036
41	stefany	$2b$10$pYs00ZyXaN1qzjRlZAsZYOm78NvpLPXAqvdQSekkJ94OGCWq4pD0C	stefanayayyuey@email.com	2022-10-20 21:12:05.092281
42	stefany	$2b$10$d.KwwORg1HrlBMRwh5BekuM.RLw4uwbbVrRS/fbIzjT9ojP4y1pe6	stefaanayayyuey@email.com	2022-10-20 21:12:28.840207
43	stefany	$2b$10$WfQxJcqcCr9sfNAfS8.27.mjy/GzJYPisbZkhgmjc2odyG.CoMiBe	stefaanaayayyuey@email.com	2022-10-20 21:13:05.529216
44	stefany	$2b$10$rlrzQjRP37lvyXw3/2L0Y.x6sGMJzgos8XMo95TGC.KpcWQpjqtqy	stefaaanaayayyuey@email.com	2022-10-20 21:13:36.594249
45	stefany	$2b$10$3RhStRuRxv.x9YjPLDSfROrTHdofTeXxb8X2Sc/NDQ7e7RvcDCVUK	stefaaanaaayayyuey@email.com	2022-10-20 21:13:47.377631
46	stefany	$2b$10$sNuKqnjlhvZktMo5L3use.vha46NZZZtqrpyx5Qwv45GFYkUbvjy.	stefaaanaaaayayyuey@email.com	2022-10-20 21:14:21.550005
47	stefany	$2b$10$75xXY7xEHMy60uPRHenzhO6DEfnRTRk72Q6AoiV5nJT5PzbRV6MiC	stefaaaanaaaayayyuey@email.com	2022-10-20 21:14:43.521732
48	stefany	$2b$10$T5gQj4RHypgOH7x1MTvPmusn/V.gR/Jfc8cSLXWaj7Ydz7xinZXS.	stefaaaaanaaaayayyuey@email.com	2022-10-20 21:15:06.985319
49	stefany	$2b$10$vkxXHi97spLnc6pyw1N5JOWztfU4dVumR8Fv9JdFz.RLecglf0N8i	stefaaaaanaaaaaaayayyuey@email.com	2022-10-20 21:24:42.694991
50	stefany	$2b$10$zzUJg6pURjHXmqiibcfJ5Oh9eghYi2Gbv/y7bwOtv3T8C1O6sePQW	stefaaaaaanaaaaaaayayyuey@email.com	2022-10-20 21:26:47.416566
51	stefany	$2b$10$k3sHshvEP5gmR2SlDtPym.WdOfSPRoDC8eATk9SoRa8knNB9NNAHu	stefaaaaaanaaaaaaaayayyuey@email.com	2022-10-20 21:28:19.968877
52	stefany	$2b$10$LDjeigp.zziHSKhukcq6oOaCCY0HYYmoLqlYYnqytb5iLl7lqI2Ui	stefaaaaaaanaaaaaaaayayyuey@email.com	2022-10-20 21:29:13.29582
53	stefany	$2b$10$KG.RmlomgKGQ2v7K.lHO/eIdKYXyxXRrcZsj25WI5fWprwx7goi8C	stefaaaaaaanaaaaaaaaayayyuey@email.com	2022-10-20 21:29:51.261144
54	stefany	$2b$10$vREX2Dn479H4dUGm.i9y7.8HQ0yTcx15oCEGnPXOnQZcCb8OoC.u.	stefaaaaaaaanaaaaaaaaayayyuey@email.com	2022-10-20 21:34:50.544646
55	stefany	$2b$10$ov1jUgvN9H3te3kdUERxO.aWiTClMoNRBUILBRbvx6KKjXyylvSZq	stefaaaauey@email.com	2022-10-20 21:34:56.792638
56	stefany	$2b$10$TTiNDLVBpv695kvz7TfaqOmROUEfFs/gGHURE6RXLK4C5/ihCcvy.	stefaaaauaey@email.com	2022-10-20 21:35:22.568355
57	stefany	$2b$10$y0BMMvSlwlZxSWJ.I4TcseF3YzkF/yersHVcSVGWTJvCmA5wEPjJW	stefaaaauaaey@email.com	2022-10-20 21:36:26.681524
58	stefany	$2b$10$aa3GB6zUMFzABqriq74Epuow58CAYYAOO9WP4NH5DPIJpvjVMeVKK	steafaaaauaaey@email.com	2022-10-20 21:37:05.761089
59	stefany	$2b$10$6py4z6uH.wknPVAgMYiZS.Usb/A21.XMfW9an8i2Pbx.AfSM5o4Dy	steafaaaaauaaey@email.com	2022-10-20 21:37:27.049046
60	stefany	$2b$10$IqyRwnXIROKYUn8SYi0vE.HG4A/atsEh1qZKum5LfBX7dY4cdVoO.	steafaaaaaauaaey@email.com	2022-10-20 21:38:47.056253
61	stefany	$2b$10$qTceoT0qp8.1u1mKo9kBGOE3HFbhjClf8zH2wDj1sRxaLb/U0.exG	steafaaaaaaauaaey@email.com	2022-10-20 21:42:03.568234
62	stefany	$2b$10$EOu3tgMuHwNi2tKs9tKdzuJhLIX8DpbL1Ce6L7BCdvRXluODgTRJC	steafaaaaaaaauaaey@email.com	2022-10-20 21:42:47.98507
63	stefany	$2b$10$OGMZ0xDmfgJKMzclNGIL.uvCB7EiHfbTBVeSxCp/WXdI8L23wKh0K	steafaaaaaaaaauaaey@email.com	2022-10-20 21:47:32.900366
64	stefany	$2b$10$IClBf38zFEIRA1k28o3OGerGVv21hZYdhkI2tvZlT/a.oTJdBtXBC	steafaaaaaadaaauaaey@email.com	2022-10-20 21:49:10.57942
65	stefany	$2b$10$uuZlk2sWOSSIj.iewqRhced3O2Wbk4l9ezmQOZpSDhJgs9YfjjNEK	steaaafaaaaaadaaauaaey@email.com	2022-10-20 21:54:48.754287
66	stefany	$2b$10$cUHVEdUAGY/hdz/l7aEEwueipk7Ou4bhtzASzyHE6ZBzjjz7mWIdu	steafaaaaaaaaauaaey@emaail.com	2022-10-20 21:55:36.584841
67	saveiro rebaixada	$2b$10$35IygHo7wLj2LGnjpAMNvuxoZ9qlj39imDKHBJqh0VZ7r7AVNUzPi	saveiro_rebaixada@gmail.com	2022-10-20 23:18:23.671994
68	junin	$2b$10$eySf8i0KohJE7JRBf6/aAeULAukanPqpXmo3hj7RnldazUF3ONwIK	junin123@email.com	2022-10-21 00:44:22.300929
69	Calopsita Calva	$2b$10$rscoFEIaqE3kUKZ0hGqppe1zUVgEcuUvJLdifUsJHPeVtj2oIk1.G	calopsita@calva.com	2022-10-21 12:18:40.405576
70	wesley	$2b$10$bWzbuIB1l/kA1ypn/zLEdeyIJYUSHcZEIdyUyiri3BCwVo9le1vUi	wesley@email.com	2022-10-21 14:38:36.604769
71	julinha	$2b$10$74QQdyw.S44dbZT0LItGDOVC8RguF.nXbcyeVwBMjBltBvQKIH9/6	julia@email.com	2022-10-21 16:22:26.056375
72	mary	$2b$10$rHfwcx5mCaLoFYTHGVmw5.D2cHYRBz5i1VeRvh8LViuSx6nPXsyNW	maria2@email.com	2022-10-21 17:21:20.383213
73	lucas	$2b$10$VHhrL1MK2VQvC0/oHbMAse7r/1/EzzhCsyT1sQAuJPPUaJWnYuZdK	lucasdosualdo@gmail.com	2022-10-21 17:22:32.594675
74	saveiro_rebaixada	$2b$10$F7LPiFKZkCQNFvanvmaF5./lQQLtLtti6ySlKmXfO/hoTPDoiv9aG	saveiro_rebaixada1@gmail.com	2022-10-22 15:04:21.393443
75	wellinton	$2b$10$yTkyJs9gXEhjD6Sp5EX51eijBUT3AnaQ9Lte5cCS1nNBYaPvCjGsa	wel@email.com	2022-10-24 14:19:40.35563
76	usuario de teste	$2b$10$/oWhzTBxgzbtWUrLSAslAecE99.LGBx8auNqpXnGoHXZkvtrq6BXy	usuariodeteste@email.com	2022-10-24 20:05:30.089281
\.


--
-- Name: hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skgowwxrypwfbv
--

SELECT pg_catalog.setval('public.hashtags_id_seq', 40, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skgowwxrypwfbv
--

SELECT pg_catalog.setval('public.likes_id_seq', 121, true);


--
-- Name: postsHashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skgowwxrypwfbv
--

SELECT pg_catalog.setval('public."postsHashtags_id_seq"', 112, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skgowwxrypwfbv
--

SELECT pg_catalog.setval('public.posts_id_seq', 116, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skgowwxrypwfbv
--

SELECT pg_catalog.setval('public.sessions_id_seq', 27, true);


--
-- Name: userPicture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skgowwxrypwfbv
--

SELECT pg_catalog.setval('public."userPicture_id_seq"', 21, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skgowwxrypwfbv
--

SELECT pg_catalog.setval('public.users_id_seq', 76, true);


--
-- Name: hashtags hashtags_hashtag_key; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_hashtag_key UNIQUE (hashtag);


--
-- Name: hashtags hashtags_pkey; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pk; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pk PRIMARY KEY (id);


--
-- Name: postsHashtags postsHashtags_pkey; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public."postsHashtags"
    ADD CONSTRAINT "postsHashtags_pkey" PRIMARY KEY (id);


--
-- Name: posts posts_pk; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pk PRIMARY KEY (id);


--
-- Name: sessions sessions_pk; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pk PRIMARY KEY (id);


--
-- Name: userPicture userPicture_pk; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public."userPicture"
    ADD CONSTRAINT "userPicture_pk" PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: postsHashtags fk_postId; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public."postsHashtags"
    ADD CONSTRAINT "fk_postId" FOREIGN KEY ("postId") REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: likes fk_postId; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "fk_postId" FOREIGN KEY ("postId") REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: postsHashtags postsHashtags_fk0; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public."postsHashtags"
    ADD CONSTRAINT "postsHashtags_fk0" FOREIGN KEY ("postId") REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: postsHashtags postsHashtags_fk1; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public."postsHashtags"
    ADD CONSTRAINT "postsHashtags_fk1" FOREIGN KEY ("hashtagId") REFERENCES public.hashtags(id) ON DELETE CASCADE;


--
-- Name: postsHashtags postsHashtags_hashtagId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public."postsHashtags"
    ADD CONSTRAINT "postsHashtags_hashtagId_fkey" FOREIGN KEY ("hashtagId") REFERENCES public.hashtags(id);


--
-- Name: posts posts_fk0; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: userPicture userPicture_fk0; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public."userPicture"
    ADD CONSTRAINT "userPicture_fk0" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: SCHEMA heroku_ext; Type: ACL; Schema: -; Owner: u1sh767n7i1rat
--

GRANT USAGE ON SCHEMA heroku_ext TO skgowwxrypwfbv;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: skgowwxrypwfbv
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO skgowwxrypwfbv;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO skgowwxrypwfbv;


--
-- PostgreSQL database dump complete
--
