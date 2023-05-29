PGDMP         '                {         
   dumptarea2    15.3    15.3 C    S           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            T           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            U           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            V           1262    34170 
   dumptarea2    DATABASE     }   CREATE DATABASE dumptarea2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE dumptarea2;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            W           0    0    SCHEMA public    COMMENT         COMMENT ON SCHEMA public IS '';
                   postgres    false    5            X           0    0    SCHEMA public    ACL     +   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
                   postgres    false    5            �            1259    34171    _defensasToreinos    TABLE     `   CREATE TABLE public."_defensasToreinos" (
    "A" integer NOT NULL,
    "B" integer NOT NULL
);
 '   DROP TABLE public."_defensasToreinos";
       public         heap    postgres    false    5            �            1259    34174    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
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
       public         heap    postgres    false    5            �            1259    34181    defensas    TABLE     f   CREATE TABLE public.defensas (
    id integer NOT NULL,
    defensa character varying(45) NOT NULL
);
    DROP TABLE public.defensas;
       public         heap    postgres    false    5            �            1259    34184    defensas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.defensas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.defensas_id_seq;
       public          postgres    false    216    5            Y           0    0    defensas_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.defensas_id_seq OWNED BY public.defensas.id;
          public          postgres    false    217            �            1259    34185    diplomacias    TABLE     �   CREATE TABLE public.diplomacias (
    id_reino_1 integer NOT NULL,
    id_reino_2 integer NOT NULL,
    es_aliado boolean NOT NULL
);
    DROP TABLE public.diplomacias;
       public         heap    postgres    false    5            �            1259    34188    karts    TABLE     �   CREATE TABLE public.karts (
    id integer NOT NULL,
    modelo character varying(45) NOT NULL,
    color character varying(45) NOT NULL,
    velocidad_maxima integer,
    id_personaje integer
);
    DROP TABLE public.karts;
       public         heap    postgres    false    5            �            1259    34191    karts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.karts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.karts_id_seq;
       public          postgres    false    5    219            Z           0    0    karts_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.karts_id_seq OWNED BY public.karts.id;
          public          postgres    false    220            �            1259    34192    personaje_habita_reino    TABLE     �   CREATE TABLE public.personaje_habita_reino (
    id_personaje integer NOT NULL,
    id_reino integer NOT NULL,
    fecha_registro timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    es_gobernante boolean NOT NULL
);
 *   DROP TABLE public.personaje_habita_reino;
       public         heap    postgres    false    5            �            1259    34196    personaje_tiene_trabajo    TABLE     �   CREATE TABLE public.personaje_tiene_trabajo (
    id_trabajo integer NOT NULL,
    id_personaje integer NOT NULL,
    fecha_inicio date DEFAULT CURRENT_TIMESTAMP NOT NULL,
    fecha_termino date
);
 +   DROP TABLE public.personaje_tiene_trabajo;
       public         heap    postgres    false    5            �            1259    34200 
   personajes    TABLE     �   CREATE TABLE public.personajes (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL,
    fuerza integer NOT NULL,
    fecha_nacimiento date DEFAULT CURRENT_TIMESTAMP NOT NULL,
    objeto character varying(30)
);
    DROP TABLE public.personajes;
       public         heap    postgres    false    5            �            1259    34204    personajes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personajes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.personajes_id_seq;
       public          postgres    false    223    5            [           0    0    personajes_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.personajes_id_seq OWNED BY public.personajes.id;
          public          postgres    false    224            �            1259    34205    reinos    TABLE     �   CREATE TABLE public.reinos (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL,
    ubicacion character varying(45) NOT NULL,
    superficie integer NOT NULL
);
    DROP TABLE public.reinos;
       public         heap    postgres    false    5            �            1259    34208    reinos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reinos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.reinos_id_seq;
       public          postgres    false    225    5            \           0    0    reinos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.reinos_id_seq OWNED BY public.reinos.id;
          public          postgres    false    226            �            1259    34209    trabajos    TABLE     ~   CREATE TABLE public.trabajos (
    id integer NOT NULL,
    descripcion character varying(45),
    sueldo integer NOT NULL
);
    DROP TABLE public.trabajos;
       public         heap    postgres    false    5            �            1259    34212    trabajos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.trabajos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.trabajos_id_seq;
       public          postgres    false    227    5            ]           0    0    trabajos_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.trabajos_id_seq OWNED BY public.trabajos.id;
          public          postgres    false    228            �           2604    34213    defensas id    DEFAULT     j   ALTER TABLE ONLY public.defensas ALTER COLUMN id SET DEFAULT nextval('public.defensas_id_seq'::regclass);
 :   ALTER TABLE public.defensas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216            �           2604    34214    karts id    DEFAULT     d   ALTER TABLE ONLY public.karts ALTER COLUMN id SET DEFAULT nextval('public.karts_id_seq'::regclass);
 7   ALTER TABLE public.karts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            �           2604    34215    personajes id    DEFAULT     n   ALTER TABLE ONLY public.personajes ALTER COLUMN id SET DEFAULT nextval('public.personajes_id_seq'::regclass);
 <   ALTER TABLE public.personajes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223            �           2604    34216 	   reinos id    DEFAULT     f   ALTER TABLE ONLY public.reinos ALTER COLUMN id SET DEFAULT nextval('public.reinos_id_seq'::regclass);
 8   ALTER TABLE public.reinos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225            �           2604    34217    trabajos id    DEFAULT     j   ALTER TABLE ONLY public.trabajos ALTER COLUMN id SET DEFAULT nextval('public.trabajos_id_seq'::regclass);
 :   ALTER TABLE public.trabajos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227            B          0    34171    _defensasToreinos 
   TABLE DATA           7   COPY public."_defensasToreinos" ("A", "B") FROM stdin;
    public          postgres    false    214   �P       C          0    34174    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          postgres    false    215   �P       D          0    34181    defensas 
   TABLE DATA           /   COPY public.defensas (id, defensa) FROM stdin;
    public          postgres    false    216   lQ       F          0    34185    diplomacias 
   TABLE DATA           H   COPY public.diplomacias (id_reino_1, id_reino_2, es_aliado) FROM stdin;
    public          postgres    false    218   R       G          0    34188    karts 
   TABLE DATA           R   COPY public.karts (id, modelo, color, velocidad_maxima, id_personaje) FROM stdin;
    public          postgres    false    219   JR       I          0    34192    personaje_habita_reino 
   TABLE DATA           g   COPY public.personaje_habita_reino (id_personaje, id_reino, fecha_registro, es_gobernante) FROM stdin;
    public          postgres    false    221   �R       J          0    34196    personaje_tiene_trabajo 
   TABLE DATA           h   COPY public.personaje_tiene_trabajo (id_trabajo, id_personaje, fecha_inicio, fecha_termino) FROM stdin;
    public          postgres    false    222   +T       K          0    34200 
   personajes 
   TABLE DATA           R   COPY public.personajes (id, nombre, fuerza, fecha_nacimiento, objeto) FROM stdin;
    public          postgres    false    223   �T       M          0    34205    reinos 
   TABLE DATA           C   COPY public.reinos (id, nombre, ubicacion, superficie) FROM stdin;
    public          postgres    false    225   �W       O          0    34209    trabajos 
   TABLE DATA           ;   COPY public.trabajos (id, descripcion, sueldo) FROM stdin;
    public          postgres    false    227   =X       ^           0    0    defensas_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.defensas_id_seq', 9, true);
          public          postgres    false    217            _           0    0    karts_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.karts_id_seq', 7, true);
          public          postgres    false    220            `           0    0    personajes_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.personajes_id_seq', 30, true);
          public          postgres    false    224            a           0    0    reinos_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.reinos_id_seq', 5, true);
          public          postgres    false    226            b           0    0    trabajos_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.trabajos_id_seq', 13, true);
          public          postgres    false    228            �           2606    34219 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public            postgres    false    215            �           2606    34221    defensas defensas_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.defensas
    ADD CONSTRAINT defensas_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.defensas DROP CONSTRAINT defensas_pkey;
       public            postgres    false    216            �           2606    34223    diplomacias diplomacias_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.diplomacias
    ADD CONSTRAINT diplomacias_pkey PRIMARY KEY (id_reino_1, id_reino_2);
 F   ALTER TABLE ONLY public.diplomacias DROP CONSTRAINT diplomacias_pkey;
       public            postgres    false    218    218            �           2606    34225    karts karts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.karts
    ADD CONSTRAINT karts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.karts DROP CONSTRAINT karts_pkey;
       public            postgres    false    219            �           2606    34227 2   personaje_habita_reino personaje_habita_reino_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.personaje_habita_reino
    ADD CONSTRAINT personaje_habita_reino_pkey PRIMARY KEY (id_personaje, id_reino);
 \   ALTER TABLE ONLY public.personaje_habita_reino DROP CONSTRAINT personaje_habita_reino_pkey;
       public            postgres    false    221    221            �           2606    34229 4   personaje_tiene_trabajo personaje_tiene_trabajo_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.personaje_tiene_trabajo
    ADD CONSTRAINT personaje_tiene_trabajo_pkey PRIMARY KEY (id_personaje, id_trabajo);
 ^   ALTER TABLE ONLY public.personaje_tiene_trabajo DROP CONSTRAINT personaje_tiene_trabajo_pkey;
       public            postgres    false    222    222            �           2606    34231    personajes personajes_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.personajes
    ADD CONSTRAINT personajes_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.personajes DROP CONSTRAINT personajes_pkey;
       public            postgres    false    223            �           2606    34233    reinos reinos_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.reinos
    ADD CONSTRAINT reinos_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.reinos DROP CONSTRAINT reinos_pkey;
       public            postgres    false    225            �           2606    34235    trabajos trabajos_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.trabajos
    ADD CONSTRAINT trabajos_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.trabajos DROP CONSTRAINT trabajos_pkey;
       public            postgres    false    227            �           1259    34236    _defensasToreinos_AB_unique    INDEX     h   CREATE UNIQUE INDEX "_defensasToreinos_AB_unique" ON public."_defensasToreinos" USING btree ("A", "B");
 1   DROP INDEX public."_defensasToreinos_AB_unique";
       public            postgres    false    214    214            �           1259    34237    _defensasToreinos_B_index    INDEX     Z   CREATE INDEX "_defensasToreinos_B_index" ON public."_defensasToreinos" USING btree ("B");
 /   DROP INDEX public."_defensasToreinos_B_index";
       public            postgres    false    214            �           2606    34238 *   _defensasToreinos _defensasToreinos_A_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."_defensasToreinos"
    ADD CONSTRAINT "_defensasToreinos_A_fkey" FOREIGN KEY ("A") REFERENCES public.defensas(id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public."_defensasToreinos" DROP CONSTRAINT "_defensasToreinos_A_fkey";
       public          postgres    false    216    3228    214            �           2606    34243 *   _defensasToreinos _defensasToreinos_B_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."_defensasToreinos"
    ADD CONSTRAINT "_defensasToreinos_B_fkey" FOREIGN KEY ("B") REFERENCES public.reinos(id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public."_defensasToreinos" DROP CONSTRAINT "_defensasToreinos_B_fkey";
       public          postgres    false    3240    214    225            �           2606    34248 '   diplomacias diplomacias_id_reino_1_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.diplomacias
    ADD CONSTRAINT diplomacias_id_reino_1_fkey FOREIGN KEY (id_reino_1) REFERENCES public.reinos(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 Q   ALTER TABLE ONLY public.diplomacias DROP CONSTRAINT diplomacias_id_reino_1_fkey;
       public          postgres    false    225    218    3240            �           2606    34253 '   diplomacias diplomacias_id_reino_2_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.diplomacias
    ADD CONSTRAINT diplomacias_id_reino_2_fkey FOREIGN KEY (id_reino_2) REFERENCES public.reinos(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 Q   ALTER TABLE ONLY public.diplomacias DROP CONSTRAINT diplomacias_id_reino_2_fkey;
       public          postgres    false    218    3240    225            �           2606    34258    karts karts_id_personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.karts
    ADD CONSTRAINT karts_id_personaje_fkey FOREIGN KEY (id_personaje) REFERENCES public.personajes(id) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.karts DROP CONSTRAINT karts_id_personaje_fkey;
       public          postgres    false    219    223    3238            �           2606    34263 ?   personaje_habita_reino personaje_habita_reino_id_personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personaje_habita_reino
    ADD CONSTRAINT personaje_habita_reino_id_personaje_fkey FOREIGN KEY (id_personaje) REFERENCES public.personajes(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 i   ALTER TABLE ONLY public.personaje_habita_reino DROP CONSTRAINT personaje_habita_reino_id_personaje_fkey;
       public          postgres    false    221    223    3238            �           2606    34268 ;   personaje_habita_reino personaje_habita_reino_id_reino_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personaje_habita_reino
    ADD CONSTRAINT personaje_habita_reino_id_reino_fkey FOREIGN KEY (id_reino) REFERENCES public.reinos(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 e   ALTER TABLE ONLY public.personaje_habita_reino DROP CONSTRAINT personaje_habita_reino_id_reino_fkey;
       public          postgres    false    3240    225    221            �           2606    34273 A   personaje_tiene_trabajo personaje_tiene_trabajo_id_personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personaje_tiene_trabajo
    ADD CONSTRAINT personaje_tiene_trabajo_id_personaje_fkey FOREIGN KEY (id_personaje) REFERENCES public.personajes(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 k   ALTER TABLE ONLY public.personaje_tiene_trabajo DROP CONSTRAINT personaje_tiene_trabajo_id_personaje_fkey;
       public          postgres    false    3238    222    223            �           2606    34278 ?   personaje_tiene_trabajo personaje_tiene_trabajo_id_trabajo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personaje_tiene_trabajo
    ADD CONSTRAINT personaje_tiene_trabajo_id_trabajo_fkey FOREIGN KEY (id_trabajo) REFERENCES public.trabajos(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 i   ALTER TABLE ONLY public.personaje_tiene_trabajo DROP CONSTRAINT personaje_tiene_trabajo_id_trabajo_fkey;
       public          postgres    false    227    222    3242            B   -   x�3�4�2�4�2�4�2bS06�2�4�2bNS.K ����� }�x      C   �   x�m��	1 ��*ҀY�%m�`!ؖ�������o�1�M�J£�^M}U�&ˌ�u�$Ƃ�Tf��z��M^KSBh��K2���~9'QnH���Z;H�]U[�Y�I���́�y�����[�r7��.      D   �   x��;�0��S�H��F�(B%��Y��Ŏ�ط�@9�/Ʀ�y���&M�E(����I��ĸ����Ɖ����-\�#�!�N�ېp�H�������$[��<�W� m������oU�p�S�r![���􅥨�p���Z_6�qa|���m:�      F   '   x�3�4�,�2�4�F�&�i\�`�	�L��dc���� ��S      G   �   x�-�A�0���S�&-�n�7ʢk6#4�f�I!&z-���l����4��3+˯ 4���{�1���+CCWd�pZ������'�Ϩk��9�7�Zx`\�_P�K��O`V6�;�G/��)i��.�HX�@�����:l����.���Hݎ�~0�9y      I   "  x�m��q D���4p�j-�N����$9�~.��*E
�����!��\]	�Y�F}1/85��U[i'mF�Z�i���m?��� ���e	�e����z�q��Jfz�W:����'�A-��*r��8Ħ�Ʃ�'�Z�M��r�%/�&LR}	��U����me�JC�5/�� %��{����E�g&���`j����n�>|�9�X�ȧ��im��ϗ�vZKA��[oju�}o�K�{'�m�΋ͨ�x�s����$~����](.�ͥs�����ŝ�?����ƨ�      J   �   x�e��!CϦ2����D*��눜d�3�� [�!M0j�
>��	R�1A!�2QT�lLTe�n!��2L��6Ҥ�?=�#�3́�O��� jѥ�7]���Ùa���7�e��!p!XT��tlj��8�6F]	����V�������}+�H�釘�O_��wo�@f:�ʾ�����)��8b�      K   �  x�eS�n�0�ɯ��)ے��N�U�A� ˕ĸh2�� ��d�С��U?�Cى�0�<�����s
Û���SLe*�dj�2��/���o�b�C�͘\,�L�������ĵv��8W�$[LT��\4�ޢi|����n�k���9��2�����
���q�~I��z��n�~"{J�{����-����Չ%5����OG]tM�z.3v����Q0�I&Df	���;�R��@TEa�����¹�M�h��݃q&b�JӲ=�Jo��eή��L�]$qȁ;�BO���O�����[b���s�19af���Gk�8��o�l��uc��8��!'l�f���71hk	l�]�C�\}8On����y�f��<� ��G�(ѵ���<x�e1�^y���(E&ŀ�� %�$���s�PR?㶣����D7�^�ˉD�yBa��Z�G�5� T��;G�<����'��J٫����.�k���R�1c�o���ͱ��/Q�6����v-ϓ��G���WS��@(�9:+Q�"ݛ�}6ڵ�5�Cj�1��!��>��������`��8�LW"�U�y�`7����hY��AN���vW�d�eZ�ܯ�Z`�~61@&+y	r�	����q�Ae�mK�+���'-�t6Z��5�V�:9��O��?�L)      M   �   x�M�K�0D��)r��`[uâR�5�4X�(Ē��3q�^�U��񌃁8��r�t�
�ig-�W���u����$	|����揤�'A��4ѧ��[<�@K�SM-����)p�X<mH��kT�̀k���o-<�Zu�!�P:k      O   �   x�-���0E��a��P"B	� 4N�Y
y�m�a 
f�b��=��Ps�٢�R��%gz�=AɈ�x "y��z1~}�[�čۉ^z�KQ�&G�e"�3�أ6��G8���t�G��ZI\��,�HD����Uu&��@�?��GF�:v�i�@���?�U;�     