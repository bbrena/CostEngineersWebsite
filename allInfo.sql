--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: blogs; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE blogs (
    id integer NOT NULL,
    title character varying,
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying,
    status integer DEFAULT 0,
    topic_id integer
);


ALTER TABLE public.blogs OWNER TO ubuntu;

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE blogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blogs_id_seq OWNER TO ubuntu;

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE blogs_id_seq OWNED BY blogs.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    content text,
    user_id integer,
    blog_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO ubuntu;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO ubuntu;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: portfolios; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE portfolios (
    id integer NOT NULL,
    title character varying,
    subtitle character varying,
    body text,
    main_image text,
    thumb_image text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer
);


ALTER TABLE public.portfolios OWNER TO ubuntu;

--
-- Name: portfolios_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE portfolios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.portfolios_id_seq OWNER TO ubuntu;

--
-- Name: portfolios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE portfolios_id_seq OWNED BY portfolios.id;


--
-- Name: skills; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE skills (
    id integer NOT NULL,
    title character varying,
    percent_utilized integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    badge text
);


ALTER TABLE public.skills OWNER TO ubuntu;

--
-- Name: skills_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skills_id_seq OWNER TO ubuntu;

--
-- Name: skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE skills_id_seq OWNED BY skills.id;


--
-- Name: technologies; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE technologies (
    id integer NOT NULL,
    name character varying,
    portfolio_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.technologies OWNER TO ubuntu;

--
-- Name: technologies_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE technologies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.technologies_id_seq OWNER TO ubuntu;

--
-- Name: technologies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE technologies_id_seq OWNED BY technologies.id;


--
-- Name: topics; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE topics (
    id integer NOT NULL,
    title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.topics OWNER TO ubuntu;

--
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topics_id_seq OWNER TO ubuntu;

--
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE topics_id_seq OWNED BY topics.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    name character varying,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    roles character varying
);


ALTER TABLE public.users OWNER TO ubuntu;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO ubuntu;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY blogs ALTER COLUMN id SET DEFAULT nextval('blogs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY portfolios ALTER COLUMN id SET DEFAULT nextval('portfolios_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY skills ALTER COLUMN id SET DEFAULT nextval('skills_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY technologies ALTER COLUMN id SET DEFAULT nextval('technologies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY topics ALTER COLUMN id SET DEFAULT nextval('topics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY blogs (id, title, body, created_at, updated_at, slug, status, topic_id) FROM stdin;
27	Chat	DO NOT DELETE! \r\nThis is where you and other people can chat.	2017-08-01 02:31:35.751607	2017-08-02 00:45:09.290117	chat	1	8
31	Sales!	If there are any sales during this time, they will be listed here.	2017-08-01 14:44:10.240357	2017-08-02 16:32:08.156156	sales	1	4
34	Other	Do you have something to say that doesn't go under any other topic? Type here!	2017-08-01 14:50:42.659237	2017-08-02 19:29:21.298112	other	1	8
42	Place An Order	MUST BE PICKED UP AT ALTA HIGH SCHOOL, UTAH!!!	2017-08-03 00:01:06.914971	2017-08-04 21:18:43.17038	place-an-order	1	8
44	Employees	Owner/Manager: Brena Anzer \r\nEmail: brenabrezna@gmail.com\r\n\r\nCo-manager: Robyn Christiansen\r\nEmail: christiansenrobyn10@gmail.com\r\n\r\nAdvertisement/Co-manager: Jessalyn Betterly\r\nEmail: jbet0151@csddocs.org\r\n	2017-08-04 21:52:57.322045	2017-08-04 22:16:12.609539	employees	1	8
32	Price Questions	Ask me any questions about prices here.	2017-08-01 14:45:29.237548	2017-08-01 14:47:24.962541	price-questions	1	5
33	Reviews	Write your reviews here on my business.	2017-08-01 14:47:51.722257	2017-08-01 14:53:50.502243	reviews	1	7
\.


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('blogs_id_seq', 44, true);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY comments (id, content, user_id, blog_id, created_at, updated_at) FROM stdin;
16	Hello, I am currently working on the final changes of this website. If you run into any errors, please contact me.	1	27	2017-08-01 02:32:06.045605	2017-08-01 02:32:06.045605
18	Check here for sales. Before you ask for the discount, make sure the date is viable.	1	31	2017-08-01 14:44:48.908955	2017-08-01 14:44:48.908955
19	I will answer your question as soon as possible.	1	32	2017-08-01 14:45:46.555271	2017-08-01 14:45:46.555271
20	Please make your reviews appropriate, or they will be deleted.	1	33	2017-08-01 14:48:13.411578	2017-08-01 14:48:13.411578
21	Please only put content here if it doesn't have to do with any other topic. DO NOT use this as a chat. There is one on the main blog page.	1	34	2017-08-01 14:51:37.589016	2017-08-01 14:53:02.453604
33	If you are going to order an item, please view the About Me and Portfolio pages first, and place your order in the format that follows.\n\nWhen You Want To Pick It Up: (It can't be during Alta High School hours [except for lunch or a period we share])\n\nName: (first and last)\n\nWhere You Want To Pick It Up: (after school in the hallway or outside the building, during a class period we share, a social event, or lunch)\n\nMoney Due: ($ + coupon details [if applicable])\n\nItem Description: (Please be as detailed as you can, so I can create the right item. Include color[s], what the item is, a thorough description, and any specific beads you want me to use.)\n\nQuantity: (how many items of the SAME thing you are ordering)\n\nImportant notes:\n\n**Please give me at LEAST 3 business days to create your item** \n**View prices on the About Me page** \n**Please don't order more than one thing in a single comment**\n**View beads on the Portfolio page** \n**If the order does not come in this format it will not be accepted unless you speak with me or an employee personally** \n**The order won't be accepted if any of the restrictions above are not followed**	1	42	2017-08-04 21:22:49.248854	2017-08-04 21:22:49.248854
38	You can contact any of these people if you have any questions. Items can also be ordered and delivered by these people.	6	44	2017-08-04 22:17:16.795445	2017-08-04 22:17:16.795445
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('comments_id_seq', 38, true);


--
-- Data for Name: portfolios; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY portfolios (id, title, subtitle, body, main_image, thumb_image, created_at, updated_at, "position") FROM stdin;
15	Me And My Mom Wearing Bracelets I Made	Bracelets	In 2016, I wanted to make me and my mom matching bracelets. I created hers first. I called it "X's and O's". Now in a rhythm, I created my bracelet. It is called "Schokolade und Vanille" which is "Chocolate and Vanilla" in German. It took me about 2 hours to create each bracelet separately. These bracelets are available at Alta High School for $4.00 each. Get these now, because I have a limited supply of pearl* beads to make these bracelets! Only a couple more can be made!\r\n\r\n* (not real pearls)	2Wrists.jpg	2Wrists.jpg	2017-08-02 22:05:03.364795	2017-08-02 22:05:03.364795	\N
21	Seed Beads	Beads	These are seed beads that you can use for seed bead bracelets. You can select from a variety of colors, and there are even more featured in another picture.	SeedBeads.jpg	SeedBeads.jpg	2017-08-02 22:53:10.574283	2017-08-02 22:54:36.368804	\N
16	Beaded Creature Seed Beads                                                 	Beads	Am showing you these beads to help you decide what color seed beads you want for your beaded creature. These seeds beads are only for beaded creatures. If you want a different color, and I have it, you can pay 25¢ extra** to get your creature made with that color. Please contact me to learn what beaded creatures I offer.\r\n\r\n** black is an exception, it is free	CircleBeads.jpg	CircleBeads.jpg	2017-08-02 22:30:40.641666	2017-08-02 22:31:35.439678	\N
17	Clay Beads	Beads	These beads are created from clay, then painted. I can put these beads on a bracelet, or sell them to you for 5¢ each.	ClayBeads.jpg	ClayBeads.jpg	2017-08-02 22:34:12.71331	2017-08-02 22:34:12.71331	\N
18	String To Use For Your Jewelry	String	Omniflex is the thinnest cord, and is great for seed bead bracelets. Spider Line is the next thickest, and can't be used for seed bead bracelets. It is great for non-stretchy, non-seed-bead bracelets. Lastly, Stretch Magic is stretchy, and also can't be used for seed bead bracelets. This is not recommended for everyday wearing. Stretch Magic is recommended for young children. In short: Omniflex - seed bead bracelets, Spider Line - not seed bead bracelets or stretchy bracelets, Stretch Magic - stretchy kids bracelets.	Cords.jpg	Cords.jpg	2017-08-02 22:41:26.62616	2017-08-02 22:41:26.62616	\N
19	Gem Faire Beads	Beads	These beads have many uses. You can use them for the middle of intricate bracelets, just on regular bracelets, or on backpack charms. These beads are limited, so I am only able to use a certain amount per piece of jewelry.	GemFaireBeads.jpg	GemFaireBeads.jpg	2017-08-02 22:44:47.148191	2017-08-02 22:44:47.148191	\N
20	Hooks You Can Use For Bracelets and Anklets	Hooks	These can be used for all types of bracelets and anklets to be able to put them on. I used these in the bracelets me and my mom wear in the first picture. You can pick from a selection of colors in this picture.	Hooks.jpg	Hooks.jpg	2017-08-02 22:50:34.124883	2017-08-02 22:50:34.124883	\N
22	Other Seed Beads	Beads	These are other seed beads that you can use to create a unique bracelet.	OtherSeedBeads.jpg	OtherSeedBeads.jpg	2017-08-02 22:56:55.719172	2017-08-02 22:56:55.719172	\N
24	Skull Beads	Beads	These beads are shaped like skulls and can be used to create bracelets, earrings, backpack charms, and anklets.	Skulls.jpg	Skulls.jpg	2017-08-02 23:18:13.748404	2017-08-02 23:18:47.131266	\N
25	Tray of Beads	Beads	These are many different beads with the same kind of look and feel. You can get all different types. This set is mostly exotic, and are meant to give a tropical look.	Trayo_Beads.jpg	Trayo_Beads.jpg	2017-08-02 23:21:30.326711	2017-08-02 23:21:30.326711	\N
26	Various Beads	Beads	These beads can be used to make earrings, bracelets, and anklets. I recommend using them to make earrings. They are sparkly and all different shapes and colors. Don't think that the selection ends here. I have two tubs with separators filled with beads!	TubBeads.jpg	TubBeads.jpg	2017-08-02 23:26:58.772962	2017-08-02 23:26:58.772962	\N
23	Shell Beads	Beads	There are 3 types of these beads. One is more circular, another is very big and has a orange mark on it, and the last one is like a mini conch shell. These are real shells that have had a hole driven through them so I can use them as a bead. I can create necklaces, bracelets, and anklets out of these. Earrings, backpack charms, and beaded creatures cannot be created from these beads.	Shells.jpg	Shells.jpg	2017-08-02 23:01:10.351165	2017-08-03 14:33:25.522516	\N
27	Beaded Creatures and Earrings	Creatures and Earrings	These are some examples of beaded creatures and earrings. You can get many other creatures besides these. There are lizards, tree frogs, skunks, butterflies, bees, jewel bugs, ants, grasshoppers, dragonflies, damselflies, seahorses, fish, spiders, girls, boys, angels, and more. The earrings are not the only of their kind. I can replace the beads on here with other ones creating a unique look for you.	BeadedCreaturesandEarrings.jpg	BeadedCreaturesandEarrings.jpg	2017-08-04 01:45:38.723697	2017-08-04 01:45:38.723697	\N
\.


--
-- Name: portfolios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('portfolios_id_seq', 28, true);


--
-- Data for Name: skills; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY skills (id, title, percent_utilized, created_at, updated_at, badge) FROM stdin;
6	Bracelets and Anklets	75	2017-08-02 15:22:22.77694	2017-08-02 15:22:22.77694	\N
7	Earrings	87	2017-08-02 15:22:52.33036	2017-08-02 15:22:52.33036	\N
\.


--
-- Name: skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('skills_id_seq', 7, true);


--
-- Data for Name: technologies; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY technologies (id, name, portfolio_id, created_at, updated_at) FROM stdin;
42	Seed Beads	15	2017-08-02 22:05:03.371292	2017-08-02 22:05:03.371292
43	Omniflex (fishing line)	15	2017-08-02 22:05:03.386099	2017-08-02 22:05:03.386099
44	Pearl Beads	15	2017-08-02 22:06:11.429138	2017-08-02 22:06:11.429138
45	None	16	2017-08-02 22:30:40.643471	2017-08-02 22:30:40.643471
46	None	17	2017-08-02 22:34:12.714931	2017-08-02 22:34:12.714931
47	None	18	2017-08-02 22:41:26.628117	2017-08-02 22:41:26.628117
48	None	19	2017-08-02 22:44:47.153589	2017-08-02 22:44:47.153589
49	None	20	2017-08-02 22:50:34.126797	2017-08-02 22:50:34.126797
50	None	21	2017-08-02 22:53:10.575932	2017-08-02 22:53:10.575932
51	None	22	2017-08-02 22:56:55.720743	2017-08-02 22:56:55.720743
52	None	23	2017-08-02 23:01:10.353517	2017-08-02 23:01:10.353517
53	None	24	2017-08-02 23:18:13.750426	2017-08-02 23:18:13.750426
54	None	25	2017-08-02 23:21:30.328403	2017-08-02 23:21:30.328403
55	None	26	2017-08-02 23:26:58.774982	2017-08-02 23:26:58.774982
56	Wire Eyelets	27	2017-08-04 01:45:38.731387	2017-08-04 01:45:38.731387
57	Earring Hooks	27	2017-08-04 01:45:38.747894	2017-08-04 01:45:38.747894
58	Wire Stud Points	27	2017-08-04 01:45:38.749307	2017-08-04 01:45:38.749307
59	Disco Beads, Bugle Beads, and Seed Beads	27	2017-08-04 01:45:38.750456	2017-08-04 01:45:38.750456
60	Thin Wire	27	2017-08-04 01:45:38.751896	2017-08-04 01:45:38.751896
61	Needle Nose Pliers	27	2017-08-04 01:45:38.753529	2017-08-04 01:45:38.753529
62	Pliers	27	2017-08-04 01:45:38.755106	2017-08-04 01:45:38.755106
63	Wire Cutters	27	2017-08-04 01:45:38.756102	2017-08-04 01:45:38.756102
\.


--
-- Name: technologies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('technologies_id_seq', 64, true);


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY topics (id, title, created_at, updated_at) FROM stdin;
4	Sales	2017-08-01 02:23:17.894894	2017-08-01 02:23:17.894894
5	Price Questions	2017-08-01 02:23:27.245318	2017-08-01 02:23:27.245318
7	Reviews	2017-08-01 02:30:42.737363	2017-08-01 02:30:42.737363
8	Other	2017-08-01 02:30:49.387151	2017-08-01 02:30:49.387151
\.


--
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('topics_id_seq', 8, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY users (id, email, encrypted_password, name, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, roles) FROM stdin;
3	bellachabela@gmail.com	$2a$11$5JHpEpJDUa.t2aQqZ.CzNupLHrxNUXR3uz9tXcer6BTCNbV4YJ1gK	Chelsea A.	\N	\N	\N	3	2017-07-31 15:34:42.01269	2017-07-31 15:32:24.131616	107.77.228.208	163.248.33.226	2017-07-31 14:49:14.377303	2017-07-31 15:35:29.589372	user
4	anthonyanzer@gmail.com	$2a$11$RHAmMDp6jOIwQQ.JWqgnOOVmMFHY3To3xdGJjMaR.gZaBPG0Vyeea	Anthony A.	\N	\N	\N	1	2017-08-05 18:35:49.338986	2017-08-05 18:35:49.338986	174.52.66.107	174.52.66.107	2017-07-31 15:23:44.105962	2017-08-05 18:36:48.978129	user
7	jbet0151@csddocs.org	$2a$11$biH4N.Ajcl58zVhRH9AA9OkQslAMMam0CnNZMNJm0AXeH8EN2XOsO	Jessa B.	\N	\N	\N	1	2017-08-06 20:52:21.783087	2017-08-06 20:52:21.783087	174.52.66.107	174.52.66.107	2017-08-06 20:52:21.773639	2017-08-06 20:53:33.743747	site_admin
1	ackids@anzerfamilie.com	$2a$11$4RNaggfmrqV7.lNfa8Y93evZd1edFvpaTPf5GW2lBljo6DbH8TUrq	Brena A.	\N	\N	\N	55	2017-08-07 21:01:49.105397	2017-08-06 20:47:22.610432	174.52.66.107	174.52.66.107	2017-07-26 17:53:03.180266	2017-08-07 21:01:49.107393	site_admin
6	christiansenrobyn10@gmail.com	$2a$11$EKLq.TXlH1E8SfogdUqOHe5hWd5vvUqzCPcQwu/mUQgrE9rx6rNBy	Robyn Christiansen	\N	\N	\N	1	2017-08-04 21:39:11.276611	2017-08-04 21:39:11.276611	174.52.66.107	174.52.66.107	2017-08-04 21:39:11.265801	2017-08-04 21:40:56.616854	site_admin
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('users_id_seq', 7, true);


--
-- Name: blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: portfolios_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY portfolios
    ADD CONSTRAINT portfolios_pkey PRIMARY KEY (id);


--
-- Name: skills_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (id);


--
-- Name: technologies_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY technologies
    ADD CONSTRAINT technologies_pkey PRIMARY KEY (id);


--
-- Name: topics_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_blogs_on_slug; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX index_blogs_on_slug ON blogs USING btree (slug);


--
-- Name: index_blogs_on_topic_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_blogs_on_topic_id ON blogs USING btree (topic_id);


--
-- Name: index_comments_on_blog_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_comments_on_blog_id ON comments USING btree (blog_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_comments_on_user_id ON comments USING btree (user_id);


--
-- Name: index_technologies_on_portfolio_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_technologies_on_portfolio_id ON technologies USING btree (portfolio_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: fk_rails_03de2dc08c; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT fk_rails_03de2dc08c FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_7f5637ea0d; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY blogs
    ADD CONSTRAINT fk_rails_7f5637ea0d FOREIGN KEY (topic_id) REFERENCES topics(id);


--
-- Name: fk_rails_b9ae98a823; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT fk_rails_b9ae98a823 FOREIGN KEY (blog_id) REFERENCES blogs(id) ON DELETE CASCADE;


--
-- Name: fk_rails_cc5ab4a1c3; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY technologies
    ADD CONSTRAINT fk_rails_cc5ab4a1c3 FOREIGN KEY (portfolio_id) REFERENCES portfolios(id);


--
-- PostgreSQL database dump complete
--

