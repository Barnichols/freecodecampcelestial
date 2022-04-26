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
-- Name: earth_satellites; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.earth_satellites (
    name character varying(30) NOT NULL,
    earth_satellites_id integer NOT NULL,
    perigee_km text,
    apogee_km text
);


ALTER TABLE public.earth_satellites OWNER TO freecodecamp;

--
-- Name: earth_satellites_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.earth_satellites_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.earth_satellites_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: earth_satellites_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.earth_satellites_satellite_id_seq OWNED BY public.earth_satellites.earth_satellites_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    distance_across_kpc numeric,
    age_in_bln_yrs numeric,
    type character varying(30)
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
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer,
    gravity_ms2 numeric,
    mass_kgx22 numeric,
    radius_km numeric
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    has_life boolean,
    star_id integer,
    planet_type character varying(30),
    diameter_km integer,
    gravity_ms2 numeric,
    mass_kgx24 numeric,
    ring boolean,
    description text
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer,
    mass_m0 numeric NOT NULL,
    radius_mi numeric NOT NULL,
    age_bln_yr numeric,
    surface_temp_k integer,
    type character varying(30)
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
-- Name: earth_satellites earth_satellites_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth_satellites ALTER COLUMN earth_satellites_id SET DEFAULT nextval('public.earth_satellites_satellite_id_seq'::regclass);


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
-- Data for Name: earth_satellites; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.earth_satellites VALUES ('Starlink 3681', 1, '322', '323');
INSERT INTO public.earth_satellites VALUES ('Spacebee-120', 2, '506', '543');
INSERT INTO public.earth_satellites VALUES ('Tianping 2C', 3, '581', '603');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 30, 13.61, 'spiral');
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 67, 10.01, 'spiral');
INSERT INTO public.galaxy VALUES ('Triangulum', 3, 18.40, 13, 'spiral');
INSERT INTO public.galaxy VALUES ('Messier 87', 4, 18.4, 13.24, 'elliptical');
INSERT INTO public.galaxy VALUES ('Sculptor Galaxy', 5, 27.59, 15.0, 'spiral');
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 6, 4.29, 1.01, 'satellite');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 1, 1.62, 7.34, 1734);
INSERT INTO public.moon VALUES ('Deimos', 2, 4, 0.003, 0.000000015, 6.2);
INSERT INTO public.moon VALUES ('Phobos', 3, 4, 0.0057, 0.000000106, 11);
INSERT INTO public.moon VALUES ('Io', 4, 5, 1.79, 8.93, 1821);
INSERT INTO public.moon VALUES ('Europa', 5, 5, 1.315, 4.8, 9806);
INSERT INTO public.moon VALUES ('Callisto', 6, 5, 1.235, 10.7, 2410);
INSERT INTO public.moon VALUES ('Ganymede', 7, 5, 1.428, 14.8, 16532);
INSERT INTO public.moon VALUES ('Amalthea', 8, 5, 0.02, 0.00002, 85);
INSERT INTO public.moon VALUES ('Dione', 9, 6, 0.232, 0.109, 550);
INSERT INTO public.moon VALUES ('Enceladus', 10, 6, 0.113, 0.00108, 252);
INSERT INTO public.moon VALUES ('Hyperion', 11, 6, 0.02, 0.0000561, 135);
INSERT INTO public.moon VALUES ('Iapetus', 12, 6, 0.223, 0.1806, 4621);
INSERT INTO public.moon VALUES ('Mimas', 13, 6, 0.064, 0.00374, 1245);
INSERT INTO public.moon VALUES ('Phoebe', 14, 6, 0.05, 0.00083, 106);
INSERT INTO public.moon VALUES ('Rhea', 15, 6, 0.264, 0.2306, 764);
INSERT INTO public.moon VALUES ('Tethys', 16, 6, 0.145, 0.00617, 533);
INSERT INTO public.moon VALUES ('Titan', 17, 6, 1.354, 13.45, 2574);
INSERT INTO public.moon VALUES ('Ariel', 18, 7, 0.258, 0.127, 578);
INSERT INTO public.moon VALUES ('Miranda', 19, 7, 0.079, 0.00064, 1481);
INSERT INTO public.moon VALUES ('Oberon', 20, 7, 0.332, 0.37, 4784);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 1, true, 1, 'terrestrial', 12742, 9.81, 5.97, false, 'Our big blue home');
INSERT INTO public.planet VALUES ('Mercury', 2, false, 1, 'terrestrial', 4879, 3.7, 0.33, false, 'Planet 1, Closest to the sun');
INSERT INTO public.planet VALUES ('Venus', 3, false, 1, 'terrestrial', 12104, 8.9, 4.87, false, 'Planet 3, very thick atmosphere, cloud civilization?');
INSERT INTO public.planet VALUES ('Mars', 4, false, 1, 'terrestrial', 6792, 3.7, 0.642, false, 'Planet 5, next place we will step foot?');
INSERT INTO public.planet VALUES ('Jupiter', 5, false, 1, 'Gas Giant', 142984, 23.1, 1898, true, 'Has a big spot');
INSERT INTO public.planet VALUES ('Saturn', 6, false, 1, 'Gas Giant', 120536, 9.0, 568, true, 'Prettiest rings');
INSERT INTO public.planet VALUES ('Uranus', 7, false, 1, 'Ice Giant', 51118, 8.7, 86.8, true, 'very cold');
INSERT INTO public.planet VALUES ('Neptune', 8, false, 1, 'Ice Giant', 49528, 11.0, 102, true, 'Last planet in the solar system');
INSERT INTO public.planet VALUES ('Pluto', 9, false, 1, 'Dwarf', 2377, 0.62, 1.3, false, 'We will never forget you');
INSERT INTO public.planet VALUES ('Kepler-186b', 10, false, 7, 'Super Earth', 13633, NULL, 7.4, false, NULL);
INSERT INTO public.planet VALUES ('Kepler-186C', 11, false, 7, 'Super Earth', 15927, NULL, 12.5, false, NULL);
INSERT INTO public.planet VALUES ('Kepler-186D', 12, false, 7, 'Super Earth', 17838, NULL, 15.2, false, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 1, 1, 1988500, 4.6, 5778, 'white dwarf');
INSERT INTO public.star VALUES ('Titawin', 2, 2, 1.27, 1163886, 2.7, 6213, 'white_dwarf');
INSERT INTO public.star VALUES ('Kang', 4, 4, 1.46, 10984436, 9.67, 4235, 'red giant');
INSERT INTO public.star VALUES ('Alpha Trianguli', 3, 3, 1.70, 2173833, 1.6, 6228, 'white_dwarf');
INSERT INTO public.star VALUES ('Alpha Sculptoris', 5, 5, 5.01, 3255128, 0.093, 13600, 'blue giant');
INSERT INTO public.star VALUES ('Sirius', 6, 1, 2.06, 739644, 0.242, 9940, 'white dwarf');
INSERT INTO public.star VALUES ('Kepler-186', 7, 1, 0.544, 226296, 4, 3755, 'red_dwarf');


--
-- Name: earth_satellites_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.earth_satellites_satellite_id_seq', 3, true);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: earth_satellites earth_satellites_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth_satellites
    ADD CONSTRAINT earth_satellites_name_key UNIQUE (name);


--
-- Name: earth_satellites earth_satellites_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth_satellites
    ADD CONSTRAINT earth_satellites_pkey PRIMARY KEY (earth_satellites_id);


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
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key1 UNIQUE (name);


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
