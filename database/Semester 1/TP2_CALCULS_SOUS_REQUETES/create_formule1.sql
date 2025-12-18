
--
-- Name: tp_formule1; Type: SCHEMA; Schema: -; 
--

CREATE SCHEMA tp_formule1;
set search_path = tp_formule1;



SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bareme; Type: TABLE; Schema: tp_formule1; 
--

CREATE TABLE tp_formule1.bareme (
    place integer,
    points integer
);



--
-- Name: circuit; Type: TABLE; Schema: tp_formule1; 
--

CREATE TABLE tp_formule1.circuit (
    id_circuit integer NOT NULL,
    nomcircuit character varying(150) NOT NULL,
    payscircuit character varying(45),
    longpiste numeric(5,2),
    nbspectateur integer
);



--
-- Name: circuit_id_circuit_seq; Type: SEQUENCE; Schema: tp_formule1; 
--

CREATE SEQUENCE tp_formule1.circuit_id_circuit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: circuit_id_circuit_seq; Type: SEQUENCE OWNED BY; Schema: tp_formule1; 
--

ALTER SEQUENCE tp_formule1.circuit_id_circuit_seq OWNED BY tp_formule1.circuit.id_circuit;


--
-- Name: courir; Type: TABLE; Schema: tp_formule1; 
--

CREATE TABLE tp_formule1.courir (
    idgp integer NOT NULL,
    idpilote integer NOT NULL,
    numvoiture integer,
    positiongrille integer,
    positionarrivee character varying(2)
);



--
-- Name: ecurie; Type: TABLE; Schema: tp_formule1; 
--

CREATE TABLE tp_formule1.ecurie (
    id_ecurie integer NOT NULL,
    nomecurie character varying(75) NOT NULL,
    idfour integer NOT NULL,
    adrsiege character varying(75),
    villesiege character varying(45),
    cpsiege numeric(5,0),
    directeur character varying(45)
);



--
-- Name: ecurie_id_ecurie_seq; Type: SEQUENCE; Schema: tp_formule1; 
--

CREATE SEQUENCE tp_formule1.ecurie_id_ecurie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




--
-- Name: ecurie_id_ecurie_seq; Type: SEQUENCE OWNED BY; Schema: tp_formule1; 
--

ALTER SEQUENCE tp_formule1.ecurie_id_ecurie_seq OWNED BY tp_formule1.ecurie.id_ecurie;


--
-- Name: fournisseur; Type: TABLE; Schema: tp_formule1; 
--

CREATE TABLE tp_formule1.fournisseur (
    idfour integer NOT NULL,
    nomfour character varying(45),
    adr character varying(75),
    ville character varying(45),
    cp numeric(5,0),
    dateaccordfisa date
);




--
-- Name: fournisseur_idfour_seq; Type: SEQUENCE; Schema: tp_formule1; 
--

CREATE SEQUENCE tp_formule1.fournisseur_idfour_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




--
-- Name: fournisseur_idfour_seq; Type: SEQUENCE OWNED BY; Schema: tp_formule1; 
--

ALTER SEQUENCE tp_formule1.fournisseur_idfour_seq OWNED BY tp_formule1.fournisseur.idfour;


--
-- Name: grandprix; Type: TABLE; Schema: tp_formule1; 
--

CREATE TABLE tp_formule1.grandprix (
    idgp integer NOT NULL,
    id_circuit integer NOT NULL,
    nomgp character varying(45) NOT NULL,
    nbtour integer,
    dategp date,
    nbqualif integer,
    nbtourseffectue integer
);




--
-- Name: grandprix_idgp_seq; Type: SEQUENCE; Schema: tp_formule1; 
--

CREATE SEQUENCE tp_formule1.grandprix_idgp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




--
-- Name: grandprix_idgp_seq; Type: SEQUENCE OWNED BY; Schema: tp_formule1; 
--

ALTER SEQUENCE tp_formule1.grandprix_idgp_seq OWNED BY tp_formule1.grandprix.idgp;


--
-- Name: pilote; Type: TABLE; Schema: tp_formule1; 
--

CREATE TABLE tp_formule1.pilote (
    idpilote integer NOT NULL,
    prenompilote character varying(45),
    nompilote character varying(45)
);




--
-- Name: pilote_idpilote_seq; Type: SEQUENCE; Schema: tp_formule1; 
--

CREATE SEQUENCE tp_formule1.pilote_idpilote_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




--
-- Name: pilote_idpilote_seq; Type: SEQUENCE OWNED BY; Schema: tp_formule1; 
--

ALTER SEQUENCE tp_formule1.pilote_idpilote_seq OWNED BY tp_formule1.pilote.idpilote;


--
-- Name: soutenir; Type: TABLE; Schema: tp_formule1; 
--

CREATE TABLE tp_formule1.soutenir (
    nomsponsor character varying(45) NOT NULL,
    idpilote integer NOT NULL
);




--
-- Name: sponsor; Type: TABLE; Schema: tp_formule1; 
--

CREATE TABLE tp_formule1.sponsor (
    nomsponsor character varying(45) NOT NULL,
    secteur character varying(45)
);




--
-- Name: sponsoriser; Type: TABLE; Schema: tp_formule1; 
--

CREATE TABLE tp_formule1.sponsoriser (
    id_ecurie integer NOT NULL,
    nomsponsor character varying(45) NOT NULL
);




--
-- Name: voiture; Type: TABLE; Schema: tp_formule1; 
--

CREATE TABLE tp_formule1.voiture (
    numvoiture integer NOT NULL,
    id_ecurie integer NOT NULL,
    type character varying(75)
);




--
-- Name: circuit id_circuit; Type: DEFAULT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.circuit ALTER COLUMN id_circuit SET DEFAULT nextval('tp_formule1.circuit_id_circuit_seq'::regclass);


--
-- Name: ecurie id_ecurie; Type: DEFAULT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.ecurie ALTER COLUMN id_ecurie SET DEFAULT nextval('tp_formule1.ecurie_id_ecurie_seq'::regclass);


--
-- Name: fournisseur idfour; Type: DEFAULT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.fournisseur ALTER COLUMN idfour SET DEFAULT nextval('tp_formule1.fournisseur_idfour_seq'::regclass);


--
-- Name: grandprix idgp; Type: DEFAULT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.grandprix ALTER COLUMN idgp SET DEFAULT nextval('tp_formule1.grandprix_idgp_seq'::regclass);


--
-- Name: pilote idpilote; Type: DEFAULT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.pilote ALTER COLUMN idpilote SET DEFAULT nextval('tp_formule1.pilote_idpilote_seq'::regclass);


--
-- Data for Name: bareme; Type: TABLE DATA; Schema: tp_formule1; 
--

INSERT INTO tp_formule1.bareme VALUES (1, 25);
INSERT INTO tp_formule1.bareme VALUES (2, 18);
INSERT INTO tp_formule1.bareme VALUES (3, 15);
INSERT INTO tp_formule1.bareme VALUES (4, 12);
INSERT INTO tp_formule1.bareme VALUES (5, 10);
INSERT INTO tp_formule1.bareme VALUES (6, 8);
INSERT INTO tp_formule1.bareme VALUES (7, 6);
INSERT INTO tp_formule1.bareme VALUES (8, 4);
INSERT INTO tp_formule1.bareme VALUES (9, 2);
INSERT INTO tp_formule1.bareme VALUES (10, 1);


--
-- Data for Name: circuit; Type: TABLE DATA; Schema: tp_formule1; 
--

INSERT INTO tp_formule1.circuit VALUES (1, 'Circuit de l''Albert Park (Melbourne Grand Prix Circuit)', 'australie', 3.70, 34000);
INSERT INTO tp_formule1.circuit VALUES (2, 'Circuit des Amériques (Circuit of the Americas)', 'US', 5.52, 56900);
INSERT INTO tp_formule1.circuit VALUES (3, 'Circuit international de Sakhir (Barhain International Circuit)', 'Bahreïn', 5.41, 50000);
INSERT INTO tp_formule1.circuit VALUES (4, 'Circuit de Catalogne (Circuit de Catalunya)', 'Espagne', 6.90, 34560);
INSERT INTO tp_formule1.circuit VALUES (5, 'Circuit Gilles-Villeneuve', 'Canada', 3.90, 23000);
INSERT INTO tp_formule1.circuit VALUES (6, 'Circuit d''Hockenheim (Hockenheimring)', 'Allemagne', 7.50, 34000);
INSERT INTO tp_formule1.circuit VALUES (7, 'Hungaroring', 'Hongrie', 4.70, 67000);
INSERT INTO tp_formule1.circuit VALUES (8, 'Circuit José Carlos Pace d''Interlagos (Autodromo José Carlos Pace)', 'Brésil', 9.60, 56789);
INSERT INTO tp_formule1.circuit VALUES (9, 'Circuit de Monaco', 'Monaco', 5.80, 43000);
INSERT INTO tp_formule1.circuit VALUES (10, 'Circuit de Monza (Autodromo Nazionale di Monza)', 'Italie', 6.30, 76000);
INSERT INTO tp_formule1.circuit VALUES (11, 'Red Bull Ring', 'Autriche', 4.90, 54000);
INSERT INTO tp_formule1.circuit VALUES (12, 'Circuit international de Sepang (Sepang International Circuit)', 'Malaisie', 7.89, 120000);
INSERT INTO tp_formule1.circuit VALUES (13, 'Circuit international de Shanghai (Shanghai International Circuit)', 'Chine', 10.30, 12000);
INSERT INTO tp_formule1.circuit VALUES (14, 'Circuit de Silverstone (Silverstone Circuit)', 'Grande-Bretagne', 4.90, 65000);
INSERT INTO tp_formule1.circuit VALUES (15, 'Circuit urbain de Singapour (Marina Bay Street Circuit)', 'Singapour', 3.90, 78000);
INSERT INTO tp_formule1.circuit VALUES (16, 'Circuit de Spa-Francorchamps', 'Belgique', 6.10, 35300);
INSERT INTO tp_formule1.circuit VALUES (17, 'Circuit urbain international de Sotchi', 'Russie', 9.40, 12300);
INSERT INTO tp_formule1.circuit VALUES (18, 'Circuit de Suzuka (Suzuka Circuit)', 'Japon', 3.30, 65800);
INSERT INTO tp_formule1.circuit VALUES (19, 'Circuit Yas Marina (Yas Marina Circuit)', 'Abou Dabi', 2.90, 5690);


