--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

-- Started on 2023-07-13 15:56:55 CEST

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

--
-- TOC entry 3525 (class 1262 OID 16385)
-- Name: iberu; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE iberu WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE iberu OWNER TO postgres;

\connect iberu

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
-- TOC entry 213 (class 1259 OID 18998)
-- Name: acqua; Type: TABLE; Schema: public; Owner: rfabbian
--

CREATE TABLE public.acqua (
    id_acqua integer NOT NULL,
    ml smallint NOT NULL
);


ALTER TABLE public.acqua OWNER TO rfabbian;

--
-- TOC entry 215 (class 1259 OID 19018)
-- Name: alimento; Type: TABLE; Schema: public; Owner: rfabbian
--

CREATE TABLE public.alimento (
    id_alimento integer NOT NULL,
    nome_alimento character varying(50) NOT NULL,
    calorie_alimento smallint NOT NULL,
    proteine_alimento numeric(6,2) NOT NULL,
    carboidrati_alimento numeric(6,2) NOT NULL,
    fibre smallint,
    zuccheri smallint,
    grassi_alimento numeric(6,2) NOT NULL,
    colesterolo smallint,
    saturi smallint,
    monoinsaturi smallint,
    polinsaturi smallint,
    sale_alimento smallint
);


ALTER TABLE public.alimento OWNER TO rfabbian;

--
-- TOC entry 221 (class 1259 OID 19090)
-- Name: allenamento; Type: TABLE; Schema: public; Owner: rfabbian
--

CREATE TABLE public.allenamento (
    id_allenamento integer NOT NULL,
    id_utente integer NOT NULL,
    data_allenamento timestamp without time zone,
    calorie_consumate smallint,
    battito_allenamento smallint,
    durata_allenamento numeric(5,2),
    intensita smallint,
    gruppo_muscolare character varying(50),
    tipologia_allenamento smallint
);


ALTER TABLE public.allenamento OWNER TO rfabbian;

--
-- TOC entry 219 (class 1259 OID 19060)
-- Name: appartenente; Type: TABLE; Schema: public; Owner: rfabbian
--

CREATE TABLE public.appartenente (
    nome_dieta character varying(30) NOT NULL,
    id_alimento integer NOT NULL
);


ALTER TABLE public.appartenente OWNER TO rfabbian;

--
-- TOC entry 220 (class 1259 OID 19075)
-- Name: assume; Type: TABLE; Schema: public; Owner: rfabbian
--

CREATE TABLE public.assume (
    id_acqua integer NOT NULL,
    id_utente integer NOT NULL
);


ALTER TABLE public.assume OWNER TO rfabbian;

--
-- TOC entry 222 (class 1259 OID 19100)
-- Name: cardio; Type: TABLE; Schema: public; Owner: rfabbian
--

CREATE TABLE public.cardio (
    id_allenamento integer NOT NULL,
    durata_aerobico integer,
    durata_anaerobico integer,
    distanza integer,
    dislivello integer
);


ALTER TABLE public.cardio OWNER TO rfabbian;

--
-- TOC entry 223 (class 1259 OID 19110)
-- Name: cardiovascolare; Type: TABLE; Schema: public; Owner: rfabbian
--

CREATE TABLE public.cardiovascolare (
    nome_movimento character varying(50) NOT NULL,
    spiegazione_esercizio character varying(250),
    tipologia_esercizio_cardio integer,
    calorie_100m integer,
    recupero integer,
    distanza_minima integer
);


ALTER TABLE public.cardiovascolare OWNER TO rfabbian;

--
-- TOC entry 226 (class 1259 OID 19135)
-- Name: composto; Type: TABLE; Schema: public; Owner: rfabbian
--

CREATE TABLE public.composto (
    id_allenamento integer NOT NULL,
    nome_esercizio character varying(50) NOT NULL,
    set_allenamento integer,
    ripetizioni integer
);


ALTER TABLE public.composto OWNER TO rfabbian;

--
-- TOC entry 218 (class 1259 OID 19045)
-- Name: contenente; Type: TABLE; Schema: public; Owner: rfabbian
--

CREATE TABLE public.contenente (
    nome_ricetta character varying(50) NOT NULL,
    id_alimento integer NOT NULL,
    quantita_ingrediente smallint
);


ALTER TABLE public.contenente OWNER TO rfabbian;

--
-- TOC entry 216 (class 1259 OID 19023)
-- Name: costituito; Type: TABLE; Schema: public; Owner: rfabbian
--

CREATE TABLE public.costituito (
    id_pasto integer NOT NULL,
    id_alimento integer NOT NULL,
    quantita_alimento integer
);


ALTER TABLE public.costituito OWNER TO rfabbian;

--
-- TOC entry 211 (class 1259 OID 18976)
-- Name: dieta; Type: TABLE; Schema: public; Owner: rfabbian
--

CREATE TABLE public.dieta (
    nome_dieta character varying(30) NOT NULL,
    descrizione_dieta character varying(500),
    moltiplicatore_calorie numeric(2,1) NOT NULL,
    moltiplicatore_proteine numeric(2,1) NOT NULL,
    moltiplicatore_carboidrati numeric(2,1) NOT NULL,
    moltiplicatore_grassi numeric(2,1) NOT NULL,
    moltiplicatore_acqua numeric(2,1) NOT NULL
);


ALTER TABLE public.dieta OWNER TO rfabbian;

--
-- TOC entry 228 (class 1259 OID 19160)
-- Name: fase; Type: TABLE; Schema: public; Owner: rfabbian
--

CREATE TABLE public.fase (
    tipologia_fase character varying(50) NOT NULL,
    descrizione_fase character varying(5000)
);


ALTER TABLE public.fase OWNER TO rfabbian;

--
-- TOC entry 224 (class 1259 OID 19115)
-- Name: formato; Type: TABLE; Schema: public; Owner: rfabbian
--

CREATE TABLE public.formato (
    nome_movimento character varying(50) NOT NULL,
    id_allenamento integer NOT NULL
);


ALTER TABLE public.formato OWNER TO rfabbian;

--
-- TOC entry 214 (class 1259 OID 19003)
-- Name: pasto; Type: TABLE; Schema: public; Owner: rfabbian
--

CREATE TABLE public.pasto (
    id_pasto integer NOT NULL,
    id_utente integer NOT NULL,
    data_ora_pasto timestamp without time zone,
    calorie_pasto smallint NOT NULL,
    proteine_pasto smallint NOT NULL,
    carboidrati_pasto smallint NOT NULL,
    grassi_pasto smallint NOT NULL,
    id_acqua integer
);


ALTER TABLE public.pasto OWNER TO rfabbian;

--
-- TOC entry 225 (class 1259 OID 19130)
-- Name: pesistica; Type: TABLE; Schema: public; Owner: rfabbian
--

CREATE TABLE public.pesistica (
    nome_esercizio character varying(50) NOT NULL,
    recupero integer,
    descrizione_esercizio character varying(250),
    calorie_ripetizione integer NOT NULL,
    set_consigliati integer,
    ripetizioni_consigliate integer
);


ALTER TABLE public.pesistica OWNER TO rfabbian;

--
-- TOC entry 210 (class 1259 OID 18966)
-- Name: peso; Type: TABLE; Schema: public; Owner: rfabbian
--

CREATE TABLE public.peso (
    id_utente integer NOT NULL,
    data_misurazione date NOT NULL,
    peso numeric(6,2) NOT NULL,
    percentuale_massa_grassa numeric(4,2),
    percentuale_massa_magra numeric(4,2)
);


ALTER TABLE public.peso OWNER TO rfabbian;

--
-- TOC entry 217 (class 1259 OID 19038)
-- Name: ricetta; Type: TABLE; Schema: public; Owner: rfabbian
--

CREATE TABLE public.ricetta (
    nome_ricetta character varying(50) NOT NULL,
    peso_finale numeric(6,2),
    durata_preparazione time without time zone,
    durata_cottura time without time zone,
    procedimento character varying(500),
    difficolta smallint
);


ALTER TABLE public.ricetta OWNER TO rfabbian;

--
-- TOC entry 230 (class 1259 OID 19182)
-- Name: risveglio; Type: TABLE; Schema: public; Owner: rfabbian
--

CREATE TABLE public.risveglio (
    id_utente integer NOT NULL,
    data_ora_riposo timestamp without time zone NOT NULL,
    orario_risveglio timestamp without time zone NOT NULL,
    durata_risveglio time without time zone
);


ALTER TABLE public.risveglio OWNER TO rfabbian;

--
-- TOC entry 212 (class 1259 OID 18983)
-- Name: segue; Type: TABLE; Schema: public; Owner: rfabbian
--

CREATE TABLE public.segue (
    id_utente integer NOT NULL,
    nome_dieta character varying(30) NOT NULL,
    grassi_dieta smallint NOT NULL,
    carboidrati_dieta smallint NOT NULL,
    acqua_dieta smallint NOT NULL,
    peso_obiettivo smallint NOT NULL,
    tipologia_dieta smallint NOT NULL,
    calorie_dieta smallint NOT NULL,
    proteine_dieta smallint NOT NULL
);


ALTER TABLE public.segue OWNER TO rfabbian;

--
-- TOC entry 227 (class 1259 OID 19150)
-- Name: sonno; Type: TABLE; Schema: public; Owner: rfabbian
--

CREATE TABLE public.sonno (
    id_utente integer NOT NULL,
    data_ora_riposo timestamp without time zone NOT NULL,
    qualita smallint,
    durata_riposo integer
);


ALTER TABLE public.sonno OWNER TO rfabbian;

--
-- TOC entry 229 (class 1259 OID 19167)
-- Name: suddiviso; Type: TABLE; Schema: public; Owner: rfabbian
--

CREATE TABLE public.suddiviso (
    id_suddiviso integer NOT NULL,
    data_ora_riposo timestamp without time zone NOT NULL,
    id_utente integer NOT NULL,
    tipologia_fase character varying(50),
    battito_fase integer,
    durata_fase integer
);


ALTER TABLE public.suddiviso OWNER TO rfabbian;

--
-- TOC entry 209 (class 1259 OID 18959)
-- Name: utente; Type: TABLE; Schema: public; Owner: rfabbian
--

CREATE TABLE public.utente (
    id_utente integer NOT NULL,
    email character varying(50) NOT NULL,
    nome character varying(50) NOT NULL,
    cognome character varying(50) NOT NULL,
    eta smallint NOT NULL,
    genere boolean NOT NULL,
    altezza numeric(5,2) NOT NULL,
    volume_attivita smallint
);


ALTER TABLE public.utente OWNER TO rfabbian;

--
-- TOC entry 3502 (class 0 OID 18998)
-- Dependencies: 213
-- Data for Name: acqua; Type: TABLE DATA; Schema: public; Owner: rfabbian
--

INSERT INTO public.acqua VALUES (1, 250);
INSERT INTO public.acqua VALUES (2, 500);
INSERT INTO public.acqua VALUES (3, 750);
INSERT INTO public.acqua VALUES (4, 1000);
INSERT INTO public.acqua VALUES (5, 200);
INSERT INTO public.acqua VALUES (6, 150);
INSERT INTO public.acqua VALUES (7, 800);
INSERT INTO public.acqua VALUES (8, 350);
INSERT INTO public.acqua VALUES (9, 600);
INSERT INTO public.acqua VALUES (10, 400);
INSERT INTO public.acqua VALUES (11, 900);
INSERT INTO public.acqua VALUES (12, 250);
INSERT INTO public.acqua VALUES (13, 700);
INSERT INTO public.acqua VALUES (14, 450);
INSERT INTO public.acqua VALUES (15, 300);
INSERT INTO public.acqua VALUES (16, 550);
INSERT INTO public.acqua VALUES (17, 850);
INSERT INTO public.acqua VALUES (18, 500);
INSERT INTO public.acqua VALUES (19, 950);
INSERT INTO public.acqua VALUES (20, 200);
INSERT INTO public.acqua VALUES (21, 400);
INSERT INTO public.acqua VALUES (22, 750);
INSERT INTO public.acqua VALUES (23, 350);
INSERT INTO public.acqua VALUES (24, 600);
INSERT INTO public.acqua VALUES (25, 300);
INSERT INTO public.acqua VALUES (26, 500);
INSERT INTO public.acqua VALUES (27, 900);
INSERT INTO public.acqua VALUES (28, 250);
INSERT INTO public.acqua VALUES (29, 700);
INSERT INTO public.acqua VALUES (30, 400);


--
-- TOC entry 3504 (class 0 OID 19018)
-- Dependencies: 215
-- Data for Name: alimento; Type: TABLE DATA; Schema: public; Owner: rfabbian
--

