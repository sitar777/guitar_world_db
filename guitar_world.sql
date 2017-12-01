DROP DATABASE IF EXISTS guitar_world;
CREATE DATABASE guitar_world;
GRANT ALL PRIVILEGES ON DATABASE guitar_world TO postgres;
\c guitar_world



CREATE TABLE ab_relations (
    guitar_player_id integer NOT NULL,
    brand_id integer NOT NULL,
    id serial);
    
    ALTER TABLE ab_relations OWNER TO postgres;

CREATE TABLE ag_relations (
    guitar_player_id integer NOT NULL,
    genre_id integer NOT NULL,
    id serial);

ALTER TABLE ag_relations OWNER TO postgres;

CREATE TABLE bands (
    band_name character varying(256) NOT NULL,
    is_playing boolean NOT NULL,
    hometown character varying(256),
    one_man_band boolean NOT NULL,
    id serial);

ALTER TABLE bands OWNER TO postgres;

CREATE TABLE countries (
    country_name character varying(256) NOT NULL,
    id serial);
    ALTER TABLE countries OWNER TO postgres;

CREATE TABLE genres (
    genre_name character varying(256) NOT NULL,
    country_of_origin_id integer NOT NULL,
    year_of_occurrence smallint NOT NULL,
    brightest_band_id integer NOT NULL,
    id serial,
    CONSTRAINT genre_year_of_occurrence_check CHECK ((year_of_occurrence > 1850)));
    
    ALTER TABLE genres OWNER TO postgres;

CREATE TABLE gp_band_relations (
    band_id integer NOT NULL,
    guitar_player_id integer NOT NULL,
    id serial);
    
    ALTER TABLE gp_band_relations OWNER TO postgres;

CREATE TABLE guitar_brands (
    brand_name character varying(256) NOT NULL,
    id serial);
    
    ALTER TABLE guitar_brands OWNER TO postgres;

CREATE TABLE guitar_players (
    first_name character varying(256) NOT NULL,
    last_name character varying(256),
    birth_date date NOT NULL,
    death_date date,
    country_id integer NOT NULL,
    label_id integer NOT NULL,
    id serial,
    CONSTRAINT birth_death_date CHECK ((birth_date < death_date)));
    
    ALTER TABLE guitar_players OWNER TO postgres;

CREATE TABLE labels (
    label_name character varying(256) NOT NULL,
    id serial);
    
    ALTER TABLE labels OWNER TO postgres;

INSERT INTO ab_relations (guitar_player_id, brand_id) VALUES
(15,	1	),
(3,	    2	),
(12,	2	),
(14,	2	),
(1,	    3	),
(2,	    3	),
(4,	    3	),
(5,   	3	),
(8, 	3	),
(9, 	3	),
(11,	3	),
(12,	3	),
(13,	3	),
(1, 	4	),
(2, 	4	),
(4, 	4	),
(6, 	4	),
(7, 	4	),
(11,	4	),
(12,	4	),
(8, 	5	),
(10,	5	),
(11,	5	),
(10,	6	),
(8, 	7	),
(3, 	8	),
(1, 	9	),
(4, 	9	);

INSERT INTO ag_relations (guitar_player_id, genre_id) VALUES
(1, 	1	),
(1, 	2	),
(1, 	3	),
(2, 	3	),
(2, 	2	),
(2, 	4	),
(3, 	3	),
(3, 	5	),
(4, 	3	),
(4, 	2	),
(4, 	1	),
(4, 	6	),
(5, 	7	),
(5, 	3	),
(5, 	5	),
(5, 	2	),
(6, 	6	),
(6, 	2	),
(7, 	4	),
(7, 	1	),
(7, 	2	),
(7, 	8	),
(8, 	9	),
(8, 	5	),
(8, 	3	),
(9, 	3	),
(9, 	2	),
(9, 	10	),
(10,	9	),
(10,	5	),
(10,	11	),
(11,	3	),
(11,	5	),
(12,	3	),
(12,	5	),
(12,	4	),
(13,	10	),
(13,	6	),
(13,	2	),
(14,	4	),
(14,	3	),
(14,	5	),
(14,	8	),
(14,	13	),
(15,	2	),
(15,	14	);

