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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description text,
    is_spherical boolean,
    name character varying(30) NOT NULL,
    type integer
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    distance_from_host integer,
    type integer
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
    has_life boolean,
    name character varying(30),
    distance_from_earth numeric(6,2),
    star_id integer NOT NULL,
    type integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    details text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    total_planets integer,
    type integer
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

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, NULL, true, 'Andromida', NULL);
INSERT INTO public.galaxy VALUES (2, NULL, true, 'Milkyway', NULL);
INSERT INTO public.galaxy VALUES (3, NULL, false, 'Celtricon', NULL);
INSERT INTO public.galaxy VALUES (4, NULL, NULL, 'Cigar', NULL);
INSERT INTO public.galaxy VALUES (5, NULL, NULL, 'Cosmos Redshift', NULL);
INSERT INTO public.galaxy VALUES (6, NULL, NULL, 'Black EYE', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3000, NULL);
INSERT INTO public.moon VALUES (2, 'Europa', 3, 2000, NULL);
INSERT INTO public.moon VALUES (3, 'IO', 3, 1000, NULL);
INSERT INTO public.moon VALUES (4, 'IO-next', 2, 1000, NULL);
INSERT INTO public.moon VALUES (5, 'IO-next-2', 2, 1000, NULL);
INSERT INTO public.moon VALUES (6, 'Class-A', 2, 1000, NULL);
INSERT INTO public.moon VALUES (7, 'Class-A1', 2, 1000, NULL);
INSERT INTO public.moon VALUES (8, 'Class-B', 2, 1000, NULL);
INSERT INTO public.moon VALUES (9, 'Class-B1', 2, 1000, NULL);
INSERT INTO public.moon VALUES (10, 'Class-C', 2, 1000, NULL);
INSERT INTO public.moon VALUES (11, 'Metis', 3, 1400, NULL);
INSERT INTO public.moon VALUES (12, 'Thebe', 3, 2400, NULL);
INSERT INTO public.moon VALUES (13, 'Adrastea', 3, 2800, NULL);
INSERT INTO public.moon VALUES (14, 'Adrastea-1', 3, 3800, NULL);
INSERT INTO public.moon VALUES (15, 'Adrastea-2', 3, 3800, NULL);
INSERT INTO public.moon VALUES (16, 'Amalthea', 3, 1800, NULL);
INSERT INTO public.moon VALUES (17, 'Ganymede', 3, 5800, NULL);
INSERT INTO public.moon VALUES (18, 'Callisto', 3, 5200, NULL);
INSERT INTO public.moon VALUES (19, 'Linthia', 3, 4500, NULL);
INSERT INTO public.moon VALUES (20, 'Linthia-B', 3, 4500, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, true, 'Earth', NULL, 1, NULL);
INSERT INTO public.planet VALUES (2, false, 'Mars', NULL, 1, NULL);
INSERT INTO public.planet VALUES (3, false, 'Jupiter', NULL, 1, NULL);
INSERT INTO public.planet VALUES (4, false, 'HB-2', NULL, 3, NULL);
INSERT INTO public.planet VALUES (5, false, 'Venus', NULL, 1, NULL);
INSERT INTO public.planet VALUES (6, false, 'Satern', NULL, 1, NULL);
INSERT INTO public.planet VALUES (7, false, 'Mercury', NULL, 1, NULL);
INSERT INTO public.planet VALUES (8, false, 'Pluto', NULL, 1, NULL);
INSERT INTO public.planet VALUES (9, true, 'Earth-2', NULL, 2, NULL);
INSERT INTO public.planet VALUES (10, true, 'Waterland', NULL, 3, NULL);
INSERT INTO public.planet VALUES (11, false, 'Satern-like', NULL, 3, NULL);
INSERT INTO public.planet VALUES (12, false, 'HB1221', NULL, 3, NULL);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Rocky', NULL);
INSERT INTO public.planet_types VALUES (2, 'Waterland', NULL);
INSERT INTO public.planet_types VALUES (3, 'Gas giant', NULL);
INSERT INTO public.planet_types VALUES (4, 'Rock-water', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 2, 9, NULL);
INSERT INTO public.star VALUES (2, 'Plure', 1, 5, NULL);
INSERT INTO public.star VALUES (3, 'Mellon', 3, 15, NULL);
INSERT INTO public.star VALUES (4, 'Binay-A', 4, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Binay-B', 4, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Aldebaran', 6, NULL, NULL);
INSERT INTO public.star VALUES (7, 'Cygnus', 4, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

