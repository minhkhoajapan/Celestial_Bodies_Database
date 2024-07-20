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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    first_observation integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    age_in_billions_of_years numeric(5,2),
    first_observation integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    age_in_billions_of_years numeric(5,2),
    first_observation integer,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    age_in_billions_of_years numeric(5,2),
    first_observation integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_star_id_seq OWNER TO freecodecamp;

--
-- Name: planet_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_star_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    age_in_billions_of_years numeric(5,2),
    first_observation integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_star_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Harley', 1854);
INSERT INTO public.comet VALUES (2, 'Ashley', 1945);
INSERT INTO public.comet VALUES (3, 'Lichar', 1679);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, false, 'Andromeda', 'closest big galaxy to Milkey Way', 2.50, -964);
INSERT INTO public.galaxy VALUES (2, false, 'Antennae', 'look like an insect', 1.20, 1785);
INSERT INTO public.galaxy VALUES (3, false, 'Backward', 'appear to rotate backward', 0.50, 2001);
INSERT INTO public.galaxy VALUES (4, false, 'Butterfly', 'look like a butterfly', 3.20, 1876);
INSERT INTO public.galaxy VALUES (5, false, 'Cigar', 'look like a cigar', 0.10, 1774);
INSERT INTO public.galaxy VALUES (6, false, 'Milky Way', 'our home', 3.00, 1610);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, false, 'A', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, false, 'B', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (3, false, 'C', NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (4, false, 'D', NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (5, false, 'E', NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (6, false, 'F', NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (7, false, 'G', NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (8, false, 'H', NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (9, false, 'I', NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (10, false, 'J', NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (11, false, 'K', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (12, false, 'L', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (13, false, 'M', NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (14, false, 'N', NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (15, false, 'P', NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (16, false, 'O', NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (17, false, 'U', NULL, NULL, NULL, 10);
INSERT INTO public.moon VALUES (18, false, 'T', NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (19, false, 'R', NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (20, false, 'W', NULL, NULL, NULL, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, false, 'XYAX', 'dangerous', 0.32, 1804, 1);
INSERT INTO public.planet VALUES (2, false, 'LIAE', 'dangerous', 0.20, 1814, 2);
INSERT INTO public.planet VALUES (3, false, 'MKAI', 'dangerous', 0.30, 1821, 1);
INSERT INTO public.planet VALUES (4, false, 'PNDJ', 'mysterious', 1.70, 1531, 2);
INSERT INTO public.planet VALUES (5, true, 'NURA', 'allies??', 0.70, 2009, 3);
INSERT INTO public.planet VALUES (7, false, 'ODFQ', 'hot', 2.70, 1757, 4);
INSERT INTO public.planet VALUES (6, true, 'UNAR', 'enemies??', 0.70, 2012, 3);
INSERT INTO public.planet VALUES (8, false, 'YNSA', 'hot', 2.70, 1857, 4);
INSERT INTO public.planet VALUES (9, false, 'ENBF', 'extreme cold', 0.30, 1967, 5);
INSERT INTO public.planet VALUES (10, false, 'VBYT', 'extreme sandy', 0.70, 1976, 5);
INSERT INTO public.planet VALUES (11, false, 'ZAER', 'icey', 1.10, 1802, 6);
INSERT INTO public.planet VALUES (12, false, 'GFTE', 'lava', 0.34, 1803, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, false, 'Thor', 'home of thunder', 0.30, 1843, 1);
INSERT INTO public.star VALUES (2, false, 'Hemindal', 'see all', 0.20, 1911, 1);
INSERT INTO public.star VALUES (3, false, 'Zues', 'home of thunder', 2.00, 1889, 2);
INSERT INTO public.star VALUES (4, false, 'Hera', 'home of love', 1.50, 1890, 2);
INSERT INTO public.star VALUES (5, false, 'Osirus', 'home of osirus', 0.90, 1893, 3);
INSERT INTO public.star VALUES (6, false, 'Ra', 'home of Ra', 6.00, 1456, 3);
INSERT INTO public.star VALUES (7, false, 'Yasuo', 'home of wind', 0.20, 1954, 4);
INSERT INTO public.star VALUES (8, false, 'Yone', 'home of wind 2', 0.30, 1970, 5);
INSERT INTO public.star VALUES (9, false, 'Trang', 'my biggest regret', 18.80, 2000, 6);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_star_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet unique_comet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT unique_comet_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon moon_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


