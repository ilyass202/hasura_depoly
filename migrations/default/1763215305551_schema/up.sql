SET check_function_bodies = false;
CREATE TABLE public."User" (
    id uuid NOT NULL,
    email text NOT NULL
);
CREATE TABLE public.categorie (
    id integer NOT NULL,
    nom character varying(100) NOT NULL
);
CREATE SEQUENCE public.categorie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.categorie_id_seq OWNED BY public.categorie.id;
CREATE TABLE public.commercant (
    id integer NOT NULL,
    nom character varying(255) NOT NULL,
    url_image text NOT NULL,
    categorie_id integer
);
CREATE SEQUENCE public.commercant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.commercant_id_seq OWNED BY public.commercant.id;
CREATE TABLE public.user_favoris (
    user_id uuid NOT NULL,
    commercant_id integer NOT NULL,
    liked_at timestamp with time zone DEFAULT now()
);
ALTER TABLE ONLY public.categorie ALTER COLUMN id SET DEFAULT nextval('public.categorie_id_seq'::regclass);
ALTER TABLE ONLY public.commercant ALTER COLUMN id SET DEFAULT nextval('public.commercant_id_seq'::regclass);
ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT categorie_nom_key UNIQUE (nom);
ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT categorie_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.commercant
    ADD CONSTRAINT commercant_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.user_favoris
    ADD CONSTRAINT user_favoris_pkey PRIMARY KEY (user_id, commercant_id);
ALTER TABLE ONLY public.commercant
    ADD CONSTRAINT commercant_categorie_id_fkey FOREIGN KEY (categorie_id) REFERENCES public.categorie(id) ON DELETE SET NULL;
ALTER TABLE ONLY public.user_favoris
    ADD CONSTRAINT user_favoris_commercant_id_fkey FOREIGN KEY (commercant_id) REFERENCES public.commercant(id) ON DELETE CASCADE;
ALTER TABLE ONLY public.user_favoris
    ADD CONSTRAINT user_favoris_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."User"(id) ON DELETE CASCADE;