--
-- Data for Name: courir; Type: TABLE DATA; Schema: tp_formule1; 
--

INSERT INTO tp_formule1.courir VALUES (1, 19, 14, 0, '0');
INSERT INTO tp_formule1.courir VALUES (1, 20, 22, 0, '0');
INSERT INTO tp_formule1.courir VALUES (1, 4, 7, 1, '4');
INSERT INTO tp_formule1.courir VALUES (1, 1, 44, 2, '1');
INSERT INTO tp_formule1.courir VALUES (1, 2, 6, 3, '2');
INSERT INTO tp_formule1.courir VALUES (1, 3, 5, 4, '3');
INSERT INTO tp_formule1.courir VALUES (1, 8, 26, 5, '8');
INSERT INTO tp_formule1.courir VALUES (1, 10, 27, 6, '9');
INSERT INTO tp_formule1.courir VALUES (1, 5, 19, 7, '5');
INSERT INTO tp_formule1.courir VALUES (1, 6, 77, 8, '6');
INSERT INTO tp_formule1.courir VALUES (1, 11, 11, 9, '10');
INSERT INTO tp_formule1.courir VALUES (1, 12, 20, 10, '11');
INSERT INTO tp_formule1.courir VALUES (1, 7, 3, 11, '7');
INSERT INTO tp_formule1.courir VALUES (1, 13, 30, 12, '12');
INSERT INTO tp_formule1.courir VALUES (1, 9, 33, 13, '13');
INSERT INTO tp_formule1.courir VALUES (1, 15, 55, 14, '14');
INSERT INTO tp_formule1.courir VALUES (1, 17, 9, 15, '15');
INSERT INTO tp_formule1.courir VALUES (1, 18, 12, 16, '16');
INSERT INTO tp_formule1.courir VALUES (1, 22, 94, 17, '17');
INSERT INTO tp_formule1.courir VALUES (1, 26, 21, 18, '20');
INSERT INTO tp_formule1.courir VALUES (1, 23, 88, 19, '18');
INSERT INTO tp_formule1.courir VALUES (1, 25, 8, 20, '19');
INSERT INTO tp_formule1.courir VALUES (2, 17, 9, 0, '0');
INSERT INTO tp_formule1.courir VALUES (2, 18, 12, 0, '0');
INSERT INTO tp_formule1.courir VALUES (2, 7, 3, 0, '0');
INSERT INTO tp_formule1.courir VALUES (2, 13, 30, 0, '0');
INSERT INTO tp_formule1.courir VALUES (2, 25, 8, 1, '9');
INSERT INTO tp_formule1.courir VALUES (2, 12, 20, 2, '11');
INSERT INTO tp_formule1.courir VALUES (2, 6, 77, 3, '14');
INSERT INTO tp_formule1.courir VALUES (2, 19, 14, 4, '15');
INSERT INTO tp_formule1.courir VALUES (2, 4, 7, 5, '5');
INSERT INTO tp_formule1.courir VALUES (2, 11, 11, 6, '3');
INSERT INTO tp_formule1.courir VALUES (2, 5, 19, 7, 'A');
INSERT INTO tp_formule1.courir VALUES (2, 10, 27, 8, '2');
INSERT INTO tp_formule1.courir VALUES (2, 1, 44, 9, '17');
INSERT INTO tp_formule1.courir VALUES (2, 23, 88, 10, '18');
INSERT INTO tp_formule1.courir VALUES (2, 3, 5, 11, '1');
INSERT INTO tp_formule1.courir VALUES (2, 20, 22, 12, '8');
INSERT INTO tp_formule1.courir VALUES (2, 15, 55, 13, '10');
INSERT INTO tp_formule1.courir VALUES (2, 22, 94, 14, '12');
INSERT INTO tp_formule1.courir VALUES (2, 26, 21, 15, '7');
INSERT INTO tp_formule1.courir VALUES (2, 2, 6, 16, '16');
INSERT INTO tp_formule1.courir VALUES (2, 8, 26, 17, '13');
INSERT INTO tp_formule1.courir VALUES (2, 9, 33, 18, '6');
INSERT INTO tp_formule1.courir VALUES (3, 18, 12, 0, '0');
INSERT INTO tp_formule1.courir VALUES (3, 8, 26, 0, '0');
INSERT INTO tp_formule1.courir VALUES (3, 11, 11, 0, '0');
INSERT INTO tp_formule1.courir VALUES (3, 19, 14, 14, '1');
INSERT INTO tp_formule1.courir VALUES (3, 20, 22, 15, '2');
INSERT INTO tp_formule1.courir VALUES (3, 7, 3, 7, '3');
INSERT INTO tp_formule1.courir VALUES (3, 9, 33, 11, '4');
INSERT INTO tp_formule1.courir VALUES (3, 10, 27, 8, '5');
INSERT INTO tp_formule1.courir VALUES (3, 22, 94, 16, '6');
INSERT INTO tp_formule1.courir VALUES (3, 4, 7, 4, '7');
INSERT INTO tp_formule1.courir VALUES (3, 6, 77, 6, '9');
INSERT INTO tp_formule1.courir VALUES (3, 25, 8, 18, '10');
INSERT INTO tp_formule1.courir VALUES (3, 1, 44, 1, '11');
INSERT INTO tp_formule1.courir VALUES (3, 15, 55, 12, '12');
INSERT INTO tp_formule1.courir VALUES (3, 3, 5, 3, '13');
INSERT INTO tp_formule1.courir VALUES (3, 26, 21, 19, '14');
INSERT INTO tp_formule1.courir VALUES (3, 13, 30, 10, '15');
INSERT INTO tp_formule1.courir VALUES (3, 51, 88, 17, '16');
INSERT INTO tp_formule1.courir VALUES (3, 17, 9, 13, '17');
INSERT INTO tp_formule1.courir VALUES (3, 12, 20, 9, '18');
INSERT INTO tp_formule1.courir VALUES (3, 5, 19, 5, '19');
INSERT INTO tp_formule1.courir VALUES (3, 2, 6, 2, 'A');
INSERT INTO tp_formule1.courir VALUES (4, 10, 27, 16, '1');
INSERT INTO tp_formule1.courir VALUES (4, 15, 55, 6, '2');
INSERT INTO tp_formule1.courir VALUES (4, 22, 94, 3, '3');
INSERT INTO tp_formule1.courir VALUES (4, 17, 9, 7, '4');
INSERT INTO tp_formule1.courir VALUES (4, 4, 7, 12, '5');
INSERT INTO tp_formule1.courir VALUES (4, 11, 11, 20, '6');
INSERT INTO tp_formule1.courir VALUES (4, 3, 5, 4, '7');
INSERT INTO tp_formule1.courir VALUES (4, 2, 6, 2, '8');
INSERT INTO tp_formule1.courir VALUES (4, 9, 33, 21, '9');
INSERT INTO tp_formule1.courir VALUES (4, 1, 44, 1, '10');
INSERT INTO tp_formule1.courir VALUES (4, 43, 30, 17, '11');
INSERT INTO tp_formule1.courir VALUES (4, 6, 77, 8, '13');
INSERT INTO tp_formule1.courir VALUES (4, 5, 19, 18, '14');
INSERT INTO tp_formule1.courir VALUES (4, 20, 22, 9, '15');
INSERT INTO tp_formule1.courir VALUES (4, 18, 12, 10, '16');
INSERT INTO tp_formule1.courir VALUES (4, 26, 21, 5, '17');
INSERT INTO tp_formule1.courir VALUES (4, 23, 88, 13, '18');
INSERT INTO tp_formule1.courir VALUES (4, 19, 14, 15, '20');
INSERT INTO tp_formule1.courir VALUES (4, 12, 20, 19, '21');
INSERT INTO tp_formule1.courir VALUES (4, 7, 3, 22, '22');
INSERT INTO tp_formule1.courir VALUES (4, 39, 26, 11, 'A');
INSERT INTO tp_formule1.courir VALUES (4, 25, 8, 14, 'A');
INSERT INTO tp_formule1.courir VALUES (5, 11, 11, 0, '0');
INSERT INTO tp_formule1.courir VALUES (5, 25, 8, 0, '0');
INSERT INTO tp_formule1.courir VALUES (5, 26, 21, 0, '0');
INSERT INTO tp_formule1.courir VALUES (5, 18, 12, 0, '0');
INSERT INTO tp_formule1.courir VALUES (5, 5, 19, 8, '1');
INSERT INTO tp_formule1.courir VALUES (5, 2, 6, 2, '2');
INSERT INTO tp_formule1.courir VALUES (5, 51, 88, 22, '3');
INSERT INTO tp_formule1.courir VALUES (5, 7, 3, 1, '4');
INSERT INTO tp_formule1.courir VALUES (5, 19, 14, 9, 'A');
INSERT INTO tp_formule1.courir VALUES (5, 8, 26, 20, '6');
INSERT INTO tp_formule1.courir VALUES (5, 3, 5, 15, '7');
INSERT INTO tp_formule1.courir VALUES (5, 35, 77, 17, '8');
INSERT INTO tp_formule1.courir VALUES (5, 12, 20, 6, '9');
INSERT INTO tp_formule1.courir VALUES (5, 22, 94, 7, '10');
INSERT INTO tp_formule1.courir VALUES (5, 20, 22, 10, '11');
INSERT INTO tp_formule1.courir VALUES (5, 10, 27, 5, '12');
INSERT INTO tp_formule1.courir VALUES (5, 9, 33, 13, '13');
INSERT INTO tp_formule1.courir VALUES (5, 4, 7, 18, '14');
INSERT INTO tp_formule1.courir VALUES (5, 1, 44, 3, '15');
INSERT INTO tp_formule1.courir VALUES (5, 15, 55, 4, '16');
INSERT INTO tp_formule1.courir VALUES (5, 13, 30, 11, '17');
INSERT INTO tp_formule1.courir VALUES (5, 17, 9, 21, '18');
INSERT INTO tp_formule1.courir VALUES (6, 15, 55, 0, '0');
INSERT INTO tp_formule1.courir VALUES (6, 11, 11, 0, '0');
INSERT INTO tp_formule1.courir VALUES (6, 10, 27, 4, '1');
INSERT INTO tp_formule1.courir VALUES (6, 1, 44, 12, '2');
INSERT INTO tp_formule1.courir VALUES (6, 12, 20, 17, '3');
INSERT INTO tp_formule1.courir VALUES (6, 34, 19, 11, '4');
INSERT INTO tp_formule1.courir VALUES (6, 17, 9, 3, '5');
INSERT INTO tp_formule1.courir VALUES (6, 13, 30, 19, '6');
INSERT INTO tp_formule1.courir VALUES (6, 2, 6, 14, '7');
INSERT INTO tp_formule1.courir VALUES (6, 25, 8, 16, '8');
INSERT INTO tp_formule1.courir VALUES (6, 4, 7, 10, '9');
INSERT INTO tp_formule1.courir VALUES (6, 18, 12, 13, '10');
INSERT INTO tp_formule1.courir VALUES (6, 6, 77, 15, 'A');
INSERT INTO tp_formule1.courir VALUES (6, 26, 21, 7, '12');
INSERT INTO tp_formule1.courir VALUES (6, 23, 88, 20, '13');
INSERT INTO tp_formule1.courir VALUES (6, 3, 5, 5, '14');
INSERT INTO tp_formule1.courir VALUES (6, 9, 33, 6, '15');
INSERT INTO tp_formule1.courir VALUES (6, 20, 22, 9, '16');
INSERT INTO tp_formule1.courir VALUES (6, 19, 14, 1, '17');
INSERT INTO tp_formule1.courir VALUES (6, 8, 26, 2, '18');
INSERT INTO tp_formule1.courir VALUES (6, 7, 3, 8, '19');
INSERT INTO tp_formule1.courir VALUES (6, 22, 94, 18, '20');
INSERT INTO tp_formule1.courir VALUES (7, 23, 88, 0, '0');
INSERT INTO tp_formule1.courir VALUES (7, 7, 3, 0, '0');
INSERT INTO tp_formule1.courir VALUES (7, 20, 22, 0, '0');
INSERT INTO tp_formule1.courir VALUES (7, 3, 5, 0, '0');
INSERT INTO tp_formule1.courir VALUES (7, 17, 9, 8, '1');
INSERT INTO tp_formule1.courir VALUES (7, 25, 8, 10, '2');
INSERT INTO tp_formule1.courir VALUES (7, 26, 21, 4, '3');
INSERT INTO tp_formule1.courir VALUES (7, 22, 94, 2, '4');
INSERT INTO tp_formule1.courir VALUES (7, 18, 12, 9, '5');
INSERT INTO tp_formule1.courir VALUES (7, 1, 44, 16, '6');
INSERT INTO tp_formule1.courir VALUES (7, 11, 11, 7, '7');
INSERT INTO tp_formule1.courir VALUES (7, 15, 55, 14, '8');
INSERT INTO tp_formule1.courir VALUES (7, 8, 26, 6, '9');
INSERT INTO tp_formule1.courir VALUES (7, 4, 7, 17, '10');
INSERT INTO tp_formule1.courir VALUES (7, 6, 77, 15, '11');
INSERT INTO tp_formule1.courir VALUES (7, 5, 19, 18, '12');
INSERT INTO tp_formule1.courir VALUES (7, 19, 14, 3, '13');
INSERT INTO tp_formule1.courir VALUES (7, 9, 33, 13, '14');
INSERT INTO tp_formule1.courir VALUES (7, 12, 20, 1, '15');
INSERT INTO tp_formule1.courir VALUES (7, 2, 6, 12, '16');
INSERT INTO tp_formule1.courir VALUES (7, 13, 30, 5, '17');
INSERT INTO tp_formule1.courir VALUES (7, 10, 27, 11, '18');
INSERT INTO tp_formule1.courir VALUES (8, 19, 14, 8, '1');
INSERT INTO tp_formule1.courir VALUES (8, 17, 9, 16, '2');
INSERT INTO tp_formule1.courir VALUES (8, 9, 33, 7, '3');
INSERT INTO tp_formule1.courir VALUES (8, 3, 5, 13, '4');
INSERT INTO tp_formule1.courir VALUES (8, 4, 7, 3, '5');
INSERT INTO tp_formule1.courir VALUES (8, 13, 30, 10, '6');
INSERT INTO tp_formule1.courir VALUES (8, 15, 55, 5, '7');
INSERT INTO tp_formule1.courir VALUES (8, 8, 26, 9, '8');
INSERT INTO tp_formule1.courir VALUES (8, 1, 44, 6, '9');
INSERT INTO tp_formule1.courir VALUES (8, 2, 6, 12, '10');
INSERT INTO tp_formule1.courir VALUES (8, 7, 3, 15, '11');
INSERT INTO tp_formule1.courir VALUES (8, 6, 77, 4, '12');
INSERT INTO tp_formule1.courir VALUES (8, 25, 8, 19, '13');
INSERT INTO tp_formule1.courir VALUES (8, 26, 21, 17, '14');
INSERT INTO tp_formule1.courir VALUES (8, 11, 11, 2, '15');
INSERT INTO tp_formule1.courir VALUES (8, 18, 12, 22, '16');
INSERT INTO tp_formule1.courir VALUES (8, 10, 27, 1, '17');
INSERT INTO tp_formule1.courir VALUES (8, 20, 22, 11, '18');
INSERT INTO tp_formule1.courir VALUES (8, 12, 20, 18, 'A');
INSERT INTO tp_formule1.courir VALUES (8, 5, 19, 14, '20');
INSERT INTO tp_formule1.courir VALUES (8, 23, 88, 20, '21');
INSERT INTO tp_formule1.courir VALUES (8, 22, 94, 21, '22');
INSERT INTO tp_formule1.courir VALUES (9, 15, 55, 1, '1');
INSERT INTO tp_formule1.courir VALUES (9, 13, 30, 7, '2');
INSERT INTO tp_formule1.courir VALUES (9, 10, 27, 18, '3');
INSERT INTO tp_formule1.courir VALUES (9, 12, 20, 10, '4');
INSERT INTO tp_formule1.courir VALUES (9, 11, 11, 0, '0');
INSERT INTO tp_formule1.courir VALUES (9, 5, 19, 9, '5');
INSERT INTO tp_formule1.courir VALUES (9, 19, 14, 0, '0');
INSERT INTO tp_formule1.courir VALUES (9, 17, 9, 12, '6');
INSERT INTO tp_formule1.courir VALUES (9, 1, 44, 16, '7');
INSERT INTO tp_formule1.courir VALUES (9, 8, 26, 4, '8');
INSERT INTO tp_formule1.courir VALUES (9, 4, 7, 17, '9');
INSERT INTO tp_formule1.courir VALUES (9, 2, 6, 11, '10');
INSERT INTO tp_formule1.courir VALUES (9, 23, 88, 19, '11');
INSERT INTO tp_formule1.courir VALUES (9, 22, 94, 13, '12');
INSERT INTO tp_formule1.courir VALUES (9, 21, 22, 5, '13');
INSERT INTO tp_formule1.courir VALUES (9, 3, 5, 14, '14');
INSERT INTO tp_formule1.courir VALUES (9, 7, 3, 3, '15');
INSERT INTO tp_formule1.courir VALUES (9, 18, 12, 20, '16');
INSERT INTO tp_formule1.courir VALUES (9, 6, 77, 2, '17');
INSERT INTO tp_formule1.courir VALUES (9, 9, 33, 15, '18');
INSERT INTO tp_formule1.courir VALUES (9, 25, 8, 8, '19');
INSERT INTO tp_formule1.courir VALUES (9, 26, 21, 6, '20');
INSERT INTO tp_formule1.courir VALUES (10, 17, 9, 1, '1');
INSERT INTO tp_formule1.courir VALUES (10, 10, 27, 2, '2');
INSERT INTO tp_formule1.courir VALUES (10, 1, 44, 14, '3');
INSERT INTO tp_formule1.courir VALUES (10, 26, 21, 3, '4');
INSERT INTO tp_formule1.courir VALUES (10, 11, 11, 8, '5');
INSERT INTO tp_formule1.courir VALUES (10, 20, 22, 13, '6');
INSERT INTO tp_formule1.courir VALUES (10, 3, 5, 0, '0');
INSERT INTO tp_formule1.courir VALUES (10, 2, 6, 0, '0');
INSERT INTO tp_formule1.courir VALUES (10, 42, 30, 6, '7');
INSERT INTO tp_formule1.courir VALUES (10, 34, 7, 16, '8');
INSERT INTO tp_formule1.courir VALUES (10, 35, 19, 12, '9');
INSERT INTO tp_formule1.courir VALUES (10, 43, 33, 17, '10');
INSERT INTO tp_formule1.courir VALUES (10, 18, 12, 0, '0');
INSERT INTO tp_formule1.courir VALUES (10, 22, 94, 5, '11');
INSERT INTO tp_formule1.courir VALUES (10, 15, 55, 15, '12');
INSERT INTO tp_formule1.courir VALUES (10, 7, 3, 4, '13');
INSERT INTO tp_formule1.courir VALUES (10, 8, 26, 7, '14');
INSERT INTO tp_formule1.courir VALUES (10, 25, 8, 10, '15');
INSERT INTO tp_formule1.courir VALUES (10, 12, 20, 11, '16');
INSERT INTO tp_formule1.courir VALUES (10, 19, 14, 18, '17');
INSERT INTO tp_formule1.courir VALUES (10, 6, 77, 19, '18');
INSERT INTO tp_formule1.courir VALUES (10, 23, 88, 9, '19');
INSERT INTO tp_formule1.courir VALUES (11, 8, 26, 7, '1');
INSERT INTO tp_formule1.courir VALUES (11, 7, 3, 12, '2');
INSERT INTO tp_formule1.courir VALUES (11, 4, 7, 4, '3');
INSERT INTO tp_formule1.courir VALUES (11, 12, 20, 11, '4');
INSERT INTO tp_formule1.courir VALUES (11, 5, 19, 5, '5');
INSERT INTO tp_formule1.courir VALUES (11, 26, 21, 10, '6');
INSERT INTO tp_formule1.courir VALUES (11, 9, 33, 19, '7');
INSERT INTO tp_formule1.courir VALUES (11, 13, 30, 1, '8');
INSERT INTO tp_formule1.courir VALUES (11, 2, 6, 16, '9');
INSERT INTO tp_formule1.courir VALUES (11, 1, 44, 3, 'A');
INSERT INTO tp_formule1.courir VALUES (11, 3, 5, 0, '0');
INSERT INTO tp_formule1.courir VALUES (11, 6, 77, 15, '11');
INSERT INTO tp_formule1.courir VALUES (11, 22, 94, 2, '12');
INSERT INTO tp_formule1.courir VALUES (11, 17, 9, 17, '13');
INSERT INTO tp_formule1.courir VALUES (11, 25, 8, 20, '14');
INSERT INTO tp_formule1.courir VALUES (11, 23, 88, 14, '15');
INSERT INTO tp_formule1.courir VALUES (11, 20, 22, 9, 'A');
INSERT INTO tp_formule1.courir VALUES (11, 15, 55, 18, '17');
INSERT INTO tp_formule1.courir VALUES (11, 10, 27, 13, '18');
INSERT INTO tp_formule1.courir VALUES (11, 19, 14, 8, '19');
INSERT INTO tp_formule1.courir VALUES (11, 11, 11, 21, '20');
INSERT INTO tp_formule1.courir VALUES (11, 18, 12, 6, '21');
INSERT INTO tp_formule1.courir VALUES (12, 2, 6, 5, '1');
INSERT INTO tp_formule1.courir VALUES (12, 8, 26, 7, '2');
INSERT INTO tp_formule1.courir VALUES (12, 6, 77, 8, '3');
INSERT INTO tp_formule1.courir VALUES (12, 18, 12, 10, '4');
INSERT INTO tp_formule1.courir VALUES (12, 11, 11, 3, '5');
INSERT INTO tp_formule1.courir VALUES (12, 10, 27, 11, '6');
INSERT INTO tp_formule1.courir VALUES (12, 5, 19, 18, '7');
INSERT INTO tp_formule1.courir VALUES (12, 7, 3, 1, '8');
INSERT INTO tp_formule1.courir VALUES (12, 1, 44, 2, '9');
INSERT INTO tp_formule1.courir VALUES (12, 26, 21, 6, '10');
INSERT INTO tp_formule1.courir VALUES (12, 19, 14, 15, '11');
INSERT INTO tp_formule1.courir VALUES (12, 20, 22, 17, '12');
INSERT INTO tp_formule1.courir VALUES (12, 25, 8, 21, '13');
INSERT INTO tp_formule1.courir VALUES (12, 13, 30, 12, '14');
INSERT INTO tp_formule1.courir VALUES (12, 12, 20, 13, 'A');
INSERT INTO tp_formule1.courir VALUES (12, 9, 33, 19, '16');
INSERT INTO tp_formule1.courir VALUES (12, 4, 7, 16, '17');
INSERT INTO tp_formule1.courir VALUES (12, 17, 9, 20, '18');
INSERT INTO tp_formule1.courir VALUES (12, 3, 5, 9, '19');
INSERT INTO tp_formule1.courir VALUES (12, 22, 94, 4, '20');
INSERT INTO tp_formule1.courir VALUES (12, 23, 88, 0, '0');
INSERT INTO tp_formule1.courir VALUES (12, 15, 55, 14, '21');
INSERT INTO tp_formule1.courir VALUES (13, 23, 88, 12, '1');
INSERT INTO tp_formule1.courir VALUES (13, 5, 19, 11, '2');
INSERT INTO tp_formule1.courir VALUES (13, 19, 14, 4, '3');
INSERT INTO tp_formule1.courir VALUES (13, 3, 5, 6, '4');
INSERT INTO tp_formule1.courir VALUES (13, 8, 26, 0, '0');
INSERT INTO tp_formule1.courir VALUES (13, 2, 6, 0, '0');
INSERT INTO tp_formule1.courir VALUES (13, 7, 3, 8, '5');
INSERT INTO tp_formule1.courir VALUES (13, 25, 8, 17, '6');
INSERT INTO tp_formule1.courir VALUES (13, 18, 12, 13, '7');
INSERT INTO tp_formule1.courir VALUES (13, 21, 22, 19, '8');
INSERT INTO tp_formule1.courir VALUES (13, 9, 33, 3, '9');
INSERT INTO tp_formule1.courir VALUES (13, 10, 27, 2, '10');
INSERT INTO tp_formule1.courir VALUES (13, 26, 21, 14, '11');
INSERT INTO tp_formule1.courir VALUES (13, 6, 77, 0, '0');
INSERT INTO tp_formule1.courir VALUES (13, 12, 20, 7, '12');
INSERT INTO tp_formule1.courir VALUES (13, 13, 30, 9, '13');
INSERT INTO tp_formule1.courir VALUES (13, 1, 44, 18, '14');
INSERT INTO tp_formule1.courir VALUES (13, 11, 11, 16, '15');
INSERT INTO tp_formule1.courir VALUES (13, 15, 55, 10, '16');
INSERT INTO tp_formule1.courir VALUES (13, 22, 94, 5, '17');
INSERT INTO tp_formule1.courir VALUES (13, 17, 9, 15, '18');
INSERT INTO tp_formule1.courir VALUES (13, 4, 7, 1, '19');
INSERT INTO tp_formule1.courir VALUES (14, 13, 30, 0, '0');
INSERT INTO tp_formule1.courir VALUES (14, 23, 88, 0, '0');
INSERT INTO tp_formule1.courir VALUES (14, 6, 77, 0, '0');
INSERT INTO tp_formule1.courir VALUES (14, 4, 7, 6, '1');
INSERT INTO tp_formule1.courir VALUES (14, 22, 94, 6, '2');
INSERT INTO tp_formule1.courir VALUES (14, 3, 5, 16, '3');
INSERT INTO tp_formule1.courir VALUES (14, 19, 14, 18, '4');
INSERT INTO tp_formule1.courir VALUES (14, 18, 12, 2, '5');
INSERT INTO tp_formule1.courir VALUES (14, 12, 20, 7, '6');
INSERT INTO tp_formule1.courir VALUES (14, 11, 11, 15, '7');
INSERT INTO tp_formule1.courir VALUES (14, 7, 3, 18, '8');
INSERT INTO tp_formule1.courir VALUES (14, 1, 44, 8, '9');
INSERT INTO tp_formule1.courir VALUES (14, 2, 6, 13, '10');
INSERT INTO tp_formule1.courir VALUES (14, 17, 9, 20, '11');
INSERT INTO tp_formule1.courir VALUES (14, 5, 19, 20, '12');
INSERT INTO tp_formule1.courir VALUES (14, 26, 21, 8, '13');
INSERT INTO tp_formule1.courir VALUES (14, 25, 8, 9, '14');
INSERT INTO tp_formule1.courir VALUES (14, 10, 27, 4, '15');
INSERT INTO tp_formule1.courir VALUES (14, 15, 55, 10, '16');
INSERT INTO tp_formule1.courir VALUES (14, 20, 22, 19, '17');
INSERT INTO tp_formule1.courir VALUES (14, 9, 33, 3, '18');
INSERT INTO tp_formule1.courir VALUES (14, 8, 26, 20, '19');
INSERT INTO tp_formule1.courir VALUES (15, 6, 77, 0, '0');
INSERT INTO tp_formule1.courir VALUES (15, 22, 94, 17, '1');
INSERT INTO tp_formule1.courir VALUES (15, 15, 55, 4, '2');
INSERT INTO tp_formule1.courir VALUES (15, 25, 8, 6, '3');
INSERT INTO tp_formule1.courir VALUES (15, 7, 3, 2, '4');
INSERT INTO tp_formule1.courir VALUES (15, 13, 30, 10, '5');
INSERT INTO tp_formule1.courir VALUES (15, 17, 9, 20, '6');
INSERT INTO tp_formule1.courir VALUES (15, 8, 26, 3, '7');
INSERT INTO tp_formule1.courir VALUES (15, 26, 21, 1, 'A');
INSERT INTO tp_formule1.courir VALUES (15, 2, 6, 8, '9');
INSERT INTO tp_formule1.courir VALUES (15, 4, 7, 21, '10');
INSERT INTO tp_formule1.courir VALUES (15, 20, 22, 9, '11');
INSERT INTO tp_formule1.courir VALUES (15, 11, 11, 7, '12');
INSERT INTO tp_formule1.courir VALUES (15, 1, 44, 12, '13');
INSERT INTO tp_formule1.courir VALUES (15, 10, 27, 15, '14');
INSERT INTO tp_formule1.courir VALUES (15, 9, 33, 16, '15');
INSERT INTO tp_formule1.courir VALUES (15, 18, 12, 19, '16');
INSERT INTO tp_formule1.courir VALUES (15, 3, 5, 13, '17');
INSERT INTO tp_formule1.courir VALUES (15, 19, 14, 18, '18');
INSERT INTO tp_formule1.courir VALUES (15, 23, 88, 5, '19');
INSERT INTO tp_formule1.courir VALUES (15, 12, 20, 11, '20');
INSERT INTO tp_formule1.courir VALUES (15, 5, 19, 14, '21');
INSERT INTO tp_formule1.courir VALUES (16, 23, 88, 0, '0');
INSERT INTO tp_formule1.courir VALUES (16, 2, 6, 4, '1');
INSERT INTO tp_formule1.courir VALUES (16, 6, 77, 7, '2');
INSERT INTO tp_formule1.courir VALUES (16, 3, 5, 5, '3');
INSERT INTO tp_formule1.courir VALUES (16, 5, 19, 1, '4');
INSERT INTO tp_formule1.courir VALUES (16, 26, 21, 3, 'A');
INSERT INTO tp_formule1.courir VALUES (16, 25, 8, 14, '6');
INSERT INTO tp_formule1.courir VALUES (16, 10, 27, 20, '7');
INSERT INTO tp_formule1.courir VALUES (16, 7, 3, 15, '8');
INSERT INTO tp_formule1.courir VALUES (16, 9, 33, 8, '9');
INSERT INTO tp_formule1.courir VALUES (16, 20, 22, 9, '10');
INSERT INTO tp_formule1.courir VALUES (16, 8, 26, 13, '11');
INSERT INTO tp_formule1.courir VALUES (16, 4, 7, 17, '12');
INSERT INTO tp_formule1.courir VALUES (16, 12, 20, 18, '13');
INSERT INTO tp_formule1.courir VALUES (16, 19, 14, 21, '14');
INSERT INTO tp_formule1.courir VALUES (16, 18, 12, 12, '15');
INSERT INTO tp_formule1.courir VALUES (16, 22, 94, 10, '16');
INSERT INTO tp_formule1.courir VALUES (16, 11, 11, 19, '17');
INSERT INTO tp_formule1.courir VALUES (16, 15, 55, 11, '18');
INSERT INTO tp_formule1.courir VALUES (16, 17, 9, 2, '19');
INSERT INTO tp_formule1.courir VALUES (16, 13, 30, 16, '20');
INSERT INTO tp_formule1.courir VALUES (16, 1, 44, 6, '21');
INSERT INTO tp_formule1.courir VALUES (17, 11, 11, 0, '0');
INSERT INTO tp_formule1.courir VALUES (17, 23, 88, 0, '0');
INSERT INTO tp_formule1.courir VALUES (17, 19, 14, 7, '1');
INSERT INTO tp_formule1.courir VALUES (17, 25, 8, 10, '2');
INSERT INTO tp_formule1.courir VALUES (17, 22, 94, 14, '3');
INSERT INTO tp_formule1.courir VALUES (17, 4, 7, 15, '4');
INSERT INTO tp_formule1.courir VALUES (17, 17, 9, 19, '5');
INSERT INTO tp_formule1.courir VALUES (17, 20, 22, 1, '6');
INSERT INTO tp_formule1.courir VALUES (17, 9, 33, 6, '7');
INSERT INTO tp_formule1.courir VALUES (17, 13, 30, 9, '8');
INSERT INTO tp_formule1.courir VALUES (17, 10, 27, 5, '9');
INSERT INTO tp_formule1.courir VALUES (17, 18, 12, 11, '10');
INSERT INTO tp_formule1.courir VALUES (17, 26, 21, 20, 'A');
INSERT INTO tp_formule1.courir VALUES (17, 8, 26, 8, '12');
INSERT INTO tp_formule1.courir VALUES (17, 5, 19, 18, '13');
INSERT INTO tp_formule1.courir VALUES (17, 2, 6, 2, '14');
INSERT INTO tp_formule1.courir VALUES (17, 3, 5, 3, '15');
INSERT INTO tp_formule1.courir VALUES (17, 1, 44, 17, '16');
INSERT INTO tp_formule1.courir VALUES (17, 6, 77, 12, '17');
INSERT INTO tp_formule1.courir VALUES (17, 7, 3, 4, '18');
INSERT INTO tp_formule1.courir VALUES (17, 12, 20, 13, '19');
INSERT INTO tp_formule1.courir VALUES (17, 15, 55, 16, '20');
INSERT INTO tp_formule1.courir VALUES (18, 1, 44, 14, '8');
INSERT INTO tp_formule1.courir VALUES (18, 2, 6, 15, '9');
INSERT INTO tp_formule1.courir VALUES (18, 3, 5, 16, '7');
INSERT INTO tp_formule1.courir VALUES (18, 4, 7, 21, '11');
INSERT INTO tp_formule1.courir VALUES (18, 5, 19, 9, '6');
INSERT INTO tp_formule1.courir VALUES (18, 6, 77, 11, '22');
INSERT INTO tp_formule1.courir VALUES (18, 7, 3, 12, '14');
INSERT INTO tp_formule1.courir VALUES (18, 8, 26, 5, '12');
INSERT INTO tp_formule1.courir VALUES (18, 10, 27, 10, '19');
INSERT INTO tp_formule1.courir VALUES (18, 11, 11, 18, '5');
INSERT INTO tp_formule1.courir VALUES (18, 12, 20, 7, '21');
INSERT INTO tp_formule1.courir VALUES (18, 13, 30, 19, '4');
INSERT INTO tp_formule1.courir VALUES (18, 9, 33, 3, '17');
INSERT INTO tp_formule1.courir VALUES (18, 15, 55, 1, '10');
INSERT INTO tp_formule1.courir VALUES (18, 17, 9, 2, '13');
INSERT INTO tp_formule1.courir VALUES (18, 18, 12, 6, '16');
INSERT INTO tp_formule1.courir VALUES (18, 19, 14, 13, '18');
INSERT INTO tp_formule1.courir VALUES (18, 20, 22, 8, '15');
INSERT INTO tp_formule1.courir VALUES (18, 22, 94, 17, '3');
INSERT INTO tp_formule1.courir VALUES (18, 23, 88, 4, '20');
INSERT INTO tp_formule1.courir VALUES (18, 25, 8, 22, '2');
INSERT INTO tp_formule1.courir VALUES (18, 26, 21, 20, '1');
INSERT INTO tp_formule1.courir VALUES (19, 20, 22, 0, '0');
INSERT INTO tp_formule1.courir VALUES (19, 9, 33, 0, '0');
INSERT INTO tp_formule1.courir VALUES (19, 18, 12, 8, '1');
INSERT INTO tp_formule1.courir VALUES (19, 19, 14, 20, '2');
INSERT INTO tp_formule1.courir VALUES (19, 5, 19, 4, '3');
INSERT INTO tp_formule1.courir VALUES (19, 1, 44, 9, '4');
INSERT INTO tp_formule1.courir VALUES (19, 3, 5, 10, '5');
INSERT INTO tp_formule1.courir VALUES (19, 22, 94, 6, '6');
INSERT INTO tp_formule1.courir VALUES (19, 26, 21, 15, '7');
INSERT INTO tp_formule1.courir VALUES (19, 23, 88, 19, '8');
INSERT INTO tp_formule1.courir VALUES (19, 12, 20, 11, '9');
INSERT INTO tp_formule1.courir VALUES (19, 11, 11, 3, '10');
INSERT INTO tp_formule1.courir VALUES (19, 10, 27, 7, '11');
INSERT INTO tp_formule1.courir VALUES (19, 17, 9, 12, '12');
INSERT INTO tp_formule1.courir VALUES (19, 2, 6, 14, '13');
INSERT INTO tp_formule1.courir VALUES (19, 4, 7, 16, '14');
INSERT INTO tp_formule1.courir VALUES (19, 25, 8, 17, '15');
INSERT INTO tp_formule1.courir VALUES (19, 7, 3, 5, '16');
INSERT INTO tp_formule1.courir VALUES (19, 6, 77, 1, '17');
INSERT INTO tp_formule1.courir VALUES (19, 8, 26, 2, '18');
INSERT INTO tp_formule1.courir VALUES (19, 13, 30, 13, '19');
INSERT INTO tp_formule1.courir VALUES (19, 15, 55, 18, 'A');