INSERT INTO public.alimento VALUES (1, 'Mace Ground', 729, 32.20, 7.90, NULL, NULL, 63.20, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (2, 'Fenngreek Seed', 779, 76.80, 62.50, NULL, NULL, 24.60, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (3, 'Bread - Calabrese Baguette', 347, 8.60, 48.70, NULL, NULL, 13.10, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (4, 'Grapes - Green', 617, 32.50, 82.50, NULL, NULL, 17.40, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (5, 'Cheese - Parmigiano Reggiano', 574, 46.60, 9.70, NULL, NULL, 38.70, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (6, 'Wine - Ruffino Chianti Classico', 1069, 81.30, 60.50, NULL, NULL, 55.70, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (7, 'Wine - Bourgogne 2002, La', 347, 27.10, 35.00, NULL, NULL, 11.00, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (8, 'Wine - Beringer Founders Estate', 1283, 40.80, 96.10, NULL, NULL, 81.70, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (9, 'Vinegar - Red Wine', 1277, 85.70, 46.90, NULL, NULL, 82.90, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (10, 'Potatoes - Yukon Gold 5 Oz', 968, 54.00, 21.60, NULL, NULL, 73.90, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (11, 'Beef - Roasted, Cooked', 232, 43.70, 0.80, NULL, NULL, 6.00, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (12, 'Sauce - Apple, Unsweetened', 1283, 20.30, 95.60, NULL, NULL, 91.00, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (13, 'Beer - Mcauslan Apricot', 1088, 16.60, 41.00, NULL, NULL, 95.30, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (14, 'Ecolab - Lime - A - Way 4/4 L', 1347, 93.70, 99.70, NULL, NULL, 63.70, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (15, 'Passion Fruit', 1145, 65.90, 15.80, NULL, NULL, 90.90, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (16, 'Squid - U - 10 Thailand', 977, 3.50, 22.60, NULL, NULL, 97.00, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (17, 'Pastry - Apple Muffins - Mini', 847, 45.10, 51.60, NULL, NULL, 51.10, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (18, 'Beans - Yellow', 412, 20.40, 9.10, NULL, NULL, 32.70, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (19, 'Cranberries - Fresh', 361, 1.10, 53.30, NULL, NULL, 15.90, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (20, 'Tarragon - Fresh', 1012, 18.90, 69.60, NULL, NULL, 73.10, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (21, 'Parasol Pick Stir Stick', 1033, 66.40, 30.10, NULL, NULL, 71.90, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (22, 'Raspberries - Fresh', 813, 96.50, 35.50, NULL, NULL, 31.70, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (23, 'Wine - Touraine Azay - Le - Rideau', 697, 45.70, 65.50, NULL, NULL, 28.00, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (24, 'Coconut - Whole', 622, 63.20, 87.90, NULL, NULL, 2.00, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (25, 'Lemon Pepper', 338, 25.00, 53.30, NULL, NULL, 2.80, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (26, 'Muffin Hinge Container 6', 214, 42.60, 6.70, NULL, NULL, 1.90, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (27, 'Eggplant - Asian', 1037, 48.60, 13.20, NULL, NULL, 87.80, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (28, 'Water - Perrier', 609, 37.30, 80.30, NULL, NULL, 15.40, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (29, 'Cheese - Brie, Cups 125g', 441, 21.00, 11.50, NULL, NULL, 34.60, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (30, 'Versatainer Nc - 9388', 1520, 82.20, 87.10, NULL, NULL, 93.60, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (31, 'Beans - Black Bean, Preserved', 1238, 89.70, 79.80, NULL, NULL, 62.20, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (32, 'Coffee - Decaffeinato Coffee', 734, 80.60, 2.70, NULL, NULL, 44.50, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (33, 'Scampi Tail', 1140, 88.20, 96.60, NULL, NULL, 44.50, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (34, 'Mustard - Dry, Powder', 510, 55.30, 62.40, NULL, NULL, 4.30, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (35, 'Cheese - Mozzarella, Shredded', 968, 92.80, 62.70, NULL, NULL, 38.40, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (36, 'Vector Energy Bar', 1196, 1.30, 99.80, NULL, NULL, 87.90, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (37, 'Wine - Placido Pinot Grigo', 1275, 92.50, 96.00, NULL, NULL, 57.90, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (38, 'Bowl 12 Oz - Showcase 92012', 269, 29.90, 23.90, NULL, NULL, 6.00, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (39, 'Lemon Grass', 475, 64.80, 15.90, NULL, NULL, 16.90, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (40, 'Versatainer Nc - 8288', 1022, 0.20, 72.70, NULL, NULL, 81.20, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (41, 'Ice Cream - Super Sandwich', 1169, 40.50, 37.80, NULL, NULL, 95.10, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (42, 'Sugar - Monocystal / Rock', 1192, 2.70, 74.50, NULL, NULL, 98.10, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (43, 'Chicken - Whole Roasting', 740, 91.70, 77.00, NULL, NULL, 7.20, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (44, 'Cornish Hen', 1358, 44.30, 84.10, NULL, NULL, 93.80, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (45, 'Tomatoes - Vine Ripe, Yellow', 923, 77.00, 20.50, NULL, NULL, 59.20, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (46, 'Pasta - Lasagne, Fresh', 590, 4.10, 40.50, NULL, NULL, 45.70, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (47, 'Bar Mix - Lemon', 152, 10.30, 2.30, NULL, NULL, 11.30, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (48, 'Cheese - Provolone', 1233, 87.20, 15.00, NULL, NULL, 91.60, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (49, 'Rappini - Andy Boy', 792, 43.50, 80.40, NULL, NULL, 32.90, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (50, 'Flour - Whole Wheat', 1023, 0.90, 78.40, NULL, NULL, 78.40, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (51, 'Onions - Green', 1044, 86.90, 80.80, NULL, NULL, 41.50, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (52, 'Muffin Orange Individual', 585, 16.40, 18.50, NULL, NULL, 49.50, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (53, 'Compound - Orange', 906, 74.70, 54.00, NULL, NULL, 43.50, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (54, 'Smoked Paprika', 1312, 74.90, 99.60, NULL, NULL, 68.20, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (55, 'Ice Cream - Strawberry', 445, 63.80, 34.20, NULL, NULL, 5.90, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (56, 'Muffin - Mix - Bran And Maple 15l', 730, 91.40, 8.00, NULL, NULL, 36.90, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (57, 'Olives - Green, Pitted', 889, 62.90, 66.80, NULL, NULL, 41.10, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (58, 'Oil - Peanut', 871, 23.00, 78.20, NULL, NULL, 51.80, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (59, 'Papayas', 1048, 70.70, 45.30, NULL, NULL, 64.90, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.alimento VALUES (60, 'Beef Ground Medium', 579, 83.80, 22.20, NULL, NULL, 17.20, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 3510 (class 0 OID 19090)
-- Dependencies: 221
-- Data for Name: allenamento; Type: TABLE DATA; Schema: public; Owner: rfabbian
--

INSERT INTO public.allenamento VALUES (1, 1, '2023-06-20 09:00:00', 300, 120, 1.50, 2, 'Gambe', 1);
INSERT INTO public.allenamento VALUES (2, 1, '2023-06-20 16:30:00', 450, 135, 1.80, 3, 'Petto', 2);
INSERT INTO public.allenamento VALUES (3, 1, '2023-06-21 08:15:00', 250, 115, 1.20, 1, 'Schiena', 3);
INSERT INTO public.allenamento VALUES (4, 1, '2023-06-21 17:45:00', 400, 130, 1.60, 2, 'Spalle', 2);
INSERT INTO public.allenamento VALUES (5, 1, '2023-06-22 10:30:00', 350, 125, 1.40, 3, 'Braccia', 1);
INSERT INTO public.allenamento VALUES (6, 1, '2023-06-22 18:00:00', 500, 140, 1.90, 2, 'Gambe', 2);
INSERT INTO public.allenamento VALUES (7, 1, '2023-06-23 09:45:00', 300, 120, 1.50, 1, 'Petto', 3);
INSERT INTO public.allenamento VALUES (8, 1, '2023-06-23 17:15:00', 450, 135, 1.80, 3, 'Schiena', 1);
INSERT INTO public.allenamento VALUES (9, 2, '2023-06-24 08:30:00', 250, 115, 1.20, 2, 'Spalle', 2);
INSERT INTO public.allenamento VALUES (10, 2, '2023-06-24 16:00:00', 400, 130, 1.60, 3, 'Braccia', 3);
INSERT INTO public.allenamento VALUES (11, 2, '2023-06-25 11:00:00', 350, 125, 1.40, 2, 'Gambe', 1);
INSERT INTO public.allenamento VALUES (12, 2, '2023-06-25 18:30:00', 500, 140, 1.90, 1, 'Petto', 2);
INSERT INTO public.allenamento VALUES (13, 2, '2023-06-26 09:15:00', 300, 120, 1.50, 3, 'Schiena', 3);
INSERT INTO public.allenamento VALUES (14, 2, '2023-06-26 16:45:00', 450, 135, 1.80, 2, 'Spalle', 1);
INSERT INTO public.allenamento VALUES (15, 12, '2023-06-27 08:00:00', 250, 115, 1.20, 1, 'Braccia', 2);
INSERT INTO public.allenamento VALUES (16, 2, '2023-06-27 15:30:00', 400, 130, 1.60, 3, 'Gambe', 3);
INSERT INTO public.allenamento VALUES (17, 11, '2023-06-28 10:15:00', 350, 125, 1.40, 2, 'Petto', 1);
INSERT INTO public.allenamento VALUES (18, 2, '2023-06-28 17:45:00', 500, 140, 1.90, 1, 'Schiena', 2);
INSERT INTO public.allenamento VALUES (19, 2, '2023-06-29 09:30:00', 300, 120, 1.50, 3, 'Spalle', 3);
INSERT INTO public.allenamento VALUES (20, 2, '2023-06-29 17:00:00', 450, 135, 1.80, 2, 'Braccia', 1);
INSERT INTO public.allenamento VALUES (21, 2, '2023-06-30 10:45:00', 250, 115, 1.20, 1, 'Gambe', 2);
INSERT INTO public.allenamento VALUES (22, 2, '2023-06-30 18:15:00', 400, 130, 1.60, 3, 'Petto', 3);
INSERT INTO public.allenamento VALUES (23, 9, '2023-07-01 09:00:00', 350, 125, 1.40, 2, 'Schiena', 1);
INSERT INTO public.allenamento VALUES (24, 3, '2023-07-01 16:30:00', 500, 140, 1.90, 1, 'Spalle', 2);
INSERT INTO public.allenamento VALUES (25, 3, '2023-07-02 08:45:00', 300, 120, 1.50, 3, 'Braccia', 3);
INSERT INTO public.allenamento VALUES (26, 3, '2023-07-02 17:15:00', 450, 135, 1.80, 2, 'Gambe', 1);
INSERT INTO public.allenamento VALUES (27, 3, '2023-07-03 10:00:00', 250, 115, 1.20, 1, 'Petto', 2);
INSERT INTO public.allenamento VALUES (28, 3, '2023-07-03 17:30:00', 400, 130, 1.60, 3, 'Schiena', 3);
INSERT INTO public.allenamento VALUES (29, 3, '2023-07-04 08:15:00', 350, 125, 1.40, 2, 'Spalle', 1);
INSERT INTO public.allenamento VALUES (30, 3, '2023-07-04 15:45:00', 500, 140, 1.90, 1, 'Braccia', 2);
INSERT INTO public.allenamento VALUES (31, 3, '2023-07-05 10:30:00', 300, 120, 1.50, 3, 'Gambe', 3);
INSERT INTO public.allenamento VALUES (32, 3, '2023-07-05 18:00:00', 450, 135, 1.80, 2, 'Petto', 1);
INSERT INTO public.allenamento VALUES (33, 3, '2023-07-06 09:45:00', 250, 115, 1.20, 1, 'Schiena', 2);
INSERT INTO public.allenamento VALUES (34, 1, '2023-07-06 17:15:00', 400, 130, 1.60, 3, 'Spalle', 3);
INSERT INTO public.allenamento VALUES (35, 2, '2023-07-07 08:30:00', 350, 125, 1.40, 2, 'Braccia', 1);
INSERT INTO public.allenamento VALUES (36, 3, '2023-07-07 16:00:00', 500, 140, 1.90, 1, 'Gambe', 2);
INSERT INTO public.allenamento VALUES (37, 4, '2023-07-08 11:00:00', 300, 120, 1.50, 3, 'Petto', 3);
INSERT INTO public.allenamento VALUES (38, 5, '2023-07-08 18:30:00', 450, 135, 1.80, 2, 'Schiena', 1);
INSERT INTO public.allenamento VALUES (39, 6, '2023-07-09 09:15:00', 250, 115, 1.20, 1, 'Spalle', 2);
INSERT INTO public.allenamento VALUES (40, 7, '2023-07-09 16:45:00', 400, 130, 1.60, 3, 'Braccia', 3);
INSERT INTO public.allenamento VALUES (41, 8, '2023-07-10 08:00:00', 350, 125, 1.40, 2, 'Gambe', 1);
INSERT INTO public.allenamento VALUES (42, 9, '2023-07-10 15:30:00', 500, 140, 1.90, 1, 'Petto', 2);
INSERT INTO public.allenamento VALUES (43, 10, '2023-07-11 10:15:00', 300, 120, 1.50, 3, 'Schiena', 3);
INSERT INTO public.allenamento VALUES (44, 11, '2023-07-11 17:45:00', 450, 135, 1.80, 2, 'Spalle', 1);
INSERT INTO public.allenamento VALUES (45, 12, '2023-07-12 08:00:00', 250, 115, 1.20, 1, 'Braccia', 2);
INSERT INTO public.allenamento VALUES (46, 12, '2023-07-12 15:30:00', 400, 130, 1.60, 3, 'Gambe', 3);
INSERT INTO public.allenamento VALUES (47, 12, '2023-07-13 10:15:00', 350, 125, 1.40, 2, 'Petto', 1);
INSERT INTO public.allenamento VALUES (48, 12, '2023-07-13 17:45:00', 500, 140, 1.90, 1, 'Schiena', 2);
INSERT INTO public.allenamento VALUES (49, 12, '2023-07-14 09:30:00', 300, 120, 1.50, 3, 'Spalle', 3);
INSERT INTO public.allenamento VALUES (50, 12, '2023-07-14 17:00:00', 450, 135, 1.80, 2, 'Braccia', 1);


--
-- TOC entry 3508 (class 0 OID 19060)
-- Dependencies: 219
-- Data for Name: appartenente; Type: TABLE DATA; Schema: public; Owner: rfabbian
--

INSERT INTO public.appartenente VALUES ('LowCarb', 3);
INSERT INTO public.appartenente VALUES ('LowCarb', 4);
INSERT INTO public.appartenente VALUES ('LowCarb', 5);
INSERT INTO public.appartenente VALUES ('LowCarb', 6);
INSERT INTO public.appartenente VALUES ('LowCarb', 7);
INSERT INTO public.appartenente VALUES ('LowCarb', 8);
INSERT INTO public.appartenente VALUES ('LowCarb', 9);
INSERT INTO public.appartenente VALUES ('LowCarb', 10);
INSERT INTO public.appartenente VALUES ('LowCarb', 11);
INSERT INTO public.appartenente VALUES ('LowCarb', 12);
INSERT INTO public.appartenente VALUES ('LowCarb', 13);
INSERT INTO public.appartenente VALUES ('LowCarb', 14);
INSERT INTO public.appartenente VALUES ('LowCarb', 15);
INSERT INTO public.appartenente VALUES ('LowCarb', 16);
INSERT INTO public.appartenente VALUES ('LowCarb', 17);
INSERT INTO public.appartenente VALUES ('LowCarb', 18);
INSERT INTO public.appartenente VALUES ('LowCarb', 19);
INSERT INTO public.appartenente VALUES ('LowCarb', 20);
INSERT INTO public.appartenente VALUES ('LowCarb', 21);
INSERT INTO public.appartenente VALUES ('LowCarb', 22);
INSERT INTO public.appartenente VALUES ('LowCarb', 23);
INSERT INTO public.appartenente VALUES ('LowCarb', 24);
INSERT INTO public.appartenente VALUES ('LowCarb', 25);
INSERT INTO public.appartenente VALUES ('LowCarb', 26);
INSERT INTO public.appartenente VALUES ('LowCarb', 27);
INSERT INTO public.appartenente VALUES ('LowCarb', 28);
INSERT INTO public.appartenente VALUES ('LowCarb', 29);
INSERT INTO public.appartenente VALUES ('LowCarb', 30);
INSERT INTO public.appartenente VALUES ('LowCarb', 31);
INSERT INTO public.appartenente VALUES ('LowCarb', 32);
INSERT INTO public.appartenente VALUES ('LowCarb', 33);
INSERT INTO public.appartenente VALUES ('LowCarb', 34);
INSERT INTO public.appartenente VALUES ('LowCarb', 35);
INSERT INTO public.appartenente VALUES ('HighProt', 4);
INSERT INTO public.appartenente VALUES ('HighProt', 5);
INSERT INTO public.appartenente VALUES ('HighProt', 6);
INSERT INTO public.appartenente VALUES ('HighProt', 7);
INSERT INTO public.appartenente VALUES ('HighProt', 8);
INSERT INTO public.appartenente VALUES ('HighProt', 9);
INSERT INTO public.appartenente VALUES ('HighProt', 10);
INSERT INTO public.appartenente VALUES ('HighProt', 11);
INSERT INTO public.appartenente VALUES ('HighProt', 12);
INSERT INTO public.appartenente VALUES ('HighProt', 13);
INSERT INTO public.appartenente VALUES ('HighProt', 14);
INSERT INTO public.appartenente VALUES ('HighProt', 15);
INSERT INTO public.appartenente VALUES ('HighProt', 16);
INSERT INTO public.appartenente VALUES ('HighProt', 17);
INSERT INTO public.appartenente VALUES ('HighProt', 18);
INSERT INTO public.appartenente VALUES ('HighProt', 19);
INSERT INTO public.appartenente VALUES ('HighProt', 20);
INSERT INTO public.appartenente VALUES ('HighProt', 21);
INSERT INTO public.appartenente VALUES ('HighProt', 22);
INSERT INTO public.appartenente VALUES ('HighProt', 23);
INSERT INTO public.appartenente VALUES ('HighProt', 24);
INSERT INTO public.appartenente VALUES ('HighProt', 25);
INSERT INTO public.appartenente VALUES ('HighProt', 26);
INSERT INTO public.appartenente VALUES ('HighProt', 27);
INSERT INTO public.appartenente VALUES ('HighProt', 28);
INSERT INTO public.appartenente VALUES ('HighProt', 29);
INSERT INTO public.appartenente VALUES ('HighProt', 30);
INSERT INTO public.appartenente VALUES ('HighProt', 31);
INSERT INTO public.appartenente VALUES ('HighProt', 32);
INSERT INTO public.appartenente VALUES ('HighProt', 33);
INSERT INTO public.appartenente VALUES ('HighProt', 34);
INSERT INTO public.appartenente VALUES ('HighProt', 35);
INSERT INTO public.appartenente VALUES ('Mediterranean', 3);
INSERT INTO public.appartenente VALUES ('Mediterranean', 4);
INSERT INTO public.appartenente VALUES ('Mediterranean', 5);
INSERT INTO public.appartenente VALUES ('Mediterranean', 6);
INSERT INTO public.appartenente VALUES ('Mediterranean', 7);
INSERT INTO public.appartenente VALUES ('Mediterranean', 8);
INSERT INTO public.appartenente VALUES ('Mediterranean', 9);
INSERT INTO public.appartenente VALUES ('Mediterranean', 10);
INSERT INTO public.appartenente VALUES ('Mediterranean', 11);
INSERT INTO public.appartenente VALUES ('Mediterranean', 12);
INSERT INTO public.appartenente VALUES ('Mediterranean', 13);
INSERT INTO public.appartenente VALUES ('Mediterranean', 14);
INSERT INTO public.appartenente VALUES ('Mediterranean', 15);
INSERT INTO public.appartenente VALUES ('Mediterranean', 16);
INSERT INTO public.appartenente VALUES ('Mediterranean', 17);
INSERT INTO public.appartenente VALUES ('Mediterranean', 18);


--
-- TOC entry 3509 (class 0 OID 19075)
-- Dependencies: 220
-- Data for Name: assume; Type: TABLE DATA; Schema: public; Owner: rfabbian
--

INSERT INTO public.assume VALUES (1, 1);
INSERT INTO public.assume VALUES (2, 1);
INSERT INTO public.assume VALUES (3, 1);
INSERT INTO public.assume VALUES (4, 1);
INSERT INTO public.assume VALUES (5, 1);
INSERT INTO public.assume VALUES (6, 2);
INSERT INTO public.assume VALUES (7, 2);
INSERT INTO public.assume VALUES (8, 3);
INSERT INTO public.assume VALUES (9, 3);
INSERT INTO public.assume VALUES (10, 3);
INSERT INTO public.assume VALUES (11, 4);
INSERT INTO public.assume VALUES (12, 5);
INSERT INTO public.assume VALUES (13, 6);
INSERT INTO public.assume VALUES (14, 7);
INSERT INTO public.assume VALUES (15, 7);
INSERT INTO public.assume VALUES (16, 8);
INSERT INTO public.assume VALUES (17, 9);
INSERT INTO public.assume VALUES (18, 10);
INSERT INTO public.assume VALUES (19, 11);
INSERT INTO public.assume VALUES (20, 12);


--
-- TOC entry 3511 (class 0 OID 19100)
-- Dependencies: 222
-- Data for Name: cardio; Type: TABLE DATA; Schema: public; Owner: rfabbian
--

INSERT INTO public.cardio VALUES (1, 30, 0, 5, 100);
INSERT INTO public.cardio VALUES (2, 45, 0, 7, 150);
INSERT INTO public.cardio VALUES (3, 60, 0, 10, 200);
INSERT INTO public.cardio VALUES (4, 40, 0, 6, 120);
INSERT INTO public.cardio VALUES (5, 50, 0, 8, 180);
INSERT INTO public.cardio VALUES (6, 35, 0, 5, 100);
INSERT INTO public.cardio VALUES (7, 55, 0, 9, 160);
INSERT INTO public.cardio VALUES (8, 60, 0, 11, 220);
INSERT INTO public.cardio VALUES (9, 40, 0, 6, 120);
INSERT INTO public.cardio VALUES (10, 50, 0, 8, 180);
INSERT INTO public.cardio VALUES (11, 45, 0, 7, 150);
INSERT INTO public.cardio VALUES (12, 55, 0, 9, 160);
INSERT INTO public.cardio VALUES (13, 60, 0, 10, 200);
INSERT INTO public.cardio VALUES (14, 35, 0, 5, 100);
INSERT INTO public.cardio VALUES (15, 50, 0, 8, 180);
INSERT INTO public.cardio VALUES (16, 40, 0, 6, 120);
INSERT INTO public.cardio VALUES (17, 45, 0, 7, 150);
INSERT INTO public.cardio VALUES (18, 60, 0, 10, 200);
INSERT INTO public.cardio VALUES (19, 55, 0, 9, 160);
INSERT INTO public.cardio VALUES (20, 35, 0, 5, 100);
INSERT INTO public.cardio VALUES (21, 50, 0, 8, 180);
INSERT INTO public.cardio VALUES (22, 60, 0, 11, 220);
INSERT INTO public.cardio VALUES (23, 40, 0, 6, 120);
INSERT INTO public.cardio VALUES (24, 50, 0, 8, 180);
INSERT INTO public.cardio VALUES (25, 45, 0, 7, 150);


--
-- TOC entry 3512 (class 0 OID 19110)
-- Dependencies: 223
-- Data for Name: cardiovascolare; Type: TABLE DATA; Schema: public; Owner: rfabbian
--

INSERT INTO public.cardiovascolare VALUES ('Corsa', 'Attività di corsa a ritmo sostenuto', 1, 600, 2, 1000);
INSERT INTO public.cardiovascolare VALUES ('Ciclismo', 'Attività di ciclismo su strada o su cicloergometro', 1, 400, 3, 5000);
INSERT INTO public.cardiovascolare VALUES ('Nuoto', 'Attività di nuoto a stile libero', 1, 700, 2, 500);
INSERT INTO public.cardiovascolare VALUES ('Jumping Jacks', 'Esercizio di salto e allargamento delle gambe', 2, 100, 1, 0);
INSERT INTO public.cardiovascolare VALUES ('Burpees', 'Esercizio che combina squat, flessioni e salti', 2, 150, 1, 0);
INSERT INTO public.cardiovascolare VALUES ('Salto con la corda', 'Esercizio di salto continuo con la corda', 2, 200, 1, 0);
INSERT INTO public.cardiovascolare VALUES ('Ellittica', 'Attività su macchina ellittica', 1, 500, 2, 0);
INSERT INTO public.cardiovascolare VALUES ('Step', 'Attività su step aerobico', 1, 300, 1, 0);
INSERT INTO public.cardiovascolare VALUES ('Pattinaggio', 'Attività di pattinaggio su rotelle o su ghiaccio', 1, 400, 3, 1000);
INSERT INTO public.cardiovascolare VALUES ('Aerobica', 'Attività aerobica a ritmo sostenuto', 1, 300, 1, 0);


--
-- TOC entry 3515 (class 0 OID 19135)
-- Dependencies: 226
-- Data for Name: composto; Type: TABLE DATA; Schema: public; Owner: rfabbian
--

INSERT INTO public.composto VALUES (26, 'Squat', 3, 10);
INSERT INTO public.composto VALUES (26, 'Panca piana', 4, 8);
INSERT INTO public.composto VALUES (27, 'Stacchi da terra', 3, 12);
INSERT INTO public.composto VALUES (27, 'Shoulder press', 4, 10);
INSERT INTO public.composto VALUES (28, 'Curl bicipiti', 3, 12);
INSERT INTO public.composto VALUES (28, 'Tricipiti alla sbarra', 3, 12);
INSERT INTO public.composto VALUES (29, 'Rematore', 4, 10);
INSERT INTO public.composto VALUES (29, 'Leg extension', 3, 15);
INSERT INTO public.composto VALUES (30, 'Calf raise', 3, 20);
INSERT INTO public.composto VALUES (30, 'Addominali crunch', 3, 15);
INSERT INTO public.composto VALUES (31, 'Squat', 3, 10);
INSERT INTO public.composto VALUES (31, 'Panca piana', 4, 8);
INSERT INTO public.composto VALUES (32, 'Stacchi da terra', 3, 12);
INSERT INTO public.composto VALUES (32, 'Shoulder press', 4, 10);
INSERT INTO public.composto VALUES (33, 'Curl bicipiti', 3, 12);
INSERT INTO public.composto VALUES (33, 'Tricipiti alla sbarra', 3, 12);
INSERT INTO public.composto VALUES (34, 'Rematore', 4, 10);
INSERT INTO public.composto VALUES (34, 'Leg extension', 3, 15);
INSERT INTO public.composto VALUES (35, 'Calf raise', 3, 20);
INSERT INTO public.composto VALUES (35, 'Addominali crunch', 3, 15);
INSERT INTO public.composto VALUES (36, 'Squat', 3, 10);
INSERT INTO public.composto VALUES (36, 'Panca piana', 4, 8);
INSERT INTO public.composto VALUES (37, 'Stacchi da terra', 3, 12);
INSERT INTO public.composto VALUES (37, 'Shoulder press', 4, 10);
INSERT INTO public.composto VALUES (38, 'Curl bicipiti', 3, 12);
INSERT INTO public.composto VALUES (38, 'Tricipiti alla sbarra', 3, 12);
INSERT INTO public.composto VALUES (39, 'Rematore', 4, 10);
INSERT INTO public.composto VALUES (39, 'Leg extension', 3, 15);
INSERT INTO public.composto VALUES (40, 'Calf raise', 3, 20);
INSERT INTO public.composto VALUES (40, 'Addominali crunch', 3, 15);
INSERT INTO public.composto VALUES (41, 'Squat', 3, 10);
INSERT INTO public.composto VALUES (41, 'Panca piana', 4, 8);
INSERT INTO public.composto VALUES (42, 'Stacchi da terra', 3, 12);
INSERT INTO public.composto VALUES (42, 'Shoulder press', 4, 10);
INSERT INTO public.composto VALUES (43, 'Curl bicipiti', 3, 12);
INSERT INTO public.composto VALUES (43, 'Tricipiti alla sbarra', 3, 12);
INSERT INTO public.composto VALUES (44, 'Rematore', 4, 10);
INSERT INTO public.composto VALUES (44, 'Leg extension', 3, 15);
INSERT INTO public.composto VALUES (45, 'Calf raise', 3, 20);
INSERT INTO public.composto VALUES (45, 'Addominali crunch', 3, 15);
INSERT INTO public.composto VALUES (46, 'Squat', 3, 10);
INSERT INTO public.composto VALUES (46, 'Panca piana', 4, 8);
INSERT INTO public.composto VALUES (47, 'Stacchi da terra', 3, 12);
INSERT INTO public.composto VALUES (47, 'Shoulder press', 4, 10);
INSERT INTO public.composto VALUES (48, 'Curl bicipiti', 3, 12);
INSERT INTO public.composto VALUES (48, 'Tricipiti alla sbarra', 3, 12);
INSERT INTO public.composto VALUES (49, 'Rematore', 4, 10);
INSERT INTO public.composto VALUES (49, 'Leg extension', 3, 15);
INSERT INTO public.composto VALUES (50, 'Calf raise', 3, 20);
INSERT INTO public.composto VALUES (50, 'Addominali crunch', 3, 15);


--
-- TOC entry 3507 (class 0 OID 19045)
-- Dependencies: 218
-- Data for Name: contenente; Type: TABLE DATA; Schema: public; Owner: rfabbian
--

INSERT INTO public.contenente VALUES ('Lasagne al Forno', 11, 500);
INSERT INTO public.contenente VALUES ('Lasagne al Forno', 4, 200);
INSERT INTO public.contenente VALUES ('Lasagne al Forno', 3, 100);
INSERT INTO public.contenente VALUES ('Lasagne al Forno', 5, 300);
INSERT INTO public.contenente VALUES ('Tiramisù', 5, 200);
INSERT INTO public.contenente VALUES ('Tiramisù', 9, 150);
INSERT INTO public.contenente VALUES ('Tiramisù', 8, 100);
INSERT INTO public.contenente VALUES ('Tiramisù', 7, 50);
INSERT INTO public.contenente VALUES ('Pasta alla Carbonara', 3, 400);
INSERT INTO public.contenente VALUES ('Pasta alla Carbonara', 11, 200);
INSERT INTO public.contenente VALUES ('Pasta alla Carbonara', 9, 100);
INSERT INTO public.contenente VALUES ('Pasta alla Carbonara', 5, 50);
INSERT INTO public.contenente VALUES ('Pizza Margherita', 3, 800);
INSERT INTO public.contenente VALUES ('Pizza Margherita', 5, 500);
INSERT INTO public.contenente VALUES ('Pizza Margherita', 9, 300);
INSERT INTO public.contenente VALUES ('Pizza Margherita', 10, 100);
INSERT INTO public.contenente VALUES ('Insalata di Rucola e Parmigiano', 5, 100);
INSERT INTO public.contenente VALUES ('Insalata di Rucola e Parmigiano', 10, 100);
INSERT INTO public.contenente VALUES ('Risotto ai Funghi', 3, 200);
INSERT INTO public.contenente VALUES ('Risotto ai Funghi', 5, 150);
INSERT INTO public.contenente VALUES ('Risotto ai Funghi', 11, 100);
INSERT INTO public.contenente VALUES ('Risotto ai Funghi', 17, 100);
INSERT INTO public.contenente VALUES ('Pollo Arrosto', 11, 1000);
INSERT INTO public.contenente VALUES ('Pollo Arrosto', 9, 200);
INSERT INTO public.contenente VALUES ('Pollo Arrosto', 5, 200);
INSERT INTO public.contenente VALUES ('Gelato alla Vaniglia', 5, 500);
INSERT INTO public.contenente VALUES ('Gelato alla Vaniglia', 9, 200);
INSERT INTO public.contenente VALUES ('Gelato alla Vaniglia', 8, 100);
INSERT INTO public.contenente VALUES ('Gelato alla Vaniglia', 6, 200);
INSERT INTO public.contenente VALUES ('Spaghetti Aglio, Olio e Peperoncino', 5, 300);
INSERT INTO public.contenente VALUES ('Spaghetti Aglio, Olio e Peperoncino', 9, 100);
INSERT INTO public.contenente VALUES ('Spaghetti Aglio, Olio e Peperoncino', 8, 50);
INSERT INTO public.contenente VALUES ('Spaghetti Aglio, Olio e Peperoncino', 10, 50);
INSERT INTO public.contenente VALUES ('Salmone alla Griglia', 5, 400);
INSERT INTO public.contenente VALUES ('Salmone alla Griglia', 9, 200);
INSERT INTO public.contenente VALUES ('Salmone alla Griglia', 8, 100);
INSERT INTO public.contenente VALUES ('Salmone alla Griglia', 6, 100);


--
-- TOC entry 3505 (class 0 OID 19023)
-- Dependencies: 216
-- Data for Name: costituito; Type: TABLE DATA; Schema: public; Owner: rfabbian
--

INSERT INTO public.costituito VALUES (1, 1, 1);
INSERT INTO public.costituito VALUES (1, 2, 2);
INSERT INTO public.costituito VALUES (2, 3, 1);
INSERT INTO public.costituito VALUES (2, 4, 1);
INSERT INTO public.costituito VALUES (3, 5, 1);
INSERT INTO public.costituito VALUES (4, 6, 1);
INSERT INTO public.costituito VALUES (4, 7, 1);
INSERT INTO public.costituito VALUES (5, 8, 1);
INSERT INTO public.costituito VALUES (5, 9, 1);
INSERT INTO public.costituito VALUES (12, 27, 2);
INSERT INTO public.costituito VALUES (12, 29, 1);
INSERT INTO public.costituito VALUES (13, 28, 1);
INSERT INTO public.costituito VALUES (13, 31, 1);
INSERT INTO public.costituito VALUES (14, 29, 2);
INSERT INTO public.costituito VALUES (14, 35, 1);
INSERT INTO public.costituito VALUES (15, 36, 1);
INSERT INTO public.costituito VALUES (15, 37, 1);
INSERT INTO public.costituito VALUES (16, 32, 1);
INSERT INTO public.costituito VALUES (16, 38, 3);
INSERT INTO public.costituito VALUES (17, 27, 2);
INSERT INTO public.costituito VALUES (17, 34, 1);
INSERT INTO public.costituito VALUES (18, 30, 1);
INSERT INTO public.costituito VALUES (18, 39, 1);
INSERT INTO public.costituito VALUES (19, 28, 1);
INSERT INTO public.costituito VALUES (19, 40, 2);
INSERT INTO public.costituito VALUES (20, 29, 1);
INSERT INTO public.costituito VALUES (20, 36, 2);


--
-- TOC entry 3500 (class 0 OID 18976)
-- Dependencies: 211
-- Data for Name: dieta; Type: TABLE DATA; Schema: public; Owner: rfabbian
--

INSERT INTO public.dieta VALUES ('LowCarb', 'Questa è una dieta a base di poche calorie', 3.4, 2.4, 0.7, 1.5, 4.0);
INSERT INTO public.dieta VALUES ('HighProt', 'Questa è una dieta a base alte proteine', 5.4, 3.4, 1.7, 0.5, 2.0);
INSERT INTO public.dieta VALUES ('Mediterranean', 'Questa dieta si ispira a quella Mediterranea e mangia di tutto', 2.8, 1.8, 1.2, 1.5, 3.0);
INSERT INTO public.dieta VALUES ('Vegan', 'Questa dieta è vegana e non si possono mangiare derivati da animali', 3.0, 1.5, 1.0, 1.2, 3.0);
INSERT INTO public.dieta VALUES ('Vegetarian', 'Questa dieta non permette di mangiare nè carne nè pesce', 2.8, 1.8, 1.2, 1.5, 3.0);
INSERT INTO public.dieta VALUES ('Pescetarian', 'Questa dieta non permette di mangiare carne ma si pesce', 3.0, 2.2, 1.0, 1.2, 3.0);


--
-- TOC entry 3517 (class 0 OID 19160)
-- Dependencies: 228
-- Data for Name: fase; Type: TABLE DATA; Schema: public; Owner: rfabbian
--

INSERT INTO public.fase VALUES ('Stadio1:addormentamento', 'Lo stadio 1 rappresenta il passaggio dalla veglia al sonno. Durante questo breve periodo (che dura diversi minuti) di un sonno relativamente leggero :rallentano, il battito cardiaco, la respirazione, i movimenti degli occhi,le onde cerebrali iniziano a cambiare rispetto agli schemi della veglia diurna.');
INSERT INTO public.fase VALUES ('Stadio2:sonno_leggero', 'Lo stadio 2 è un periodo di sonno leggero che precede un sonno più profondo:Il battito cardiaco e la respirazione rallentano,i muscoli si rilassano ulteriormente,la temperatura corporea si abbassa,i movimenti degli occhi s’interrompono,l’’elettroencefalogramma mostra delle onde cerebrali molto simili a quelle che sono visibili durante la veglia.');
INSERT INTO public.fase VALUES ('Stadio3:sonno_profondo', 'Lo stadio 3 è il periodo di sonno profondo, quello che ci fa sentire riposati al mattino:nella prima metà della notte si manifesta con periodi più lunghi,il battito cardiaco e la respirazione rallentano a livelli più bassi,i muscoli sono rilassati,in questo stadio potrebbe essere difficile svegliare chi dorme,le onde cerebrali diventano ancora più lente,è in questa fase che noi rigeneriamo e recuperiamo le nostre forze,il nostro corpo produce una grande quantità di ormoni della crescita, i quali hanno un ruolo importante nel regolare la crescita e il metabolismo del nostro organismo.');
INSERT INTO public.fase VALUES ('Stadio4:sonno_profondo_effettivo', 'Nel quarto stadio si entra nella fase del rilassamento più profondo, del sonno senza sogni, e all’attività inconscia della mente.Il respiro e il battito cardiaco sono lenti, la nostra temperatura corporea si abbassa ulteriormente,il sonno è pesante, i nostri muscoli sono completamente rilassati,gli occhi iniziano lentamente a muoversi in maniera irregolare sotto le palpebre, ed il nostro corpo si prepara alla fase successiva, quella del sonno REM,svegliarsi, oppure essere svegliati, durante questa fase potrebbe provocarci un forte senso di disorientamento.');
INSERT INTO public.fase VALUES ('Stadio5:fase_rem', 'Successivamente si entra nella fase REM del sonno – stadio 5 – . Lo stadio REM arriva la prima volta circa 90 minuti dopo che ci siamo addormentati.In questo stadio si hanno rapidi movimenti oculari (REM=Rapid Eye Movements):l’attività delle onde cerebrali diventa più simile a quella che si osservata nella veglia,la respirazione diventa più veloce e più irregolare,la frequenza cardiaca e la pressione sanguigna aumentano fino a raggiungere i livelli della veglia,durante il sonno REM si verifica la maggior parte dei sogni (anche se alcuni possano verificarsi anche nel sonno non REM),i muscoli delle nostre braccia e delle nostre gambe si paralizzano temporaneamente, il che ci impedisce di mettere in atto quello che stiamo sognando.
Invecchiando, noi dormiamo meno tempo nella fase REM.');


--
-- TOC entry 3513 (class 0 OID 19115)
-- Dependencies: 224
-- Data for Name: formato; Type: TABLE DATA; Schema: public; Owner: rfabbian
--

INSERT INTO public.formato VALUES ('Corsa', 1);
INSERT INTO public.formato VALUES ('Ciclismo', 2);
INSERT INTO public.formato VALUES ('Nuoto', 3);
INSERT INTO public.formato VALUES ('Jumping Jacks', 4);
INSERT INTO public.formato VALUES ('Burpees', 5);
INSERT INTO public.formato VALUES ('Salto con la corda', 6);
INSERT INTO public.formato VALUES ('Ellittica', 7);
INSERT INTO public.formato VALUES ('Step', 8);
INSERT INTO public.formato VALUES ('Pattinaggio', 9);
INSERT INTO public.formato VALUES ('Aerobica', 10);
INSERT INTO public.formato VALUES ('Corsa', 11);
INSERT INTO public.formato VALUES ('Ciclismo', 12);
INSERT INTO public.formato VALUES ('Nuoto', 13);
INSERT INTO public.formato VALUES ('Jumping Jacks', 14);
INSERT INTO public.formato VALUES ('Burpees', 15);
INSERT INTO public.formato VALUES ('Salto con la corda', 16);
INSERT INTO public.formato VALUES ('Ellittica', 17);
INSERT INTO public.formato VALUES ('Step', 18);
INSERT INTO public.formato VALUES ('Pattinaggio', 19);
INSERT INTO public.formato VALUES ('Aerobica', 20);
INSERT INTO public.formato VALUES ('Corsa', 21);
INSERT INTO public.formato VALUES ('Ciclismo', 22);
INSERT INTO public.formato VALUES ('Nuoto', 23);
INSERT INTO public.formato VALUES ('Jumping Jacks', 24);
INSERT INTO public.formato VALUES ('Burpees', 25);
INSERT INTO public.formato VALUES ('Salto con la corda', 23);
INSERT INTO public.formato VALUES ('Ellittica', 22);
INSERT INTO public.formato VALUES ('Step', 23);
INSERT INTO public.formato VALUES ('Pattinaggio', 20);
INSERT INTO public.formato VALUES ('Aerobica', 6);


--
-- TOC entry 3503 (class 0 OID 19003)
-- Dependencies: 214
-- Data for Name: pasto; Type: TABLE DATA; Schema: public; Owner: rfabbian
--

INSERT INTO public.pasto VALUES (1, 1, '2023-06-18 12:00:00', 500, 20, 50, 10, NULL);
INSERT INTO public.pasto VALUES (2, 1, '2023-06-18 18:30:00', 700, 30, 60, 15, NULL);
INSERT INTO public.pasto VALUES (3, 2, '2023-06-19 08:00:00', 400, 15, 40, 8, NULL);
INSERT INTO public.pasto VALUES (4, 2, '2023-06-19 13:15:00', 600, 25, 55, 12, NULL);
INSERT INTO public.pasto VALUES (5, 2, '2023-06-19 20:00:00', 800, 35, 70, 18, NULL);
INSERT INTO public.pasto VALUES (6, 1, '2023-06-20 12:30:00', 550, 22, 52, 11, NULL);
INSERT INTO public.pasto VALUES (7, 2, '2023-06-20 19:45:00', 750, 32, 65, 16, NULL);
INSERT INTO public.pasto VALUES (8, 3, '2023-06-21 09:15:00', 450, 18, 45, 9, NULL);
INSERT INTO public.pasto VALUES (9, 3, '2023-06-21 14:30:00', 650, 28, 58, 14, NULL);
INSERT INTO public.pasto VALUES (10, 1, '2023-06-21 21:15:00', 900, 40, 75, 20, NULL);
INSERT INTO public.pasto VALUES (11, 2, '2023-06-22 12:45:00', 520, 21, 53, 11, NULL);
INSERT INTO public.pasto VALUES (12, 3, '2023-06-22 19:30:00', 720, 31, 68, 15, NULL);
INSERT INTO public.pasto VALUES (13, 3, '2023-06-23 08:30:00', 410, 16, 42, 8, NULL);
INSERT INTO public.pasto VALUES (14, 3, '2023-06-23 13:45:00', 620, 26, 60, 13, NULL);
INSERT INTO public.pasto VALUES (15, 1, '2023-06-23 20:30:00', 820, 36, 72, 18, NULL);
INSERT INTO public.pasto VALUES (16, 1, '2023-06-24 12:15:00', 530, 23, 55, 12, NULL);
INSERT INTO public.pasto VALUES (17, 2, '2023-06-24 18:45:00', 730, 33, 66, 15, NULL);
INSERT INTO public.pasto VALUES (18, 1, '2023-06-25 09:45:00', 470, 19, 48, 10, NULL);
INSERT INTO public.pasto VALUES (19, 3, '2023-06-25 15:00:00', 680, 29, 62, 14, NULL);
INSERT INTO public.pasto VALUES (20, 4, '2023-06-25 21:30:00', 950, 42, 78, 22, NULL);
INSERT INTO public.pasto VALUES (21, 1, '2023-06-26 12:30:00', 560, 24, 57, 12, NULL);
INSERT INTO public.pasto VALUES (22, 4, '2023-06-26 19:15:00', 760, 34, 68, 16, NULL);
INSERT INTO public.pasto VALUES (23, 4, '2023-06-27 08:45:00', 430, 17, 44, 9, NULL);
INSERT INTO public.pasto VALUES (24, 1, '2023-06-27 14:00:00', 640, 27, 59, 12, NULL);
INSERT INTO public.pasto VALUES (25, 2, '2023-06-27 20:45:00', 840, 38, 74, 18, NULL);
INSERT INTO public.pasto VALUES (26, 2, '2023-06-28 12:45:00', 540, 23, 55, 12, NULL);
INSERT INTO public.pasto VALUES (27, 11, '2023-06-28 18:30:00', 740, 33, 67, 15, NULL);
INSERT INTO public.pasto VALUES (28, 11, '2023-06-29 09:15:00', 460, 19, 47, 10, NULL);
INSERT INTO public.pasto VALUES (29, 12, '2023-06-29 14:30:00', 660, 28, 61, 13, NULL);
INSERT INTO public.pasto VALUES (30, 12, '2023-06-29 21:15:00', 910, 41, 77, 21, NULL);


--
-- TOC entry 3514 (class 0 OID 19130)
-- Dependencies: 225
-- Data for Name: pesistica; Type: TABLE DATA; Schema: public; Owner: rfabbian
--

INSERT INTO public.pesistica VALUES ('Squat', 2, 'Esercizio per allenare gli arti inferiori', 20, 3, 10);
INSERT INTO public.pesistica VALUES ('Panca piana', 2, 'Esercizio per allenare il petto', 15, 4, 8);
INSERT INTO public.pesistica VALUES ('Stacchi da terra', 3, 'Esercizio per allenare i muscoli della schiena e delle gambe', 25, 3, 12);
INSERT INTO public.pesistica VALUES ('Shoulder press', 2, 'Esercizio per allenare le spalle', 12, 4, 10);
INSERT INTO public.pesistica VALUES ('Curl bicipiti', 1, 'Esercizio per allenare i muscoli dei bicipiti', 8, 3, 12);
INSERT INTO public.pesistica VALUES ('Tricipiti alla sbarra', 2, 'Esercizio per allenare i muscoli dei tricipiti', 10, 3, 12);
INSERT INTO public.pesistica VALUES ('Rematore', 2, 'Esercizio per allenare i muscoli della schiena', 15, 4, 10);
INSERT INTO public.pesistica VALUES ('Leg extension', 1, 'Esercizio per allenare gli arti inferiori', 10, 3, 15);
INSERT INTO public.pesistica VALUES ('Calf raise', 1, 'Esercizio per allenare i polpacci', 8, 3, 20);
INSERT INTO public.pesistica VALUES ('Addominali crunch', 1, 'Esercizio per allenare gli addominali', 5, 3, 15);


--
-- TOC entry 3499 (class 0 OID 18966)
-- Dependencies: 210
-- Data for Name: peso; Type: TABLE DATA; Schema: public; Owner: rfabbian
--

INSERT INTO public.peso VALUES (1, '2023-04-01', 69.60, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-05-16', 70.50, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-05-21', 68.60, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-02-18', 68.50, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-03-16', 70.60, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-03-09', 69.50, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-05-04', 70.00, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-05-23', 70.50, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-05-05', 70.70, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-02-28', 73.50, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-03-13', 74.30, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-04-21', 71.50, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-05-13', 73.20, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-04-30', 70.30, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-05-12', 68.80, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-03-19', 72.60, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-05-06', 69.70, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-02-14', 73.60, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-03-28', 74.90, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-05-29', 70.60, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-05-30', 73.30, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-02-25', 68.50, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-03-01', 74.90, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-05-26', 74.90, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-05-19', 69.20, NULL, NULL);
INSERT INTO public.peso VALUES (1, '2023-05-17', 73.20, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-03-07', 83.90, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-05-27', 90.20, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-06-08', 84.00, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-04-24', 83.50, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-04-19', 85.00, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-05-01', 88.60, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-05-24', 91.40, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-02-15', 92.60, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-06-07', 93.90, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-02-25', 89.00, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-03-04', 86.00, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-05-17', 85.30, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-05-19', 82.70, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-03-12', 91.60, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-03-11', 86.00, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-06-03', 89.60, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-04-03', 93.90, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-06-15', 84.50, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-03-17', 94.20, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-05-14', 86.30, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-03-19', 94.50, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-05-22', 87.30, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-05-12', 91.90, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-04-09', 91.60, NULL, NULL);
INSERT INTO public.peso VALUES (2, '2023-05-05', 84.70, NULL, NULL);
INSERT INTO public.peso VALUES (5, '2023-04-11', 71.10, NULL, NULL);
INSERT INTO public.peso VALUES (5, '2022-04-28', 69.90, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2023-03-13', 69.50, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2022-11-21', 72.00, NULL, NULL);
INSERT INTO public.peso VALUES (3, '2023-04-14', 75.00, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2022-04-03', 71.90, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2022-12-31', 71.50, NULL, NULL);
INSERT INTO public.peso VALUES (3, '2023-02-07', 75.40, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2022-10-15', 69.70, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2023-05-02', 75.80, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2022-07-02', 75.10, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2022-09-23', 73.30, NULL, NULL);
INSERT INTO public.peso VALUES (3, '2023-03-16', 74.80, NULL, NULL);
INSERT INTO public.peso VALUES (5, '2023-03-15', 71.20, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2022-04-26', 74.30, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2023-01-28', 69.40, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2022-11-17', 69.40, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2022-02-15', 71.50, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2023-04-23', 74.50, NULL, NULL);
INSERT INTO public.peso VALUES (5, '2022-07-25', 75.10, NULL, NULL);
INSERT INTO public.peso VALUES (5, '2022-02-26', 70.40, NULL, NULL);
INSERT INTO public.peso VALUES (5, '2022-10-26', 73.80, NULL, NULL);
INSERT INTO public.peso VALUES (3, '2023-06-15', 70.60, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2022-09-07', 70.70, NULL, NULL);
INSERT INTO public.peso VALUES (3, '2022-03-15', 72.40, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2022-12-11', 75.40, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2022-11-30', 69.50, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2022-08-11', 69.10, NULL, NULL);
INSERT INTO public.peso VALUES (5, '2022-08-20', 72.70, NULL, NULL);
INSERT INTO public.peso VALUES (3, '2022-11-15', 74.30, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2022-10-23', 70.20, NULL, NULL);
INSERT INTO public.peso VALUES (3, '2022-12-16', 71.90, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2023-04-02', 75.20, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2022-03-24', 69.80, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2022-11-01', 71.70, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2022-12-02', 70.90, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2023-03-04', 74.20, NULL, NULL);
INSERT INTO public.peso VALUES (5, '2023-03-29', 72.10, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2023-01-02', 72.10, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2022-09-25', 70.30, NULL, NULL);
INSERT INTO public.peso VALUES (3, '2022-07-04', 72.10, NULL, NULL);
INSERT INTO public.peso VALUES (5, '2022-05-27', 70.90, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2023-05-01', 73.20, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2022-11-09', 72.80, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2023-05-20', 70.60, NULL, NULL);
INSERT INTO public.peso VALUES (5, '2022-03-04', 72.00, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2022-12-05', 73.40, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2023-03-16', 75.20, NULL, NULL);
INSERT INTO public.peso VALUES (5, '2022-12-12', 71.10, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2022-08-23', 73.00, NULL, NULL);
INSERT INTO public.peso VALUES (5, '2022-06-14', 71.60, NULL, NULL);
INSERT INTO public.peso VALUES (3, '2023-05-16', 73.30, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2022-07-12', 69.30, NULL, NULL);
INSERT INTO public.peso VALUES (3, '2022-04-22', 71.60, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2022-12-14', 74.20, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2023-01-15', 71.70, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2022-04-11', 72.90, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2022-04-16', 74.30, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2022-08-30', 73.90, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2022-05-03', 74.10, NULL, NULL);
INSERT INTO public.peso VALUES (5, '2023-01-09', 72.20, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2022-04-27', 75.40, NULL, NULL);
INSERT INTO public.peso VALUES (5, '2022-04-24', 70.50, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2022-08-02', 69.60, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2022-05-08', 73.30, NULL, NULL);
INSERT INTO public.peso VALUES (5, '2022-04-21', 70.10, NULL, NULL);
INSERT INTO public.peso VALUES (5, '2022-09-16', 73.70, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2022-03-03', 71.80, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2022-07-15', 71.70, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2023-04-13', 73.80, NULL, NULL);
INSERT INTO public.peso VALUES (5, '2022-11-15', 70.40, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2022-11-10', 73.40, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2022-09-30', 71.80, NULL, NULL);
INSERT INTO public.peso VALUES (5, '2023-05-12', 75.60, NULL, NULL);
INSERT INTO public.peso VALUES (3, '2022-12-30', 73.50, NULL, NULL);
INSERT INTO public.peso VALUES (3, '2023-04-12', 70.20, NULL, NULL);
INSERT INTO public.peso VALUES (3, '2022-04-13', 71.00, NULL, NULL);
INSERT INTO public.peso VALUES (3, '2022-06-30', 71.30, NULL, NULL);
INSERT INTO public.peso VALUES (5, '2023-04-24', 76.00, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2022-10-03', 72.10, NULL, NULL);
INSERT INTO public.peso VALUES (5, '2022-06-24', 71.40, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2023-06-02', 75.90, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2022-04-17', 75.50, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2022-12-09', 71.90, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2022-10-19', 75.20, NULL, NULL);
INSERT INTO public.peso VALUES (6, '2022-09-01', 71.60, NULL, NULL);
INSERT INTO public.peso VALUES (3, '2022-04-10', 71.80, NULL, NULL);
INSERT INTO public.peso VALUES (4, '2022-06-05', 72.70, NULL, NULL);
INSERT INTO public.peso VALUES (7, '2023-04-01', 60.20, NULL, NULL);
INSERT INTO public.peso VALUES (7, '2023-05-16', 59.80, NULL, NULL);
INSERT INTO public.peso VALUES (7, '2023-05-21', 60.50, NULL, NULL);
INSERT INTO public.peso VALUES (7, '2023-02-18', 61.00, NULL, NULL);
INSERT INTO public.peso VALUES (7, '2023-03-16', 59.60, NULL, NULL);
INSERT INTO public.peso VALUES (7, '2023-03-09', 60.10, NULL, NULL);
INSERT INTO public.peso VALUES (7, '2023-05-04', 59.90, NULL, NULL);
INSERT INTO public.peso VALUES (7, '2023-05-23', 60.30, NULL, NULL);
INSERT INTO public.peso VALUES (7, '2023-05-05', 59.70, NULL, NULL);
INSERT INTO public.peso VALUES (7, '2023-02-28', 60.60, NULL, NULL);
INSERT INTO public.peso VALUES (7, '2023-03-13', 60.90, NULL, NULL);
INSERT INTO public.peso VALUES (7, '2023-04-21', 60.40, NULL, NULL);
INSERT INTO public.peso VALUES (7, '2023-05-13', 59.50, NULL, NULL);
INSERT INTO public.peso VALUES (7, '2023-04-30', 60.80, NULL, NULL);
INSERT INTO public.peso VALUES (7, '2023-05-12', 60.70, NULL, NULL);
INSERT INTO public.peso VALUES (7, '2023-03-19', 59.40, NULL, NULL);
INSERT INTO public.peso VALUES (7, '2023-05-06', 59.30, NULL, NULL);
INSERT INTO public.peso VALUES (7, '2023-02-14', 60.00, NULL, NULL);
INSERT INTO public.peso VALUES (8, '2023-04-01', 55.70, NULL, NULL);
INSERT INTO public.peso VALUES (8, '2023-05-16', 56.20, NULL, NULL);
INSERT INTO public.peso VALUES (8, '2023-05-21', 55.50, NULL, NULL);
INSERT INTO public.peso VALUES (8, '2023-02-18', 56.10, NULL, NULL);
INSERT INTO public.peso VALUES (8, '2023-03-16', 56.50, NULL, NULL);
INSERT INTO public.peso VALUES (8, '2023-03-09', 55.90, NULL, NULL);
INSERT INTO public.peso VALUES (8, '2023-05-04', 56.30, NULL, NULL);
INSERT INTO public.peso VALUES (8, '2023-05-23', 55.80, NULL, NULL);
INSERT INTO public.peso VALUES (8, '2023-05-05', 56.40, NULL, NULL);
INSERT INTO public.peso VALUES (8, '2023-02-28', 55.60, NULL, NULL);
INSERT INTO public.peso VALUES (8, '2023-03-13', 56.00, NULL, NULL);
INSERT INTO public.peso VALUES (8, '2023-04-21', 55.30, NULL, NULL);
INSERT INTO public.peso VALUES (8, '2023-05-13', 56.60, NULL, NULL);
INSERT INTO public.peso VALUES (8, '2023-04-30', 55.40, NULL, NULL);
INSERT INTO public.peso VALUES (8, '2023-05-12', 55.10, NULL, NULL);
INSERT INTO public.peso VALUES (8, '2023-03-19', 55.20, NULL, NULL);
INSERT INTO public.peso VALUES (8, '2023-05-06', 56.70, NULL, NULL);
INSERT INTO public.peso VALUES (8, '2023-02-14', 55.00, NULL, NULL);
INSERT INTO public.peso VALUES (9, '2023-04-01', 58.40, NULL, NULL);
INSERT INTO public.peso VALUES (9, '2023-05-16', 59.00, NULL, NULL);
INSERT INTO public.peso VALUES (9, '2023-05-21', 58.80, NULL, NULL);
INSERT INTO public.peso VALUES (9, '2023-02-18', 58.70, NULL, NULL);
INSERT INTO public.peso VALUES (9, '2023-03-16', 59.20, NULL, NULL);
INSERT INTO public.peso VALUES (9, '2023-03-09', 58.90, NULL, NULL);
INSERT INTO public.peso VALUES (9, '2023-05-04', 59.50, NULL, NULL);
INSERT INTO public.peso VALUES (9, '2023-05-23', 59.40, NULL, NULL);
INSERT INTO public.peso VALUES (9, '2023-05-05', 58.60, NULL, NULL);
INSERT INTO public.peso VALUES (9, '2023-02-28', 58.20, NULL, NULL);
INSERT INTO public.peso VALUES (9, '2023-03-13', 58.30, NULL, NULL);
INSERT INTO public.peso VALUES (9, '2023-04-21', 58.10, NULL, NULL);
INSERT INTO public.peso VALUES (9, '2023-05-13', 58.50, NULL, NULL);
INSERT INTO public.peso VALUES (9, '2023-04-30', 59.10, NULL, NULL);
INSERT INTO public.peso VALUES (9, '2023-05-12', 58.00, NULL, NULL);
INSERT INTO public.peso VALUES (9, '2023-03-19', 59.30, NULL, NULL);
INSERT INTO public.peso VALUES (9, '2023-05-06', 58.80, NULL, NULL);
INSERT INTO public.peso VALUES (9, '2023-02-14', 59.70, NULL, NULL);
INSERT INTO public.peso VALUES (10, '2023-04-01', 62.10, NULL, NULL);
INSERT INTO public.peso VALUES (10, '2023-05-16', 61.80, NULL, NULL);
INSERT INTO public.peso VALUES (10, '2023-05-21', 62.50, NULL, NULL);
INSERT INTO public.peso VALUES (10, '2023-02-18', 61.90, NULL, NULL);
INSERT INTO public.peso VALUES (10, '2023-03-16', 61.60, NULL, NULL);
INSERT INTO public.peso VALUES (10, '2023-03-09', 62.20, NULL, NULL);
INSERT INTO public.peso VALUES (10, '2023-05-04', 61.50, NULL, NULL);
INSERT INTO public.peso VALUES (10, '2023-05-23', 62.00, NULL, NULL);
INSERT INTO public.peso VALUES (10, '2023-05-05', 61.70, NULL, NULL);
INSERT INTO public.peso VALUES (10, '2023-02-28', 62.40, NULL, NULL);
INSERT INTO public.peso VALUES (10, '2023-03-13', 62.30, NULL, NULL);
INSERT INTO public.peso VALUES (10, '2023-04-21', 61.40, NULL, NULL);
INSERT INTO public.peso VALUES (10, '2023-05-13', 62.60, NULL, NULL);
INSERT INTO public.peso VALUES (10, '2023-04-30', 61.30, NULL, NULL);
INSERT INTO public.peso VALUES (10, '2023-05-12', 62.70, NULL, NULL);
INSERT INTO public.peso VALUES (10, '2023-03-19', 61.20, NULL, NULL);
INSERT INTO public.peso VALUES (10, '2023-05-06', 61.10, NULL, NULL);
INSERT INTO public.peso VALUES (10, '2023-02-14', 62.80, NULL, NULL);
INSERT INTO public.peso VALUES (11, '2023-04-01', 57.20, NULL, NULL);
INSERT INTO public.peso VALUES (11, '2023-05-16', 56.90, NULL, NULL);
INSERT INTO public.peso VALUES (11, '2023-05-21', 57.40, NULL, NULL);
INSERT INTO public.peso VALUES (11, '2023-02-18', 57.10, NULL, NULL);
INSERT INTO public.peso VALUES (11, '2023-03-16', 57.60, NULL, NULL);
INSERT INTO public.peso VALUES (11, '2023-03-09', 57.30, NULL, NULL);
INSERT INTO public.peso VALUES (11, '2023-05-04', 57.80, NULL, NULL);
INSERT INTO public.peso VALUES (11, '2023-05-23', 57.70, NULL, NULL);
INSERT INTO public.peso VALUES (11, '2023-05-05', 57.00, NULL, NULL);
INSERT INTO public.peso VALUES (11, '2023-02-28', 57.90, NULL, NULL);
INSERT INTO public.peso VALUES (11, '2023-03-13', 57.50, NULL, NULL);
INSERT INTO public.peso VALUES (11, '2023-04-21', 56.80, NULL, NULL);
INSERT INTO public.peso VALUES (11, '2023-05-13', 57.30, NULL, NULL);
INSERT INTO public.peso VALUES (11, '2023-04-30', 57.10, NULL, NULL);
INSERT INTO public.peso VALUES (11, '2023-05-12', 57.20, NULL, NULL);
INSERT INTO public.peso VALUES (11, '2023-03-19', 57.40, NULL, NULL);
INSERT INTO public.peso VALUES (11, '2023-05-06', 57.60, NULL, NULL);
INSERT INTO public.peso VALUES (11, '2023-02-14', 57.30, NULL, NULL);
INSERT INTO public.peso VALUES (12, '2023-04-01', 54.80, NULL, NULL);
INSERT INTO public.peso VALUES (12, '2023-05-16', 55.10, NULL, NULL);
INSERT INTO public.peso VALUES (12, '2023-05-21', 55.30, NULL, NULL);
INSERT INTO public.peso VALUES (12, '2023-02-18', 54.90, NULL, NULL);
INSERT INTO public.peso VALUES (12, '2023-03-16', 55.20, NULL, NULL);
INSERT INTO public.peso VALUES (12, '2023-03-09', 54.70, NULL, NULL);
INSERT INTO public.peso VALUES (12, '2023-05-04', 55.00, NULL, NULL);
INSERT INTO public.peso VALUES (12, '2023-05-23', 54.80, NULL, NULL);
INSERT INTO public.peso VALUES (12, '2023-05-05', 55.40, NULL, NULL);
INSERT INTO public.peso VALUES (12, '2023-02-28', 55.50, NULL, NULL);
INSERT INTO public.peso VALUES (12, '2023-03-13', 54.60, NULL, NULL);
INSERT INTO public.peso VALUES (12, '2023-04-21', 55.20, NULL, NULL);
INSERT INTO public.peso VALUES (12, '2023-05-13', 55.30, NULL, NULL);
INSERT INTO public.peso VALUES (12, '2023-04-30', 54.90, NULL, NULL);
INSERT INTO public.peso VALUES (12, '2023-05-12', 55.10, NULL, NULL);
INSERT INTO public.peso VALUES (12, '2023-03-19', 55.00, NULL, NULL);
INSERT INTO public.peso VALUES (12, '2023-05-06', 54.70, NULL, NULL);
INSERT INTO public.peso VALUES (12, '2023-02-14', 55.20, NULL, NULL);


--
-- TOC entry 3506 (class 0 OID 19038)
-- Dependencies: 217
-- Data for Name: ricetta; Type: TABLE DATA; Schema: public; Owner: rfabbian
--

INSERT INTO public.ricetta VALUES ('Lasagne al Forno', 500.00, '01:30:00', '00:45:00', 'Preparare il ragù, cuocere le lasagne, comporre gli strati e infornare.', 3);
INSERT INTO public.ricetta VALUES ('Tiramisù', 300.00, '00:20:00', '00:00:00', 'Preparare la crema al mascarpone, inzuppare i biscotti nel caffè, alternare gli strati e lasciare in frigo.', 2);
INSERT INTO public.ricetta VALUES ('Pasta alla Carbonara', 400.00, '00:15:00', '00:10:00', 'Cuocere la pasta, saltare la pancetta e un uovo, unire il tutto e servire.', 2);
INSERT INTO public.ricetta VALUES ('Pizza Margherita', 800.00, '01:00:00', '00:15:00', 'Preparare lo impasto, far lievitare, stendere la pizza, aggiungere il condimento e infornare.', 2);
INSERT INTO public.ricetta VALUES ('Insalata di Rucola e Parmigiano', 200.00, '00:10:00', '00:00:00', 'Lavare la rucola, tagliare il parmigiano a scaglie, condire con olio e aceto.', 1);
INSERT INTO public.ricetta VALUES ('Risotto ai Funghi', 350.00, '00:30:00', '00:20:00', 'Preparare il soffritto, tostare il riso, aggiungere i funghi e cuocere a fuoco lento.', 3);
INSERT INTO public.ricetta VALUES ('Pollo Arrosto', 1000.00, '00:15:00', '01:30:00', 'Preparare il pollo, insaporire con le erbe, infornare e cuocere fino a doratura.', 3);
INSERT INTO public.ricetta VALUES ('Gelato alla Vaniglia', 600.00, '02:00:00', '00:30:00', 'Preparare la base del gelato, raffreddare, versare nella gelatiera e mantecare.', 2);
INSERT INTO public.ricetta VALUES ('Spaghetti Aglio, Olio e Peperoncino', 350.00, '00:10:00', '00:12:00', 'Cuocere gli spaghetti, saltare del aglio e il peperoncino in olio, condire la pasta e servire.', 2);
INSERT INTO public.ricetta VALUES ('Salmone alla Griglia', 400.00, '00:10:00', '00:15:00', 'Marinare il salmone, grigliare da entrambi i lati, condire con limone e erbe.', 2);
INSERT INTO public.ricetta VALUES ('Pancakes', 300.00, '00:15:00', '00:10:00', 'In una ciotola, mescolare la farina, lo zucchero, il lievito e il sale. In una ciotola, sbattere le uova, aggiungere il latte e il burro fuso.Versare il composto liquido nella ciotola degli ingredienti secchi e mescolare fino a ottenere un impasto omogeneo.', 2);
INSERT INTO public.ricetta VALUES ('Insalata di Pollo', 250.00, '00:20:00', '00:00:00', 'Cuocere il petto di pollo e tagliarlo a dadini. Mescolare insieme il pollo, lattuga, pomodori, cetrioli, olive e formaggio.Preparare una salsa con olio di oliva, aceto, senape, sale e pepe. Condire l insalata con la salsa e mescolare bene.', 2);
INSERT INTO public.ricetta VALUES ('Zuppa di Pomodoro', 400.00, '00:30:00', '00:25:00', 'Soffriggere cipolla e aglio in olio di oliva. Aggiungere pomodori pelati, brodo di verdure, basilico, sale e pepe.Cuocere a fuoco medio per circa 20 minuti.', 2);
INSERT INTO public.ricetta VALUES ('Risotto ai Frutti di Mare', 350.00, '00:40:00', '00:30:00', 'Soffriggere cipolla e aglio in olio di oliva.Aggiungere riso e tostarlo per qualche minuto. Sfumare con vino bianco e lasciar evaporare. Aggiungere brodo di pesce poco alla volta, mescolando di tanto in tanto.', 3);


--
-- TOC entry 3519 (class 0 OID 19182)
-- Dependencies: 230
-- Data for Name: risveglio; Type: TABLE DATA; Schema: public; Owner: rfabbian
--

INSERT INTO public.risveglio VALUES (1, '2023-06-01 23:00:00', '2023-06-01 23:20:00', '00:30:00');
INSERT INTO public.risveglio VALUES (1, '2023-06-02 22:30:00', '2023-06-02 22:50:00', '00:30:00');
INSERT INTO public.risveglio VALUES (1, '2023-06-03 23:30:00', '2023-06-03 23:50:00', '00:30:00');
INSERT INTO public.risveglio VALUES (1, '2023-06-04 23:15:00', '2023-06-04 23:35:00', '00:30:00');
INSERT INTO public.risveglio VALUES (1, '2023-06-05 22:45:00', '2023-06-05 23:05:00', '00:30:00');
INSERT INTO public.risveglio VALUES (2, '2023-06-01 23:30:00', '2023-06-01 23:50:00', '00:30:00');
INSERT INTO public.risveglio VALUES (2, '2023-06-02 23:00:00', '2023-06-02 23:20:00', '00:30:00');
INSERT INTO public.risveglio VALUES (2, '2023-06-03 22:45:00', '2023-06-03 23:05:00', '00:30:00');
INSERT INTO public.risveglio VALUES (2, '2023-06-04 23:15:00', '2023-06-04 23:35:00', '00:30:00');
INSERT INTO public.risveglio VALUES (2, '2023-06-05 23:30:00', '2023-06-05 23:50:00', '00:30:00');
INSERT INTO public.risveglio VALUES (3, '2023-06-01 23:15:00', '2023-06-01 23:35:00', '00:30:00');
INSERT INTO public.risveglio VALUES (3, '2023-06-02 22:45:00', '2023-06-02 23:05:00', '00:30:00');
INSERT INTO public.risveglio VALUES (3, '2023-06-03 23:30:00', '2023-06-03 23:50:00', '00:30:00');
INSERT INTO public.risveglio VALUES (3, '2023-06-04 23:00:00', '2023-06-04 23:20:00', '00:30:00');
INSERT INTO public.risveglio VALUES (3, '2023-06-05 22:30:00', '2023-06-05 22:50:00', '00:30:00');
INSERT INTO public.risveglio VALUES (4, '2023-06-01 22:45:00', '2023-06-01 23:05:00', '00:30:00');
INSERT INTO public.risveglio VALUES (4, '2023-06-02 23:15:00', '2023-06-02 23:35:00', '00:30:00');
INSERT INTO public.risveglio VALUES (4, '2023-06-03 23:30:00', '2023-06-03 23:50:00', '00:30:00');
INSERT INTO public.risveglio VALUES (5, '2023-06-01 23:00:00', '2023-06-01 23:20:00', '00:30:00');
INSERT INTO public.risveglio VALUES (5, '2023-06-02 22:30:00', '2023-06-02 22:50:00', '00:30:00');
INSERT INTO public.risveglio VALUES (5, '2023-06-03 23:30:00', '2023-06-03 23:50:00', '00:30:00');
INSERT INTO public.risveglio VALUES (5, '2023-06-04 23:15:00', '2023-06-04 23:35:00', '00:30:00');
INSERT INTO public.risveglio VALUES (5, '2023-06-05 22:45:00', '2023-06-05 23:05:00', '00:30:00');
INSERT INTO public.risveglio VALUES (6, '2023-06-01 23:00:00', '2023-06-01 23:20:00', '00:30:00');
INSERT INTO public.risveglio VALUES (6, '2023-06-02 23:00:00', '2023-06-02 23:20:00', '00:30:00');
INSERT INTO public.risveglio VALUES (6, '2023-06-03 22:45:00', '2023-06-03 23:05:00', '00:30:00');
INSERT INTO public.risveglio VALUES (6, '2023-06-04 23:15:00', '2023-06-04 23:35:00', '00:30:00');
INSERT INTO public.risveglio VALUES (6, '2023-06-05 22:45:00', '2023-06-05 23:05:00', '00:30:00');
INSERT INTO public.risveglio VALUES (7, '2023-06-01 23:15:00', '2023-06-01 23:35:00', '00:30:00');
INSERT INTO public.risveglio VALUES (7, '2023-06-02 22:45:00', '2023-06-02 23:05:00', '00:30:00');
INSERT INTO public.risveglio VALUES (7, '2023-06-03 23:30:00', '2023-06-03 23:50:00', '00:30:00');
INSERT INTO public.risveglio VALUES (7, '2023-06-04 23:00:00', '2023-06-04 23:20:00', '00:30:00');
INSERT INTO public.risveglio VALUES (7, '2023-06-05 22:30:00', '2023-06-05 22:50:00', '00:30:00');
INSERT INTO public.risveglio VALUES (8, '2023-06-01 22:45:00', '2023-06-01 23:05:00', '00:30:00');
INSERT INTO public.risveglio VALUES (8, '2023-06-02 23:15:00', '2023-06-02 23:35:00', '00:30:00');
INSERT INTO public.risveglio VALUES (8, '2023-06-03 23:30:00', '2023-06-03 23:50:00', '00:30:00');
INSERT INTO public.risveglio VALUES (8, '2023-06-04 23:00:00', '2023-06-04 23:20:00', '00:30:00');
INSERT INTO public.risveglio VALUES (8, '2023-06-05 22:30:00', '2023-06-05 22:50:00', '00:30:00');


--
-- TOC entry 3501 (class 0 OID 18983)
-- Dependencies: 212
-- Data for Name: segue; Type: TABLE DATA; Schema: public; Owner: rfabbian
--

INSERT INTO public.segue VALUES (1, 'LowCarb', 4500, 2100, 12000, 75, 0, 10200, 7200);
INSERT INTO public.segue VALUES (2, 'HighProt', 1400, 4760, 5600, 70, 1, 14800, 9520);
INSERT INTO public.segue VALUES (3, 'Mediterranean', 4200, 3360, 8400, 75, 0, 7840, 5040);
INSERT INTO public.segue VALUES (4, 'Vegan', 3600, 3000, 9000, 76, 0, 9000, 4500);
INSERT INTO public.segue VALUES (5, 'Vegetarian', 4200, 3360, 8400, 65, 0, 7840, 5040);
INSERT INTO public.segue VALUES (6, 'Pescetarian', 3600, 3000, 9000, 70, 0, 9000, 6600);
INSERT INTO public.segue VALUES (7, 'LowCarb', 4500, 2100, 12000, 63, 1, 10200, 7200);
INSERT INTO public.segue VALUES (8, 'HighProt', 1400, 4760, 5600, 68, 1, 14800, 9520);
INSERT INTO public.segue VALUES (9, 'Mediterranean', 4200, 3360, 8400, 66, 1, 7840, 5040);
INSERT INTO public.segue VALUES (10, 'Vegan', 3600, 3000, 9000, 70, 0, 9000, 4500);
INSERT INTO public.segue VALUES (11, 'Vegetarian', 4200, 3360, 8400, 72, 0, 7840, 5040);
INSERT INTO public.segue VALUES (12, 'Pescetarian', 3600, 3000, 9000, 68, 0, 9000, 6600);


--
-- TOC entry 3516 (class 0 OID 19150)
-- Dependencies: 227
-- Data for Name: sonno; Type: TABLE DATA; Schema: public; Owner: rfabbian
--

INSERT INTO public.sonno VALUES (1, '2023-06-01 23:00:00', 3, 420);
INSERT INTO public.sonno VALUES (1, '2023-06-02 22:30:00', 4, 480);
INSERT INTO public.sonno VALUES (1, '2023-06-03 23:30:00', 2, 360);
INSERT INTO public.sonno VALUES (1, '2023-06-04 23:15:00', 3, 420);
INSERT INTO public.sonno VALUES (1, '2023-06-05 22:45:00', 4, 480);
INSERT INTO public.sonno VALUES (2, '2023-06-01 23:30:00', 4, 450);
INSERT INTO public.sonno VALUES (2, '2023-06-02 23:00:00', 3, 420);
INSERT INTO public.sonno VALUES (2, '2023-06-03 22:45:00', 4, 480);
INSERT INTO public.sonno VALUES (2, '2023-06-04 23:15:00', 2, 360);
INSERT INTO public.sonno VALUES (2, '2023-06-05 23:30:00', 3, 420);
INSERT INTO public.sonno VALUES (3, '2023-06-01 23:15:00', 3, 420);
INSERT INTO public.sonno VALUES (3, '2023-06-02 22:45:00', 4, 480);
INSERT INTO public.sonno VALUES (3, '2023-06-03 23:30:00', 2, 360);
INSERT INTO public.sonno VALUES (3, '2023-06-04 23:00:00', 3, 420);
INSERT INTO public.sonno VALUES (3, '2023-06-05 22:30:00', 4, 480);
INSERT INTO public.sonno VALUES (4, '2023-06-01 22:45:00', 4, 480);
INSERT INTO public.sonno VALUES (4, '2023-06-02 23:15:00', 2, 360);
INSERT INTO public.sonno VALUES (4, '2023-06-03 23:30:00', 3, 420);
INSERT INTO public.sonno VALUES (4, '2023-06-04 23:00:00', 4, 480);
INSERT INTO public.sonno VALUES (4, '2023-06-05 22:30:00', 3, 420);
INSERT INTO public.sonno VALUES (5, '2023-06-01 23:00:00', 2, 360);
INSERT INTO public.sonno VALUES (5, '2023-06-02 22:30:00', 3, 420);
INSERT INTO public.sonno VALUES (5, '2023-06-03 23:30:00', 4, 480);
INSERT INTO public.sonno VALUES (5, '2023-06-04 23:15:00', 3, 420);
INSERT INTO public.sonno VALUES (5, '2023-06-05 22:45:00', 4, 480);
INSERT INTO public.sonno VALUES (6, '2023-06-01 23:00:00', 4, 450);
INSERT INTO public.sonno VALUES (6, '2023-06-02 23:00:00', 3, 420);
INSERT INTO public.sonno VALUES (6, '2023-06-03 22:45:00', 4, 480);
INSERT INTO public.sonno VALUES (6, '2023-06-04 23:15:00', 2, 360);
INSERT INTO public.sonno VALUES (6, '2023-06-05 22:45:00', 3, 420);
INSERT INTO public.sonno VALUES (7, '2023-06-01 23:15:00', 3, 420);
INSERT INTO public.sonno VALUES (7, '2023-06-02 22:45:00', 4, 480);
INSERT INTO public.sonno VALUES (7, '2023-06-03 23:30:00', 2, 360);
INSERT INTO public.sonno VALUES (7, '2023-06-04 23:00:00', 3, 420);
INSERT INTO public.sonno VALUES (7, '2023-06-05 22:30:00', 4, 480);
INSERT INTO public.sonno VALUES (8, '2023-06-01 22:45:00', 4, 480);
INSERT INTO public.sonno VALUES (8, '2023-06-02 23:15:00', 2, 360);
INSERT INTO public.sonno VALUES (8, '2023-06-03 23:30:00', 3, 420);
INSERT INTO public.sonno VALUES (8, '2023-06-04 23:00:00', 4, 480);
INSERT INTO public.sonno VALUES (8, '2023-06-05 22:30:00', 3, 420);


--
-- TOC entry 3518 (class 0 OID 19167)
-- Dependencies: 229
-- Data for Name: suddiviso; Type: TABLE DATA; Schema: public; Owner: rfabbian
--

INSERT INTO public.suddiviso VALUES (1, '2023-06-05 22:45:00', 1, 'Stadio1:addormentamento', 35, 120);
INSERT INTO public.suddiviso VALUES (2, '2023-06-05 22:45:00', 1, 'Stadio2:sonno_leggero', 40, 180);
INSERT INTO public.suddiviso VALUES (3, '2023-06-05 22:45:00', 1, 'Stadio3:sonno_profondo', 55, 240);
INSERT INTO public.suddiviso VALUES (4, '2023-06-05 22:45:00', 1, 'Stadio4:sonno_profondo_effettivo', 60, 300);
INSERT INTO public.suddiviso VALUES (5, '2023-06-05 22:45:00', 1, 'Stadio5:fase_rem', 65, 360);
INSERT INTO public.suddiviso VALUES (6, '2023-06-01 23:00:00', 1, 'Stadio1:addormentamento', 30, 4200);
INSERT INTO public.suddiviso VALUES (7, '2023-06-01 23:00:00', 1, 'Stadio2:sonno_leggero', 25, 3800);
INSERT INTO public.suddiviso VALUES (8, '2023-06-01 23:00:00', 1, 'Stadio3:sonno_profondo', 40, 2800);
INSERT INTO public.suddiviso VALUES (9, '2023-06-01 23:00:00', 1, 'Stadio4:sonno_profondo_effettivo', 50, 4600);
INSERT INTO public.suddiviso VALUES (10, '2023-06-01 23:00:00', 1, 'Stadio5:fase_rem', 70, 5000);
INSERT INTO public.suddiviso VALUES (1, '2023-06-05 23:30:00', 2, 'Stadio1:addormentamento', 45, 150);
INSERT INTO public.suddiviso VALUES (2, '2023-06-05 23:30:00', 2, 'Stadio2:sonno_leggero', 50, 210);
INSERT INTO public.suddiviso VALUES (3, '2023-06-05 23:30:00', 2, 'Stadio3:sonno_profondo', 65, 270);
INSERT INTO public.suddiviso VALUES (4, '2023-06-05 23:30:00', 2, 'Stadio4:sonno_profondo_effettivo', 70, 330);
INSERT INTO public.suddiviso VALUES (5, '2023-06-05 23:30:00', 2, 'Stadio5:fase_rem', 75, 390);
INSERT INTO public.suddiviso VALUES (6, '2023-06-01 23:30:00', 2, 'Stadio1:addormentamento', 40, 4050);
INSERT INTO public.suddiviso VALUES (7, '2023-06-01 23:30:00', 2, 'Stadio2:sonno_leggero', 35, 3750);
INSERT INTO public.suddiviso VALUES (8, '2023-06-01 23:30:00', 2, 'Stadio3:sonno_profondo', 50, 3150);
INSERT INTO public.suddiviso VALUES (9, '2023-06-01 23:30:00', 2, 'Stadio4:sonno_profondo_effettivo', 60, 4950);
INSERT INTO public.suddiviso VALUES (10, '2023-06-01 23:30:00', 2, 'Stadio5:fase_rem', 70, 4200);
INSERT INTO public.suddiviso VALUES (1, '2023-06-05 22:30:00', 3, 'Stadio1:addormentamento', 35, 120);
INSERT INTO public.suddiviso VALUES (2, '2023-06-05 22:30:00', 3, 'Stadio2:sonno_leggero', 40, 180);
INSERT INTO public.suddiviso VALUES (3, '2023-06-05 22:30:00', 3, 'Stadio3:sonno_profondo', 55, 240);
INSERT INTO public.suddiviso VALUES (4, '2023-06-05 22:30:00', 3, 'Stadio4:sonno_profondo_effettivo', 60, 300);
INSERT INTO public.suddiviso VALUES (5, '2023-06-05 22:30:00', 3, 'Stadio5:fase_rem', 65, 360);
INSERT INTO public.suddiviso VALUES (6, '2023-06-01 23:15:00', 3, 'Stadio1:addormentamento', 30, 4200);
INSERT INTO public.suddiviso VALUES (7, '2023-06-01 23:15:00', 3, 'Stadio2:sonno_leggero', 25, 3800);
INSERT INTO public.suddiviso VALUES (8, '2023-06-01 23:15:00', 3, 'Stadio3:sonno_profondo', 25, 3800);
INSERT INTO public.suddiviso VALUES (1, '2023-06-05 22:30:00', 4, 'Stadio1:addormentamento', 35, 120);
INSERT INTO public.suddiviso VALUES (2, '2023-06-05 22:30:00', 4, 'Stadio2:sonno_leggero', 40, 180);
INSERT INTO public.suddiviso VALUES (3, '2023-06-05 22:30:00', 4, 'Stadio3:sonno_profondo', 55, 240);
INSERT INTO public.suddiviso VALUES (4, '2023-06-05 22:30:00', 4, 'Stadio4:sonno_profondo_effettivo', 60, 300);
INSERT INTO public.suddiviso VALUES (5, '2023-06-05 22:30:00', 4, 'Stadio5:fase_rem', 65, 360);
INSERT INTO public.suddiviso VALUES (6, '2023-06-01 22:45:00', 4, 'Stadio1:addormentamento', 30, 4200);
INSERT INTO public.suddiviso VALUES (7, '2023-06-01 22:45:00', 4, 'Stadio2:sonno_leggero', 25, 3800);
INSERT INTO public.suddiviso VALUES (8, '2023-06-01 22:45:00', 4, 'Stadio3:sonno_profondo', 40, 2800);
INSERT INTO public.suddiviso VALUES (9, '2023-06-01 22:45:00', 4, 'Stadio4:sonno_profondo_effettivo', 50, 4600);
INSERT INTO public.suddiviso VALUES (10, '2023-06-01 22:45:00', 4, 'Stadio5:fase_rem', 70, 5000);
INSERT INTO public.suddiviso VALUES (1, '2023-06-05 22:45:00', 5, 'Stadio1:addormentamento', 35, 120);
INSERT INTO public.suddiviso VALUES (2, '2023-06-05 22:45:00', 5, 'Stadio2:sonno_leggero', 40, 180);
INSERT INTO public.suddiviso VALUES (3, '2023-06-05 22:45:00', 5, 'Stadio3:sonno_profondo', 55, 240);
INSERT INTO public.suddiviso VALUES (4, '2023-06-05 22:45:00', 5, 'Stadio4:sonno_profondo_effettivo', 60, 300);
INSERT INTO public.suddiviso VALUES (5, '2023-06-05 22:45:00', 5, 'Stadio5:fase_rem', 65, 360);
INSERT INTO public.suddiviso VALUES (6, '2023-06-01 23:00:00', 5, 'Stadio1:addormentamento', 30, 4200);
INSERT INTO public.suddiviso VALUES (7, '2023-06-01 23:00:00', 5, 'Stadio2:sonno_leggero', 25, 3800);
INSERT INTO public.suddiviso VALUES (8, '2023-06-01 23:00:00', 5, 'Stadio3:sonno_profondo', 40, 2800);
INSERT INTO public.suddiviso VALUES (9, '2023-06-01 23:00:00', 5, 'Stadio4:sonno_profondo_effettivo', 50, 4600);
INSERT INTO public.suddiviso VALUES (10, '2023-06-01 23:00:00', 5, 'Stadio5:fase_rem', 70, 5000);
INSERT INTO public.suddiviso VALUES (1, '2023-06-05 22:45:00', 6, 'Stadio1:addormentamento', 35, 120);
INSERT INTO public.suddiviso VALUES (2, '2023-06-05 22:45:00', 6, 'Stadio2:sonno_leggero', 40, 180);
INSERT INTO public.suddiviso VALUES (3, '2023-06-05 22:45:00', 6, 'Stadio3:sonno_profondo', 55, 240);
INSERT INTO public.suddiviso VALUES (4, '2023-06-05 22:45:00', 6, 'Stadio4:sonno_profondo_effettivo', 60, 300);
INSERT INTO public.suddiviso VALUES (5, '2023-06-05 22:45:00', 6, 'Stadio5:fase_rem', 65, 360);
INSERT INTO public.suddiviso VALUES (6, '2023-06-01 23:00:00', 6, 'Stadio1:addormentamento', 30, 4200);
INSERT INTO public.suddiviso VALUES (7, '2023-06-01 23:00:00', 6, 'Stadio2:sonno_leggero', 25, 3800);
INSERT INTO public.suddiviso VALUES (8, '2023-06-01 23:00:00', 6, 'Stadio3:sonno_profondo', 40, 2800);
INSERT INTO public.suddiviso VALUES (9, '2023-06-01 23:00:00', 6, 'Stadio4:sonno_profondo_effettivo', 50, 4600);
INSERT INTO public.suddiviso VALUES (10, '2023-06-01 23:00:00', 6, 'Stadio5:fase_rem', 70, 5000);
INSERT INTO public.suddiviso VALUES (1, '2023-06-05 22:30:00', 7, 'Stadio1:addormentamento', 35, 120);
INSERT INTO public.suddiviso VALUES (2, '2023-06-05 22:30:00', 7, 'Stadio2:sonno_leggero', 40, 180);
INSERT INTO public.suddiviso VALUES (3, '2023-06-05 22:30:00', 7, 'Stadio3:sonno_profondo', 55, 240);
INSERT INTO public.suddiviso VALUES (4, '2023-06-05 22:30:00', 7, 'Stadio4:sonno_profondo_effettivo', 60, 300);
INSERT INTO public.suddiviso VALUES (5, '2023-06-05 22:30:00', 7, 'Stadio5:fase_rem', 65, 360);
INSERT INTO public.suddiviso VALUES (6, '2023-06-01 23:15:00', 7, 'Stadio1:addormentamento', 30, 4200);
INSERT INTO public.suddiviso VALUES (7, '2023-06-01 23:15:00', 7, 'Stadio2:sonno_leggero', 25, 3800);
INSERT INTO public.suddiviso VALUES (8, '2023-06-01 23:15:00', 7, 'Stadio3:sonno_profondo', 40, 2800);
INSERT INTO public.suddiviso VALUES (9, '2023-06-01 23:15:00', 7, 'Stadio4:sonno_profondo_effettivo', 50, 4600);
INSERT INTO public.suddiviso VALUES (10, '2023-06-01 23:15:00', 7, 'Stadio5:fase_rem', 70, 5000);
INSERT INTO public.suddiviso VALUES (1, '2023-06-05 22:30:00', 8, 'Stadio1:addormentamento', 35, 120);
INSERT INTO public.suddiviso VALUES (2, '2023-06-05 22:30:00', 8, 'Stadio2:sonno_leggero', 40, 180);
INSERT INTO public.suddiviso VALUES (3, '2023-06-05 22:30:00', 8, 'Stadio3:sonno_profondo', 55, 240);
INSERT INTO public.suddiviso VALUES (4, '2023-06-05 22:30:00', 8, 'Stadio4:sonno_profondo_effettivo', 60, 300);
INSERT INTO public.suddiviso VALUES (5, '2023-06-05 22:30:00', 8, 'Stadio5:fase_rem', 65, 360);
INSERT INTO public.suddiviso VALUES (6, '2023-06-01 22:45:00', 8, 'Stadio1:addormentamento', 30, 4200);
INSERT INTO public.suddiviso VALUES (7, '2023-06-01 22:45:00', 8, 'Stadio2:sonno_leggero', 25, 3800);
INSERT INTO public.suddiviso VALUES (8, '2023-06-01 22:45:00', 8, 'Stadio3:sonno_profondo', 40, 2800);
INSERT INTO public.suddiviso VALUES (9, '2023-06-01 22:45:00', 8, 'Stadio4:sonno_profondo_effettivo', 50, 4600);
INSERT INTO public.suddiviso VALUES (10, '2023-06-01 22:45:00', 8, 'Stadio5:fase_rem', 70, 5000);


--
-- TOC entry 3498 (class 0 OID 18959)
-- Dependencies: 209
-- Data for Name: utente; Type: TABLE DATA; Schema: public; Owner: rfabbian
--

INSERT INTO public.utente VALUES (1, 'fabb.riccardo@gmail.com', 'Riccardo', 'Fabbian', 22, true, 1.75, 4);
INSERT INTO public.utente VALUES (2, 'matteo.scavazza@gmail.com', 'Matteo', 'Scavazza', 22, true, 1.86, 1);
INSERT INTO public.utente VALUES (3, 'marco.costa@gmail.com', 'Marco', 'Costa', 22, true, 1.75, 4);
INSERT INTO public.utente VALUES (4, 'matteo.munari@gmail.com', 'Matteo', 'Munari', 21, true, 1.78, 2);
INSERT INTO public.utente VALUES (5, 'cannaviello.riccardo@gmail.com', 'Riccardo', 'Cannaviello', 22, true, 1.78, 4);
INSERT INTO public.utente VALUES (6, 'lorenzo.franco@gmail.com', 'Lorenzo', 'Franco', 22, true, 1.75, 3);
INSERT INTO public.utente VALUES (7, 'giulia.bianchi@gmail.com', 'Giulia', 'Bianchi', 22, false, 1.65, 4);
INSERT INTO public.utente VALUES (8, 'marta.rossi@gmail.com', 'Marta', 'Rossi', 22, false, 1.70, 1);
INSERT INTO public.utente VALUES (9, 'francesca.verdi@gmail.com', 'Francesca', 'Verdi', 22, false, 1.68, 4);
INSERT INTO public.utente VALUES (10, 'laura.gialli@gmail.com', 'Laura', 'Gialli', 21, false, 1.72, 2);
INSERT INTO public.utente VALUES (11, 'elisa.neri@gmail.com', 'Elisa', 'Neri', 22, false, 1.70, 4);
INSERT INTO public.utente VALUES (12, 'valentina.rosselli@gmail.com', 'Valentina', 'Rosselli', 22, false, 1.65, 3);


--
-- TOC entry 3301 (class 2606 OID 19002)
-- Name: acqua acqua_pkey; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.acqua
    ADD CONSTRAINT acqua_pkey PRIMARY KEY (id_acqua);


--
-- TOC entry 3305 (class 2606 OID 19022)
-- Name: alimento alimento_pkey; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.alimento
    ADD CONSTRAINT alimento_pkey PRIMARY KEY (id_alimento);


--
-- TOC entry 3317 (class 2606 OID 19094)
-- Name: allenamento allenamento_pkey; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.allenamento
    ADD CONSTRAINT allenamento_pkey PRIMARY KEY (id_allenamento);


--
-- TOC entry 3313 (class 2606 OID 19064)
-- Name: appartenente appartenente_pkey; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.appartenente
    ADD CONSTRAINT appartenente_pkey PRIMARY KEY (nome_dieta, id_alimento);


--
-- TOC entry 3315 (class 2606 OID 19079)
-- Name: assume assume_pkey; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.assume
    ADD CONSTRAINT assume_pkey PRIMARY KEY (id_utente, id_acqua);


--
-- TOC entry 3319 (class 2606 OID 19104)
-- Name: cardio cardio_pkey; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.cardio
    ADD CONSTRAINT cardio_pkey PRIMARY KEY (id_allenamento);


--
-- TOC entry 3321 (class 2606 OID 19114)
-- Name: cardiovascolare cardiovascolare_pkey; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.cardiovascolare
    ADD CONSTRAINT cardiovascolare_pkey PRIMARY KEY (nome_movimento);


--
-- TOC entry 3327 (class 2606 OID 19139)
-- Name: composto composto_pkey; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.composto
    ADD CONSTRAINT composto_pkey PRIMARY KEY (id_allenamento, nome_esercizio);


--
-- TOC entry 3311 (class 2606 OID 19049)
-- Name: contenente contenente_pkey; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.contenente
    ADD CONSTRAINT contenente_pkey PRIMARY KEY (nome_ricetta, id_alimento);


--
-- TOC entry 3307 (class 2606 OID 19027)
-- Name: costituito costituito_pkey; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.costituito
    ADD CONSTRAINT costituito_pkey PRIMARY KEY (id_pasto, id_alimento);


--
-- TOC entry 3297 (class 2606 OID 18982)
-- Name: dieta dieta_pkey; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.dieta
    ADD CONSTRAINT dieta_pkey PRIMARY KEY (nome_dieta);


--
-- TOC entry 3331 (class 2606 OID 19166)
-- Name: fase fase_pkey; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.fase
    ADD CONSTRAINT fase_pkey PRIMARY KEY (tipologia_fase);


--
-- TOC entry 3323 (class 2606 OID 19119)
-- Name: formato formato_pkey; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.formato
    ADD CONSTRAINT formato_pkey PRIMARY KEY (nome_movimento, id_allenamento);


--
-- TOC entry 3303 (class 2606 OID 19007)
-- Name: pasto pasto_pkey; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.pasto
    ADD CONSTRAINT pasto_pkey PRIMARY KEY (id_pasto);


--
-- TOC entry 3325 (class 2606 OID 19134)
-- Name: pesistica pesistica_pkey; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.pesistica
    ADD CONSTRAINT pesistica_pkey PRIMARY KEY (nome_esercizio);


--
-- TOC entry 3295 (class 2606 OID 18970)
-- Name: peso peso_pkey; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.peso
    ADD CONSTRAINT peso_pkey PRIMARY KEY (id_utente, data_misurazione);


--
-- TOC entry 3309 (class 2606 OID 19044)
-- Name: ricetta ricetta_pkey; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.ricetta
    ADD CONSTRAINT ricetta_pkey PRIMARY KEY (nome_ricetta);


--
-- TOC entry 3335 (class 2606 OID 19186)
-- Name: risveglio risveglio_pkey; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.risveglio
    ADD CONSTRAINT risveglio_pkey PRIMARY KEY (id_utente, data_ora_riposo, orario_risveglio);


--
-- TOC entry 3299 (class 2606 OID 18987)
-- Name: segue segue_pkey; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.segue
    ADD CONSTRAINT segue_pkey PRIMARY KEY (id_utente, nome_dieta);


--
-- TOC entry 3329 (class 2606 OID 19154)
-- Name: sonno sonno_pkey; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.sonno
    ADD CONSTRAINT sonno_pkey PRIMARY KEY (id_utente, data_ora_riposo);


--
-- TOC entry 3333 (class 2606 OID 19171)
-- Name: suddiviso suddiviso_pkey; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.suddiviso
    ADD CONSTRAINT suddiviso_pkey PRIMARY KEY (id_suddiviso, id_utente, data_ora_riposo);


--
-- TOC entry 3291 (class 2606 OID 18965)
-- Name: utente utente_email_key; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.utente
    ADD CONSTRAINT utente_email_key UNIQUE (email);


--
-- TOC entry 3293 (class 2606 OID 18963)
-- Name: utente utente_pkey; Type: CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.utente
    ADD CONSTRAINT utente_pkey PRIMARY KEY (id_utente);


--
-- TOC entry 3349 (class 2606 OID 19095)
-- Name: allenamento allenamento_id_utente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.allenamento
    ADD CONSTRAINT allenamento_id_utente_fkey FOREIGN KEY (id_utente) REFERENCES public.utente(id_utente) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3345 (class 2606 OID 19065)
-- Name: appartenente appartenente_id_alimento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.appartenente
    ADD CONSTRAINT appartenente_id_alimento_fkey FOREIGN KEY (id_alimento) REFERENCES public.alimento(id_alimento) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3346 (class 2606 OID 19070)
-- Name: appartenente appartenente_nome_dieta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.appartenente
    ADD CONSTRAINT appartenente_nome_dieta_fkey FOREIGN KEY (nome_dieta) REFERENCES public.dieta(nome_dieta) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3347 (class 2606 OID 19085)
-- Name: assume assume_id_acqua_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.assume
    ADD CONSTRAINT assume_id_acqua_fkey FOREIGN KEY (id_acqua) REFERENCES public.acqua(id_acqua) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3348 (class 2606 OID 19080)
-- Name: assume assume_id_utente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.assume
    ADD CONSTRAINT assume_id_utente_fkey FOREIGN KEY (id_utente) REFERENCES public.utente(id_utente) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3350 (class 2606 OID 19105)
-- Name: cardio cardio_id_allenamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.cardio
    ADD CONSTRAINT cardio_id_allenamento_fkey FOREIGN KEY (id_allenamento) REFERENCES public.allenamento(id_allenamento) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3353 (class 2606 OID 19140)
-- Name: composto composto_id_allenamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.composto
    ADD CONSTRAINT composto_id_allenamento_fkey FOREIGN KEY (id_allenamento) REFERENCES public.allenamento(id_allenamento) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3354 (class 2606 OID 19145)
-- Name: composto composto_nome_esercizio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.composto
    ADD CONSTRAINT composto_nome_esercizio_fkey FOREIGN KEY (nome_esercizio) REFERENCES public.pesistica(nome_esercizio) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3343 (class 2606 OID 19055)
-- Name: contenente contenente_id_alimento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.contenente
    ADD CONSTRAINT contenente_id_alimento_fkey FOREIGN KEY (id_alimento) REFERENCES public.alimento(id_alimento) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3344 (class 2606 OID 19050)
-- Name: contenente contenente_nome_ricetta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.contenente
    ADD CONSTRAINT contenente_nome_ricetta_fkey FOREIGN KEY (nome_ricetta) REFERENCES public.ricetta(nome_ricetta) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3341 (class 2606 OID 19033)
-- Name: costituito costituito_id_alimento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.costituito
    ADD CONSTRAINT costituito_id_alimento_fkey FOREIGN KEY (id_alimento) REFERENCES public.alimento(id_alimento) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3342 (class 2606 OID 19028)
-- Name: costituito costituito_id_pasto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.costituito
    ADD CONSTRAINT costituito_id_pasto_fkey FOREIGN KEY (id_pasto) REFERENCES public.pasto(id_pasto) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3351 (class 2606 OID 19120)
-- Name: formato formato_id_allenamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.formato
    ADD CONSTRAINT formato_id_allenamento_fkey FOREIGN KEY (id_allenamento) REFERENCES public.cardio(id_allenamento) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3352 (class 2606 OID 19125)
-- Name: formato formato_nome_movimento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.formato
    ADD CONSTRAINT formato_nome_movimento_fkey FOREIGN KEY (nome_movimento) REFERENCES public.cardiovascolare(nome_movimento) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3339 (class 2606 OID 19013)
-- Name: pasto pasto_id_acqua_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.pasto
    ADD CONSTRAINT pasto_id_acqua_fkey FOREIGN KEY (id_acqua) REFERENCES public.acqua(id_acqua) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3340 (class 2606 OID 19008)
-- Name: pasto pasto_id_utente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.pasto
    ADD CONSTRAINT pasto_id_utente_fkey FOREIGN KEY (id_utente) REFERENCES public.utente(id_utente) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3336 (class 2606 OID 18971)
-- Name: peso peso_id_utente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.peso
    ADD CONSTRAINT peso_id_utente_fkey FOREIGN KEY (id_utente) REFERENCES public.utente(id_utente) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3358 (class 2606 OID 19187)
-- Name: risveglio risveglio_id_utente_data_ora_riposo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.risveglio
    ADD CONSTRAINT risveglio_id_utente_data_ora_riposo_fkey FOREIGN KEY (id_utente, data_ora_riposo) REFERENCES public.sonno(id_utente, data_ora_riposo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3337 (class 2606 OID 18988)
-- Name: segue segue_id_utente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.segue
    ADD CONSTRAINT segue_id_utente_fkey FOREIGN KEY (id_utente) REFERENCES public.utente(id_utente) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3338 (class 2606 OID 18993)
-- Name: segue segue_nome_dieta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.segue
    ADD CONSTRAINT segue_nome_dieta_fkey FOREIGN KEY (nome_dieta) REFERENCES public.dieta(nome_dieta) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3355 (class 2606 OID 19155)
-- Name: sonno sonno_id_utente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.sonno
    ADD CONSTRAINT sonno_id_utente_fkey FOREIGN KEY (id_utente) REFERENCES public.utente(id_utente) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3356 (class 2606 OID 19172)
-- Name: suddiviso suddiviso_id_utente_data_ora_riposo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.suddiviso
    ADD CONSTRAINT suddiviso_id_utente_data_ora_riposo_fkey FOREIGN KEY (id_utente, data_ora_riposo) REFERENCES public.sonno(id_utente, data_ora_riposo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3357 (class 2606 OID 19177)
-- Name: suddiviso suddiviso_tipologia_fase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rfabbian
--

ALTER TABLE ONLY public.suddiviso
    ADD CONSTRAINT suddiviso_tipologia_fase_fkey FOREIGN KEY (tipologia_fase) REFERENCES public.fase(tipologia_fase) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 3525
-- Name: DATABASE iberu; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE iberu TO rfabbian;


-- Completed on 2023-07-13 15:56:56 CEST

--
-- PostgreSQL database dump complete
--


SELECT r.nome_ricetta, r.peso_finale, r.durata_preparazione, r.durata_cottura, r.procedimento, r.difficolta
FROM ricetta r
JOIN contenente c
ON r.nome_ricetta = c.nome_ricetta 
WHERE c.id_alimento = 11
GROUP BY r.nome_ricetta
HAVING COUNT (*) = 1
ORDER BY r.difficolta DESC;


SELECT al.nome_alimento, COUNT(*) AS migliori
FROM Segue s
JOIN Dieta d
ON s.nome_dieta = d.nome_dieta
JOIN Appartenente a
ON d.nome_dieta = a.nome_dieta
JOIN Alimento al
ON al.id_alimento = a.id_alimento
WHERE s.nome_dieta = 'Mediterranean'
GROUP BY al.nome_alimento
ORDER BY migliori DESC;


SELECT u.nome, u.cognome, ROUND(us.media_riposo, 2) AS media_riposo_utente, ROUND(usa.media_add, 2) AS media_add, ROUND(usl.media_sl, 2) AS media_sl, ROUND(usp.media_sp, 2) AS media_sp, ROUND(uspe.media_spe, 2) AS media_spe, ROUND(usr.media_r, 2) AS media_r
FROM utente u
JOIN sonno s
ON s.id_utente = u.id_utente
JOIN (SELECT u.id_utente, AVG(s.durata_riposo) AS media_riposo 
FROM sonno s JOIN utente u ON u.id_utente = s.id_utente
WHERE u.nome = 'Matteo' AND u.cognome = 'Scavazza' GROUP BY u.id_utente) AS us 
ON us.id_utente = u.id_utente
JOIN (SELECT u.id_utente, AVG(s.durata_fase) AS media_add
FROM suddiviso s JOIN utente u ON u.id_utente = s.id_utente
WHERE tipologia_fase = 'Stadio1:addormentamento' AND u.nome = 'Matteo' AND u.cognome = 'Scavazza' GROUP BY u.id_utente) AS usa 
ON usa.id_utente = u.id_utente
JOIN (SELECT u.id_utente, AVG(s.durata_fase) AS media_sl
FROM suddiviso s JOIN utente u ON u.id_utente = s.id_utente
WHERE tipologia_fase = 'Stadio2:sonno_leggero' AND u.nome = 'Matteo' AND u.cognome = 'Scavazza' GROUP BY u.id_utente) AS usl 
ON usl.id_utente = u.id_utente
JOIN (SELECT u.id_utente, AVG(s.durata_fase) AS media_sp
FROM suddiviso s JOIN utente u ON u.id_utente = s.id_utente
WHERE tipologia_fase = 'Stadio3:sonno_profondo' AND u.nome = 'Matteo' AND u.cognome = 'Scavazza' GROUP BY u.id_utente) AS usp 
ON usp.id_utente = u.id_utente
JOIN (SELECT u.id_utente, AVG(s.durata_fase) AS media_spe
FROM suddiviso s JOIN utente u ON u.id_utente = s.id_utente
WHERE tipologia_fase = 'Stadio4:sonno_profondo_effettivo' AND u.nome = 'Matteo' AND u.cognome = 'Scavazza' GROUP BY u.id_utente) AS uspe 
ON uspe.id_utente = u.id_utente
JOIN (SELECT u.id_utente, AVG(s.durata_fase) AS media_r
FROM suddiviso s JOIN utente u ON u.id_utente = s.id_utente
WHERE tipologia_fase = 'Stadio5:fase_rem' AND u.nome = 'Matteo' AND u.cognome = 'Scavazza' GROUP BY u.id_utente) AS usr 
ON usr.id_utente = u.id_utente
GROUP BY u.nome, u.cognome, us.media_riposo, usa.media_add, usl.media_sl, usp.media_sp, uspe.media_spe, usr.media_r; 


SELECT r.nome_ricetta 
FROM ricetta r 
WHERE r.nome_ricetta NOT IN(SELECT r.nome_ricetta
FROM ricetta r 
JOIN contenente c ON r.nome_ricetta = c.nome_ricetta
JOIN alimento a ON a.id_alimento = c.id_alimento
JOIN appartenente ap ON ap.id_alimento = a.id_alimento
GROUP BY r.nome_ricetta)
GROUP BY r.nome_ricetta;
 
SELECT u.nome, u.cognome,
(SELECT p.nome_esercizio
FROM utente u1
JOIN allenamento a ON u1.id_utente = a.id_utente
JOIN composto c ON a.id_allenamento = c.id_allenamento
JOIN pesistica p ON c.nome_esercizio = p.nome_esercizio
WHERE u1.genere = false AND u1.id_utente = u.id_utente
GROUP BY p.nome_esercizio
ORDER BY COUNT(*) DESC
LIMIT 1) AS esercizio_preferito,
(SELECT c.nome_movimento
FROM utente u3
JOIN allenamento a ON u3.id_utente = a.id_utente
JOIN formato f ON a.id_allenamento = f.id_allenamento
JOIN cardiovascolare c ON f.nome_movimento = c.nome_movimento
WHERE u3.genere = false AND u3.id_utente = u.id_utente
GROUP BY c.nome_movimento
ORDER BY COUNT(*) DESC
LIMIT 1) AS movimento_preferito
FROM utente u
WHERE u.genere = false;


SELECT u.nome, u.cognome, p.peso as peso_iniziale, s.peso_obiettivo, ROUND(AVG(pp.peso), 2) as peso_medio, ROUND(AVG(pp.perdita_peso), 3) as perdita_peso_misurazioni
FROM utente u 
JOIN segue s ON u.id_utente = s.id_utente
JOIN (SELECT *, peso - LAG(peso, 1) OVER(PARTITION BY id_utente 
ORDER BY data_misurazione) perdita_peso 
FROM peso
WHERE data_misurazione > '2023-03-17'
ORDER BY data_misurazione) pp ON pp.id_utente = u.id_utente
JOIN (SELECT row_number() OVER(PARTITION BY id_utente order by data_misurazione) as row, id_utente, peso
FROM peso
WHERE data_misurazione >  '2023-03-17') p ON p.id_utente = u.id_utente
WHERE p.row = 1
GROUP BY u.nome, u.cognome, p.peso, s.peso_obiettivo;


SELECT COUNT(*) AS totale_utenti, 
ROUND(AVG(un.calorie), 2) AS media_calorie, 
ROUND(AVG(un.carboidrati), 0) AS media_carboidrati, 
ROUND(AVG(un.proteine), 0) AS media_proteine, 
ROUND(AVG(un.grassi), 0) AS media_grassi
FROM (SELECT u.id_utente, 
AVG(p.calorie_pasto) AS calorie, 
AVG(p.carboidrati_pasto) AS carboidrati, 
AVG(p.proteine_pasto) AS proteine, 
AVG(p.grassi_pasto) AS grassi
FROM utente u 
JOIN pasto AS p
ON p.id_utente = u.id_utente
WHERE u.volume_attivita >= 2 AND u.genere=true
GROUP BY u.id_utente) AS un;