INSERT INTO bands (band_name, is_playing, hometown, one_man_band) VALUES
('The Jimi Hendrix Experience'	,FALSE,	'London'	,FALSE	),
('Led Zeppelin'	        ,FALSE,	'London'	,FALSE	),
('The Youngbirds'	        ,TRUE,	'London'	,FALSE	),
('Van Halen'	                ,TRUE,	'Pasadena'	,TRUE	),
('Cream'                ,FALSE,	'London'	,FALSE	),
('Eric Clapton'	        ,TRUE,	'Surrey'	,TRUE	),
('Guns`N Roses'	        ,TRUE,	'Los-Angeles'	,FALSE	),
('Slash`s Snakepit'	        ,FALSE,	'Los-Angeles'	,TRUE	),
('Double Trouble'	        ,TRUE,	'Austin'	,FALSE	),
('Pink Floyd'                ,FALSE,	'London'	,FALSE	),
('Metallica'	                ,TRUE,	'Los-Angeles'	,FALSE	),
('Exodus'                ,TRUE, 	'San-Francisco'	,FALSE	),
('AC/DC'	                ,TRUE,	'Sydney'	,FALSE	),
('Pantera'	                ,FALSE,	'Arlington'	,FALSE	),
('Damageplan'	                ,FALSE,	'Dallas'	,TRUE	),
('Ozzy Osbourne'	        ,TRUE,	'Birmingham'	,TRUE	),
('Quet Riot'	                ,TRUE,	'Los-Angeles'	,TRUE	),
('Smile'	                ,FALSE,	'London'	,FALSE	),
('Queen'	                ,TRUE,	'London'	,FALSE	),
('Chuck Berry'	                ,FALSE,	'Wentzwille'	,TRUE	),
('Whitesnake'	                ,FALSE,	'Middlesbrough'	,FALSE	),
('G3'	                       ,FALSE,	    NULL            ,TRUE	),
('Santana'                ,TRUE,	'Jalisco'	,TRUE),
('The Beatles'	                ,FALSE,	'Liverpool'	,FALSE	),
('Judas Priest'	        ,TRUE,	'Birmingham'	,FALSE	),
('B.B.King'	                ,FALSE,	'Las-Vegas'	,TRUE	),
('David Bowie'	                ,FALSE,	'Manhattan'	,TRUE	),
('Elvis Presley'	        ,FALSE,	'Tupelo'	,TRUE	),
('Ornette Coleman'	        ,FALSE,	'Manhattan'	,TRUE	),
('Bon Jovi'	                ,TRUE,	'New-Jersey'	,FALSE	),
('Steve Vai'	                ,TRUE,	'New-York'	,TRUE	);

INSERT INTO countries (country_name) VALUES
('USA'	                ),
('Great Britain'	),
('Australia'	        );

INSERT INTO genres (genre_name, country_of_origin_id, year_of_occurrence, brightest_band_id) VALUES
('Psychedelic Rock'	,2,	1960,	24	),
('Blues Rock'	        ,2,	1960,	6	),
('Hard Rock'	        ,2,	1970,	13	),
('Progresiive Rock'	,2,	1960,	10	),
('Heavy Metal'	        ,2,	1970,	25	),
('Blues'	        ,1,	1880,	26	),
('Glam Metal'	        ,1,	1983,	30	),
('Experimental Rock'	,1,	1960,	27	),
('Trash Metal'	        ,1,	1980,	11	),
('Rock and Roll'	,1,	1950,	28	),
('Groove Metal'	        ,1,	1990,	14	),
('Rhythm and Blues'	,1,	1940,	20	),
('Instrumental Rock'	,1,	1950,	31	),
('Free Jazz'           ,1,	1960,	29	);