--
-- Data for Name: ecurie; Type: TABLE DATA; Schema: tp_formule1; 
--

INSERT INTO tp_formule1.ecurie VALUES (1, 'Mercedes AMG', 1, '2993 Arcu. St.', 'Palmerston North', 83175, 'Maddox');
INSERT INTO tp_formule1.ecurie VALUES (2, 'Scuderia Ferrari', 3, '467-198 In Rd.', 'Walsall', 14652, 'Noble');
INSERT INTO tp_formule1.ecurie VALUES (3, 'Williams Martini Racing', 2, '6450 Et, Rd.', 'Tire', 63896, 'Castaneda');
INSERT INTO tp_formule1.ecurie VALUES (4, 'Red Bull Racing', 1, '1310 Pellentesque Rd.', 'Gignod', 41087, 'Ruiz');
INSERT INTO tp_formule1.ecurie VALUES (5, 'Sahara Force India F1 Team', 3, 'Ap #197-7116 Metus Street', 'Sant''Egidio alla Vibrata', 55219, 'Wheeler');
INSERT INTO tp_formule1.ecurie VALUES (6, 'Renault Sport Formula 1 Team', 2, '617 Cursus, Street', 'Whitchurch', 53752, 'Gonzales');
INSERT INTO tp_formule1.ecurie VALUES (7, 'Scuderia Toro Rosso', 1, 'P.O. Box 800, 1255 Lacus, St.', 'Duffel', 82118, 'Ruiz');
INSERT INTO tp_formule1.ecurie VALUES (8, 'Sauber F1 Team', 1, '9169 Lectus St.', 'Leighton Buzzard', 77992, 'Delaney');
INSERT INTO tp_formule1.ecurie VALUES (9, 'McLaren Honda Formula 1 Team', 2, '195-3559 Curabitur Av.', 'Middelkerke', 64288, 'Rich');
INSERT INTO tp_formule1.ecurie VALUES (10, 'Manor Racing MRT', 1, '332-7330 Nibh Rd.', 'Springdale', 68563, 'Huffman');
INSERT INTO tp_formule1.ecurie VALUES (11, 'Haas F1 Team', 1, '560-4975 At St.', 'Moe', 21246, 'Pierce');


