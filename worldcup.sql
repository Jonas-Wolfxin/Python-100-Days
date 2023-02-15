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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(20) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (79, 2018, 'Final', 160, 161, 4, 2);
INSERT INTO public.games VALUES (80, 2018, 'Third Place', 162, 163, 2, 0);
INSERT INTO public.games VALUES (81, 2018, 'Semi-Final', 161, 163, 2, 1);
INSERT INTO public.games VALUES (82, 2018, 'Semi-Final', 160, 162, 1, 0);
INSERT INTO public.games VALUES (83, 2018, 'Quarter-Final', 161, 164, 3, 2);
INSERT INTO public.games VALUES (84, 2018, 'Quarter-Final', 163, 165, 2, 0);
INSERT INTO public.games VALUES (85, 2018, 'Quarter-Final', 162, 166, 2, 1);
INSERT INTO public.games VALUES (86, 2018, 'Quarter-Final', 160, 167, 2, 0);
INSERT INTO public.games VALUES (87, 2018, 'Eighth-Final', 163, 168, 2, 1);
INSERT INTO public.games VALUES (88, 2018, 'Eighth-Final', 165, 169, 1, 0);
INSERT INTO public.games VALUES (89, 2018, 'Eighth-Final', 162, 170, 3, 2);
INSERT INTO public.games VALUES (90, 2018, 'Eighth-Final', 166, 171, 2, 0);
INSERT INTO public.games VALUES (91, 2018, 'Eighth-Final', 161, 172, 2, 1);
INSERT INTO public.games VALUES (92, 2018, 'Eighth-Final', 164, 173, 2, 1);
INSERT INTO public.games VALUES (93, 2018, 'Eighth-Final', 167, 174, 2, 1);
INSERT INTO public.games VALUES (94, 2018, 'Eighth-Final', 160, 175, 4, 3);
INSERT INTO public.games VALUES (95, 2014, 'Final', 176, 175, 1, 0);
INSERT INTO public.games VALUES (96, 2014, 'Third Place', 177, 166, 3, 0);
INSERT INTO public.games VALUES (97, 2014, 'Semi-Final', 175, 177, 1, 0);
INSERT INTO public.games VALUES (98, 2014, 'Semi-Final', 176, 166, 7, 1);
INSERT INTO public.games VALUES (99, 2014, 'Quarter-Final', 177, 178, 1, 0);
INSERT INTO public.games VALUES (100, 2014, 'Quarter-Final', 175, 162, 1, 0);
INSERT INTO public.games VALUES (101, 2014, 'Quarter-Final', 166, 168, 2, 1);
INSERT INTO public.games VALUES (102, 2014, 'Quarter-Final', 176, 160, 1, 0);
INSERT INTO public.games VALUES (103, 2014, 'Eighth-Final', 166, 179, 2, 1);
INSERT INTO public.games VALUES (104, 2014, 'Eighth-Final', 168, 167, 2, 0);
INSERT INTO public.games VALUES (105, 2014, 'Eighth-Final', 160, 180, 2, 0);
INSERT INTO public.games VALUES (106, 2014, 'Eighth-Final', 176, 181, 2, 1);
INSERT INTO public.games VALUES (107, 2014, 'Eighth-Final', 177, 171, 2, 1);
INSERT INTO public.games VALUES (108, 2014, 'Eighth-Final', 178, 182, 2, 1);
INSERT INTO public.games VALUES (109, 2014, 'Eighth-Final', 175, 169, 1, 0);
INSERT INTO public.games VALUES (110, 2014, 'Eighth-Final', 162, 183, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (160, 'France');
INSERT INTO public.teams VALUES (161, 'Croatia');
INSERT INTO public.teams VALUES (162, 'Belgium');
INSERT INTO public.teams VALUES (163, 'England');
INSERT INTO public.teams VALUES (164, 'Russia');
INSERT INTO public.teams VALUES (165, 'Sweden');
INSERT INTO public.teams VALUES (166, 'Brazil');
INSERT INTO public.teams VALUES (167, 'Uruguay');
INSERT INTO public.teams VALUES (168, 'Colombia');
INSERT INTO public.teams VALUES (169, 'Switzerland');
INSERT INTO public.teams VALUES (170, 'Japan');
INSERT INTO public.teams VALUES (171, 'Mexico');
INSERT INTO public.teams VALUES (172, 'Denmark');
INSERT INTO public.teams VALUES (173, 'Spain');
INSERT INTO public.teams VALUES (174, 'Portugal');
INSERT INTO public.teams VALUES (175, 'Argentina');
INSERT INTO public.teams VALUES (176, 'Germany');
INSERT INTO public.teams VALUES (177, 'Netherlands');
INSERT INTO public.teams VALUES (178, 'Costa Rica');
INSERT INTO public.teams VALUES (179, 'Chile');
INSERT INTO public.teams VALUES (180, 'Nigeria');
INSERT INTO public.teams VALUES (181, 'Algeria');
INSERT INTO public.teams VALUES (182, 'Greece');
INSERT INTO public.teams VALUES (183, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 110, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 183, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

