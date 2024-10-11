--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: username; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.username (
    id integer NOT NULL,
    name character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.username OWNER TO freecodecamp;

--
-- Name: username_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.username_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.username_id_seq OWNER TO freecodecamp;

--
-- Name: username_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.username_id_seq OWNED BY public.username.id;


--
-- Name: username id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.username ALTER COLUMN id SET DEFAULT nextval('public.username_id_seq'::regclass);


--
-- Data for Name: username; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.username VALUES (2, 'user_1728647133217', NULL, NULL);
INSERT INTO public.username VALUES (3, 'user_1728647133216', NULL, NULL);
INSERT INTO public.username VALUES (1, 'Igor', 0, NULL);
INSERT INTO public.username VALUES (5, 'A', 0, NULL);
INSERT INTO public.username VALUES (4, 'a', 1, 8);
INSERT INTO public.username VALUES (7, 'user_1728648750451', 2, 833);
INSERT INTO public.username VALUES (6, 'user_1728648750452', 4, 12);
INSERT INTO public.username VALUES (25, 'user_1728649253382', 2, 764);
INSERT INTO public.username VALUES (9, 'user_1728648880266', 2, 357);
INSERT INTO public.username VALUES (8, 'user_1728648880267', 4, 36);
INSERT INTO public.username VALUES (24, 'user_1728649253383', 5, 76);
INSERT INTO public.username VALUES (11, 'user_1728648910625', 2, 156);
INSERT INTO public.username VALUES (10, 'user_1728648910626', 4, 330);
INSERT INTO public.username VALUES (13, 'user_1728649000179', 2, 492);
INSERT INTO public.username VALUES (12, 'user_1728649000180', 4, 160);
INSERT INTO public.username VALUES (15, 'user_1728649007541', 2, 507);
INSERT INTO public.username VALUES (14, 'user_1728649007542', 4, 5);
INSERT INTO public.username VALUES (17, 'user_1728649028514', 2, 838);
INSERT INTO public.username VALUES (16, 'user_1728649028515', 4, 385);
INSERT INTO public.username VALUES (19, 'user_1728649031929', 2, 674);
INSERT INTO public.username VALUES (18, 'user_1728649031930', 4, 69);
INSERT INTO public.username VALUES (21, 'user_1728649104184', 2, 343);
INSERT INTO public.username VALUES (20, 'user_1728649104185', 4, 7);
INSERT INTO public.username VALUES (23, 'user_1728649192801', 2, 376);
INSERT INTO public.username VALUES (22, 'user_1728649192802', 5, 20);


--
-- Name: username_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.username_id_seq', 25, true);


--
-- Name: username username_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.username
    ADD CONSTRAINT username_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