--
-- Data for Name: fournisseur; Type: TABLE DATA; Schema: tp_formule1; 
--

INSERT INTO tp_formule1.fournisseur VALUES (1, 'Michelin', 'P.O. Box 461, 2514 Volutpat. St.', 'Gliwice', 63000, '2016-11-22');
INSERT INTO tp_formule1.fournisseur VALUES (2, 'Pirelli', '4481 Pellentesque Street', 'Sainte-Ode', 25348, '2017-02-18');
INSERT INTO tp_formule1.fournisseur VALUES (3, 'Fireston', 'P.O. Box 815, 2101 Enim Rd.', 'Birori', 55864, '2015-11-15');


--
-- Data for Name: grandprix; Type: TABLE DATA; Schema: tp_formule1; 
--

INSERT INTO tp_formule1.grandprix VALUES (1, 1, 'Grand Prix d''Australie', 156, '2016-01-26', 20, 156);
INSERT INTO tp_formule1.grandprix VALUES (2, 2, 'Grand Prix des Etats-Unis', 194, '2016-04-24', 18, 194);
INSERT INTO tp_formule1.grandprix VALUES (3, 3, 'Grand Prix de Bahreïn', 246, '2016-04-01', 19, 230);
INSERT INTO tp_formule1.grandprix VALUES (4, 4, 'Grand Prix d''Espagne', 166, '2017-02-10', 22, 166);
INSERT INTO tp_formule1.grandprix VALUES (5, 5, 'Grand Prix du Canada', 210, '2016-12-13', 18, 210);
INSERT INTO tp_formule1.grandprix VALUES (6, 6, 'Grand Prix d''Allemagne', 178, '2016-12-01', 20, 178);
INSERT INTO tp_formule1.grandprix VALUES (7, 7, 'Grand Prix de Hongrie', 196, '2016-09-11', 18, 196);
INSERT INTO tp_formule1.grandprix VALUES (8, 8, 'Grand Prix du Brésil', 124, '2017-01-10', 22, 124);
INSERT INTO tp_formule1.grandprix VALUES (9, 9, 'Grand Prix de Monaco', 146, '2017-08-22', 20, 146);
INSERT INTO tp_formule1.grandprix VALUES (10, 6, 'Grand Prix d''Italie', 254, '2016-12-07', 19, 254);
INSERT INTO tp_formule1.grandprix VALUES (11, 11, 'Grand Prix d''Autriche', 452, '2015-11-09', 21, 350);
INSERT INTO tp_formule1.grandprix VALUES (12, 12, 'Grand Prix de Malaisie', 128, '2017-04-06', 21, 128);
INSERT INTO tp_formule1.grandprix VALUES (13, 13, 'Grand Prix de Chine', 298, '2015-12-14', 19, 298);
INSERT INTO tp_formule1.grandprix VALUES (14, 14, 'Grand Prix de Grande-Bretagne', 300, '2017-06-28', 19, 100);
INSERT INTO tp_formule1.grandprix VALUES (15, 15, 'Grand Prix de Singapour', 214, '2016-11-13', 21, 200);
INSERT INTO tp_formule1.grandprix VALUES (16, 16, 'Grand Prix de Belgique', 400, '2016-10-03', 21, 400);
INSERT INTO tp_formule1.grandprix VALUES (17, 17, 'Grand Prix de Russie', 326, '2017-07-11', 20, 326);
INSERT INTO tp_formule1.grandprix VALUES (18, 18, 'Grand Prix du Japon', 426, '2017-02-21', 22, 200);
INSERT INTO tp_formule1.grandprix VALUES (19, 19, 'Grand Prix d''Abou Dabi', 264, '2016-07-21', 20, 264);


