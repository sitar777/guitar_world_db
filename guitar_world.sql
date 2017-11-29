--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ab_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ab_relations (
    guitar_player_id integer NOT NULL,
    brand_id integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE ab_relations OWNER TO postgres;

--
-- Name: ab_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ab_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ab_relations_id_seq OWNER TO postgres;

--
-- Name: ab_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ab_relations_id_seq OWNED BY ab_relations.id;


--
-- Name: ag_relations; Type: TABLE; Schema: public; Owner: kirill
--

CREATE TABLE ag_relations (
    guitar_player_id integer NOT NULL,
    genre_id integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE ag_relations OWNER TO kirill;

--
-- Name: ag_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ag_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ag_relations_id_seq OWNER TO postgres;

--
-- Name: ag_relations_id_seq1; Type: SEQUENCE; Schema: public; Owner: kirill
--

CREATE SEQUENCE ag_relations_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ag_relations_id_seq1 OWNER TO kirill;

--
-- Name: ag_relations_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: kirill
--

ALTER SEQUENCE ag_relations_id_seq1 OWNED BY ag_relations.id;


--
-- Name: bands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bands (
    band_name character varying(256) NOT NULL,
    is_playing boolean NOT NULL,
    hometown character varying(256),
    one_man_band boolean NOT NULL,
    id integer NOT NULL
);


ALTER TABLE bands OWNER TO postgres;

--
-- Name: bands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bands_id_seq OWNER TO postgres;

--
-- Name: bands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bands_id_seq OWNED BY bands.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE countries (
    country_name character varying(256) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE countries OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countries_id_seq OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE genres (
    genre_name character varying(256) NOT NULL,
    country_of_origin_id integer NOT NULL,
    year_of_occurrence smallint NOT NULL,
    brightest_band_id integer NOT NULL,
    id integer NOT NULL,
    CONSTRAINT genre_year_of_occurrence_check CHECK ((year_of_occurrence > 1850))
);


ALTER TABLE genres OWNER TO postgres;

--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genres_id_seq OWNER TO postgres;

--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE genres_id_seq OWNED BY genres.id;


--
-- Name: gp_band_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE gp_band_relations (
    band_id integer NOT NULL,
    guitar_player_id integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE gp_band_relations OWNER TO postgres;

--
-- Name: gp_band_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE gp_band_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gp_band_relations_id_seq OWNER TO postgres;

--
-- Name: gp_band_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE gp_band_relations_id_seq OWNED BY gp_band_relations.id;


--
-- Name: guitar_brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE guitar_brands (
    brand_name character varying(256) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE guitar_brands OWNER TO postgres;

--
-- Name: guitar_brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE guitar_brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE guitar_brands_id_seq OWNER TO postgres;

--
-- Name: guitar_brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE guitar_brands_id_seq OWNED BY guitar_brands.id;


--
-- Name: guitar_players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE guitar_players (
    first_name character varying(256) NOT NULL,
    last_name character varying(256),
    birth_date date NOT NULL,
    death_date date,
    country_id integer NOT NULL,
    label_id integer NOT NULL,
    id integer NOT NULL,
    CONSTRAINT birth_death_date CHECK ((birth_date < death_date))
);


ALTER TABLE guitar_players OWNER TO postgres;

--
-- Name: guitar_players_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE guitar_players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE guitar_players_id_seq OWNER TO postgres;

--
-- Name: guitar_players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE guitar_players_id_seq OWNED BY guitar_players.id;


--
-- Name: id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id
    START WITH 100
    INCREMENT BY 1
    MINVALUE 100
    NO MAXVALUE
    CACHE 1;


ALTER TABLE id OWNER TO postgres;

--
-- Name: labels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE labels (
    label_name character varying(256) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE labels OWNER TO postgres;

--
-- Name: labels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE labels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE labels_id_seq OWNER TO postgres;

--
-- Name: labels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE labels_id_seq OWNED BY labels.id;


--
-- Name: ab_relations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ab_relations ALTER COLUMN id SET DEFAULT nextval('ab_relations_id_seq'::regclass);


--
-- Name: ag_relations id; Type: DEFAULT; Schema: public; Owner: kirill
--

ALTER TABLE ONLY ag_relations ALTER COLUMN id SET DEFAULT nextval('ag_relations_id_seq1'::regclass);


--
-- Name: bands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bands ALTER COLUMN id SET DEFAULT nextval('bands_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genres ALTER COLUMN id SET DEFAULT nextval('genres_id_seq'::regclass);


--
-- Name: gp_band_relations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gp_band_relations ALTER COLUMN id SET DEFAULT nextval('gp_band_relations_id_seq'::regclass);


--
-- Name: guitar_brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY guitar_brands ALTER COLUMN id SET DEFAULT nextval('guitar_brands_id_seq'::regclass);


--
-- Name: guitar_players id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY guitar_players ALTER COLUMN id SET DEFAULT nextval('guitar_players_id_seq'::regclass);


--
-- Name: labels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY labels ALTER COLUMN id SET DEFAULT nextval('labels_id_seq'::regclass);


--
-- Data for Name: ab_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ab_relations (guitar_player_id, brand_id, id) FROM stdin;
15	1	2
3	2	3
12	2	4
14	2	5
1	3	6
2	3	7
4	3	8
5	3	9
8	3	10
9	3	11
11	3	12
12	3	13
13	3	14
1	4	15
2	4	16
4	4	17
6	4	18
7	4	19
11	4	20
12	4	21
8	5	22
10	5	23
11	5	24
10	6	25
8	7	26
3	8	27
1	9	28
4	9	29
\.


--
-- Name: ab_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ab_relations_id_seq', 29, true);


--
-- Data for Name: ag_relations; Type: TABLE DATA; Schema: public; Owner: kirill
--

COPY ag_relations (guitar_player_id, genre_id, id) FROM stdin;
1	1	1
1	2	2
1	3	3
2	3	4
2	2	5
2	4	6
3	3	7
3	5	8
4	3	9
4	2	10
4	1	11
4	6	12
5	7	13
5	3	14
5	5	15
5	2	16
6	6	17
6	2	18
7	4	19
7	1	20
7	2	21
7	8	22
8	9	23
8	5	24
8	3	25
9	3	26
9	2	27
9	10	28
10	9	29
10	5	30
10	11	31
11	3	32
11	5	33
12	3	34
12	5	35
12	4	36
13	10	37
13	6	38
13	2	39
14	4	40
14	3	41
14	5	42
14	8	43
14	13	44
15	2	45
15	14	46
\.


--
-- Name: ag_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ag_relations_id_seq', 1, false);


--
-- Name: ag_relations_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: kirill
--

SELECT pg_catalog.setval('ag_relations_id_seq1', 46, true);


--
-- Data for Name: bands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bands (band_name, is_playing, hometown, one_man_band, id) FROM stdin;
The Jimi Hendrix Experience	f	London	f	1
Led Zeppelin	f	London	f	2
The Youngbirds	t	London	f	3
Van Halen	t	Pasadena	t	4
Cream	f	London	f	5
Eric Clapton	t	Surrey	t	6
Guns'N Roses	t	Los-Angeles	f	7
Slash's Snakepit	f	Los-Angeles	t	8
Double Trouble	t	Austin	f	9
Pink Floyd	f	London	f	10
Metallica	t	Los-Angeles	f	11
Exodus	t	San-Francisco	f	12
AC/DC	t	Sydney	f	13
Pantera	f	Arlington	f	14
Damageplan	f	Dallas	t	15
Ozzy Osbourne	t	Birmingham	t	16
Quet Riot	t	Los-Angeles	f	17
Smile	f	London	f	18
Queen 	t	London	f	19
Chuck Berry	f	Wentzwille	t	20
Whitesnake	f	Middlesbrough	f	21
G3	f		t	22
Santana	t	Jalisco	t	23
The Beatles	f	Liverpool	f	24
Judas Priest	t	Birmingham	f	25
B.B.King	f	Las-Vegas	t	26
David Bowie	f	Manhattan	t	27
Elvis Presley	f	Tupelo	t	28
Ornette Coleman	f	Manhattan	t	29
Bon Jovi	t	New-Jersey	f	30
Steve Vai	t	New-York	t	31
\.


--
-- Name: bands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bands_id_seq', 31, true);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY countries (country_name, id) FROM stdin;
USA	1
Great Britain	2
Australia	3
\.


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('countries_id_seq', 3, true);


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY genres (genre_name, country_of_origin_id, year_of_occurrence, brightest_band_id, id) FROM stdin;
Psychedelic Rock	2	1960	24	1
Blues Rock	2	1960	6	2
Hard Rock	2	1970	13	3
Progresiive Rock	2	1960	10	4
Heavy Metal	2	1970	25	5
Blues	1	1880	26	6
Glam Metal	1	1983	30	7
Experimental Rock	1	1960	27	8
Trash Metal	1	1980	11	9
Rock and Roll	1	1950	28	10
Groove Metal	1	1990	14	11
Rhythm and Blues	1	1940	20	12
Instrumental Rock	1	1950	31	13
Free Jazz	1	1960	29	14
\.


--
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('genres_id_seq', 17, true);


--
-- Data for Name: gp_band_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY gp_band_relations (band_id, guitar_player_id, id) FROM stdin;
1	1	1
2	2	2
3	2	3
4	3	4
3	4	5
5	4	6
6	4	7
7	5	8
8	5	9
9	6	10
10	7	11
11	8	12
12	8	13
13	9	14
14	10	15
15	10	16
16	11	17
17	11	18
18	12	19
19	12	20
20	13	21
22	13	22
16	14	23
21	14	24
23	15	25
\.


--
-- Name: gp_band_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('gp_band_relations_id_seq', 25, true);


--
-- Data for Name: guitar_brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY guitar_brands (brand_name, id) FROM stdin;
PRS	1
Ibanez	2
Gibson	3
Fender	4
Jackson	5
Dean	6
ESP	7
EVH	8
Gretsch	9
\.


--
-- Name: guitar_brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('guitar_brands_id_seq', 9, true);


--
-- Data for Name: guitar_players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY guitar_players (first_name, last_name, birth_date, death_date, country_id, label_id, id) FROM stdin;
Jimi	Hendrix	1942-11-27	1970-09-18	1	1	1
Jimmy	Page	1944-01-09	\N	2	2	2
Edward	van Halen	1955-01-26	\N	1	3	3
Eric	Clapton	1945-03-30	\N	2	3	4
Slash		1965-07-23	\N	1	4	5
Stevie	Vaughan	1954-10-03	1990-08-27	1	5	6
David 	Guilmour	1946-03-06	\N	2	6	7
Kirk	Hammett	1962-11-18	\N	1	3	8
Angus	Young	1955-03-31	\N	3	6	9
Darell	Dimebag	1966-08-20	2004-11-08	1	7	10
Randy	Rhoads	1965-11-06	1982-03-19	1	5	11
Brian	May	1947-07-19	\N	2	8	12
Chuck	Berry	1926-10-18	2017-03-18	1	9	13
Steve	Vai	1960-07-06	\N	1	10	14
Carlos	Santana	1947-07-20	\N	1	11	15
\.


--
-- Name: guitar_players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('guitar_players_id_seq', 16, true);


--
-- Name: id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id', 100, false);


--
-- Data for Name: labels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY labels (label_name, id) FROM stdin;
Reprise Records	1
Swan Song	2
Warner Bros	3
RCA	4
Epic Records	5
EMI	6
Atco Records	7
Parlophone	8
Chess	9
Favored Nations	10
Columbia Records	11
\.


--
-- Name: labels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('labels_id_seq', 22, true);


--
-- Name: ab_relations ab_relations_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ab_relations
    ADD CONSTRAINT ab_relations_pk PRIMARY KEY (id);


--
-- Name: ag_relations ag_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: kirill
--

ALTER TABLE ONLY ag_relations
    ADD CONSTRAINT ag_relations_pkey PRIMARY KEY (id);


--
-- Name: bands bands_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bands
    ADD CONSTRAINT bands_pk PRIMARY KEY (id);


--
-- Name: countries countries_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pk PRIMARY KEY (id);


--
-- Name: genres genre_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genres
    ADD CONSTRAINT genre_pk PRIMARY KEY (id);


--
-- Name: gp_band_relations gp_band_relations_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gp_band_relations
    ADD CONSTRAINT gp_band_relations_pk PRIMARY KEY (id);


--
-- Name: guitar_brands guitar_brands_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY guitar_brands
    ADD CONSTRAINT guitar_brands_pk PRIMARY KEY (id);


--
-- Name: guitar_players guitar_players_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY guitar_players
    ADD CONSTRAINT guitar_players_pk PRIMARY KEY (id);


--
-- Name: labels labels_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY labels
    ADD CONSTRAINT labels_pk PRIMARY KEY (id);


--
-- Name: ab_relations unique_ab_relation; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ab_relations
    ADD CONSTRAINT unique_ab_relation UNIQUE (guitar_player_id, brand_id);


--
-- Name: ag_relations unique_ag_relation; Type: CONSTRAINT; Schema: public; Owner: kirill
--

ALTER TABLE ONLY ag_relations
    ADD CONSTRAINT unique_ag_relation UNIQUE (guitar_player_id, genre_id);


--
-- Name: guitar_brands unique_brand_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY guitar_brands
    ADD CONSTRAINT unique_brand_name UNIQUE (brand_name);


--
-- Name: countries unique_country_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT unique_country_name UNIQUE (country_name);


--
-- Name: genres unique_genre_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genres
    ADD CONSTRAINT unique_genre_name UNIQUE (genre_name);


--
-- Name: gp_band_relations unique_gp_band_relation; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gp_band_relations
    ADD CONSTRAINT unique_gp_band_relation UNIQUE (guitar_player_id, band_id);


--
-- Name: labels unique_label_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY labels
    ADD CONSTRAINT unique_label_name UNIQUE (label_name);


--
-- Name: band_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX band_name_idx ON bands USING btree (band_name text_pattern_ops);


--
-- Name: birth_date_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX birth_date_idx ON guitar_players USING btree (birth_date);


--
-- Name: brightest_band_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX brightest_band_id_idx ON genres USING btree (brightest_band_id);


--
-- Name: country_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX country_id_idx ON guitar_players USING btree (country_id);


--
-- Name: country_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX country_name_idx ON countries USING btree (country_name text_pattern_ops);


--
-- Name: death_date_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX death_date_idx ON guitar_players USING btree (death_date NULLS FIRST);


--
-- Name: first_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX first_name_idx ON guitar_players USING btree (first_name text_pattern_ops);


--
-- Name: genre_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX genre_name_idx ON genres USING btree (genre_name text_pattern_ops);


--
-- Name: hometown_indx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hometown_indx ON bands USING btree (hometown);


--
-- Name: is_playing_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX is_playing_idx ON bands USING btree (is_playing) WHERE is_playing;


--
-- Name: label_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX label_id_idx ON guitar_players USING btree (label_id);


--
-- Name: label_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX label_name_idx ON labels USING btree (label_name text_pattern_ops);


--
-- Name: last_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX last_name_idx ON guitar_players USING btree (last_name text_pattern_ops);


--
-- Name: one_man_band_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX one_man_band_idx ON bands USING btree (one_man_band) WHERE (NOT one_man_band);


--
-- Name: ab_relations ab_relations_brands_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ab_relations
    ADD CONSTRAINT ab_relations_brands_fk FOREIGN KEY (brand_id) REFERENCES guitar_brands(id) ON UPDATE CASCADE;


--
-- Name: ab_relations ab_relations_gp_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ab_relations
    ADD CONSTRAINT ab_relations_gp_fk FOREIGN KEY (guitar_player_id) REFERENCES guitar_players(id) ON UPDATE CASCADE;


--
-- Name: ag_relations ag_relations_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kirill
--

ALTER TABLE ONLY ag_relations
    ADD CONSTRAINT ag_relations_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES genres(id);


--
-- Name: ag_relations ag_relations_guitar_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kirill
--

ALTER TABLE ONLY ag_relations
    ADD CONSTRAINT ag_relations_guitar_player_id_fkey FOREIGN KEY (guitar_player_id) REFERENCES guitar_players(id);


--
-- Name: genres genres_brightest_band_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genres
    ADD CONSTRAINT genres_brightest_band_id_fkey FOREIGN KEY (brightest_band_id) REFERENCES bands(id) ON UPDATE CASCADE;


--
-- Name: genres genres_country_of_origin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genres
    ADD CONSTRAINT genres_country_of_origin_id_fkey FOREIGN KEY (country_of_origin_id) REFERENCES countries(id);


--
-- Name: gp_band_relations gp_band_relations_gp_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gp_band_relations
    ADD CONSTRAINT gp_band_relations_gp_fk FOREIGN KEY (guitar_player_id) REFERENCES guitar_players(id) ON UPDATE CASCADE;


--
-- Name: guitar_players guitar_players_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY guitar_players
    ADD CONSTRAINT guitar_players_country_id_fkey FOREIGN KEY (country_id) REFERENCES countries(id) ON UPDATE CASCADE;


--
-- Name: guitar_players guitar_players_label_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY guitar_players
    ADD CONSTRAINT guitar_players_label_id_fkey FOREIGN KEY (label_id) REFERENCES labels(id) ON UPDATE CASCADE;


--
-- PostgreSQL database dump complete
--

