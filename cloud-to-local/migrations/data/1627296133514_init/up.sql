SET check_function_bodies = false;
CREATE TABLE public.class (
    id integer NOT NULL,
    std integer NOT NULL,
    div text NOT NULL
);
CREATE SEQUENCE public.class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.class_id_seq OWNED BY public.class.id;
CREATE TABLE public.student (
    id integer NOT NULL,
    class_id integer NOT NULL,
    name text NOT NULL,
    "DOB" date NOT NULL
);
CREATE SEQUENCE public.student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.student_id_seq OWNED BY public.student.id;
ALTER TABLE ONLY public.class ALTER COLUMN id SET DEFAULT nextval('public.class_id_seq'::regclass);
ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public.student_id_seq'::regclass);
ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_class_id_fkey FOREIGN KEY (class_id) REFERENCES public.class(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
