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
    ab_relation_id integer NOT NULL,
    guitar_player_id integer NOT NULL,
    brand_id integer NOT NULL
);


ALTER TABLE ab_relations OWNER TO postgres;

--
-- Name: ag_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ag_relations (
    ag_relation_id integer NOT NULL,
    guitar_player_id integer NOT NULL,
    genre_id integer NOT NULL
);


ALTER TABLE ag_relations OWNER TO postgres;

--
-- Name: bands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bands (
    id integer NOT NULL,
    band_name text NOT NULL,
    is_playing boolean NOT NULL,
    hometown text,
    one_man_band boolean NOT NULL
);


ALTER TABLE bands OWNER TO postgres;

--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE countries (
    id integer NOT NULL,
    country_name text NOT NULL
);


ALTER TABLE countries OWNER TO postgres;

--
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE genres (
    id integer NOT NULL,
    genre_name text NOT NULL,
    place_of_origin text NOT NULL,
    year_of_occurrence smallint NOT NULL,
    brightest_band_id integer NOT NULL,
    CONSTRAINT genre_year_of_occurrence_check CHECK ((year_of_occurrence > 1850))
);


ALTER TABLE genres OWNER TO postgres;

--
-- Name: gp_band_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE gp_band_relations (
    gp_band_relation_id integer NOT NULL,
    band_id integer NOT NULL,
    guitar_player_id integer NOT NULL
);


ALTER TABLE gp_band_relations OWNER TO postgres;

--
-- Name: guitar_brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE guitar_brands (
    id integer NOT NULL,
    brand_name text NOT NULL
);


ALTER TABLE guitar_brands OWNER TO postgres;

--
-- Name: guitar_players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE guitar_players (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text,
    birth_date date NOT NULL,
    death_date date,
    country_id integer NOT NULL,
    label_id integer NOT NULL
);


ALTER TABLE guitar_players OWNER TO postgres;

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
    id integer NOT NULL,
    label_name text NOT NULL
);


ALTER TABLE labels OWNER TO postgres;

--
-- Data for Name: ab_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ab_relations (ab_relation_id, guitar_player_id, brand_id) FROM stdin;
238	114	152
239	102	153
240	111	153
241	113	153
242	100	154
243	101	154
244	103	154
245	104	154
246	107	154
247	108	154
248	110	154
249	111	154
250	112	154
251	100	155
252	101	155
253	103	155
254	105	155
255	106	155
256	110	155
257	111	155
258	107	156
259	109	156
260	110	156
261	109	157
262	107	158
263	102	159
264	100	160
265	103	160
\.


--
-- Data for Name: ag_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ag_relations (ag_relation_id, guitar_player_id, genre_id) FROM stdin;
192	100	138
193	100	139
194	100	140
195	101	140
196	101	139
197	101	141
198	102	140
199	102	142
200	103	140
201	103	139
202	103	138
203	103	143
204	104	144
205	104	140
206	104	142
207	104	139
208	105	143
209	105	139
210	106	141
211	106	138
212	106	139
213	106	145
214	107	146
215	107	142
216	107	140
217	108	140
218	108	139
219	108	147
220	109	146
221	109	142
222	109	148
223	110	140
224	110	142
225	111	140
226	111	142
227	111	141
228	112	147
229	112	143
230	112	149
231	113	141
232	113	140
233	113	142
234	113	145
235	113	150
236	114	139
237	114	151
\.


--
-- Data for Name: bands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bands (id, band_name, is_playing, hometown, one_man_band) FROM stdin;
115	The Jimi Hendrix Experience	f	London	f
116	Led Zeppelin	f	London	f
117	The Youngbirds	t	London	f
118	Van Halen	t	Pasadena	t
119	Cream	f	London	f
120	Eric Clapton	t	Surrey	t
121	Guns`N Roses	t	Los-Angeles	f
122	Slash`s Snakepit	f	Los-Angeles	t
123	Double Trouble	t	Austin	f
124	Pink Floyd	f	London	f
125	Metallica	t	Los-Angeles	f
126	Exodus	t	San-Francisco	f
127	AC/DC	t	Sydney	f
128	Pantera	f	Arlington	f
129	Damageplan	f	Dallas	t
130	Ozzy Osbourne	t	Birmingham	t
131	Quiet Riot	t	Los-Angeles	f
132	Smile	f	London	f
133	Queen	t	London	f
134	Chuck Berry	f	Wentzville	t
135	Whitesnake	f	Middlesbrough	f
136	G3	f	\N	t
137	Santana	t	Jalisco	t
161	The Beatles	f	Liverpool	f
162	Judas Priest	t	Birmingham	f
163	B.B.King	f	Las-Vegas	t
164	David Bowie	f	Manhattan	t
165	Elvis Presley	f	Tupelo	t
166	Ornette Coleman	f	Manhattan	t
280	Bon Jovi	t	New-Jersey	f
281	Steve Vai	t	New-York	t
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY countries (id, country_name) FROM stdin;
266	USA
267	Great Britain
268	Australia
\.


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY genres (id, genre_name, place_of_origin, year_of_occurrence, brightest_band_id) FROM stdin;
138	Psychedelic Rock	Great Britain	1960	161
139	Blues Rock	Great Britain	1960	120
140	Hard Rock	Great Britain	1970	127
141	Progressive Rock	Great Britain	1960	124
142	Heavy Metal	Great Britain	1970	162
143	Blues	USA	1880	163
144	Glam Metal	USA	1983	280
145	Experimental Rock	USA	1960	164
146	Trash Metal	USA	1980	125
147	Rock and Roll	USA	1950	165
148	Groove Metal	USA	1990	128
149	Rhythm and Blues	USA	1940	134
150	Instrumental Rock	USA	1950	281
151	Free Jazz	USA	1960	166
\.