INSERT INTO gp_band_relations (band_id, guitar_player_id) VALUES
(1,	1	),
(2,	2	),
(3,	2	),
(4,	3	),
(3,	4	),
(5,	4	),
(6,	4	),
(7,	5	),
(8,	5	),
(9,	6	),
(10,	7	),
(11,	8	),
(12,	8	),
(13,	9	),
(14,	10	),
(15,	10	),
(16,	11	),
(17,	11	),
(18,	12	),
(19,	12	),
(20,	13	),
(22,	13	),
(16,	14	),
(21,	14	),
(23,	15	);

INSERT INTO guitar_brands (brand_name) VALUES
('PRS'),
('Ibanez'),
('Gibson'),
('Fender'),
('Jackson'),
('Dean'),
('ESP'),
('EVH'),
('Gretsch');	

INSERT INTO guitar_players (first_name, last_name, birth_date, death_date, country_id, label_id) VALUES
('Jimi'	        ,'Hendrix'	 , '1942-11-27'	,'1970-09-18'	 ,1	,1	),
('Jimmy'	,'Page'          , '1944-01-09'	,	NULL   ,2	,2	),
('Edward'	,'van Halen'	 , '1955-01-26',	NULL     ,1	,3	),
('Eric'         ,'Clapton'	 , '1945-03-30'	,	NULL     ,2	,3	),
('Slash'	,      NULL          , '1965-07-23'	,	NULL     ,1	,4	),
('Stevie'	,'Vaughan'	 , '1954-10-03'	,'1990-08-27',	1	,5      ),
('David' 	,'Guilmour'	 , '1946-03-06'	,	NULL   , 2	,6	),
('Kirk'	        ,'Hammett'       , '1962-11-18'	,	NULL   ,1	,3	),
('Angus'	,'Young'         , '1955-03-31'	,	NULL    ,3	,6	),
('Darell'	,'Dimebag'       , '1966-08-20'	,'2004-11-08',	 1	,7	),
('Randy'        ,'Rhoads'        , '1965-11-06'	,'1982-03-19',	1	,5	),
('Brian'	,'May'           , '1947-07-19'	,	   NULL     ,2,8	),
('Chuck'        ,'Berry'         ,'1926-10-18'	,'2017-03-18',	1	,9	),
('Steve'        ,'Vai'           ,'1960-07-06'	,	  NULL    ,1	,10	),
('Carlos'	,'Santana'       ,'1947-07-20'	,	  NULL     ,1	,11	);

INSERT INTO labels (label_name) VALUES
('Reprise Records'),	
('Swan Song'),	
('Warner Bros'),	
('RCA'),
('Epic Records'),	
('EMI'),
('Atco Records'),	
('Parlophone'),	
('Chess'),
('Favored Nations'),
('Columbia Records');

ALTER TABLE ab_relations
    ADD CONSTRAINT ab_relations_pk PRIMARY KEY (id);

ALTER TABLE ag_relations
    ADD CONSTRAINT ag_relations_pkey PRIMARY KEY (id);

ALTER TABLE bands
    ADD CONSTRAINT bands_pk PRIMARY KEY (id);

ALTER TABLE countries
    ADD CONSTRAINT countries_pk PRIMARY KEY (id);

ALTER TABLE genres
    ADD CONSTRAINT genre_pk PRIMARY KEY (id);

ALTER TABLE gp_band_relations
    ADD CONSTRAINT gp_band_relations_pk PRIMARY KEY (id);

ALTER TABLE guitar_brands
    ADD CONSTRAINT guitar_brands_pk PRIMARY KEY (id);

ALTER TABLE guitar_players
    ADD CONSTRAINT guitar_players_pk PRIMARY KEY (id);

