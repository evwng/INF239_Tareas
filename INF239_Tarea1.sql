PGDMP                          {            tarea1    15.2    15.2 $    (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            +           1262    16399    tarea1    DATABASE     y   CREATE DATABASE tarea1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE tarea1;
                postgres    false            �            1259    24924    cuentas_bancarias    TABLE     �   CREATE TABLE public.cuentas_bancarias (
    id integer NOT NULL,
    tipo_de_cuenta character varying(45) NOT NULL,
    banco character varying(45) NOT NULL,
    saldo integer NOT NULL,
    id_persona integer
);
 %   DROP TABLE public.cuentas_bancarias;
       public         heap    postgres    false            �            1259    24923    cuentas_bancarias_id_seq    SEQUENCE     �   ALTER TABLE public.cuentas_bancarias ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cuentas_bancarias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �            1259    24901 	   facciones    TABLE     �   CREATE TABLE public.facciones (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL,
    descripcion character varying(45) NOT NULL
);
    DROP TABLE public.facciones;
       public         heap    postgres    false            �            1259    24900    facciones_id_seq    SEQUENCE     �   ALTER TABLE public.facciones ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.facciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    24934    persona_pertenece_faccion    TABLE     t   CREATE TABLE public.persona_pertenece_faccion (
    id_persona integer NOT NULL,
    id_faccion integer NOT NULL
);
 -   DROP TABLE public.persona_pertenece_faccion;
       public         heap    postgres    false            �            1259    24949    persona_tiene_trabajo    TABLE     �   CREATE TABLE public.persona_tiene_trabajo (
    id_persona integer NOT NULL,
    id_trabajo integer NOT NULL,
    estado boolean NOT NULL,
    ultima_vez_realizado timestamp without time zone NOT NULL
);
 )   DROP TABLE public.persona_tiene_trabajo;
       public         heap    postgres    false            �            1259    24913    personas    TABLE     �   CREATE TABLE public.personas (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL,
    apellidos character varying(45) NOT NULL,
    fecha_nacimiento date NOT NULL,
    infectado boolean NOT NULL,
    conyugue integer
);
    DROP TABLE public.personas;
       public         heap    postgres    false            �            1259    24912    personas_id_seq    SEQUENCE     �   ALTER TABLE public.personas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.personas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    24907    trabajos    TABLE     �   CREATE TABLE public.trabajos (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL,
    descripcion character varying(45) NOT NULL,
    sueldo integer NOT NULL
);
    DROP TABLE public.trabajos;
       public         heap    postgres    false            �            1259    24906    trabajos_id_seq    SEQUENCE     �   ALTER TABLE public.trabajos ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.trabajos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            #          0    24924    cuentas_bancarias 
   TABLE DATA           Y   COPY public.cuentas_bancarias (id, tipo_de_cuenta, banco, saldo, id_persona) FROM stdin;
    public          postgres    false    221   -                 0    24901 	   facciones 
   TABLE DATA           <   COPY public.facciones (id, nombre, descripcion) FROM stdin;
    public          postgres    false    215   �.       $          0    24934    persona_pertenece_faccion 
   TABLE DATA           K   COPY public.persona_pertenece_faccion (id_persona, id_faccion) FROM stdin;
    public          postgres    false    222   �/       %          0    24949    persona_tiene_trabajo 
   TABLE DATA           e   COPY public.persona_tiene_trabajo (id_persona, id_trabajo, estado, ultima_vez_realizado) FROM stdin;
    public          postgres    false    223   �/       !          0    24913    personas 
   TABLE DATA           `   COPY public.personas (id, nombre, apellidos, fecha_nacimiento, infectado, conyugue) FROM stdin;
    public          postgres    false    219   51                 0    24907    trabajos 
   TABLE DATA           C   COPY public.trabajos (id, nombre, descripcion, sueldo) FROM stdin;
    public          postgres    false    217   4       ,           0    0    cuentas_bancarias_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.cuentas_bancarias_id_seq', 25, true);
          public          postgres    false    220            -           0    0    facciones_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.facciones_id_seq', 6, true);
          public          postgres    false    214            .           0    0    personas_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.personas_id_seq', 30, true);
          public          postgres    false    218            /           0    0    trabajos_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.trabajos_id_seq', 13, true);
          public          postgres    false    216            �           2606    24928 (   cuentas_bancarias cuentas_bancarias_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.cuentas_bancarias
    ADD CONSTRAINT cuentas_bancarias_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.cuentas_bancarias DROP CONSTRAINT cuentas_bancarias_pkey;
       public            postgres    false    221            }           2606    24905    facciones facciones_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.facciones
    ADD CONSTRAINT facciones_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.facciones DROP CONSTRAINT facciones_pkey;
       public            postgres    false    215            �           2606    24938 8   persona_pertenece_faccion persona_pertenece_faccion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.persona_pertenece_faccion
    ADD CONSTRAINT persona_pertenece_faccion_pkey PRIMARY KEY (id_persona, id_faccion);
 b   ALTER TABLE ONLY public.persona_pertenece_faccion DROP CONSTRAINT persona_pertenece_faccion_pkey;
       public            postgres    false    222    222            �           2606    24953 0   persona_tiene_trabajo persona_tiene_trabajo_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.persona_tiene_trabajo
    ADD CONSTRAINT persona_tiene_trabajo_pkey PRIMARY KEY (id_persona, id_trabajo);
 Z   ALTER TABLE ONLY public.persona_tiene_trabajo DROP CONSTRAINT persona_tiene_trabajo_pkey;
       public            postgres    false    223    223            �           2606    24917    personas personas_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.personas DROP CONSTRAINT personas_pkey;
       public            postgres    false    219                       2606    24911    trabajos trabajos_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.trabajos
    ADD CONSTRAINT trabajos_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.trabajos DROP CONSTRAINT trabajos_pkey;
       public            postgres    false    217            �           2606    24929 3   cuentas_bancarias cuentas_bancarias_id_persona_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cuentas_bancarias
    ADD CONSTRAINT cuentas_bancarias_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES public.personas(id);
 ]   ALTER TABLE ONLY public.cuentas_bancarias DROP CONSTRAINT cuentas_bancarias_id_persona_fkey;
       public          postgres    false    219    221    3201            �           2606    24944 C   persona_pertenece_faccion persona_pertenece_faccion_id_faccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.persona_pertenece_faccion
    ADD CONSTRAINT persona_pertenece_faccion_id_faccion_fkey FOREIGN KEY (id_faccion) REFERENCES public.facciones(id);
 m   ALTER TABLE ONLY public.persona_pertenece_faccion DROP CONSTRAINT persona_pertenece_faccion_id_faccion_fkey;
       public          postgres    false    3197    222    215            �           2606    24939 C   persona_pertenece_faccion persona_pertenece_faccion_id_persona_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.persona_pertenece_faccion
    ADD CONSTRAINT persona_pertenece_faccion_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES public.personas(id);
 m   ALTER TABLE ONLY public.persona_pertenece_faccion DROP CONSTRAINT persona_pertenece_faccion_id_persona_fkey;
       public          postgres    false    3201    222    219            �           2606    24954 ;   persona_tiene_trabajo persona_tiene_trabajo_id_persona_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.persona_tiene_trabajo
    ADD CONSTRAINT persona_tiene_trabajo_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES public.personas(id);
 e   ALTER TABLE ONLY public.persona_tiene_trabajo DROP CONSTRAINT persona_tiene_trabajo_id_persona_fkey;
       public          postgres    false    219    223    3201            �           2606    24959 ;   persona_tiene_trabajo persona_tiene_trabajo_id_trabajo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.persona_tiene_trabajo
    ADD CONSTRAINT persona_tiene_trabajo_id_trabajo_fkey FOREIGN KEY (id_trabajo) REFERENCES public.trabajos(id);
 e   ALTER TABLE ONLY public.persona_tiene_trabajo DROP CONSTRAINT persona_tiene_trabajo_id_trabajo_fkey;
       public          postgres    false    3199    223    217            �           2606    24918    personas personas_conyugue_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_conyugue_fkey FOREIGN KEY (conyugue) REFERENCES public.personas(id);
 I   ALTER TABLE ONLY public.personas DROP CONSTRAINT personas_conyugue_fkey;
       public          postgres    false    219    3201    219            #   �  x���MN�0�מS���?��l#!u�"
]�1iD�V6J��\�I�T-$��(�f<�d�{Z�l�d>ʺ�b`��d14�.���fs��1�A�\`SD&R�C�|�:���q�P�:���j~�-��ۜi!S&8���2��'l��3��^�̺jZ$VEl+��Î)�9C3����0݃vT�Y7�U?�=�
��>���24�|>��Vw���G����ȐC{������
ÕŞ��х|�,�W��Om��@�(Mj�Gb�+7�'v�Ϫ5ir�����d�%#�&�ʩ9=��)���NrR�
�^�:�l�1T���VI���B�۴!EZn���1ꢡ��M����*Iٝ�!'o�rf���8����}��Q�4e.���9���� � �G         �   x�u�KJCA��q�*j��1�	�$�:9vWbA�u���9����Q��Y~�S�au���� ��&�8��Pfڰ�{����f�q�)���*��i�S�*E:�d|���0�x0���z�J%�\��$�;�5^�����Up�v\]��P�g��o��7ԉ��$r���K\����l����CG|ħ���.[.      $   S   x��� !ߡ�A�ڋ��q�O�ĉ�	�`:�]vJ����g*�jv���Q��Z�Na4�vVA���W�
      %   @  x�]��m1DϦ�m��kSKΩ��� �k}E�m�0��6p�i�؝�_�>�4��^�:�.����L	w��Tj�4vUF�&gL;�uY�E�	oM:�p�`n�CHf�,����83C��ƚs:��4=�#�q֜�u5�����ɞmq6�R�6u�$��c��\%�����Bޙ��nC-K-�h9ƾE2�i���c����U�`�L��#+�Dl���wgZ��K���lHGH��'⻵���� g�������AV�	�)�]�H�헕�Ż*ۏTC��fa���2�#�'�L��-:Q���W��؄�����t      !   �  x�UT�v�0]_��	����ӸΣm�ƛl�06:��T��!_�ArNW,��}�J��Q���U�Ɖۓ��Ȧ��̋9���.���v� �N�W���=��Y^T�R#j�g;mm/�ƞq�AU.�'d��-�P��� �=��T�T^,rUBdh�hb�Ē��w�`Yu�f#���v�� ֞!���\��eۈgt���7�ԣ;��*/f��&����%Z+nu�y�4I�D'g�񡥈.���Z<��w�I��7�����Zďc��C��	��L��3}��Q����#i��&`_�CX�H>E��0y�9AkX�99X�H�9Z�`����!-��ӯ�lw{䬉Y���;�Z�~���#SL݌�(Fj�h�~��Hq�N�"���0���8=���if��<��`�ac��nN�I)��L�0��dU5p��y���4h����q�E��㴲��2�Dk�>"U��韻䂹��S�\��;��bx��M��"�͎�"S؜ZCW�my�}D7V��&7*Ss��Nl�C@'���5���>�ʌ�S4��i#�E��f��	;�dC���o�*��>��T�T�*����?u$]��mǫ�g	��!�L��q_�'z/֨�]��pY�Pp��K��į������p�̤��D�E�]�ͱ�Qv%g'3IgDG�}�1�ގ�K�x̈́���,���PBW         E  x�}�KN�0���)r�u��8 ���TF��I��K,z�\�q[PK����㷕�7������@;�}�cbc(��b��+��y�(b�z��q/@֤����X3��#�	w�D���^�u.�y��8�V�s�Z�
��Rl���h/��sd!�>$����ʢ��x ?`Xp����rdEe������^f��	��/�$άQ�lDg�M��7���;`�̎�Ҳ���6��c�����R���Mp.L4n״�TJtH�+�p�~�����۰�����'e2�=r$y�j�r6�3��K"�!f>�����|��R~��Ժ     