--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(255) NOT NULL,
    description text,
    is_spiral boolean DEFAULT true NOT NULL,
    trillion_solar_masses numeric(7,3),
    galaxy_types_id integer DEFAULT 1 NOT NULL
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(63) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    is_spherical boolean DEFAULT true,
    planet_id integer
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
    name character varying(255) NOT NULL,
    description text,
    population integer,
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    solar_masses numeric(13,4) NOT NULL,
    galaxy_id integer
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
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy of Earth', true, 1.500, 1);
INSERT INTO public.galaxy VALUES (2, 'IC1101', 'The biggest galaxy', false, 2500.000, 2);
INSERT INTO public.galaxy VALUES (3, 'UGC 2369', 'Rare merger of two similarly sized galaxies', false, 420.000, 3);
INSERT INTO public.galaxy VALUES (4, 'ESO-338-4', 'A blue compact dwarf full of young, hawt stars like Scarlett Johanssen', false, 0.000, 4);
INSERT INTO public.galaxy VALUES (5, 'Andromeda', 'So big and beautiful', true, 1.230, 1);
INSERT INTO public.galaxy VALUES (6, 'IC 1954', 'Mysterious galaxy', true, 420.000, 1);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral', 'Spiral shaped');
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', 'Elliptical shaped');
INSERT INTO public.galaxy_types VALUES (3, 'Peculiar', 'Weird shaped');
INSERT INTO public.galaxy_types VALUES (4, 'Irregular', 'Very weird shaped');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The', 'Earth''s moon. "Look to La Luna"', true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Famous as the setting of the first two episodes of DOOM', true, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Doom''s 3rd episode, where the marine sends the demons finally back to hell.', false, 4);
INSERT INTO public.moon VALUES (4, 'Europa', 'Original homeland of the European people', true, 5);
INSERT INTO public.moon VALUES (5, 'Io', 'This is where cows come from', true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Space Ibiza', true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Flockhart', true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Original homeland of the titans football team, and of Zeus'' nemeses', true, 6);
INSERT INTO public.moon VALUES (9, 'Iapetus', 'Where Pinocchio was forged', true, 6);
INSERT INTO public.moon VALUES (10, 'Hyperion', 'Home of the space-shrike', false, 6);
INSERT INTO public.moon VALUES (11, 'Epimetheus', 'A small rock located near the Greek God Prometheus', false, 6);
INSERT INTO public.moon VALUES (12, 'Phoebe', '80s brat pack satellite', false, 6);
INSERT INTO public.moon VALUES (13, 'Rhea', 'It''s a big one', true, 6);
INSERT INTO public.moon VALUES (14, 'The', 'Earth''s moon. "Look to La Luna"', true, 1);
INSERT INTO public.moon VALUES (15, 'Phobos', 'Famous as the setting of the first two episodes of DOOM', true, 4);
INSERT INTO public.moon VALUES (16, 'Deimos', 'Doom''s 3rd episode, where the marine sends the demons finally back to hell.', false, 4);
INSERT INTO public.moon VALUES (17, 'Europa', 'Original homeland of the European people', true, 5);
INSERT INTO public.moon VALUES (18, 'Io', 'This is where cows come from', true, 5);
INSERT INTO public.moon VALUES (19, 'Ganymede', 'Space Ibiza', true, 5);
INSERT INTO public.moon VALUES (20, 'Callisto', 'Flockhart', true, 5);
INSERT INTO public.moon VALUES (21, 'Titan', 'Original homeland of the titans football team, and of Zeus'' nemeses', true, 6);
INSERT INTO public.moon VALUES (22, 'Iapetus', 'Where Pinocchio was forged', true, 6);
INSERT INTO public.moon VALUES (23, 'Hyperion', 'Home of the space-shrike', false, 6);
INSERT INTO public.moon VALUES (24, 'Epimetheus', 'A small rock located near the Greek God Prometheus', false, 6);
INSERT INTO public.moon VALUES (25, 'Phoebe', '80s brat pack satellite', false, 6);
INSERT INTO public.moon VALUES (26, 'Rhea', 'It''s a big one', true, 6);
INSERT INTO public.moon VALUES (27, 'The', 'Earth''s moon. "Look to La Luna"', true, 1);
INSERT INTO public.moon VALUES (28, 'Phobos', 'Famous as the setting of the first two episodes of DOOM', true, 4);
INSERT INTO public.moon VALUES (29, 'Deimos', 'Doom''s 3rd episode, where the marine sends the demons finally back to hell.', false, 4);
INSERT INTO public.moon VALUES (30, 'Europa', 'Original homeland of the European people', true, 5);
INSERT INTO public.moon VALUES (31, 'Io', 'This is where cows come from', true, 5);
INSERT INTO public.moon VALUES (32, 'Ganymede', 'Space Ibiza', true, 5);
INSERT INTO public.moon VALUES (33, 'Callisto', 'Flockhart', true, 5);
INSERT INTO public.moon VALUES (34, 'Titan', 'Original homeland of the titans football team, and of Zeus'' nemeses', true, 6);
INSERT INTO public.moon VALUES (35, 'Iapetus', 'Where Pinocchio was forged', true, 6);
INSERT INTO public.moon VALUES (36, 'Hyperion', 'Home of the space-shrike', false, 6);
INSERT INTO public.moon VALUES (37, 'Epimetheus', 'A small rock located near the Greek God Prometheus', false, 6);
INSERT INTO public.moon VALUES (38, 'Phoebe', '80s brat pack satellite', false, 6);
INSERT INTO public.moon VALUES (39, 'Rhea', 'It''s a big one', true, 6);
INSERT INTO public.moon VALUES (40, 'The', 'Earth''s moon. "Look to La Luna"', true, 1);
INSERT INTO public.moon VALUES (41, 'Phobos', 'Famous as the setting of the first two episodes of DOOM', true, 4);
INSERT INTO public.moon VALUES (42, 'Deimos', 'Doom''s 3rd episode, where the marine sends the demons finally back to hell.', false, 4);
INSERT INTO public.moon VALUES (43, 'Europa', 'Original homeland of the European people', true, 5);
INSERT INTO public.moon VALUES (44, 'Io', 'This is where cows come from', true, 5);
INSERT INTO public.moon VALUES (45, 'Ganymede', 'Space Ibiza', true, 5);
INSERT INTO public.moon VALUES (46, 'Callisto', 'Flockhart', true, 5);
INSERT INTO public.moon VALUES (47, 'Titan', 'Original homeland of the titans football team, and of Zeus'' nemeses', true, 6);
INSERT INTO public.moon VALUES (48, 'Iapetus', 'Where Pinocchio was forged', true, 6);
INSERT INTO public.moon VALUES (49, 'Hyperion', 'Home of the space-shrike', false, 6);
INSERT INTO public.moon VALUES (50, 'Epimetheus', 'A small rock located near the Greek God Prometheus', false, 6);
INSERT INTO public.moon VALUES (51, 'Phoebe', '80s brat pack satellite', false, 6);
INSERT INTO public.moon VALUES (52, 'Rhea', 'It''s a big one', true, 6);
INSERT INTO public.moon VALUES (53, 'The', 'Earth''s moon. "Look to La Luna"', true, 1);
INSERT INTO public.moon VALUES (54, 'Phobos', 'Famous as the setting of the first two episodes of DOOM', true, 4);
INSERT INTO public.moon VALUES (55, 'Deimos', 'Doom''s 3rd episode, where the marine sends the demons finally back to hell.', false, 4);
INSERT INTO public.moon VALUES (56, 'Europa', 'Original homeland of the European people', true, 5);
INSERT INTO public.moon VALUES (57, 'Io', 'This is where cows come from', true, 5);
INSERT INTO public.moon VALUES (58, 'Ganymede', 'Space Ibiza', true, 5);
INSERT INTO public.moon VALUES (59, 'Callisto', 'Flockhart', true, 5);
INSERT INTO public.moon VALUES (60, 'Titan', 'Original homeland of the titans football team, and of Zeus'' nemeses', true, 6);
INSERT INTO public.moon VALUES (61, 'Iapetus', 'Where Pinocchio was forged', true, 6);
INSERT INTO public.moon VALUES (62, 'Hyperion', 'Home of the space-shrike', false, 6);
INSERT INTO public.moon VALUES (63, 'Epimetheus', 'A small rock located near the Greek God Prometheus', false, 6);
INSERT INTO public.moon VALUES (64, 'Phoebe', '80s brat pack satellite', false, 6);
INSERT INTO public.moon VALUES (65, 'Rhea', 'It''s a big one', true, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our planet', 7, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 'The fastest planet', NULL, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'The sexiest planet', NULL, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The angriest planet', NULL, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The hungriest planet', NULL, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The prettiest planet', NULL, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'The nastiest planet', NULL, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The tiltiest planet', NULL, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'The meekest planet', NULL, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-90g', 'Big boy', NULL, 4);
INSERT INTO public.planet VALUES (11, 'Kepler-90h', 'Bigger boy', NULL, 4);
INSERT INTO public.planet VALUES (12, 'HD 10180 b', 'Chubby  but very fast earth', NULL, 5);
INSERT INTO public.planet VALUES (13, 'HD 10180 c', 'Yet another big planet', NULL, 5);
INSERT INTO public.planet VALUES (14, 'Earth', 'Our planet', 7, 1);
INSERT INTO public.planet VALUES (15, 'Mercury', 'The fastest planet', NULL, 1);
INSERT INTO public.planet VALUES (16, 'Venus', 'The sexiest planet', NULL, 1);
INSERT INTO public.planet VALUES (17, 'Mars', 'The angriest planet', NULL, 1);
INSERT INTO public.planet VALUES (18, 'Jupiter', 'The hungriest planet', NULL, 1);
INSERT INTO public.planet VALUES (19, 'Saturn', 'The prettiest planet', NULL, 1);
INSERT INTO public.planet VALUES (20, 'Uranus', 'The nastiest planet', NULL, 1);
INSERT INTO public.planet VALUES (21, 'Neptune', 'The tiltiest planet', NULL, 1);
INSERT INTO public.planet VALUES (22, 'Pluto', 'The meekest planet', NULL, 1);
INSERT INTO public.planet VALUES (23, 'Kepler-90g', 'Big boy', NULL, 4);
INSERT INTO public.planet VALUES (24, 'Kepler-90h', 'Bigger boy', NULL, 4);
INSERT INTO public.planet VALUES (25, 'HD 10180 b', 'Chubby  but very fast earth', NULL, 5);
INSERT INTO public.planet VALUES (26, 'HD 10180 c', 'Yet another big planet', NULL, 5);
INSERT INTO public.planet VALUES (27, 'Earth', 'Our planet', 7, 1);
INSERT INTO public.planet VALUES (28, 'Mercury', 'The fastest planet', NULL, 1);
INSERT INTO public.planet VALUES (29, 'Venus', 'The sexiest planet', NULL, 1);
INSERT INTO public.planet VALUES (30, 'Mars', 'The angriest planet', NULL, 1);
INSERT INTO public.planet VALUES (31, 'Jupiter', 'The hungriest planet', NULL, 1);
INSERT INTO public.planet VALUES (32, 'Saturn', 'The prettiest planet', NULL, 1);
INSERT INTO public.planet VALUES (33, 'Uranus', 'The nastiest planet', NULL, 1);
INSERT INTO public.planet VALUES (34, 'Neptune', 'The tiltiest planet', NULL, 1);
INSERT INTO public.planet VALUES (35, 'Pluto', 'The meekest planet', NULL, 1);
INSERT INTO public.planet VALUES (36, 'Kepler-90g', 'Big boy', NULL, 4);
INSERT INTO public.planet VALUES (37, 'Kepler-90h', 'Bigger boy', NULL, 4);
INSERT INTO public.planet VALUES (38, 'HD 10180 b', 'Chubby  but very fast earth', NULL, 5);
INSERT INTO public.planet VALUES (39, 'HD 10180 c', 'Yet another big planet', NULL, 5);
INSERT INTO public.planet VALUES (40, 'Earth', 'Our planet', 7, 1);
INSERT INTO public.planet VALUES (41, 'Mercury', 'The fastest planet', NULL, 1);
INSERT INTO public.planet VALUES (42, 'Venus', 'The sexiest planet', NULL, 1);
INSERT INTO public.planet VALUES (43, 'Mars', 'The angriest planet', NULL, 1);
INSERT INTO public.planet VALUES (44, 'Jupiter', 'The hungriest planet', NULL, 1);
INSERT INTO public.planet VALUES (45, 'Saturn', 'The prettiest planet', NULL, 1);
INSERT INTO public.planet VALUES (46, 'Uranus', 'The nastiest planet', NULL, 1);
INSERT INTO public.planet VALUES (47, 'Neptune', 'The tiltiest planet', NULL, 1);
INSERT INTO public.planet VALUES (48, 'Pluto', 'The meekest planet', NULL, 1);
INSERT INTO public.planet VALUES (49, 'Kepler-90g', 'Big boy', NULL, 4);
INSERT INTO public.planet VALUES (50, 'Kepler-90h', 'Bigger boy', NULL, 4);
INSERT INTO public.planet VALUES (51, 'HD 10180 b', 'Chubby  but very fast earth', NULL, 5);
INSERT INTO public.planet VALUES (52, 'HD 10180 c', 'Yet another big planet', NULL, 5);
INSERT INTO public.planet VALUES (53, 'Earth', 'Our planet', 7, 1);
INSERT INTO public.planet VALUES (54, 'Mercury', 'The fastest planet', NULL, 1);
INSERT INTO public.planet VALUES (55, 'Venus', 'The sexiest planet', NULL, 1);
INSERT INTO public.planet VALUES (56, 'Mars', 'The angriest planet', NULL, 1);
INSERT INTO public.planet VALUES (57, 'Jupiter', 'The hungriest planet', NULL, 1);
INSERT INTO public.planet VALUES (58, 'Saturn', 'The prettiest planet', NULL, 1);
INSERT INTO public.planet VALUES (59, 'Uranus', 'The nastiest planet', NULL, 1);
INSERT INTO public.planet VALUES (60, 'Neptune', 'The tiltiest planet', NULL, 1);
INSERT INTO public.planet VALUES (61, 'Pluto', 'The meekest planet', NULL, 1);
INSERT INTO public.planet VALUES (62, 'Kepler-90g', 'Big boy', NULL, 4);
INSERT INTO public.planet VALUES (63, 'Kepler-90h', 'Bigger boy', NULL, 4);
INSERT INTO public.planet VALUES (64, 'HD 10180 b', 'Chubby  but very fast earth', NULL, 5);
INSERT INTO public.planet VALUES (65, 'HD 10180 c', 'Yet another big planet', NULL, 5);
INSERT INTO public.planet VALUES (66, 'Earth', 'Our planet', 7, 1);
INSERT INTO public.planet VALUES (67, 'Mercury', 'The fastest planet', NULL, 1);
INSERT INTO public.planet VALUES (68, 'Venus', 'The sexiest planet', NULL, 1);
INSERT INTO public.planet VALUES (69, 'Mars', 'The angriest planet', NULL, 1);
INSERT INTO public.planet VALUES (70, 'Jupiter', 'The hungriest planet', NULL, 1);
INSERT INTO public.planet VALUES (71, 'Saturn', 'The prettiest planet', NULL, 1);
INSERT INTO public.planet VALUES (72, 'Uranus', 'The nastiest planet', NULL, 1);
INSERT INTO public.planet VALUES (73, 'Neptune', 'The tiltiest planet', NULL, 1);
INSERT INTO public.planet VALUES (74, 'Pluto', 'The meekest planet', NULL, 1);
INSERT INTO public.planet VALUES (75, 'Kepler-90g', 'Big boy', NULL, 4);
INSERT INTO public.planet VALUES (76, 'Kepler-90h', 'Bigger boy', NULL, 4);
INSERT INTO public.planet VALUES (77, 'HD 10180 b', 'Chubby  but very fast earth', NULL, 5);
INSERT INTO public.planet VALUES (78, 'HD 10180 c', 'Yet another big planet', NULL, 5);
INSERT INTO public.planet VALUES (79, 'Earth', 'Our planet', 7, 1);
INSERT INTO public.planet VALUES (80, 'Mercury', 'The fastest planet', NULL, 1);
INSERT INTO public.planet VALUES (81, 'Venus', 'The sexiest planet', NULL, 1);
INSERT INTO public.planet VALUES (82, 'Mars', 'The angriest planet', NULL, 1);
INSERT INTO public.planet VALUES (83, 'Jupiter', 'The hungriest planet', NULL, 1);
INSERT INTO public.planet VALUES (84, 'Saturn', 'The prettiest planet', NULL, 1);
INSERT INTO public.planet VALUES (85, 'Uranus', 'The nastiest planet', NULL, 1);
INSERT INTO public.planet VALUES (86, 'Neptune', 'The tiltiest planet', NULL, 1);
INSERT INTO public.planet VALUES (87, 'Pluto', 'The meekest planet', NULL, 1);
INSERT INTO public.planet VALUES (88, 'Kepler-90g', 'Big boy', NULL, 4);
INSERT INTO public.planet VALUES (89, 'Kepler-90h', 'Bigger boy', NULL, 4);
INSERT INTO public.planet VALUES (90, 'HD 10180 b', 'Chubby  but very fast earth', NULL, 5);
INSERT INTO public.planet VALUES (91, 'HD 10180 c', 'Yet another big planet', NULL, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Betelgeuse', '10th brightest star in the night sky on Earth', 10010, 11000000.0000, NULL);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'Low mass star', 4853, 0.1220, NULL);
INSERT INTO public.star VALUES (1, 'Sun', 'Earth''s star', 4600, 1.0000, 1);
INSERT INTO public.star VALUES (4, 'Kepler-90', 'F-type built Ford tough', 2000, 1.2000, 1);
INSERT INTO public.star VALUES (5, 'TRAPPIST-1', 'Ultra-cool red dwarf', 7260, 0.0898, 1);
INSERT INTO public.star VALUES (6, 'HD 10180', 'Full HD!', 7300, 1.0620, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 12, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 65, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 91, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 30, true);


--
-- Name: galaxy galaxy_id_u; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_u UNIQUE (galaxy_id);


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
-- Name: galaxy_types galaxy_types_id_u; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_id_u UNIQUE (galaxy_types_id);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_id_u; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_u UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_u; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_u UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id_u; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_u UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: name; Type: INDEX; Schema: public; Owner: freecodecamp
--

CREATE UNIQUE INDEX name ON public.galaxy_types USING btree (name);


--
-- Name: name_unique; Type: INDEX; Schema: public; Owner: freecodecamp
--

CREATE UNIQUE INDEX name_unique ON public.star USING btree (name);


--
-- Name: galaxy galaxy_galaxy_types_fk_galaxy_types_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_types_fk_galaxy_types_id FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


--
-- Name: moon moon_planet_fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