--
-- Data for Name: gp_band_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY gp_band_relations (gp_band_relation_id, band_id, guitar_player_id) FROM stdin;
167	115	100
168	116	101
169	117	101
170	118	102
171	117	103
172	119	103
173	120	103
174	121	104
175	122	104
176	123	105
177	124	106
178	125	107
179	126	107
180	127	108
181	128	109
182	129	109
183	130	110
184	131	110
185	132	111
186	133	111
187	134	112
188	136	112
189	130	113
190	135	113
191	137	114
\.


--
-- Data for Name: guitar_brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY guitar_brands (id, brand_name) FROM stdin;
152	PRS
153	Ibanez
154	Gibson
155	Fender
156	Jackson
157	Dean
158	ESP
159	EVH
160	Gretsch
\.


--
-- Data for Name: guitar_players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY guitar_players (id, first_name, last_name, birth_date, death_date, country_id, label_id) FROM stdin;
100	Jimi	Hendrix	1942-11-27	1970-09-18	266	269
101	Jimmy	Page	1944-01-09	\N	267	270
102	Edward	van Halen	1955-01-26	\N	266	271
103	Eric	Clapton	1945-03-30	\N	267	271
104	Slash	\N	1965-07-23	\N	266	272
105	Stevie	Vaughan	1954-10-03	1990-08-27	266	273
106	David	Guilmour	1946-03-06	\N	267	274
107	Kirk	Hammett	1962-11-18	\N	266	271
108	Angus	Young	1955-03-31	\N	268	274
109	Darell	Dimebag	1966-08-20	2004-11-08	266	275
110	Randy	Rhoads	1965-11-06	1982-03-19	266	273
111	Brian	May	1947-07-19	\N	267	276
112	Chuck	Berry	1926-10-18	2017-03-18	266	277
113	Steve	Vai	1960-07-06	\N	266	278
114	Carlos	Santana	1947-07-20	\N	266	279
\.


--
-- Name: id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id', 281, true);


--
-- Data for Name: labels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY labels (id, label_name) FROM stdin;
269	Reprise Records
270	Swan Song
271	Warner Bros
272	RCA
273	Epic Records
274	EMI
275	Atco Records
276	Parlophone
277	Chess
278	Favored Nations
279	Columbia Records
\.


--
-- Name: ab_relations ab_relations_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ab_relations
    ADD CONSTRAINT ab_relations_pk PRIMARY KEY (ab_relation_id);


--
-- Name: ag_relations ag_relations_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ag_relations
    ADD CONSTRAINT ag_relations_pk PRIMARY KEY (ag_relation_id);


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
    ADD CONSTRAINT gp_band_relations_pk PRIMARY KEY (gp_band_relation_id);


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
-- Name: ag_relations unique_ag_relation; Type: CONSTRAINT; Schema: public; Owner: postgres
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
-- Name: ab_relations ab_relations_brands_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ab_relations
    ADD CONSTRAINT ab_relations_brands_fk FOREIGN KEY (brand_id) REFERENCES guitar_brands(id);


--
-- Name: ab_relations ab_relations_gp_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ab_relations
    ADD CONSTRAINT ab_relations_gp_fk FOREIGN KEY (guitar_player_id) REFERENCES guitar_players(id);


--
-- Name: ag_relations ag_relations_genres_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ag_relations
    ADD CONSTRAINT ag_relations_genres_fk FOREIGN KEY (genre_id) REFERENCES genres(id);


--
-- Name: ag_relations ag_relations_gp_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ag_relations
    ADD CONSTRAINT ag_relations_gp_fk FOREIGN KEY (guitar_player_id) REFERENCES guitar_players(id);


--
-- Name: genres genre_country_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genres
    ADD CONSTRAINT genre_country_fk FOREIGN KEY (place_of_origin) REFERENCES countries(country_name);


--
-- Name: genres genres_brightest_band_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genres
    ADD CONSTRAINT genres_brightest_band_id_fkey FOREIGN KEY (brightest_band_id) REFERENCES bands(id);


--
-- Name: gp_band_relations gp_band_relations_band_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gp_band_relations
    ADD CONSTRAINT gp_band_relations_band_fk FOREIGN KEY (band_id) REFERENCES bands(id);


--
-- Name: gp_band_relations gp_band_relations_gp_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gp_band_relations
    ADD CONSTRAINT gp_band_relations_gp_fk FOREIGN KEY (guitar_player_id) REFERENCES guitar_players(id);


--
-- Name: guitar_players guitar_players_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY guitar_players
    ADD CONSTRAINT guitar_players_country_id_fkey FOREIGN KEY (country_id) REFERENCES countries(id);


--
-- Name: guitar_players guitar_players_label_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY guitar_players
    ADD CONSTRAINT guitar_players_label_id_fkey FOREIGN KEY (label_id) REFERENCES labels(id);


--
-- PostgreSQL database dump complete
--