--
-- Data for Name: pilote; Type: TABLE DATA; Schema: tp_formule1; 
--

INSERT INTO tp_formule1.pilote VALUES (1, 'Lewis', 'Hamilton');
INSERT INTO tp_formule1.pilote VALUES (2, 'Nico', 'Rosberg');
INSERT INTO tp_formule1.pilote VALUES (3, 'Sebastian', 'Vettel');
INSERT INTO tp_formule1.pilote VALUES (4, 'Kimi', 'Räikkönen');
INSERT INTO tp_formule1.pilote VALUES (5, 'Felipe', 'Massa');
INSERT INTO tp_formule1.pilote VALUES (6, 'Valtteri', 'Bottas');
INSERT INTO tp_formule1.pilote VALUES (7, 'Daniel', 'Ricciardo');
INSERT INTO tp_formule1.pilote VALUES (8, 'Daniil', 'Kvyat');
INSERT INTO tp_formule1.pilote VALUES (9, 'Max', 'Verstappen');
INSERT INTO tp_formule1.pilote VALUES (10, 'Nico', 'Hülkenberg');
INSERT INTO tp_formule1.pilote VALUES (11, 'Sergio', 'Pérez');
INSERT INTO tp_formule1.pilote VALUES (12, 'Kevin', 'Magnussen');
INSERT INTO tp_formule1.pilote VALUES (13, 'Jolyon', 'Palmer');
INSERT INTO tp_formule1.pilote VALUES (15, 'Carlos', 'Sainz Jr.');
INSERT INTO tp_formule1.pilote VALUES (17, 'Marcus', 'Ericsson');
INSERT INTO tp_formule1.pilote VALUES (18, 'Felipe', 'Nasr');
INSERT INTO tp_formule1.pilote VALUES (19, 'Fernando', 'Alonso');
INSERT INTO tp_formule1.pilote VALUES (20, 'Jenson', 'Button');
INSERT INTO tp_formule1.pilote VALUES (21, 'Stoffel', 'Vandoorne');
INSERT INTO tp_formule1.pilote VALUES (22, 'Pascal', 'Wehrlein');
INSERT INTO tp_formule1.pilote VALUES (23, 'Rio', 'Haryanto');
INSERT INTO tp_formule1.pilote VALUES (25, 'Romain', 'Grosjean');
INSERT INTO tp_formule1.pilote VALUES (26, 'Esteban', 'Gutiérrez');
INSERT INTO tp_formule1.pilote VALUES (30, 'Jean-Eric', 'Vergne');
INSERT INTO tp_formule1.pilote VALUES (32, 'Antonio', 'Fuoco');
INSERT INTO tp_formule1.pilote VALUES (33, 'Paul', 'di Resta');
INSERT INTO tp_formule1.pilote VALUES (34, 'Alex', 'Lynn');
INSERT INTO tp_formule1.pilote VALUES (35, 'Gary', 'Paffett');
INSERT INTO tp_formule1.pilote VALUES (36, 'Lance', 'Stroll');
INSERT INTO tp_formule1.pilote VALUES (37, 'Pierre', 'Gasly');
INSERT INTO tp_formule1.pilote VALUES (38, 'Sébastien', 'Buemi');
INSERT INTO tp_formule1.pilote VALUES (39, 'Alfonso', 'Celis Jr.');
INSERT INTO tp_formule1.pilote VALUES (40, 'Nikita', 'Mazepin');
INSERT INTO tp_formule1.pilote VALUES (41, 'Esteban', 'Ocon');
INSERT INTO tp_formule1.pilote VALUES (42, 'Nicholas', 'Latifi');
INSERT INTO tp_formule1.pilote VALUES (43, 'Carmen', 'Jordá');
INSERT INTO tp_formule1.pilote VALUES (44, 'Sergey', 'Sirotkin');
INSERT INTO tp_formule1.pilote VALUES (46, 'Sérgio', 'Sette Câmara');
INSERT INTO tp_formule1.pilote VALUES (48, 'Nobuharu', 'Matsushita');
INSERT INTO tp_formule1.pilote VALUES (49, 'Alexander', 'Rossi');
INSERT INTO tp_formule1.pilote VALUES (51, 'Jordan', 'King');
INSERT INTO tp_formule1.pilote VALUES (52, 'Charles', 'Leclerc');
INSERT INTO tp_formule1.pilote VALUES (53, 'Santino', 'Ferrucci');


