--
-- PostgreSQL database dump
--
-- Dumped from database version 14.5 (Ubuntu 14.5-2.pgdg20.04+2)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
SET
    statement_timeout = 0;

SET
    lock_timeout = 0;

SET
    idle_in_transaction_session_timeout = 0;

SET
    client_encoding = 'UTF8';

SET
    standard_conforming_strings = on;

SELECT
    pg_catalog.set_config('search_path', '', false);

SET
    check_function_bodies = false;

SET
    xmloption = content;

SET
    client_min_messages = warning;

SET
    row_security = off;

--
-- Name: heroku_ext; Type: SCHEMA; Schema: -; Owner: u1sh767n7i1rat
--
CREATE SCHEMA heroku_ext;

ALTER SCHEMA heroku_ext OWNER TO u1sh767n7i1rat;

SET
    default_tablespace = '';

SET
    default_table_access_method = heap;

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

ALTER TABLE
    public.comments OWNER TO skgowwxrypwfbv;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: skgowwxrypwfbv
--
CREATE SEQUENCE public.comments_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    public.comments_id_seq OWNER TO skgowwxrypwfbv;

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

ALTER TABLE
    public.follows OWNER TO skgowwxrypwfbv;

--
-- Name: follows_id_seq; Type: SEQUENCE; Schema: public; Owner: skgowwxrypwfbv
--
CREATE SEQUENCE public.follows_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    public.follows_id_seq OWNER TO skgowwxrypwfbv;

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

ALTER TABLE
    public.hashtags OWNER TO skgowwxrypwfbv;

--
-- Name: hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: skgowwxrypwfbv
--
CREATE SEQUENCE public.hashtags_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    public.hashtags_id_seq OWNER TO skgowwxrypwfbv;

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

ALTER TABLE
    public.likes OWNER TO skgowwxrypwfbv;

--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: skgowwxrypwfbv
--
CREATE SEQUENCE public.likes_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    public.likes_id_seq OWNER TO skgowwxrypwfbv;

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

ALTER TABLE
    public.posts OWNER TO skgowwxrypwfbv;

