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
-- Name: comments; Type: TABLE; Schema: public; Owner: skgowwxrypwfbv
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    comment text NOT NULL,
    "postId" integer NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.comments OWNER TO skgowwxrypwfbv;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: skgowwxrypwfbv
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO skgowwxrypwfbv;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skgowwxrypwfbv
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: follows; Type: TABLE; Schema: public; Owner: skgowwxrypwfbv
--

CREATE TABLE public.follows (
    id integer NOT NULL,
    follower integer NOT NULL,
    followed integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.follows OWNER TO skgowwxrypwfbv;

--
-- Name: follows_id_seq; Type: SEQUENCE; Schema: public; Owner: skgowwxrypwfbv
--

CREATE SEQUENCE public.follows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.follows_id_seq OWNER TO skgowwxrypwfbv;

--
-- Name: follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skgowwxrypwfbv
--

ALTER SEQUENCE public.follows_id_seq OWNED BY public.follows.id;


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
-- Name: reposts; Type: TABLE; Schema: public; Owner: skgowwxrypwfbv
--

CREATE TABLE public.reposts (
    id integer NOT NULL,
    "postId" integer NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.reposts OWNER TO skgowwxrypwfbv;

--
-- Name: reposts_id_seq; Type: SEQUENCE; Schema: public; Owner: skgowwxrypwfbv
--

CREATE SEQUENCE public.reposts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reposts_id_seq OWNER TO skgowwxrypwfbv;

--
-- Name: reposts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skgowwxrypwfbv
--

ALTER SEQUENCE public.reposts_id_seq OWNED BY public.reposts.id;


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
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: follows id; Type: DEFAULT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.follows ALTER COLUMN id SET DEFAULT nextval('public.follows_id_seq'::regclass);


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
-- Name: reposts id; Type: DEFAULT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.reposts ALTER COLUMN id SET DEFAULT nextval('public.reposts_id_seq'::regclass);


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
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: skgowwxrypwfbv
--

COPY public.comments (id, comment, "postId", "userId", "createdAt") FROM stdin;
1	saveiro massa	1	15	2022-10-28 15:52:39.789195
2	saveiro massa	122	15	2022-10-28 17:33:06.883881
\.


--
-- Data for Name: follows; Type: TABLE DATA; Schema: public; Owner: skgowwxrypwfbv
--

COPY public.follows (id, follower, followed, "createdAt") FROM stdin;
1	70	71	2022-10-25 23:39:01.304723
3	70	68	2022-10-25 23:52:55.618249
4	70	50	2022-10-26 00:00:10.718276
11	70	81	2022-10-26 00:45:59.093028
18	70	15	2022-10-26 11:44:04.819078
19	70	67	2022-10-26 11:44:15.212009
20	70	69	2022-10-26 11:44:22.328612
22	71	73	2022-10-26 11:51:38.760157
23	77	70	2022-10-26 17:18:08.556276
24	77	69	2022-10-26 17:18:35.029707
25	77	78	2022-10-26 17:21:50.541186
27	71	69	2022-10-26 22:23:13.462436
28	70	82	2022-10-27 02:36:12.828025
32	70	64	2022-10-27 03:32:16.509209
33	78	69	2022-10-27 15:36:51.5467
34	78	73	2022-10-27 15:36:56.889717
35	70	73	2022-10-27 19:08:44.817098
37	69	77	2022-10-27 21:10:33.649162
38	78	70	2022-10-27 22:08:28.776164
39	74	69	2022-10-27 23:38:18.911683
40	70	78	2022-10-28 20:24:16.576812
\.


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
41	#otakuuuuu	2022-10-24 20:52:02.603759
42	#vaidarcerto	2022-10-26 14:57:21.777189
43	#otaku2\n	2022-10-28 19:54:26.001867
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: skgowwxrypwfbv
--

COPY public.likes (id, "createdAt", "postId", "userId") FROM stdin;
141	2022-10-28 02:46:46.530908	145	78
144	2022-10-28 18:55:06.099304	212	78
72	2022-10-23 01:16:00.943097	75	74
81	2022-10-23 17:21:19.253115	75	70
83	2022-10-23 17:21:24.875094	73	70
84	2022-10-23 17:21:26.575069	58	70
85	2022-10-23 17:21:29.075579	57	70
86	2022-10-23 17:21:32.079733	54	70
95	2022-10-23 17:30:56.973671	74	70
99	2022-10-23 22:13:24.170468	89	74
103	2022-10-23 23:45:53.643608	104	70
105	2022-10-24 14:45:50.341441	109	74
107	2022-10-24 16:55:57.04041	89	70
109	2022-10-24 17:49:06.629098	113	70
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
124	2022-10-24 21:03:00.215232	116	73
125	2022-10-25 11:23:24.123562	117	73
126	2022-10-25 22:31:03.581696	117	70
127	2022-10-26 03:29:48.734482	109	70
130	2022-10-26 17:21:26.472346	133	77
131	2022-10-27 00:21:49.236883	117	74
132	2022-10-27 03:36:15.110771	105	70
133	2022-10-27 08:32:28.811195	53	78
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: skgowwxrypwfbv
--

COPY public.posts (id, "createdAt", "userId", url, description) FROM stdin;
186	2022-10-28 15:27:26.738798	69	https://www.npmjs.com/package/react-tooltip	Teste sem infinite scroller
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
56	2022-10-21 13:31:12.405949	69	https://www.manual.com.br/queda-de-cabelo/products/finasterida-plan?gclid=Cj0KCQjwhsmaBhCvARIsAIbEbH6OV8COsoZr6ejDR2KcJ1nEqL4IoKw2-wRsmtmjuGJsvqFLOutSLMcaArx9EALw_wcB	Agora ninguém mais fica sem pena!
57	2022-10-21 13:31:12.549952	69	https://www.manual.com.br/queda-de-cabelo/products/finasterida-plan?gclid=Cj0KCQjwhsmaBhCvARIsAIbEbH6OV8COsoZr6ejDR2KcJ1nEqL4IoKw2-wRsmtmjuGJsvqFLOutSLMcaArx9EALw_wcB	Agora ninguém mais fica sem pena!
58	2022-10-21 13:38:41.995515	69	https://www.manual.com.br/queda-de-cabelo/products/finasterida-plan?gclid=Cj0KCQjwhsmaBhCvARIsAIbEbH6OV8COsoZr6ejDR2KcJ1nEqL4IoKw2-wRsmtmjuGJsvqFLOutSLMcaArx9EALw_wcB	Agora ninguém mais fica sem pena!
59	2022-10-21 13:38:42.147734	69	https://www.manual.com.br/queda-de-cabelo/products/finasterida-plan?gclid=Cj0KCQjwhsmaBhCvARIsAIbEbH6OV8COsoZr6ejDR2KcJ1nEqL4IoKw2-wRsmtmjuGJsvqFLOutSLMcaArx9EALw_wcB	Agora ninguém mais fica sem pena!
60	2022-10-21 15:25:30.24091	15	https://meusitemaneirissimo.com.br	oi oi oi oi oi #testando1 #testando2 #testando22222 #testando2
61	2022-10-21 15:25:30.394229	15	https://meusitemaneirissimo.com.br	oi oi oi oi oi #testando1 #testando2 #testando22222 #testando2
62	2022-10-21 15:31:09.750691	15	https://meusitemaneirissimo.com.br	oi oi oi oi oi #testando1 #testando2 #testando22222 #testando2
2	2022-10-20 01:57:04.624029	67	http://youtube.com	saveiro massa #saveiro #rebaixada
191	2022-10-28 15:56:26.391017	74	https://www.youtube.com/watch?v=61-euE-nxGw	saveiro #massa
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
192	2022-10-28 16:38:55.041863	69	https://www.driven.com.br/	Teste funções diferentes
194	2022-10-28 16:57:51.36283	69	https://www.driven.com.br/	Teste com função
196	2022-10-28 17:14:57.204606	69	https://www.npmjs.com/package/react-tooltip	AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
197	2022-10-28 17:24:34.635064	69	https://www.driven.com.br/	Pppppsafnmk fofw
83	2022-10-23 20:09:37.16097	73	http://pm1.narvii.com/7630/4513bdff138e115b64901c97243afb192115d14br1-540-540v2_uhq.jpg	opa #vortei
84	2022-10-23 20:23:29.791021	73	http://pm1.narvii.com/7630/4513bdff138e115b64901c97243afb192115d14br1-540-540v2_uhq.jpg	#teste\n
198	2022-10-28 17:28:05.595909	69	https://www.npmjs.com/package/react-tooltip	Outro
199	2022-10-28 17:33:25.43389	69	https://www.driven.com.br/	N aguento mais
200	2022-10-28 17:35:09.890766	69	https://www.driven.com.br/	Novo teste
201	2022-10-28 17:39:00.276401	69	https://www.npmjs.com/package/react-tooltip	Novo Post
89	2022-10-23 21:56:49.667697	74	https://www.youtube.com/watch?v=EztZqbq2hEI	sabeiro #rebaixada
202	2022-10-28 17:42:19.423405	69	https://www.driven.com.br/	Agr vaiiii
103	2022-10-23 23:34:15.393406	73	https://pbs.twimg.com/media/D_nex0hWkAARqZo.jpg	#otaku2
104	2022-10-23 23:34:33.157975	73	https://pbs.twimg.com/media/D_nex0hWkAARqZo.jpg	#otaku2
105	2022-10-23 23:34:47.698062	73	https://pbs.twimg.com/media/D_nex0hWkAARqZo.jpg	#otaku2
109	2022-10-24 00:38:12.432067	73	https://pbs.twimg.com/media/D_nex0hWkAARqZo.jpg	#otaku2 testando #otaku testando testando
111	2022-10-24 14:47:33.998487	69	https://www.driven.com.br/	Testando
113	2022-10-24 14:53:15.189078	69	https://www.npmjs.com/package/react-tooltip	Teste!
133	2022-10-26 17:21:12.809759	77	https://trello.com/b/6IDTkA4d/linkr-grupo-9-sprint-2	olha o carro da rua passadno no ser trello #teste (tinha esquecido da hashtag.... era só pra isso o post kkkk)
110	2022-10-24 14:38:55.710247	74	https://www.youtube.com/watch?v=EztZqbq2hEI	sabeiro ediatada novamente asdasdsad
115	2022-10-24 19:13:47.4959	74	https://www.youtube.com/watch?v=EztZqbq2hEI	saveiro #massa\n
116	2022-10-24 19:14:14.373738	74	https://www.youtube.com/watch?v=EztZqbq2hEI	saveiro #massa #editada
117	2022-10-24 20:26:17.057648	74	https://medium.com/cranecloud/connecting-to-a-remote-postgresql-database-779637147abf	saveiro.sql
122	2022-10-25 00:20:46.915113	67	https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F77%2F6c%2F07%2F776c0737c80e420a12c74578dceb829f.jpg&f=1&nofb=1&ipt=d712fe896575d217da10ee3563ed851ea21b86f82d66920ed3eab1d8d4287c10&ipo=images	\N
126	2022-10-26 12:08:31.291121	70	https://pbs.twimg.com/media/D_nex0hWkAARqZo.jpg	akospaksopaksopasa22222
151	2022-10-28 04:27:42.711052	78	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMoGa30hJlJI5wR44CeQzuUVxVSWCCpBtL8Q&usqp=CAU	erwvrbfdbrt
128	2022-10-26 12:15:30.842394	69	https://www.driven.com.br/	tESTEANDO!
131	2022-10-26 16:41:31.651904	70	https://github.com/miguelmmattar/linkr-front	olha o git passando na sua rua\n
132	2022-10-26 17:20:34.338256	77	https://trello.com/b/6IDTkA4d/linkr-grupo-9-sprint-2	olha o carro do trello passadno na sua rua\n
152	2022-10-28 04:27:56.068899	78	https://pbs.twimg.com/media/D_nex0hWkAARqZo.jpg	ggregerggfgrf
136	2022-10-27 12:33:09.836956	70	https://www.npmjs.com/package/react-tooltip	teste Teste de carregamento
140	2022-10-27 19:28:01.292809	70	http://meusuperlink.com.br	testando post sem link valido\n
145	2022-10-28 00:51:23.458905	70	https://meusupersite.com	enuiwuidnuifwn
147	2022-10-28 04:21:22.673826	78	http://pm1.narvii.com/7630/4513bdff138e115b64901c97243afb192115d14br1-540-540v2_uhq.jpg	dwqdqwdqwdwq
148	2022-10-28 04:23:45.192758	78	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMoGa30hJlJI5wR44CeQzuUVxVSWCCpBtL8Q&usqp=CAU	gregegeg4ge4
149	2022-10-28 04:26:38.951036	78	http://pm1.narvii.com/7630/4513bdff138e115b64901c97243afb192115d14br1-540-540v2_uhq.jpg	htrhrthrgnntr
150	2022-10-28 04:27:03.95047	78	https://pbs.twimg.com/media/D_nex0hWkAARqZo.jpg	66u56j6776
153	2022-10-28 04:29:22.053613	78	https://pbs.twimg.com/media/D_nex0hWkAARqZo.jpg	fewfewfwe
154	2022-10-28 04:29:46.34503	78	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMoGa30hJlJI5wR44CeQzuUVxVSWCCpBtL8Q&usqp=CAUg	egege
155	2022-10-28 04:34:24.192527	78	https://pbs.twimg.com/profile_images/1234914876537147392/dZkjyktq_400x400.jpg	testand okosaksoa
161	2022-10-28 04:47:21.672187	78	https://i.pinimg.com/736x/df/91/02/df91027b7859de1d4e5d2684604737d5.jpg	SERA QUE RENDERIZOU??? 
160	2022-10-28 04:47:06.439243	78	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMoGa30hJlJI5wR44CeQzuUVxVSWCCpBtL8Q&usqp=CAU	vsvdvsd
162	2022-10-28 04:47:56.745692	78	https://pbs.twimg.com/media/D_nex0hWkAARqZo.jpg	KKKKKKKKKKKKKKKKK
163	2022-10-28 04:48:57.292332	78	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMoGa30hJlJI5wR44CeQzuUVxVSWCCpBtL8Q&usqp=CAU	FEFWEFWEFWEFWE
164	2022-10-28 04:51:56.000952	78	https://pbs.twimg.com/media/D_nex0hWkAARqZo.jpg	sdsadasdsa
165	2022-10-28 04:55:21.648256	78	https://pbs.twimg.com/profile_images/1234914876537147392/dZkjyktq_400x400.jpg	AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
203	2022-10-28 17:47:13.489153	69	https://www.driven.com.br/	Mais um
204	2022-10-28 17:49:36.981833	69	https://www.npmjs.com/package/react-tooltip	Dois loads
205	2022-10-28 17:50:47.662409	69	https://www.driven.com.br/	Tá chegando?
212	2022-10-28 18:54:40.396537	78	http://pm1.narvii.com/7630/4513bdff138e115b64901c97243afb192115d14br1-540-540v2_uhq.jpg	testando2
217	2022-10-28 19:54:26.152354	70	https://meulink.com	#otaku2\n
216	2022-10-28 19:53:13.476219	70	https://meubelolink.com.br	mege test #otaku uhhuu
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
101	103	36	2022-10-23 23:34:15.712589
102	104	36	2022-10-23 23:34:33.472454
103	105	36	2022-10-23 23:34:48.012822
105	109	36	2022-10-24 00:38:12.749321
106	109	34	2022-10-24 00:38:13.080432
108	115	38	2022-10-24 19:13:47.796468
109	116	26	2022-10-24 19:14:14.673469
111	116	26	2022-10-24 19:46:43.246012
112	116	40	2022-10-24 19:46:43.542663
120	133	1	2022-10-26 17:21:13.104235
121	191	26	2022-10-28 15:56:26.685016
123	216	34	2022-10-28 19:53:13.766715
124	217	43	2022-10-28 19:54:26.447854
125	216	34	2022-10-28 19:56:37.836929
\.


--
-- Data for Name: reposts; Type: TABLE DATA; Schema: public; Owner: skgowwxrypwfbv
--

COPY public.reposts (id, "postId", "userId", "createdAt") FROM stdin;
1	117	74	2022-10-25 20:26:52.358674
2	117	69	2022-10-25 20:27:00.945812
3	116	69	2022-10-25 20:27:40.010063
5	133	73	2022-10-26 19:39:01.634275
10	126	69	2022-10-26 22:23:28.746399
11	126	69	2022-10-26 22:23:29.569026
16	20	78	2022-10-27 19:43:26.38485
21	126	78	2022-10-27 20:04:31.952318
22	126	78	2022-10-27 21:08:22.38026
25	133	78	2022-10-27 21:59:33.947132
26	126	78	2022-10-27 21:59:45.973751
27	133	78	2022-10-27 22:00:13.505428
32	116	78	2022-10-27 22:02:39.079531
33	126	78	2022-10-27 22:09:49.291906
34	126	78	2022-10-27 22:28:01.319581
35	126	70	2022-10-27 23:39:50.734438
36	126	78	2022-10-27 23:41:44.441176
37	126	78	2022-10-27 23:42:19.671929
38	116	78	2022-10-27 23:42:48.2833
39	140	78	2022-10-27 23:51:21.834592
40	126	78	2022-10-27 23:57:14.088339
41	126	78	2022-10-28 00:05:48.464314
42	133	78	2022-10-28 00:06:11.955983
43	140	78	2022-10-28 00:06:27.017939
44	126	78	2022-10-28 02:46:01.275836
45	140	78	2022-10-28 02:46:59.772041
46	149	78	2022-10-28 04:28:13.820465
52	212	78	2022-10-28 18:54:50.535748
53	212	78	2022-10-28 18:54:59.059713
55	216	70	2022-10-28 19:53:43.054429
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: skgowwxrypwfbv
--

COPY public.sessions (id, "userId", "createdAt", token, "closedAt") FROM stdin;
34	78	2022-10-25 11:25:23.393628	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjc4LCJpYXQiOjE2NjY2OTcxMjN9.gW92hbq0XA4FzmoCB7UQiHyy7NaHF0b9ZAAaPHZGIAY	2022-10-26 12:06:40.964852
9	71	2022-10-21 16:22:41.112355	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcxLCJpYXQiOjE2NjYzNjkzNjB9.zz8FhqRDmGlaGciGVdsq2h6waW8ofOVT18b0Niwr3ec	\N
1	15	2022-10-20 15:37:35.959956	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjE1LCJpYXQiOjE2NjYyODI5MjZ9.dAFHaPIvq1Q0lPHlIOrBEtiygLPtFyk7HeuwuIvVqBQ	2022-10-20 16:23:53.052296
20	70	2022-10-22 14:41:59.034619	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0NDk3MTh9.4AODas3PYWO0Wqmj4GF0sVIlMcnPTW4aqaxoX-EVvqA	2022-10-22 16:38:52.547465
2	15	2022-10-20 16:24:16.680688	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjE1LCJpYXQiOjE2NjYyODMyNDZ9.zjqipG1sejaghvF5PCIsOQ2AnY5AYRBlU4nVzDLwRk4	\N
22	70	2022-10-22 16:39:06.80296	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0NTY3NDZ9.bgwgZexz7-REmuMPYX7GqPXODALoUMWpTdg3txnhZKU	2022-10-22 16:48:34.827272
3	26	2022-10-20 16:44:51.769544	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjI2LCJpYXQiOjE2NjYyODg2MDR9.ZDv_20jzOJyyfg4V65RGcI7n0yUNAqgYHtIaGi0fiQg	2022-10-20 18:55:13.229686
4	65	2022-10-20 21:55:15.187054	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjY1LCJpYXQiOjE2NjYzMDI5MTR9.USdg44zzlyF50cH0KBWxSbj5xjNMl9B2I-qf3nfM1kQ	2022-10-20 21:55:57.36982
5	67	2022-10-20 23:19:10.513681	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjY3LCJpYXQiOjE2NjYzMDc5NTB9.BF5n8hTm-vW1xVj1GT8Lmu0m41jMtIDWm8vE0rNQq2c	\N
23	70	2022-10-22 16:52:03.347643	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0NTc1MjN9.wq1AGGaMv7_5noIMoUo1431-8GKd8vJa8y3WN6SKecs	2022-10-22 16:52:24.316165
21	74	2022-10-22 15:04:36.680803	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjc0LCJpYXQiOjE2NjY2NDMxNDF9.yCNexDyf8z0Jmwc3zte1m1_KptUENEZoaxu7ohYwqJ0	\N
27	76	2022-10-24 20:05:46.438152	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjc2LCJpYXQiOjE2NjY2NDE5NDZ9.lercFYZrd1O11MtwT5Zec2crcrEjtFpM-6d8Kiqq1Wo	2022-10-24 20:32:42.732021
8	70	2022-10-21 14:40:06.955665	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0MzEwMjV9.shdgEe-Vry3pfIIZQkew4JVKLOtKmKqB6hI3EquS3xg	2022-10-22 09:33:44.946076
11	70	2022-10-22 09:34:42.927907	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0MzEyODJ9._bARUqwAvVJtdcsdvLwrL-hg-SfLGw1utAZfbHyGpB8	2022-10-22 09:34:55.55446
6	68	2022-10-21 00:45:18.050228	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjY4LCJpYXQiOjE2NjYzMTUyMDV9.MAXGFY5kJ_v3OEoi-YQ2u0ELURmVlVD8MAuOhsnnFVA	\N
12	70	2022-10-22 09:44:08.067136	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0MzE4NDd9.gi9XvMDa3b2gsH2IRiM9eRWZ35hYXCNZCAg7klpmHuA	2022-10-22 09:44:18.404133
13	70	2022-10-22 09:53:05.026862	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0MzIzODR9.Ku4MkJCOcwlx9wzMtGtsGjBxeaNUrQoH2AiYML3ZeHE	2022-10-22 09:53:31.645445
14	70	2022-10-22 10:04:42.538731	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0MzMwODJ9.GxAs2iWOOHAAoDnzBITxLt_VKKAKkhSNQcev6G7-lO4	2022-10-22 12:34:41.872864
15	70	2022-10-22 12:35:03.537446	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0NDIxMDN9.ds99T90oUgn9SSKQu65vrQUMUkAId7whNCMs9nQFvwk	2022-10-22 12:36:58.025839
28	70	2022-10-24 20:32:52.485523	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY2NDM1NzJ9.e0IeOFjpb4O9nktjg7s4G4jBYcynVVE26Ovq9kmHHPU	2022-10-24 20:33:00.530645
16	70	2022-10-22 12:45:54.248474	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0NDQ1Njh9.XZ5mjZuhnqousYU6L4E55GoZY94s8KlSzUApQuFnR88	2022-10-22 13:16:45.331067
24	70	2022-10-23 17:20:44.578216	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY1NDYwMTh9.gksF_VhJjVsSFQCrHfLzJ-HylpuFpCcVLHAdLixLm3c	2022-10-23 17:31:34.571493
17	70	2022-10-22 13:19:37.800197	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0NDQ3Nzd9.CbgJF6lHitSsOfig99nkGXp8sWcLxPEWiZmDK_MXAP4	2022-10-22 13:19:43.098146
18	70	2022-10-22 13:27:00.883569	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0NDUyMjB9.OexL7Twx0WOgCEcZHhuylxixeqvp4J8GCIyCE7cHSt0	2022-10-22 13:31:14.017432
19	70	2022-10-22 13:32:44.494032	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY0NDU1NjR9.ovYDPNpyET-NJML8KaN1zZ55PKAygij4W1opxulIOxc	2022-10-22 13:32:48.521047
32	70	2022-10-24 21:02:25.614026	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY3MDM0NDN9.QRmBwJQdbc9_arPFiLB2tn4-dXsgg1uTTsfYQHGpr34	2022-10-25 22:57:01.819547
29	70	2022-10-24 20:33:22.386469	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY2NDM2NDd9.LqZIb2ifkoflrrx4su1_NNdeCbJmy-cF7E5Np1Hvif4	2022-10-24 20:37:53.840892
25	70	2022-10-23 17:34:56.477901	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY1NjcxODZ9.xtFyes6mx7lHNqohKSN0WvyV27hnG_zq13WcehRQhHM	2022-10-24 17:41:27.941511
30	70	2022-10-24 20:37:55.329388	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY2NDM4NzV9.unZ0IQz0406yJ4vkhMTJDzEI_l4e1fqYuaKR0jbP5KU	2022-10-24 21:01:13.456424
31	70	2022-10-24 21:01:15.888598	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY2NDUyNzV9.WyHPqIFZ9ObstyjM4RS1XODJPQ2s7-gQ2wuJFC994EY	2022-10-24 21:02:24.334697
39	69	2022-10-26 12:23:20.598365	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjY5LCJpYXQiOjE2NjY3ODcwMDB9.xEgQNyqrqHsMLEOiosFdhNfeXtgErO9G_KB_8ix5IgU	2022-10-26 12:33:12.071225
36	70	2022-10-25 22:57:24.012974	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY3Mzg2NDR9.NQmjjSY11LaOHUmXlBGIeqJxncFL-B5C1-I1KzRS5Ik	2022-10-26 00:39:06.470637
26	70	2022-10-24 17:45:48.38568	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY2NDA4OTd9.GEjNylCZ9sjJvP5ylZ5F9T9IR47xaytRy54PyHH6cr4	2022-10-24 20:03:04.701851
10	73	2022-10-21 17:26:29.99406	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjczLCJpYXQiOjE2NjY1NzY1MjJ9.-k8-cUtfv8SJFmiaoBLSJuneiSidT7-StBLJS0j4M_Q	2022-10-25 11:23:54.0457
7	69	2022-10-21 12:19:11.966226	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjY5LCJpYXQiOjE2NjY2OTg3MjR9.IHh0AR-2si6cRrcDZMoLriV2xhQHCzgsV8LXfgfgew0	2022-10-25 11:52:53.966952
33	77	2022-10-24 22:57:38.795869	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjc3LCJpYXQiOjE2NjY2NTIyNTh9.kEaHzZKDFVzo2oNVTuMbZ9_PP8Kd8K4A5DCxfsIpRlo	2022-10-25 13:10:25.782274
35	69	2022-10-25 14:01:50.90375	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjY5LCJpYXQiOjE2NjY3MDY1MTB9.qhst89FmrSETmlDjpiXZIQ6WemF83-wjHhE1-5WwhFE	2022-10-26 12:20:10.550313
37	70	2022-10-26 00:41:35.260185	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY3ODY4Mzd9.vQAAtOUC-bicjUHX1-AR1Sg3LKRORoJWM9KBoK_50hc	2022-10-26 12:23:08.44207
38	77	2022-10-26 02:47:01.489583	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjc3LCJpYXQiOjE2NjY3ODc4ODF9.HgwYPH5h5KCdlxeGQTc8_oFeDDmWTWSOVF5fNvtC4KI	2022-10-26 14:26:56.583863
40	70	2022-10-26 12:33:34.514635	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY4MDIxMzB9.Z-_69txJkHeJRQLhX3sooF993pbmlCekydwq5_k8yDI	2022-10-26 17:17:06.520657
41	77	2022-10-26 17:17:14.978649	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjc3LCJpYXQiOjE2NjY4MDQ2MzR9.dGp1tQn-LXLXfeHueGMBoVg00LGBuQ-xDWI-3WMLBt0	2022-10-26 22:27:45.494596
42	70	2022-10-26 22:28:16.259962	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY4MzcwNTF9.SA_tdrpXC2eaLy1ZUFv_ZcEip5agja2b7H1UrD9GpGk	2022-10-27 02:51:56.571309
43	70	2022-10-27 02:52:14.402948	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcwLCJpYXQiOjE2NjY4OTc2ODh9.QJyTd9ApeZjkishmvL3CZF7juIUOGbQ2bJ-lQtftd28	\N
44	78	2022-10-27 08:26:44.58407	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjc4LCJpYXQiOjE2NjY4NTkyMDN9.ROYNbNjWvoB6QHv6dyqs8UliTJ-7oURu8cG3pHjAQEE	2022-10-27 08:33:00.97186
45	78	2022-10-27 08:46:36.713026	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjc4LCJpYXQiOjE2NjY4NjAzOTV9.zinQQxA7YQLU3gk60vTuV3j5behWxuTvh4r2GJNNIWE	2022-10-27 15:33:44.890839
46	78	2022-10-27 15:33:46.65802	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjc4LCJpYXQiOjE2NjY4ODQ4MjZ9.OJXZCev1Fmi3nYgTTq_RKtNRbIgNz7_XQhIBoY7OrTA	2022-10-27 15:42:03.37764
47	78	2022-10-27 15:42:04.602123	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjc4LCJpYXQiOjE2NjY4ODUzMjR9.u_ZnlBuLu-LiMatv3QYEZK9tRpKOmFDhyGGQOMBYBbg	2022-10-27 18:30:09.737092
49	69	2022-10-27 19:13:28.278186	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjY5LCJpYXQiOjE2NjY4OTgwMDh9.VaGk9vqXxXJDf6Wxe-y8BqpO_URlFrKt9f-z1LVsq2g	\N
48	78	2022-10-27 18:30:11.256475	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjc4LCJpYXQiOjE2NjY4OTU0MTF9.PBfSZy46WI2FWtOVfuigRE5qLSuIpPA2IMeRtnABOMs	2022-10-27 19:57:44.04167
50	78	2022-10-27 19:57:44.681612	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjc4LCJpYXQiOjE2NjY5MDA2NjR9.QBKbo0ZQYFnetM5CIJkms65-oAdhk4pBrHt9uotB3mk	2022-10-28 04:13:23.253218
51	78	2022-10-28 04:13:27.05794	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjc4LCJpYXQiOjE2NjY5MzA0MDd9.gGN8DilMdniME76Jj1XK-aVO0ZVyU2tv3ZLZ45iB1VQ	\N
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
22	77	data:image/jpeg;base64,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	2022-10-24 22:57:28.766339
23	78	https://i.pinimg.com/736x/df/91/02/df91027b7859de1d4e5d2684604737d5.jpg	2022-10-25 11:25:01.078521
24	79	data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBYVFRgVFhUZGRgaHB4aHBwaHBoZGhwaGhocHBwaGhocIS4lHCErHxwYJjgmKy8xNTU1GiQ7QDszPy40NTEBDAwMEA8QHxISHzQrJCs0NDQ0NDY0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NP/AABEIALcBEwMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAAEBQMGAAIHAQj/xAA+EAACAQIEAwYEAwYFBAMAAAABAhEAAwQSITEFQVEGEyJhcYEykaGxB0LBFCNS0eHwFWJygvEzkqLiJFOy/8QAGQEAAwEBAQAAAAAAAAAAAAAAAQIDBAAF/8QAJREAAgICAgEEAwEBAAAAAAAAAAECEQMhEjFBEyJRcTJCYQSB/9oADAMBAAIRAxEAPwDlZNSq21QsK3UUrdiMIqydlrZOd83wiq3atmJ5Vcuz3DH7tnU6Mu1BLZHJ0ePju8g6gLt0onBY10eVaZpLZbK2Rh8J1ppdsKUV03JAof8ASLVF2xnG3W2sfEaJscXc2ySDNIrODYZQ8kxpVlwGEGWDVlYVybKN2gweJxNtrhEIsmOsVzl2NfQ2LsjunQDdTXz/AMRslHdejH711F8drTBCTNbodaiY1sDrQLI2tmSai+db22ysa1c60QnjNpWik1udRTvhHZu5dzu8W7VvV3M6eSiPEeUAgSRrXHCVEZtgxjeAT9qKwmCuuQERieWhE+QJ0J8qtuFu4bDISmHzR4s9/wAbEkGIWAqjKG0AzaiSJoXAdpL5zlJCsGBUC2tsydAQqAnTTc6RNA7QtscKxLDKMNeJPLu7n3iBUV/hGItDM9p1HWOnWNqI492lxOJIU3GFtDChSVUERzEH3M6RTvspx1UJV8RfuErmdDa7xWJGXQsx0gqDoM2pJ2jrBSKddBkeddK/DJoLLSzjfZy3em5gjJTezmE5fim3yMKQYB0iIFG/hzbdLzq6lTEidKKdiTVI6rh150QSAKgtmBQLuztlGgrmJdG2OxqhSKpuAQtiRyk1e14akajWlWJ4aEuB1FchXF9jO6uRQaG/bE2mjAQwoK9w5GMxRQz/AISaHUVoy1iWMg0NYXrhSjduFkAedIOAoxfSrD2vtnMDyqPsxhIliK5q9Mm2M1taVrct6Uey1C6Uy0K0K8lZRuQV5RsWjjDLNYmlbIeVSKlZW6NjZuHLacq7F2J4cFwyk6yJPvXHrYrtPZBnFhARy/Sqx6JzfRDf7Ko7sxETU9js2iKqjkZpw7NrpWWsQCuoj1rqQnFG6YJSQegqYpG1a4R53ohjTFEDsJFcN7Z4bJiXEb613RkrlH4m4TLdV43EVwY6kc+avNqlRJqNhrSssZl51qdxXs1iqSQBqSQAOpJgD51wRv2b4S9+7AU5FIzvqFSTzbloGOmsTGsVdO13GkttawyTkH7wgjKI1CZl8mVSAeS6xtRlrBvg8ALSEnNN1301YhVGUAbSQBJnw1zbiVq4zuzhi7RJPoB9uVFJgbS0ecX4l376SF1AB18Ig7nUljqSegrxb5KmBAgiOQWNvvNMuE9nXfxMpjpH11p3b4GizCFvWIB8zVFikyEs8YuinC6iqRB8Qk+Z5T5Dp51rhrsQ+hcHnMR7Ea760ZxDBBWKkZef8jSzIV5Ajr+ulI40ysZJq0X7gH4g9y3dXFy25yq0ZgijQEqIPTQRvuK6Ngkw9xVxlu4gU+J4YG30LCQIPWdeswJ4LheF5jnuEpbAkkRmboqg8z1OnrVh4HiEjIqZEBkLJOu0sT8TeflpA0qU24K6LYorNLhZ3fA4m3dTNbdXWYlddRyqW3aC0i7E2clhm5O5I8woCz8wae3Hp4ScopsjliozcV4N60dQd6gu3yKiTFjNBpiVkly0RqKgDtNF9+DpQr3RniuOZ4pbnXl23Ikb1ubwOgqK8+UdTXHFN45czMVblTLgiDJSbjglyzaUx4PcOTTSjy8EfI0a3Wr2tK94aVe4Ed4HrE+VT8YZEcKmumomYoWPWrFndVled75V7TbEo4ch1opG5UHsaMIrKzSye0AINdt7K8RR7SxyFcQQ6CavHZzFi2i+LTc00ZVpkpOtnULt9BuRUWIRSNK5de4w74hSXOQNtyq1f40I0PSnUkxXP5LBZJUxRwNIuG8SVyddBzpqcQsTOlONFhLOIqifiZhs2HDgfCauneLlmYHWue9qu2dpz3Fm218g+IgHJIOw0Ob5fLcCx1Fvo5olhyJVGI3kAx03r1sDcgtkaBMmJAy77dKaYvEuxJazlG8K7AxyU6zGpnfnStMZlaQWRxyI+Iz8MgTAjnOwoFgdlqXDMEdXIkKQY6xU9zFowYMokayPCYA16hszHcidKgFsswRdWZgq/wCpjA+pFAJ37szjHxOAF5lAa4xAEflQlPcSrEeRpXiOBK7/AAA67keY3PtTnD3Vwdm1h80pbRbYI3YgAFvcyfetcZxZE2+IjQnr09avDkukZMsot22JuKcN7siDqABv/fnSHHKxuZQdPoD+tFY7iJuMrs+moPkfMUuuY23auZpz9dZ3Gu1ao2lswT3L2rQk7ShGAC7gb/yqmNcIPnNXrjdpG8dtsy7kDcTVM4pYg5hzqOaP7I3f5pa4sLxd0kKgnQT7dfPX7UTZxHcguZ02G8nlW/dWsufNDDlvsNo6b0m4hje8hQIUajqT1P1qE18mjFKvxO6/hhxo4jAgPGa2zLp0mf1FWsnmK4z+D+PZL5ta5XDNHLUAT81j2rrbOQZGxpYnZO7CbpzL6VCuBZ1DAbUJibxt6k6GtuF8eVQyuY5qf0rmyaaumF43AMuVgZ2BrXBYTO5LUDje0eZCqg5p35aHegsLxS7MqBNDkc3FPQ8uYXIT9KksWEW2WYyxk/0qDDXWbV9zRBykUwVXZSsTwl8ReYFsqjXz9IqVcOLIKBiSNNKm4rcy3JUkeYo7AYVSuaJO/Whxp2SpPQlOJCfk186ecA4taUHvFg8jlmtr2GUnWgsRgFovYVcXaCMVjbRdiE0J00ArKW/4ef4vrWVx1s4pl51ItRI1EqOdZ2WbMqzthHTDhxNVtGhgfOug4bGJctZCR8NGk0SyPopyO430mjsJiHkLvNOEwqXbJ5FDoaI4Xw34XMbRS0TbRJwi4VQjYk6mndu1ccKitA61Pwjh6AFX51Px0PZsTZYKcwBaAYWD103AHvVeo2xseNykkvJWu0nGEFrJ3uW3qGYDUspkFBu2wjkdTqIB57xDjRYRbRlU7yvib/U09daI4ziHukJsQZyglQ7bZgTz/wAp58ySZQG8yyAzqZgyxka6gjTnR/pr48faTrfYzKvM6nU8oE5h+o2qJrYbQMNPQfSirRd5KtO2nM+utPLPAxdSSrZ13AI9NJEinjCUuhZTjHsq4tiI5zvy9DUiX2DKJylSCsDYjYxzMx8qZYng9y3v4gTAph2V7PNir6IxygAlupAB0HSTTPFJLaAskX0xpgMXisXftZWYo7ErmYEKR8W2uWUIE66U+4/w54Ki5Eag077O9mUwiohLM9p7lwsDAyuoy5xME7R70h47is0md9P79qpj5PTZjzKKdpFEx6vnjMzRq0SdCY0Hzps2AOSQ65ZGTJLMwP8AECPCRXlrBqcz5tCftRmHxaos5NRzOg8qLxycrToPqJKkrM4ZwdkOd3A022FJOPWkhsnQnTYRRWN4iz+HeT7/APFL8ZbCW2ndhA8pIqkq4tIXGnyTfYFivCkxBKj7ClXMGm/FxoT5/QUoYaVln2bcfVl//DmLWLsKde8RxtzIzDfUQC0xpzrtFq1Iri/AbmTF8P8AENbhIGo8FwKqx1BBPvXbHuZRSoM1sTceskgCaROoUVYcfaZ1JqsPvRdIzT7N7Nt3MKKs3DsFkXxDWh+CWMokjenIuDaggxj5MUA6UJjEKAsK8xAI1WhTxMZSr0R/4I8XdzsSBNM8BdKIAaUXuLW0MDrQWL4zpCmj2MsSW2y1XsUp0mo7qhRJYVzy/wAYfrUDcduMQC5PqaDQ6jFnRP2petZXPP8AFn86yhsp6MSkoeVErpQjDWisOSRUZLyRkiZCDTO1aYKMp3oHAJLgRNWmxghAJNJXwSm6B8UpS2iqYLb1vg8Rd0XMYFRXkLEjN8NB4bFnPlJ0rt2T7LPw/jDZ8rN6VL2x4s6YUAEyXzHSRAB0Y8hJHvFVK5OYmTpsaztBeYYdQxeTr0WDpHmTlOm2gqkZPopiXuRCMN3yhwJBWR+oPmDIqPEWlxFkQo79GgtzdRp4up2+VA9m+MGw2V9bbbg7Bo0PpMTR+CuXXuDPlVmnKoIiN5ABMCfnWmFN/ZXI5JX8bG/Zzg6qJK+MxB6Hp/WrK1sJDgRGjCouF2RbGe4YESZ+o/lUuP7S2EX4CTtJjUeYGta6UVSPNbc5Ntle4ndMssaHVTymguA8Se1ezpod/vUvE+JWri+Ax1XYjzX+VKrLKGJmdPv/AGa5u/JWCaXR1e9xz92+IZGOe2ZVBJJXnH+kzXN+IccW6PArn20121q4XO0VgYVFXW7a1KjZg3hyz6lflVYuEqxIsoM5zModfiOp2FQenrQ/fas94Sjhcjazz6daj4i4PhAECpVxz/8A1ZR1BB/Wg77yae/BO92Au+UwN6H4kCEObckD6jWiHYJtq3PyoG7f7x1U7ZgflQbpV8l4K3ZtfwxfSk9y2VOU77VbRdUFY0AYaddaN7c8CVP2fEWwAlwBWjkwJYMehyyP9tJmjW0UxTvRX8biDbbC6lTbRW9GLFzHqYr6Aw18XURwfC6hx6MJr547R3AzJpqqwTMyJ8P0ru/4eFLnD7LZiYUqDzhCVE/Ks6LTVj50BWKqr4OL4WNDrVjuYkKYFQsAzBtiKLIySYalgBYjlUCIFmana+YpRjeJqsg6URlG3SM4rxFUXSqHxLiRZt6n4lxAO5ANJsYnnXIeSroha4HasvNApa90q1avfJ96IFLRpiL1R23jWiMXw11TOSPSlpedBXM6Mr2GfttZQvcN1r2gPzfyBBJrcudhtXiVuggzE1nsm2NuzVnPeANdFwXBdfF7Vz/hWNC3kfLA2rp1vjVuF8Q1qiUSU0m9gL9mFLE9aU4vsTqWVoq7W8WpEzpUF7GqwMEUJKK8CUl0JsL2fQIoYSeZqjfiWoS8EUEKEQCTyIYnKOSyPcz0rpWHuSuprkfbm7mxT6QAY+LMSFVQCddN9ukc6EXfgtgSsQ4a1rB6f39qZ8Ct/vTBgqQw/UVJwa0ly6wY7KII5nNJ+mlB4R8t5pOmYifQwDTYJ3lp+KNn+mMVhpfPZ00IuJt5CxVvLefKqtjcMiDI11khpYFSxYfwgjQg7ydaKsY4rEmG5MKKGPRzNyJ9gPat+THy6bR5OOTj4K5wrh5djuo3Wd4nb7Uw/ZERMQzAZraK6knSSwQCBuMzL9aYjGozqqAA7dNNNqYcIupbuXndM6QLcHY5mmPl9hQUajSC5XK30UviedMLhouEh3ut5Bl7uCPck6abdKbYXCJetpiC0M85hyzAw31pb2xxQdkVfgTMgj+KRmGmnID/AGmkuFxboMoOkkxymsyajJrs0yg5xT6ZcsRbCrGekuJxgWQD86WnGOw3rZgCqtGsa+oqnqJ9EvR49nj3S3l59anSx4kG2jNr7Aff70MiyYmKNWAScw0VRt1JMD2Arlb2xutIlF1ViBr5/erDwriSXrF3C33gOMyMQTkdJYGBry2G81UmuCZY6cuZMdBRuAss7A5CqieWracz08tqo3y9qVipKHuYu4kAcoYjMFgkajXUesbelXv8KuLtBwzMMoBdP+7xf/ofKte0XBkxmH/ak8N22sXABOZQIzEeUa+VUTDX72DvI4gMozKfiRlbSRHxKfL7is0ouLpmhSU46O/tdCGMpaaLUiJKxSjsfxtMbaDIvjUDOsyVb15g6wedNMbxBLejEe9cTquwpbEiQaoXaLFS7L00q0Y3iICFkaNK59icQWJLHUnWuHXyhTcvQ1R3cVPOpsTaBqPDcOLSSdBTAsBxAnWoFBoooMxUnbSonEGgwpG1zFO4yFiR0qJ7NbmAZrW7d1oDqOiGH61lSftQrK46hWjSantkzEUOmho+wSCGrOychnewYtopMhzyP96VJbutArbHYa5dtd+zgxpHlQniTLPOkpk2iy4XjD92V5RQOAxrl8uY5RqaC/aWVSsb1rh75EkDeuti0Or/ABNi6hSQs6/rVH7QMTefMuUlmYjpmYkanU6Ea8/pT/B4mDLwFnUtJGumsAk6xyqq8Sv95cd9pJ6+vOqQbsthjSbC+AaXF8wdfSD+hqMoC7xMZiQemvOs4Pd/eIByYfJvCfqaP4epN1yBIzN8sxpsUbyv6NOaSWFfZJgsTIytuOX6rR9hRzJK/Wl+PsANKyNflW+ExYOjHKetb4yrTPOlG1aGnEcVYyQsoRsQGBB6zFe2+IdzhHZnZrl0qLZZWUeGTnXMoDECdddcvWg7oLsitiYDEDYGPM60h4njmuXApuM6WwUQn+ETqByk/SOlTnNopjgmj1n/AHEEa96SNT/CQ0+ei776edRYdljXmCPeDl+oFb44RprBZjqI/Mdvn9aGt/qPvWY1BSJzqayJEctf0/nW9tTk2rw3o8KZpaFPLQySBzknLr5VybTEkrWzwqF1mPufQb1mHVnJyiJPxHpECB6VNiOHsmg1LHKCJMTz+Un2qw4HCqkBFkxA5/8ANaoYnJ0+kZ55YxVoCwHDobNq7dSJ+9OVRhGZwPf+lEfsrxrp66fQULdw4G7fKtkYxSpGGU3J22MuF497TGGRlIgg8xz+lVDjOEFp+7YDuHJZGYT3eY6gEa5Z3A8j1lurovM/esxltL9pkBkjVZ0gjmp/Sp5cakiuHI4y/hXOH8QxHDcSGU5WUiQDNu4h1AMaMrAyDymdxXUuDXreO/8AkZsxY6jbKw/LHKP61ypLC3LLo75b9kFrYbZ7ayz255MurL18Q6U7/DDiqpiGs3Gyi8AEMwO8BMD1YEieoArz2qZvkuUbOjcb4flSUO1c7xd4ya6hxS3FtgTy51y7E6k+tc3QsZNaA3xJqS3dcqSKj051sMUFUgU1jkA61G2ulaG5WyT1oBRE4O1RujVOsgmvGY864ZIErK20rK44hK1NZc6TUNputTINZrO/hk2WHi2NtHDpbtoQ2hJ29Z61vZ4devW1ZUOVecdKTNii7JIgCB7V1/heItiwiJGwjWmqxWlRTsPwR7iggQRv51NiuzbhVZRtvVrstkMRvR8gj2o+miVHNuO4FbWFzNoXOX25+kaGfLzrnl8zB6ifn/f1q69vOI57xsLGW2ACRzd9x7KSPeqZfgtE7ae+2vT+lGKo1RVRRrhHKsGHIj6EH7invBbDg5lYiecTv1FB4PAEOA2mx8iDsQeY86sK2QgMSfTcfzrVixfsRzZP1Bcdd1bProYKAfFyzAkQPOlCtIfkSMoJ5T8X/jI9GNOnti4wQtEnU9BzNV8r8RExyoZYy8MXE0AMxI5/3Fe4Yw6z1r11gDTcSD1kkH7Ee1e2yA6kHmv6VA1B2JQrbtEgeIMwgzpnO/vNQINPl96LxvwWhI8IcaHo5j+/TpQSnYUq6C+xgjgD2qbhizdUR5/9vi/SgUaBVj7L8LZ7itGsSJHhVWkB36jeE3Y9BJp4P3InP8XZYLHD0yK1xss+ID8zachv/OmdvG2E0QgeeX9SPI7kU5w3DLa+J8xPMn4m9SPsNBS/i+J0yoAByAEn3rXxlJ1dfXRg9SEV+N/b2LMVLnwurjfT/wBZpXdwwGjyD9/etr2BecykoT0MD5CosVjWQBLkRPxyWXTqo9+tG82PvaClhy/jpgl0IvM/Oajw+KVWEFo86kxOBI8SSQZI22mNNaCS2SdjVo5Y5I2gSwuDpnnH8AMwugAq2rR5biknGsOlm+wtMSghkP5gGAYAkc1OntVwxOHzW9CZiR/fpVR4rbACzIdfCQea7qfUaj2rHmj5L4J/qd34biExmCtXA4ZntrnI5XMozgjkQ01zbjWFNm4yH1FGfg5jfFfsF4kLcRepEhyPbJTvtzw7TvOYqRfqRz661Zaw5Y61kisN+K4aka4yyE2oS28GTUrvnMVmJw2USK45Lybtih0qC9iZqMWiRW+GwudoJiuHVvQPWU4/wkfxV7QDwYhQ60TbBmKgtjWmdqz4M0wZ0qEmQkG4LDCII1nX0onhfESl8DMcsxFAXBkUNmMmgkY5sw60sXWxErO0qyuo1oTH402UYjUgaSYE8pPIT9JPKua4bjN5WBLGBypzxHGtcRBdBLtlNqwNWvMxABYDUKATzE5mH5TVVK+gxjb2U7EWmBYyWLFoaPiZj4n11209zRXDeBszIpXViBJ0iTE/rXSuFdhbqnvsTla4wByrAVNICgbCAAABoAKF4jbZLkgF1tzm2jNBy2x6SCfYc9NmOMUr7Ys5ycq6Xli69w7DBUs4dSX8IdywXN3kFUEypcyCDAiV11moH4cyO6MyllOUnUa9PEN4qDjrFMOsyHuP3hZdCDoQT7FfdaaWMQlzBd7fSbqjM10fEQGXVgIz+F//ABMQaCUsKTbu3sMlHK3WvgrPE7bZ28OgG486TW0yyxAIUyQ0wQBMGIMeldMsdnTdtd5Ydbg1Upc8JBEHKGHwtsRMjWq3e4OjXirnJbcOgLCClyIC3F/KQ0AkaQQRpVJcZq4snBuDqSK/xbCW3tm7aZgyhVa25BgKAB3biARH5CJ3gtBiuzVgt4Ii4bFxsuUmWBAZgoOUCdzmA0PQ7Ur4hhu7dknNAXWAJlVPInr1rErTpmztWja85KIYAguNBG+U/PXf+VZgsM1x0toJe4yoo/zMQBr6mstMvgVlkTLRuRA0n29pqexi3a9aCnJkIVSkAqokkhhvuxmusNHQOE9mrL3Et20BFkRdvODLXjAYKGEQpVgoA0ksZJUnoOD4clpYQASZMASx/iZt2O2pNK+A4dbaICZYiW1/MdTJ59PanOPugJJMA9KvGNUvJinPlb8IX8TuKBEiart1xEArPUfrUvEMdb5SfnVfxdxD8Kk+ckVuxxpGCb5SNseryYaR6xS9rWhzNQruwPhLUO9w85NUuh4waNbmIyMMvweesdMvQc4FTXHLhWRhmHxQd455eWlCvbLcoHnUOHuQcmpA1BnX7xp+p1rDmjwlzib8TU48ZFg4fi15mTGvrrVd7UGXmIgxR2GHjAnTfpHlQ3aZwdAPOulJTg2iUY8MiQH2Uxnc4yxcDBQrrmJMDKTDT5QTXa+3iA2dK+fVFdn4LxcNhrPfmSUXU6zpzrJJ0aplAv4dgSQDFC3lq68RxVkSFAg/LWkHFOHKqB0M1ykCMtbEtt4r27fJFDs1bKJFOOgizegRUT3YMios0VhFAa2Fft5rKCyHoayuO5My2ab275usiaLGlJF3ozD3YM1Ga2SkjpHaZEt4BU/dlvDqI+Y86peGxKC2UKSZ3oPFYjPlGunnVs7K8G77DXHyzln6Cg6FpFZsnO6oANTz2jmT5AST5A11fsDghfduIP8A9NJt4YEAAKNHuARoWYR899zzdeGO2HYpaaXdbQuCAoz3FWDrOuYLp1NdWu4pLFpMPbIC21VB5wI/r71XFj5O0FzUI78jXjHFRBCmP73qgcXxZBCiMs8vPc+u5ozH8REEk1UMUwdiQ0T516OLHxVmSc+brwb8UxyuGB+EaD2/mST71csBwdUw2GRwDnTK6nXUE3AD5asD6VSUs+JTIYAz7+dO8NxtmcBjohMeRyOD9SPlRzQuFLwUwSSn9lrx982c960ciGbb+GVDW83iZAPaQQfWKUca4K2KXvNO8yhnC7XLe3e2yNHKztvoAeU7LjrOKezZfMVN1yxVo1ysShHNSpEz0im17EpgMr2/GinxoR4wD4Ve3lHxbKdNZBMakYYS9NJGiUecmzj3FOGXBcuZzNxRm11zqBJZT+bw+MdQG50u4mGeLpAEwsA/wgAR8vYnzrt3anh1jGYbv7OUlFNxG2Iy+Ir/AKWE6dSCN65fwC4pL23th7csMkyVD75ZPSQDIiAdxXSSfuQYya9rKzZOknKMvrqTA2ph2bsq14FgGXMic97jhfomc+1QcTwYsu6TKgypOhKnVSRyMGCORBq0dgOG5v3pE5SSvQuwyjT/ACqHP+9aSEeUqGySUYNnT8JcQQBA/vlUPHMSp8I5UE+mrn5HalmJxSCTmk1vUN2eS5vjQLirqJuBSq5jAdVFSYzFIx5e9AMEjQx6VdNISMfkgv4lvKK0XEyDMab+lRXVbahmsHr/AEoSkaFFUbXsUWkLoPnpO1QPhyBmmCNRG9T2tDlUAkxqef8AT+VetYKwXM/81JrktlFLi9Htm9IzAjnvy6+hjlUHG9QP9NardCuRsrbdAfMGtuKmUHkKyJOLcWaH7qkICKvfB7rPh7bMZOq+oUkD6ae1USKtXDuKgWEUj4RHyJ1rPkTa0PkVoO4rbyqDQ3fnJG4qLiPEc4AoLvzlijBNLYkU6Irig0Xw3hveMATAoEvVr7OYJ7/wD3ppMZtogxXZJt0OlJjw9kaGFXziYewAm81XrjMWkrqKVOuwKTDsLgzkX90dulZRVrizgAZB86yhoBzVDrU6b1BzovBWy7hetGSKSJ7NWbhnaRrOGfD2xDPPi00nc+sUivr3TZAQTzqbgmFD3YYwIJqPkl/S/cL4hlw9m3lHiZCZ6q6sDPqBQOKxhLNvvSizi816yhbRLgI2Ogka9N59qMv4kgnUEfWvR/xbi2zN/oe0gbG4iRoY/WlLOIJ2I+tMsTdRgSRB2pFdVgdNR1rY5CwVhVm44Gbb5CtbHEMxYaAZWAI3YkQPTelmLd2ETpW2FbYEQRzqMsnL2oso8fd5HlprtjK4idWWOQIAimGI7TTebOoYwqqSAVG+aQd/i3/y0vsKSNWHvQmMtaiCDofsTS5YJxv7Bjm1Kh5c7UNbvi5YYZG1eyQAjaBQGUagkZjIO5B6g1u5fC3GuW9ApDZWEEIx0In4lEqJ/wAwOlbphCWMjRiQP9qn+lb3rACF1gMqlddRtD5lPxSmcf7vSMUZKkkzW48m7F/aK4XdHMZ3Xl5HKu+39K6LwO2LWERQNSocsP4YAB8vAF16k1zGwc9y0o1Mx+ogn0q7cZxBIMOgtIbSMjEnvDOaGH5UAIkzqParYu3IhnXtURxiPhkuo6An9ZpS2JmRI06a0q4piFYl0vshAnJnF1Q8/kcGcsL+YaaDXkK5KBS9xtcp/wCgQNh4c+ZZ2gkdTV1m10ZfQ/pPiXnYTQTOeWlerxEQiqDnJIbMQF/yx09yaYWrlskq4yt0Oh5wehECdCadTjLVjuLj4BLALiIM/pUMFZG/KmJuhHynp/WgS4ln89Kd0gRbZqFyDMdzoPKvC2fc6669dNBA22+tZJIzt7CtExJB5elKpIambYqyoUr+f7Gg8TdzWieex6b0wRw0KRz5fyoDGoAbijaJA8419dqzZ/DRfC/1YlFN7CF8kCNANNJjwz9KUTV0tYq3kTIsAIoHlzMnrJNZy0210R8S4cqICN6Rs0VaeK4kNaA8qqtyncaEg2+zwmuldkeI2rGHzEiY161zMUZbvlRFI1Y7Vl7xfGhecvGg0A5+tKr18kzEVLwCyChc1NfRSpbaouWyTaujLdyQKyli8SA0HKso7Dsp+tEWmI23rKyqS6KsktAzJphgFJdQOeleVlRkSkWS5w9cPBbV7uijeFBGbXbWQKExthdAoALOFBiNBnnb/ZWVlKpOPRrxwi4K0LsfZZVBkkGIBIjUkHlO460oa45gbA+ftXlZWjHmm1tk54oq6QemHOWpRgQBM7VlZW2KMMmxlgbQPhJrXG2Y2HI/UEVlZRn+LEh+aPMCzC4qsZGYwNNCVIGvPWg+N4cqrHkdDr1gD6msrK8zMlHJGvg9DC7TEGGt6MeYkA+1WbAYMYpFck5lQDfTcwY6gzXtZWzDuWyH+jUOSC07K3HXQqyidWjNJA57nb6nqaiPALqSgdRowIUuPhUSTrBkA/M7aVlZWhwjbMfqSoA4q4zz3NsiMpALKuw1hY2gj3oDEY4nQIMsQoLFspO5BbXp8qysqMnUtF8atbNIGcKWYDWZgmIOxHoN6mR5XL0Jn2rKygmx2SOTtXtu4BpBn2rKyrImyVbxnQACl2NWGYnfL9yaysqObopi/IURV34ZZtnDqYOg96ysrOzRLoW4u4Y8qWuKysp2LE8RDNMsDg87xXlZSS6OfRY++7pCoE0oxuLciOVZWVGK2IuwHvfKsrKyqjH/2Q==	2022-10-26 00:39:59.363739
25	80	data:image/jpeg;base64,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	2022-10-26 00:40:27.456396
26	81	https://i.ytimg.com/vi/1f5G8sBHEW4/maxresdefault.jpg	2022-10-26 00:41:17.765242
27	82	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR70XELOpjPy4vHpHvi1NdOlCtt43aHr0x2uA&usqp=CAU	2022-10-27 02:17:16.461318
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
77	caio	$2b$10$0nWUmJ177nxPkIvnb7sGZOb6GmwnDn4ZbEZ1NZ.ulXMUPMMG8i9Q.	caio@email.com	2022-10-24 22:57:28.762167
78	lucas2	$2b$10$sy2AA0h/uHN2q8vdOkVYremQgFBbULPghAsHdmEeJnG2BpjVkkeAm	lucasdosualdo2@gmail.com	2022-10-25 11:25:01.06679
79	doninha	$2b$10$9BVUDlsaPsPweSnik4FSs.UKTCIdE8Og/SSHDnrqbGZuQl1BEBsNW	doninha@email.com	2022-10-26 00:39:59.213759
80	dinho	$2b$10$/ts4JShNL3nfQR/m7p4oUOqQjvsu3ISXfixByz82Z4a9QhWHYC6AW	dinho@email.com	2022-10-26 00:40:27.311076
81	doido	$2b$10$eto054kW2sSdPVXdnqGfh.L1lkKBdwWBzjR.ZZgqvGrw0jgNjubNq	doido@email.com	2022-10-26 00:41:17.619282
82	claudia calva	$2b$10$t.JPWemSg2bEA5PWnHp1dep5uDAfrCg93F7lq5Alqu1.ctPF0BqLC	claudia@email.com	2022-10-27 02:17:16.312335
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skgowwxrypwfbv
--

SELECT pg_catalog.setval('public.comments_id_seq', 2, true);


--
-- Name: follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skgowwxrypwfbv
--

SELECT pg_catalog.setval('public.follows_id_seq', 40, true);


--
-- Name: hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skgowwxrypwfbv
--

SELECT pg_catalog.setval('public.hashtags_id_seq', 43, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skgowwxrypwfbv
--

SELECT pg_catalog.setval('public.likes_id_seq', 144, true);


--
-- Name: postsHashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skgowwxrypwfbv
--

SELECT pg_catalog.setval('public."postsHashtags_id_seq"', 125, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skgowwxrypwfbv
--

SELECT pg_catalog.setval('public.posts_id_seq', 217, true);


--
-- Name: reposts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skgowwxrypwfbv
--

SELECT pg_catalog.setval('public.reposts_id_seq', 55, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skgowwxrypwfbv
--

SELECT pg_catalog.setval('public.sessions_id_seq', 51, true);


--
-- Name: userPicture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skgowwxrypwfbv
--

SELECT pg_catalog.setval('public."userPicture_id_seq"', 27, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skgowwxrypwfbv
--

SELECT pg_catalog.setval('public.users_id_seq', 82, true);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: follows follows_pkey; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (id);


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
-- Name: reposts reposts_pkey; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.reposts
    ADD CONSTRAINT reposts_pkey PRIMARY KEY (id);


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
-- Name: comments comments_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "comments_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: comments comments_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "comments_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


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
-- Name: follows follows_folloed_fkey; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_folloed_fkey FOREIGN KEY (followed) REFERENCES public.users(id);


--
-- Name: follows follows_follower_fkey; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_follower_fkey FOREIGN KEY (follower) REFERENCES public.users(id);


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
-- Name: reposts reposts_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.reposts
    ADD CONSTRAINT "reposts_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: reposts reposts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--

ALTER TABLE ONLY public.reposts
    ADD CONSTRAINT "reposts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


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