--
-- Data for Name: soutenir; Type: TABLE DATA; Schema: tp_formule1; 
--

INSERT INTO tp_formule1.soutenir VALUES ('Heineken', 1);
INSERT INTO tp_formule1.soutenir VALUES ('Heineken', 2);
INSERT INTO tp_formule1.soutenir VALUES ('Heineken', 3);
INSERT INTO tp_formule1.soutenir VALUES ('Heineken', 4);
INSERT INTO tp_formule1.soutenir VALUES ('Heineken', 5);
INSERT INTO tp_formule1.soutenir VALUES ('Heineken', 6);
INSERT INTO tp_formule1.soutenir VALUES ('cocacola', 7);
INSERT INTO tp_formule1.soutenir VALUES ('cocacola', 8);
INSERT INTO tp_formule1.soutenir VALUES ('cocacola', 9);
INSERT INTO tp_formule1.soutenir VALUES ('cocacola', 10);
INSERT INTO tp_formule1.soutenir VALUES ('cocacola', 11);
INSERT INTO tp_formule1.soutenir VALUES ('cocacola', 12);
INSERT INTO tp_formule1.soutenir VALUES ('cocacola', 13);
INSERT INTO tp_formule1.soutenir VALUES ('cocacola', 15);
INSERT INTO tp_formule1.soutenir VALUES ('cocacola', 17);
INSERT INTO tp_formule1.soutenir VALUES ('Winston', 18);
INSERT INTO tp_formule1.soutenir VALUES ('Winston', 19);
INSERT INTO tp_formule1.soutenir VALUES ('Winston', 20);
INSERT INTO tp_formule1.soutenir VALUES ('Winston', 21);
INSERT INTO tp_formule1.soutenir VALUES ('Winston', 22);
INSERT INTO tp_formule1.soutenir VALUES ('Winston', 23);
INSERT INTO tp_formule1.soutenir VALUES ('Winston', 25);
INSERT INTO tp_formule1.soutenir VALUES ('Winston', 26);
INSERT INTO tp_formule1.soutenir VALUES ('Winston', 30);
INSERT INTO tp_formule1.soutenir VALUES ('Winston', 32);
INSERT INTO tp_formule1.soutenir VALUES ('Winston', 33);
INSERT INTO tp_formule1.soutenir VALUES ('Winston', 34);
INSERT INTO tp_formule1.soutenir VALUES ('Winston', 35);
INSERT INTO tp_formule1.soutenir VALUES ('Winston', 36);
INSERT INTO tp_formule1.soutenir VALUES ('Winston', 37);
INSERT INTO tp_formule1.soutenir VALUES ('Winston', 38);
INSERT INTO tp_formule1.soutenir VALUES ('Winston', 39);
INSERT INTO tp_formule1.soutenir VALUES ('Winston', 40);
INSERT INTO tp_formule1.soutenir VALUES ('Winston', 41);
INSERT INTO tp_formule1.soutenir VALUES ('Winston', 42);
INSERT INTO tp_formule1.soutenir VALUES ('engie', 43);
INSERT INTO tp_formule1.soutenir VALUES ('engie', 44);
INSERT INTO tp_formule1.soutenir VALUES ('engie', 46);
INSERT INTO tp_formule1.soutenir VALUES ('engie', 48);
INSERT INTO tp_formule1.soutenir VALUES ('engie', 49);
INSERT INTO tp_formule1.soutenir VALUES ('engie', 51);
INSERT INTO tp_formule1.soutenir VALUES ('engie', 52);
INSERT INTO tp_formule1.soutenir VALUES ('engie', 53);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 1);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 2);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 3);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 4);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 5);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 6);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 7);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 8);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 9);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 10);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 11);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 12);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 13);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 15);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 17);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 18);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 19);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 20);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 21);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 22);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 23);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 25);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 26);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 30);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 32);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 33);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 34);
INSERT INTO tp_formule1.soutenir VALUES ('BNP', 35);
INSERT INTO tp_formule1.soutenir VALUES ('Castrol', 36);
INSERT INTO tp_formule1.soutenir VALUES ('Castrol', 37);
INSERT INTO tp_formule1.soutenir VALUES ('Castrol', 38);
INSERT INTO tp_formule1.soutenir VALUES ('Castrol', 39);
INSERT INTO tp_formule1.soutenir VALUES ('Castrol', 40);
INSERT INTO tp_formule1.soutenir VALUES ('Castrol', 41);
INSERT INTO tp_formule1.soutenir VALUES ('Castrol', 42);
INSERT INTO tp_formule1.soutenir VALUES ('Castrol', 43);
INSERT INTO tp_formule1.soutenir VALUES ('Castrol', 44);
INSERT INTO tp_formule1.soutenir VALUES ('Castrol', 46);
INSERT INTO tp_formule1.soutenir VALUES ('Castrol', 48);
INSERT INTO tp_formule1.soutenir VALUES ('Castrol', 49);
INSERT INTO tp_formule1.soutenir VALUES ('Castrol', 51);
INSERT INTO tp_formule1.soutenir VALUES ('Castrol', 52);
INSERT INTO tp_formule1.soutenir VALUES ('Castrol', 53);
INSERT INTO tp_formule1.soutenir VALUES ('suez', 1);
INSERT INTO tp_formule1.soutenir VALUES ('suez', 2);


