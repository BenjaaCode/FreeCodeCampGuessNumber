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
-- Name: user_guess; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_guess (
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer,
    user_id integer NOT NULL
);


ALTER TABLE public.user_guess OWNER TO freecodecamp;

--
-- Name: user_guess_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_guess_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_guess_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_guess_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_guess_user_id_seq OWNED BY public.user_guess.user_id;


--
-- Name: user_guess user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_guess ALTER COLUMN user_id SET DEFAULT nextval('public.user_guess_user_id_seq'::regclass);


--
-- Data for Name: user_guess; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_guess VALUES ('fd', 1, 4, 1);
INSERT INTO public.user_guess VALUES ('ñl', 1, 1, 2);
INSERT INTO public.user_guess VALUES ('user_1748360919616', 1, 945, 3);
INSERT INTO public.user_guess VALUES ('user_1748360919615', 1, 910, 4);
INSERT INTO public.user_guess VALUES ('user_1748361013302', 1, 199, 5);
INSERT INTO public.user_guess VALUES ('user_1748361013301', 1, 95, 6);
INSERT INTO public.user_guess VALUES ('user_1748361415127', 1, 848, 7);
INSERT INTO public.user_guess VALUES ('user_1748361415126', 1, 756, 8);
INSERT INTO public.user_guess VALUES ('user_1748361475320', 1, 605, 9);
INSERT INTO public.user_guess VALUES ('user_1748361475319', 1, 592, 10);
INSERT INTO public.user_guess VALUES ('user_1748361478668', 1, 365, 11);
INSERT INTO public.user_guess VALUES ('user_1748361478667', 1, 881, 12);
INSERT INTO public.user_guess VALUES ('user_1748361482077', 1, 79, 13);
INSERT INTO public.user_guess VALUES ('user_1748361482076', 1, 877, 14);
INSERT INTO public.user_guess VALUES ('user_1748361488315', 1, 744, 15);
INSERT INTO public.user_guess VALUES ('user_1748361488314', 1, 542, 16);
INSERT INTO public.user_guess VALUES ('user_1748361732461', 1, 57, 17);
INSERT INTO public.user_guess VALUES ('user_1748361732460', 1, 967, 18);
INSERT INTO public.user_guess VALUES ('user_1748361822064', 1, 492, 19);
INSERT INTO public.user_guess VALUES ('user_1748361822063', 1, 14, 20);
INSERT INTO public.user_guess VALUES ('user_1748361993685', 1, 291, 21);
INSERT INTO public.user_guess VALUES ('user_1748361993684', 1, 495, 22);
INSERT INTO public.user_guess VALUES ('user_1748362053703', 1, 841, 23);
INSERT INTO public.user_guess VALUES ('user_1748362053702', 1, 474, 24);
INSERT INTO public.user_guess VALUES ('user_1748362100897', 1, 663, 25);
INSERT INTO public.user_guess VALUES ('user_1748362100896', 1, 183, 26);
INSERT INTO public.user_guess VALUES ('user_1748362147623', 1, 505, 27);
INSERT INTO public.user_guess VALUES ('user_1748362147622', 1, 440, 28);
INSERT INTO public.user_guess VALUES ('user_1748362250656', 1, 551, 29);
INSERT INTO public.user_guess VALUES ('user_1748362250655', 1, 386, 30);
INSERT INTO public.user_guess VALUES ('user_1748362354761', 1, 956, 31);
INSERT INTO public.user_guess VALUES ('user_1748362354760', 1, 349, 32);
INSERT INTO public.user_guess VALUES ('user_1748362441209', 2, 62, 34);
INSERT INTO public.user_guess VALUES ('user_1748362441210', 5, 130, 33);
INSERT INTO public.user_guess VALUES ('user_1748362477772', 2, 570, 36);
INSERT INTO public.user_guess VALUES ('user_1748362477773', 5, 120, 35);
INSERT INTO public.user_guess VALUES ('user_1748362603148', 2, 644, 38);
INSERT INTO public.user_guess VALUES ('user_1748362603149', 5, 136, 37);
INSERT INTO public.user_guess VALUES ('user_1748362640046', 2, 144, 40);
INSERT INTO public.user_guess VALUES ('user_1748362640047', 5, 400, 39);


--
-- Name: user_guess_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_guess_user_id_seq', 40, true);


--
-- Name: user_guess user_guess_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_guess
    ADD CONSTRAINT user_guess_pkey PRIMARY KEY (user_id);


--
-- Name: user_guess user_guess_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_guess
    ADD CONSTRAINT user_guess_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--