ALTER TABLE labels
    ADD CONSTRAINT labels_pk PRIMARY KEY (id);

ALTER TABLE ab_relations
    ADD CONSTRAINT unique_ab_relation UNIQUE (guitar_player_id, brand_id);

ALTER TABLE ag_relations
    ADD CONSTRAINT unique_ag_relation UNIQUE (guitar_player_id, genre_id);

ALTER TABLE guitar_brands
    ADD CONSTRAINT unique_brand_name UNIQUE (brand_name);

ALTER TABLE countries
    ADD CONSTRAINT unique_country_name UNIQUE (country_name);

ALTER TABLE genres
    ADD CONSTRAINT unique_genre_name UNIQUE (genre_name);

ALTER TABLE gp_band_relations
    ADD CONSTRAINT unique_gp_band_relation UNIQUE (guitar_player_id, band_id);

ALTER TABLE labels
    ADD CONSTRAINT unique_label_name UNIQUE (label_name);

CREATE INDEX band_name_idx ON bands USING btree (band_name text_pattern_ops);

CREATE INDEX birth_date_idx ON guitar_players USING btree (birth_date);

CREATE INDEX brightest_band_id_idx ON genres USING btree (brightest_band_id);

CREATE INDEX country_id_idx ON guitar_players USING btree (country_id);

CREATE INDEX country_name_idx ON countries USING btree (country_name text_pattern_ops);

CREATE INDEX death_date_idx ON guitar_players USING btree (death_date NULLS FIRST);

CREATE INDEX first_name_idx ON guitar_players USING btree (first_name text_pattern_ops);

CREATE INDEX genre_name_idx ON genres USING btree (genre_name text_pattern_ops);

CREATE INDEX hometown_indx ON bands USING btree (hometown);

CREATE INDEX is_playing_idx ON bands USING btree (is_playing) WHERE is_playing;

CREATE INDEX label_id_idx ON guitar_players USING btree (label_id);

CREATE INDEX label_name_idx ON labels USING btree (label_name text_pattern_ops);

CREATE INDEX last_name_idx ON guitar_players USING btree (last_name text_pattern_ops);

CREATE INDEX one_man_band_idx ON bands USING btree (one_man_band) WHERE (NOT one_man_band);

ALTER TABLE ab_relations
    ADD CONSTRAINT ab_relations_brands_fk FOREIGN KEY (brand_id) REFERENCES guitar_brands(id) ON UPDATE CASCADE;

ALTER TABLE ab_relations
    ADD CONSTRAINT ab_relations_gp_fk FOREIGN KEY (guitar_player_id) REFERENCES guitar_players(id) ON UPDATE CASCADE;

ALTER TABLE ag_relations
    ADD CONSTRAINT ag_relations_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES genres(id);

ALTER TABLE ag_relations
    ADD CONSTRAINT ag_relations_guitar_player_id_fkey FOREIGN KEY (guitar_player_id) REFERENCES guitar_players(id);

ALTER TABLE genres
    ADD CONSTRAINT genres_brightest_band_id_fkey FOREIGN KEY (brightest_band_id) REFERENCES bands(id) ON UPDATE CASCADE;

ALTER TABLE genres
    ADD CONSTRAINT genres_country_of_origin_id_fkey FOREIGN KEY (country_of_origin_id) REFERENCES countries(id);

ALTER TABLE gp_band_relations
    ADD CONSTRAINT gp_band_relations_gp_fk FOREIGN KEY (guitar_player_id) REFERENCES guitar_players(id) ON UPDATE CASCADE;

ALTER TABLE guitar_players
    ADD CONSTRAINT guitar_players_country_id_fkey FOREIGN KEY (country_id) REFERENCES countries(id) ON UPDATE CASCADE;

ALTER TABLE guitar_players
    ADD CONSTRAINT guitar_players_label_id_fkey FOREIGN KEY (label_id) REFERENCES labels(id) ON UPDATE CASCADE;