--
-- Data for Name: sponsor; Type: TABLE DATA; Schema: tp_formule1; 
--

INSERT INTO tp_formule1.sponsor VALUES ('malboro', 'cigarette');
INSERT INTO tp_formule1.sponsor VALUES ('Heineken', 'boisson');
INSERT INTO tp_formule1.sponsor VALUES ('tropico', 'boisson');
INSERT INTO tp_formule1.sponsor VALUES ('BNP', 'banque');
INSERT INTO tp_formule1.sponsor VALUES ('suez', 'energie');
INSERT INTO tp_formule1.sponsor VALUES ('engie', 'energie');
INSERT INTO tp_formule1.sponsor VALUES ('Winston', 'cigarette');
INSERT INTO tp_formule1.sponsor VALUES ('cocacola', 'boisson');
INSERT INTO tp_formule1.sponsor VALUES ('Castrol', 'Carburant');


--
-- Data for Name: sponsoriser; Type: TABLE DATA; Schema: tp_formule1; 
--

INSERT INTO tp_formule1.sponsoriser VALUES (1, 'Heineken');
INSERT INTO tp_formule1.sponsoriser VALUES (2, 'Heineken');
INSERT INTO tp_formule1.sponsoriser VALUES (3, 'Heineken');
INSERT INTO tp_formule1.sponsoriser VALUES (4, 'Heineken');
INSERT INTO tp_formule1.sponsoriser VALUES (5, 'Heineken');
INSERT INTO tp_formule1.sponsoriser VALUES (6, 'Heineken');
INSERT INTO tp_formule1.sponsoriser VALUES (7, 'Winston');
INSERT INTO tp_formule1.sponsoriser VALUES (8, 'Winston');
INSERT INTO tp_formule1.sponsoriser VALUES (9, 'Winston');
INSERT INTO tp_formule1.sponsoriser VALUES (10, 'Winston');
INSERT INTO tp_formule1.sponsoriser VALUES (11, 'Winston');
INSERT INTO tp_formule1.sponsoriser VALUES (1, 'engie');
INSERT INTO tp_formule1.sponsoriser VALUES (2, 'engie');
INSERT INTO tp_formule1.sponsoriser VALUES (3, 'engie');
INSERT INTO tp_formule1.sponsoriser VALUES (4, 'engie');
INSERT INTO tp_formule1.sponsoriser VALUES (7, 'BNP');
INSERT INTO tp_formule1.sponsoriser VALUES (9, 'BNP');
INSERT INTO tp_formule1.sponsoriser VALUES (10, 'BNP');
INSERT INTO tp_formule1.sponsoriser VALUES (11, 'BNP');
INSERT INTO tp_formule1.sponsoriser VALUES (1, 'Castrol');
INSERT INTO tp_formule1.sponsoriser VALUES (3, 'Castrol');
INSERT INTO tp_formule1.sponsoriser VALUES (4, 'Castrol');
INSERT INTO tp_formule1.sponsoriser VALUES (5, 'suez');
INSERT INTO tp_formule1.sponsoriser VALUES (6, 'suez');
INSERT INTO tp_formule1.sponsoriser VALUES (7, 'suez');
INSERT INTO tp_formule1.sponsoriser VALUES (8, 'suez');
INSERT INTO tp_formule1.sponsoriser VALUES (10, 'suez');
INSERT INTO tp_formule1.sponsoriser VALUES (11, 'suez');
INSERT INTO tp_formule1.sponsoriser VALUES (1, 'tropico');
INSERT INTO tp_formule1.sponsoriser VALUES (2, 'tropico');
INSERT INTO tp_formule1.sponsoriser VALUES (3, 'tropico');
INSERT INTO tp_formule1.sponsoriser VALUES (5, 'tropico');
INSERT INTO tp_formule1.sponsoriser VALUES (8, 'tropico');
INSERT INTO tp_formule1.sponsoriser VALUES (9, 'tropico');
INSERT INTO tp_formule1.sponsoriser VALUES (10, 'tropico');
INSERT INTO tp_formule1.sponsoriser VALUES (11, 'tropico');


