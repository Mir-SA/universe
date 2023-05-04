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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50),
    total_stars integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    total_stars integer,
    dist_from_earth numeric,
    discovery_date date
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
    name character varying(50) NOT NULL,
    planet_id integer,
    atmosphere text,
    dist_from_planet numeric
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
    name character varying(50) NOT NULL,
    star_id integer,
    description text,
    habitable boolean
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
    name character varying(50),
    galaxy_id integer NOT NULL,
    mass numeric(50,5),
    pulsar boolean
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 83);
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 88);
INSERT INTO public.constellation VALUES (3, 'Cassiopeia', 44);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (4, 'Sombrero', 1000000000, 28000000, '1781-05-11');
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 1000000000, 21000000, '1781-08-27');
INSERT INTO public.galaxy VALUES (6, 'Whirligig', 500000000, 28000000, '1781-03-04');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 1000000000, 0, NULL);
INSERT INTO public.galaxy VALUES (1, 'Andromeda', 100000000, 2500000, '0964-03-15');
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 100000000, 23500000, '1773-11-14');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 1, 'Thin and dusty', 9378.41);
INSERT INTO public.moon VALUES (3, 'Deimos', 1, 'Thin and dusty', 23456.72);
INSERT INTO public.moon VALUES (4, 'Ganymede', 1, 'Oxygen and hydrogen', 1070410.0);
INSERT INTO public.moon VALUES (5, 'Callisto', 2, 'Oxygen and hydrogen', 1882700.0);
INSERT INTO public.moon VALUES (6, 'Enceladus', 2, 'Water vapor and carbon dioxide', 238020.0);
INSERT INTO public.moon VALUES (7, 'Titan', 2, 'Nitrogen and methane', 1221865.0);
INSERT INTO public.moon VALUES (8, 'Miranda', 2, 'Carbon dioxide and nitrogen', 129390.0);
INSERT INTO public.moon VALUES (9, 'Ariel', 3, 'Carbon dioxide and nitrogen', 191020.0);
INSERT INTO public.moon VALUES (10, 'Triton', 3, 'Nitrogen and methane', 354759.0);
INSERT INTO public.moon VALUES (11, 'Charon', 3, 'Nitrogen and methane', 19591.0);
INSERT INTO public.moon VALUES (12, 'Io', 3, 'Sulfur dioxide and other gases', 421800.0);
INSERT INTO public.moon VALUES (13, 'Europa', 4, 'Oxygen and hydrogen', 670900.0);
INSERT INTO public.moon VALUES (14, 'Dione', 4, 'Oxygen and carbon dioxide', 377400.0);
INSERT INTO public.moon VALUES (15, 'Rhea', 4, 'Oxygen and carbon dioxide', 527100.0);
INSERT INTO public.moon VALUES (16, 'Oberon', 4, 'Nitrogen and carbon dioxide', 584000.0);
INSERT INTO public.moon VALUES (17, 'Titania', 5, 'Nitrogen and carbon dioxide', 435910.0);
INSERT INTO public.moon VALUES (18, 'Umbriel', 5, 'Carbon dioxide and nitrogen', 266000.0);
INSERT INTO public.moon VALUES (19, 'Talos', 5, 'Carbon dioxide and nitrogen', 267000.0);
INSERT INTO public.moon VALUES (20, 'Titan M32', 5, 'Nitrogen-ruch', 1221870.0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 2, 'Earth is third planet from Sun and only place known where life exists and found habitability', true);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, 'Mercury is the smallest and closest planet to the Sun.', false);
INSERT INTO public.planet VALUES (3, 'Venus', 3, 'Venus is the second planet from the Sun and is the hottest planet in the solar system.', false);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 'Mars is the fourth planet from the Sun and is often called the Red Planet due to its reddish appearance.', false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 3, 'Jupiter is the largest planet in the solar system and is known for its Great Red Spot.', false);
INSERT INTO public.planet VALUES (6, 'Saturn', 3, 'Saturn is the sixth planet from the Sun and is known for its rings.', false);
INSERT INTO public.planet VALUES (7, 'Uranus', 4, 'Uranus is the seventh planet from the Sun and is known for its blue-green color.', false);
INSERT INTO public.planet VALUES (8, 'Neptune', 4, 'Neptune is the eighth planet from the Sun and is the most distant planet in the solar system.', false);
INSERT INTO public.planet VALUES (9, 'Kepler-438b', 5, 'Kepler-438b is an exoplanet that orbits the red dwarf star Kepler-438.', true);
INSERT INTO public.planet VALUES (10, 'Gliese 667 Cc', 5, 'Gliese 667 Cc is an exoplanet that orbits the star Gliese 667 C, which is part of a triple-star system.', true);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 6, 'Proxima Centauri b is an exoplanet that orbits the star Proxima Centauri, which is the closest star to the Sun.', true);
INSERT INTO public.planet VALUES (12, 'Kapteyn b', 6, 'Kapteyn b is an exoplanet that orbits the red subdwarf star Kapteyns star.', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sun', 2, 1989000000000000000000000000000.00000, false);
INSERT INTO public.star VALUES (3, 'HD 10180', 3, 2109000000000000000000000000000.00000, false);
INSERT INTO public.star VALUES (1, 'Almach', 1, 14726000000000000000000000000000.00000, false);
INSERT INTO public.star VALUES (4, 'Sombrero Star', 4, 3200000000.00000, false);
INSERT INTO public.star VALUES (5, 'Pinwheel Star', 5, 56000000000.00000, false);
INSERT INTO public.star VALUES (6, 'Whirligig Star', 6, 28000000000.00000, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 2, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellations_pkey PRIMARY KEY (constellation_id);


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
-- Name: constellation unique_constellations; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT unique_constellations UNIQUE (name);


--
-- Name: moon unique_moons; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moons UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planets; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planets UNIQUE (name);


--
-- Name: star unique_stars; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_stars UNIQUE (name);


--
-- Name: star galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

