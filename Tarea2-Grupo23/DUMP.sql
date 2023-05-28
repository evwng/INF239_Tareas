PGDMP     :                    {            tarea2    15.2    15.2 C    S           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            T           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            U           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            V           1262    25180    tarea2    DATABASE     y   CREATE DATABASE tarea2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE tarea2;
                postgres    false                        2615    26993    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            W           0    0    SCHEMA public    COMMENT         COMMENT ON SCHEMA public IS '';
                   postgres    false    5            X           0    0    SCHEMA public    ACL     +   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
                   postgres    false    5            �            1259    27058    _defensasToreinos    TABLE     `   CREATE TABLE public."_defensasToreinos" (
    "A" integer NOT NULL,
    "B" integer NOT NULL
);
 '   DROP TABLE public."_defensasToreinos";
       public         heap    postgres    false    5            �            1259    26994    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap    postgres    false    5            �            1259    27006    defensas    TABLE     f   CREATE TABLE public.defensas (
    id integer NOT NULL,
    defensa character varying(45) NOT NULL
);
    DROP TABLE public.defensas;
       public         heap    postgres    false    5            �            1259    27005    defensas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.defensas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.defensas_id_seq;
       public          postgres    false    216    5            Y           0    0    defensas_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.defensas_id_seq OWNED BY public.defensas.id;
          public          postgres    false    215            �            1259    27012    diplomacias    TABLE     �   CREATE TABLE public.diplomacias (
    id_reino_1 integer NOT NULL,
    id_reino_2 integer NOT NULL,
    es_aliado boolean NOT NULL
);
    DROP TABLE public.diplomacias;
       public         heap    postgres    false    5            �            1259    27018    karts    TABLE     �   CREATE TABLE public.karts (
    id integer NOT NULL,
    modelo character varying(45) NOT NULL,
    color character varying(45) NOT NULL,
    velocidad_maxima integer,
    id_personaje integer
);
    DROP TABLE public.karts;
       public         heap    postgres    false    5            �            1259    27017    karts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.karts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.karts_id_seq;
       public          postgres    false    219    5            Z           0    0    karts_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.karts_id_seq OWNED BY public.karts.id;
          public          postgres    false    218            �            1259    27032    personaje_habita_reino    TABLE     �   CREATE TABLE public.personaje_habita_reino (
    id_personaje integer NOT NULL,
    id_reino integer NOT NULL,
    fecha_registro timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    es_gobernante boolean NOT NULL
);
 *   DROP TABLE public.personaje_habita_reino;
       public         heap    postgres    false    5            �            1259    27038    personaje_tiene_trabajo    TABLE     �   CREATE TABLE public.personaje_tiene_trabajo (
    id_trabajo integer NOT NULL,
    id_personaje integer NOT NULL,
    fecha_inicio date DEFAULT CURRENT_TIMESTAMP NOT NULL,
    fecha_termino date
);
 +   DROP TABLE public.personaje_tiene_trabajo;
       public         heap    postgres    false    5            �            1259    27025 
   personajes    TABLE     �   CREATE TABLE public.personajes (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL,
    fuerza integer NOT NULL,
    fecha_nacimiento date DEFAULT CURRENT_TIMESTAMP NOT NULL,
    objeto character varying(30)
);
    DROP TABLE public.personajes;
       public         heap    postgres    false    5            �            1259    27024    personajes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personajes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.personajes_id_seq;
       public          postgres    false    221    5            [           0    0    personajes_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.personajes_id_seq OWNED BY public.personajes.id;
          public          postgres    false    220            �            1259    27045    reinos    TABLE     �   CREATE TABLE public.reinos (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL,
    ubicacion character varying(45) NOT NULL,
    superficie integer NOT NULL
);
    DROP TABLE public.reinos;
       public         heap    postgres    false    5            �            1259    27044    reinos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reinos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.reinos_id_seq;
       public          postgres    false    5    225            \           0    0    reinos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.reinos_id_seq OWNED BY public.reinos.id;
          public          postgres    false    224            �            1259    27052    trabajos    TABLE     ~   CREATE TABLE public.trabajos (
    id integer NOT NULL,
    descripcion character varying(45),
    sueldo integer NOT NULL
);
    DROP TABLE public.trabajos;
       public         heap    postgres    false    5            �            1259    27051    trabajos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.trabajos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.trabajos_id_seq;
       public          postgres    false    227    5            ]           0    0    trabajos_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.trabajos_id_seq OWNED BY public.trabajos.id;
          public          postgres    false    226            �           2604    27009    defensas id    DEFAULT     j   ALTER TABLE ONLY public.defensas ALTER COLUMN id SET DEFAULT nextval('public.defensas_id_seq'::regclass);
 :   ALTER TABLE public.defensas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    27021    karts id    DEFAULT     d   ALTER TABLE ONLY public.karts ALTER COLUMN id SET DEFAULT nextval('public.karts_id_seq'::regclass);
 7   ALTER TABLE public.karts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    27028    personajes id    DEFAULT     n   ALTER TABLE ONLY public.personajes ALTER COLUMN id SET DEFAULT nextval('public.personajes_id_seq'::regclass);
 <   ALTER TABLE public.personajes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    27048 	   reinos id    DEFAULT     f   ALTER TABLE ONLY public.reinos ALTER COLUMN id SET DEFAULT nextval('public.reinos_id_seq'::regclass);
 8   ALTER TABLE public.reinos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    27055    trabajos id    DEFAULT     j   ALTER TABLE ONLY public.trabajos ALTER COLUMN id SET DEFAULT nextval('public.trabajos_id_seq'::regclass);
 :   ALTER TABLE public.trabajos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            P          0    27058    _defensasToreinos 
   TABLE DATA           7   COPY public."_defensasToreinos" ("A", "B") FROM stdin;
    public          postgres    false    228   �P       B          0    26994    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          postgres    false    214   �P       D          0    27006    defensas 
   TABLE DATA           /   COPY public.defensas (id, defensa) FROM stdin;
    public          postgres    false    216   wQ       E          0    27012    diplomacias 
   TABLE DATA           H   COPY public.diplomacias (id_reino_1, id_reino_2, es_aliado) FROM stdin;
    public          postgres    false    217   �Q       G          0    27018    karts 
   TABLE DATA           R   COPY public.karts (id, modelo, color, velocidad_maxima, id_personaje) FROM stdin;
    public          postgres    false    219   R       J          0    27032    personaje_habita_reino 
   TABLE DATA           g   COPY public.personaje_habita_reino (id_personaje, id_reino, fecha_registro, es_gobernante) FROM stdin;
    public          postgres    false    222   sR       K          0    27038    personaje_tiene_trabajo 
   TABLE DATA           h   COPY public.personaje_tiene_trabajo (id_trabajo, id_personaje, fecha_inicio, fecha_termino) FROM stdin;
    public          postgres    false    223   !S       I          0    27025 
   personajes 
   TABLE DATA           R   COPY public.personajes (id, nombre, fuerza, fecha_nacimiento, objeto) FROM stdin;
    public          postgres    false    221   �S       M          0    27045    reinos 
   TABLE DATA           C   COPY public.reinos (id, nombre, ubicacion, superficie) FROM stdin;
    public          postgres    false    225   U       O          0    27052    trabajos 
   TABLE DATA           ;   COPY public.trabajos (id, descripcion, sueldo) FROM stdin;
    public          postgres    false    227   lU       ^           0    0    defensas_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.defensas_id_seq', 5, true);
          public          postgres    false    215            _           0    0    karts_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.karts_id_seq', 3, true);
          public          postgres    false    218            `           0    0    personajes_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.personajes_id_seq', 15, true);
          public          postgres    false    220            a           0    0    reinos_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.reinos_id_seq', 3, true);
          public          postgres    false    224            b           0    0    trabajos_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.trabajos_id_seq', 6, true);
          public          postgres    false    226            �           2606    27002 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public            postgres    false    214            �           2606    27011    defensas defensas_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.defensas
    ADD CONSTRAINT defensas_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.defensas DROP CONSTRAINT defensas_pkey;
       public            postgres    false    216            �           2606    27016    diplomacias diplomacias_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.diplomacias
    ADD CONSTRAINT diplomacias_pkey PRIMARY KEY (id_reino_1, id_reino_2);
 F   ALTER TABLE ONLY public.diplomacias DROP CONSTRAINT diplomacias_pkey;
       public            postgres    false    217    217            �           2606    27023    karts karts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.karts
    ADD CONSTRAINT karts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.karts DROP CONSTRAINT karts_pkey;
       public            postgres    false    219            �           2606    27037 2   personaje_habita_reino personaje_habita_reino_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.personaje_habita_reino
    ADD CONSTRAINT personaje_habita_reino_pkey PRIMARY KEY (id_personaje, id_reino);
 \   ALTER TABLE ONLY public.personaje_habita_reino DROP CONSTRAINT personaje_habita_reino_pkey;
       public            postgres    false    222    222            �           2606    27043 4   personaje_tiene_trabajo personaje_tiene_trabajo_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.personaje_tiene_trabajo
    ADD CONSTRAINT personaje_tiene_trabajo_pkey PRIMARY KEY (id_personaje, id_trabajo);
 ^   ALTER TABLE ONLY public.personaje_tiene_trabajo DROP CONSTRAINT personaje_tiene_trabajo_pkey;
       public            postgres    false    223    223            �           2606    27031    personajes personajes_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.personajes
    ADD CONSTRAINT personajes_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.personajes DROP CONSTRAINT personajes_pkey;
       public            postgres    false    221            �           2606    27050    reinos reinos_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.reinos
    ADD CONSTRAINT reinos_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.reinos DROP CONSTRAINT reinos_pkey;
       public            postgres    false    225            �           2606    27057    trabajos trabajos_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.trabajos
    ADD CONSTRAINT trabajos_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.trabajos DROP CONSTRAINT trabajos_pkey;
       public            postgres    false    227            �           1259    27061    _defensasToreinos_AB_unique    INDEX     h   CREATE UNIQUE INDEX "_defensasToreinos_AB_unique" ON public."_defensasToreinos" USING btree ("A", "B");
 1   DROP INDEX public."_defensasToreinos_AB_unique";
       public            postgres    false    228    228            �           1259    27062    _defensasToreinos_B_index    INDEX     Z   CREATE INDEX "_defensasToreinos_B_index" ON public."_defensasToreinos" USING btree ("B");
 /   DROP INDEX public."_defensasToreinos_B_index";
       public            postgres    false    228            �           2606    27098 *   _defensasToreinos _defensasToreinos_A_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."_defensasToreinos"
    ADD CONSTRAINT "_defensasToreinos_A_fkey" FOREIGN KEY ("A") REFERENCES public.defensas(id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public."_defensasToreinos" DROP CONSTRAINT "_defensasToreinos_A_fkey";
       public          postgres    false    3226    228    216            �           2606    27103 *   _defensasToreinos _defensasToreinos_B_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."_defensasToreinos"
    ADD CONSTRAINT "_defensasToreinos_B_fkey" FOREIGN KEY ("B") REFERENCES public.reinos(id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public."_defensasToreinos" DROP CONSTRAINT "_defensasToreinos_B_fkey";
       public          postgres    false    228    225    3238            �           2606    27063 '   diplomacias diplomacias_id_reino_1_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.diplomacias
    ADD CONSTRAINT diplomacias_id_reino_1_fkey FOREIGN KEY (id_reino_1) REFERENCES public.reinos(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 Q   ALTER TABLE ONLY public.diplomacias DROP CONSTRAINT diplomacias_id_reino_1_fkey;
       public          postgres    false    3238    217    225            �           2606    27068 '   diplomacias diplomacias_id_reino_2_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.diplomacias
    ADD CONSTRAINT diplomacias_id_reino_2_fkey FOREIGN KEY (id_reino_2) REFERENCES public.reinos(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 Q   ALTER TABLE ONLY public.diplomacias DROP CONSTRAINT diplomacias_id_reino_2_fkey;
       public          postgres    false    225    3238    217            �           2606    27073    karts karts_id_personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.karts
    ADD CONSTRAINT karts_id_personaje_fkey FOREIGN KEY (id_personaje) REFERENCES public.personajes(id) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.karts DROP CONSTRAINT karts_id_personaje_fkey;
       public          postgres    false    219    3232    221            �           2606    27078 ?   personaje_habita_reino personaje_habita_reino_id_personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personaje_habita_reino
    ADD CONSTRAINT personaje_habita_reino_id_personaje_fkey FOREIGN KEY (id_personaje) REFERENCES public.personajes(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 i   ALTER TABLE ONLY public.personaje_habita_reino DROP CONSTRAINT personaje_habita_reino_id_personaje_fkey;
       public          postgres    false    221    222    3232            �           2606    27083 ;   personaje_habita_reino personaje_habita_reino_id_reino_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personaje_habita_reino
    ADD CONSTRAINT personaje_habita_reino_id_reino_fkey FOREIGN KEY (id_reino) REFERENCES public.reinos(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 e   ALTER TABLE ONLY public.personaje_habita_reino DROP CONSTRAINT personaje_habita_reino_id_reino_fkey;
       public          postgres    false    222    3238    225            �           2606    27093 A   personaje_tiene_trabajo personaje_tiene_trabajo_id_personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personaje_tiene_trabajo
    ADD CONSTRAINT personaje_tiene_trabajo_id_personaje_fkey FOREIGN KEY (id_personaje) REFERENCES public.personajes(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 k   ALTER TABLE ONLY public.personaje_tiene_trabajo DROP CONSTRAINT personaje_tiene_trabajo_id_personaje_fkey;
       public          postgres    false    223    221    3232            �           2606    27088 ?   personaje_tiene_trabajo personaje_tiene_trabajo_id_trabajo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personaje_tiene_trabajo
    ADD CONSTRAINT personaje_tiene_trabajo_id_trabajo_fkey FOREIGN KEY (id_trabajo) REFERENCES public.trabajos(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 i   ALTER TABLE ONLY public.personaje_tiene_trabajo DROP CONSTRAINT personaje_tiene_trabajo_id_trabajo_fkey;
       public          postgres    false    3240    227    223            P       x�3�4�2�4�2�4�2bS06����� 5 |      B   �   x�m��	1 ��*ҀY�%m�`!ؖ�������o�1�M�J£�^M}U�&ˌ�u�$Ƃ�Tf��z��M^KSBh��K2���~9'QnH���Z;H�]U[�Y�I���́�y�����[�r7��.      D   f   x����0г=E&@��	*$��'�P$�Av��X���4EsQE��$E�C�	�h��eo��:��`��x��*,��7}��#�ն��G.v������o�"�      E      x�3�4�,����� 
��      G   S   x�3�J��KTJ�������4�4�2��ML�LN,*��R�J99M��8�������Û�2s8�r�A�b��b���� ���      J   �   x�m�� �ZE�"j-y���?�<��e��@A�Ҟ�O���	9ʧ��R]���]��I�g��n�w	��I�B0i?7c���I����Z$7��0w�y�S�BOچX��
�2���۶y�\��S�n6�Q��/}����m_
�s�^�Z�C�S�      K   ^   x�e��� ��c�6��Kt��������`/�R�`|B�r=H}��%r����$�g�K�
O;-ɓ�M=Դ�|��A��q���0U      I   e  x�e�MN�0���S�A��B�lB,� ��4���R9ܦG@!c��OA�,����{�	,1��^/yM� �q�0�p�n�NC�BԧCd�0[�ea�,x�T�}�y���ya���a��y|O\�^âےo"'��n�e���������g�}�9���&5L��b��Oؠ*a�O�Ɲ�+��q�D�Vg}=4AY��"�=F`�f�5Y�
1xT�B��¸�?�uRﰍ��u��o�s3���^yN[<(;��H=7���^�a*yN�/���z	}bZ̜�s�̠�6c�5gF��x�y�z;�Z�%�ر�����[	>9�M��u(�Z�~��H��ɣo����#���f�o      M   X   x�3�J���W(J-.�L������+IE�pAU9e�%�\R�����3S@�\�p��ԢÛ�8}��r����b���� �U!�      O   `   x�3�t�O.�/�4500�2�(J-�LI�+I�44 	���R��J�A|N�Ă̒�� ZL9��rR�!���8]R�SsrRS�9�b���� Ǎ�     