--
-- Data for Name: voiture; Type: TABLE DATA; Schema: tp_formule1; 
--

INSERT INTO tp_formule1.voiture VALUES (44, 1, 'F1 W07');
INSERT INTO tp_formule1.voiture VALUES (6, 1, 'F1 W08');
INSERT INTO tp_formule1.voiture VALUES (5, 2, 'SF16-H');
INSERT INTO tp_formule1.voiture VALUES (7, 2, 'SF16-H1');
INSERT INTO tp_formule1.voiture VALUES (19, 3, 'FW38');
INSERT INTO tp_formule1.voiture VALUES (77, 3, 'FW39');
INSERT INTO tp_formule1.voiture VALUES (3, 4, 'RB12');
INSERT INTO tp_formule1.voiture VALUES (26, 4, 'RB13');
INSERT INTO tp_formule1.voiture VALUES (27, 5, 'VJM09');
INSERT INTO tp_formule1.voiture VALUES (11, 5, 'VJM10');
INSERT INTO tp_formule1.voiture VALUES (20, 6, 'RS16');
INSERT INTO tp_formule1.voiture VALUES (30, 6, 'RS17');
INSERT INTO tp_formule1.voiture VALUES (33, 7, 'STR11');
INSERT INTO tp_formule1.voiture VALUES (55, 7, 'STR12');
INSERT INTO tp_formule1.voiture VALUES (9, 8, 'C35');
INSERT INTO tp_formule1.voiture VALUES (12, 8, 'C36');
INSERT INTO tp_formule1.voiture VALUES (14, 9, 'MP4-31');
INSERT INTO tp_formule1.voiture VALUES (22, 9, 'MP4-32');
INSERT INTO tp_formule1.voiture VALUES (94, 10, 'MRT05');
INSERT INTO tp_formule1.voiture VALUES (88, 10, 'MRT06');
INSERT INTO tp_formule1.voiture VALUES (8, 11, 'VF-16');
INSERT INTO tp_formule1.voiture VALUES (21, 11, 'VF-17');


--
-- Name: circuit_id_circuit_seq; Type: SEQUENCE SET; Schema: tp_formule1; 
--

SELECT pg_catalog.setval('tp_formule1.circuit_id_circuit_seq', 19, true);


--
-- Name: ecurie_id_ecurie_seq; Type: SEQUENCE SET; Schema: tp_formule1; 
--

SELECT pg_catalog.setval('tp_formule1.ecurie_id_ecurie_seq', 11, true);


--
-- Name: fournisseur_idfour_seq; Type: SEQUENCE SET; Schema: tp_formule1; 
--

SELECT pg_catalog.setval('tp_formule1.fournisseur_idfour_seq', 1, false);


--
-- Name: grandprix_idgp_seq; Type: SEQUENCE SET; Schema: tp_formule1; 
--

SELECT pg_catalog.setval('tp_formule1.grandprix_idgp_seq', 19, true);


--
-- Name: pilote_idpilote_seq; Type: SEQUENCE SET; Schema: tp_formule1; 
--

SELECT pg_catalog.setval('tp_formule1.pilote_idpilote_seq', 1, false);


--
-- Name: circuit pk_circuit; Type: CONSTRAINT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.circuit
    ADD CONSTRAINT pk_circuit PRIMARY KEY (id_circuit);


--
-- Name: courir pk_courir; Type: CONSTRAINT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.courir
    ADD CONSTRAINT pk_courir PRIMARY KEY (idgp, idpilote);


--
-- Name: ecurie pk_ecurie; Type: CONSTRAINT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.ecurie
    ADD CONSTRAINT pk_ecurie PRIMARY KEY (id_ecurie);


--
-- Name: fournisseur pk_fournisseur; Type: CONSTRAINT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.fournisseur
    ADD CONSTRAINT pk_fournisseur PRIMARY KEY (idfour);


--
-- Name: grandprix pk_grandprix; Type: CONSTRAINT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.grandprix
    ADD CONSTRAINT pk_grandprix PRIMARY KEY (idgp);


--
-- Name: pilote pk_pilote; Type: CONSTRAINT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.pilote
    ADD CONSTRAINT pk_pilote PRIMARY KEY (idpilote);


--
-- Name: soutenir pk_soutenir; Type: CONSTRAINT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.soutenir
    ADD CONSTRAINT pk_soutenir PRIMARY KEY (nomsponsor, idpilote);


--
-- Name: sponsor pk_sponsor; Type: CONSTRAINT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.sponsor
    ADD CONSTRAINT pk_sponsor PRIMARY KEY (nomsponsor);


--
-- Name: sponsoriser pk_sponsoriser; Type: CONSTRAINT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.sponsoriser
    ADD CONSTRAINT pk_sponsoriser PRIMARY KEY (id_ecurie, nomsponsor);


--
-- Name: voiture pk_voiture; Type: CONSTRAINT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.voiture
    ADD CONSTRAINT pk_voiture PRIMARY KEY (numvoiture);


--
-- Name: courir fk_courir____grandpri; Type: FK CONSTRAINT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.courir
    ADD CONSTRAINT fk_courir____grandpri FOREIGN KEY (idgp) REFERENCES tp_formule1.grandprix(idgp) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: courir fk_courir____pilote; Type: FK CONSTRAINT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.courir
    ADD CONSTRAINT fk_courir____pilote FOREIGN KEY (idpilote) REFERENCES tp_formule1.pilote(idpilote) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: courir fk_courir___voiture; Type: FK CONSTRAINT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.courir
    ADD CONSTRAINT fk_courir___voiture FOREIGN KEY (numvoiture) REFERENCES tp_formule1.voiture(numvoiture) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: ecurie fk_ecurie_accorder_fourniss; Type: FK CONSTRAINT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.ecurie
    ADD CONSTRAINT fk_ecurie_accorder_fourniss FOREIGN KEY (idfour) REFERENCES tp_formule1.fournisseur(idfour) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: grandprix fk_grandpri_derouler_circuit; Type: FK CONSTRAINT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.grandprix
    ADD CONSTRAINT fk_grandpri_derouler_circuit FOREIGN KEY (id_circuit) REFERENCES tp_formule1.circuit(id_circuit) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: soutenir fk_soutenir_soutenir_pilote; Type: FK CONSTRAINT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.soutenir
    ADD CONSTRAINT fk_soutenir_soutenir_pilote FOREIGN KEY (idpilote) REFERENCES tp_formule1.pilote(idpilote) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: soutenir fk_soutenir_soutenir_sponsor; Type: FK CONSTRAINT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.soutenir
    ADD CONSTRAINT fk_soutenir_soutenir_sponsor FOREIGN KEY (nomsponsor) REFERENCES tp_formule1.sponsor(nomsponsor) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: sponsoriser fk_sponsori_sponsoris_ecurie; Type: FK CONSTRAINT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.sponsoriser
    ADD CONSTRAINT fk_sponsori_sponsoris_ecurie FOREIGN KEY (id_ecurie) REFERENCES tp_formule1.ecurie(id_ecurie) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: sponsoriser fk_sponsori_sponsoris_sponsor; Type: FK CONSTRAINT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.sponsoriser
    ADD CONSTRAINT fk_sponsori_sponsoris_sponsor FOREIGN KEY (nomsponsor) REFERENCES tp_formule1.sponsor(nomsponsor) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: voiture fk_voiture_aligner_ecurie; Type: FK CONSTRAINT; Schema: tp_formule1; 
--

ALTER TABLE ONLY tp_formule1.voiture
    ADD CONSTRAINT fk_voiture_aligner_ecurie FOREIGN KEY (id_ecurie) REFERENCES tp_formule1.ecurie(id_ecurie) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

--!!!!!!!!!!!!!!!-----> To ask teacher 1.Donner le nomet prénom des pilotes et le nom du grand prix sur lequel ils ont abandonnée,
--  trié sur le grand prix et le nom du pilote
SELECT p.nom, p.prenom, g.nomgp
FROM tp_formule1.pilote p, tp_formule1.courir c, tp_formule1.grandprix g
WHERE p.idpilote = c.idpilote
AND c.idgp = g.idgp
AND c.positionarrivee