--
-- Name: postsHashtags; Type: TABLE; Schema: public; Owner: skgowwxrypwfbv
--
CREATE TABLE public."postsHashtags" (
    id integer NOT NULL,
    "postId" integer NOT NULL,
    "hashtagId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);

ALTER TABLE
    public."postsHashtags" OWNER TO skgowwxrypwfbv;

--
-- Name: postsHashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: skgowwxrypwfbv
--
CREATE SEQUENCE public."postsHashtags_id_seq" AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    public."postsHashtags_id_seq" OWNER TO skgowwxrypwfbv;

--
-- Name: postsHashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skgowwxrypwfbv
--
ALTER SEQUENCE public."postsHashtags_id_seq" OWNED BY public."postsHashtags".id;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: skgowwxrypwfbv
--
CREATE SEQUENCE public.posts_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    public.posts_id_seq OWNER TO skgowwxrypwfbv;

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

ALTER TABLE
    public.reposts OWNER TO skgowwxrypwfbv;

--
-- Name: reposts_id_seq; Type: SEQUENCE; Schema: public; Owner: skgowwxrypwfbv
--
CREATE SEQUENCE public.reposts_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    public.reposts_id_seq OWNER TO skgowwxrypwfbv;

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

ALTER TABLE
    public.sessions OWNER TO skgowwxrypwfbv;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: skgowwxrypwfbv
--
CREATE SEQUENCE public.sessions_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    public.sessions_id_seq OWNER TO skgowwxrypwfbv;

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

ALTER TABLE
    public."userPicture" OWNER TO skgowwxrypwfbv;

--
-- Name: userPicture_id_seq; Type: SEQUENCE; Schema: public; Owner: skgowwxrypwfbv
--
CREATE SEQUENCE public."userPicture_id_seq" AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    public."userPicture_id_seq" OWNER TO skgowwxrypwfbv;

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

ALTER TABLE
    public.users OWNER TO skgowwxrypwfbv;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: skgowwxrypwfbv
--
CREATE SEQUENCE public.users_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    public.users_id_seq OWNER TO skgowwxrypwfbv;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skgowwxrypwfbv
--
ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;

--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.comments
ALTER COLUMN
    id
SET
    DEFAULT nextval('public.comments_id_seq' :: regclass);

--
-- Name: follows id; Type: DEFAULT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.follows
ALTER COLUMN
    id
SET
    DEFAULT nextval('public.follows_id_seq' :: regclass);

--
-- Name: hashtags id; Type: DEFAULT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.hashtags
ALTER COLUMN
    id
SET
    DEFAULT nextval('public.hashtags_id_seq' :: regclass);

--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.likes
ALTER COLUMN
    id
SET
    DEFAULT nextval('public.likes_id_seq' :: regclass);

--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.posts
ALTER COLUMN
    id
SET
    DEFAULT nextval('public.posts_id_seq' :: regclass);

--
-- Name: postsHashtags id; Type: DEFAULT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public."postsHashtags"
ALTER COLUMN
    id
SET
    DEFAULT nextval('public."postsHashtags_id_seq"' :: regclass);

--
-- Name: reposts id; Type: DEFAULT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.reposts
ALTER COLUMN
    id
SET
    DEFAULT nextval('public.reposts_id_seq' :: regclass);

--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.sessions
ALTER COLUMN
    id
SET
    DEFAULT nextval('public.sessions_id_seq' :: regclass);

--
-- Name: userPicture id; Type: DEFAULT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public."userPicture"
ALTER COLUMN
    id
SET
    DEFAULT nextval('public."userPicture_id_seq"' :: regclass);

--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.users
ALTER COLUMN
    id
SET
    DEFAULT nextval('public.users_id_seq' :: regclass);

--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.comments
ADD
    CONSTRAINT comments_pkey PRIMARY KEY (id);

--
-- Name: follows follows_pkey; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.follows
ADD
    CONSTRAINT follows_pkey PRIMARY KEY (id);

--
-- Name: hashtags hashtags_hashtag_key; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.hashtags
ADD
    CONSTRAINT hashtags_hashtag_key UNIQUE (hashtag);

--
-- Name: hashtags hashtags_pkey; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.hashtags
ADD
    CONSTRAINT hashtags_pkey PRIMARY KEY (id);

--
-- Name: likes likes_pk; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.likes
ADD
    CONSTRAINT likes_pk PRIMARY KEY (id);

--
-- Name: postsHashtags postsHashtags_pkey; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public."postsHashtags"
ADD
    CONSTRAINT "postsHashtags_pkey" PRIMARY KEY (id);

--
-- Name: posts posts_pk; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.posts
ADD
    CONSTRAINT posts_pk PRIMARY KEY (id);

--
-- Name: reposts reposts_pkey; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.reposts
ADD
    CONSTRAINT reposts_pkey PRIMARY KEY (id);

--
-- Name: sessions sessions_pk; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.sessions
ADD
    CONSTRAINT sessions_pk PRIMARY KEY (id);

--
-- Name: userPicture userPicture_pk; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public."userPicture"
ADD
    CONSTRAINT "userPicture_pk" PRIMARY KEY (id);

--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.users
ADD
    CONSTRAINT users_email_key UNIQUE (email);

--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.users
ADD
    CONSTRAINT users_pk PRIMARY KEY (id);

--
-- Name: comments comments_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.comments
ADD
    CONSTRAINT "comments_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id) ON DELETE CASCADE;

--
-- Name: comments comments_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.comments
ADD
    CONSTRAINT "comments_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);

--
-- Name: postsHashtags fk_postId; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public."postsHashtags"
ADD
    CONSTRAINT "fk_postId" FOREIGN KEY ("postId") REFERENCES public.posts(id) ON DELETE CASCADE;

--
-- Name: likes fk_postId; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.likes
ADD
    CONSTRAINT "fk_postId" FOREIGN KEY ("postId") REFERENCES public.posts(id) ON DELETE CASCADE;

--
-- Name: follows follows_folloed_fkey; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.follows
ADD
    CONSTRAINT follows_folloed_fkey FOREIGN KEY (followed) REFERENCES public.users(id);

--
-- Name: follows follows_follower_fkey; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.follows
ADD
    CONSTRAINT follows_follower_fkey FOREIGN KEY (follower) REFERENCES public.users(id);

--
-- Name: postsHashtags postsHashtags_fk0; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public."postsHashtags"
ADD
    CONSTRAINT "postsHashtags_fk0" FOREIGN KEY ("postId") REFERENCES public.posts(id) ON DELETE CASCADE;

--
-- Name: postsHashtags postsHashtags_fk1; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public."postsHashtags"
ADD
    CONSTRAINT "postsHashtags_fk1" FOREIGN KEY ("hashtagId") REFERENCES public.hashtags(id) ON DELETE CASCADE;

--
-- Name: postsHashtags postsHashtags_hashtagId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public."postsHashtags"
ADD
    CONSTRAINT "postsHashtags_hashtagId_fkey" FOREIGN KEY ("hashtagId") REFERENCES public.hashtags(id);

--
-- Name: posts posts_fk0; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.posts
ADD
    CONSTRAINT posts_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);

--
-- Name: reposts reposts_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.reposts
ADD
    CONSTRAINT "reposts_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id) ON DELETE CASCADE;

--
-- Name: reposts reposts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.reposts
ADD
    CONSTRAINT "reposts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);

--
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public.sessions
ADD
    CONSTRAINT sessions_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);

--
-- Name: userPicture userPicture_fk0; Type: FK CONSTRAINT; Schema: public; Owner: skgowwxrypwfbv
--
ALTER TABLE
    ONLY public."userPicture"
ADD
    CONSTRAINT "userPicture_fk0" FOREIGN KEY ("userId") REFERENCES public.users(id);

--
-- Name: SCHEMA heroku_ext; Type: ACL; Schema: -; Owner: u1sh767n7i1rat
--
GRANT USAGE ON SCHEMA heroku_ext TO skgowwxrypwfbv;

--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: skgowwxrypwfbv
--
REVOKE ALL ON SCHEMA public
FROM
    postgres;

REVOKE ALL ON SCHEMA public
FROM
    PUBLIC;

GRANT ALL ON SCHEMA public TO skgowwxrypwfbv;

GRANT ALL ON SCHEMA public TO PUBLIC;

--
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--
GRANT ALL ON LANGUAGE plpgsql TO skgowwxrypwfbv;

--
-- PostgreSQL database dump complete
--