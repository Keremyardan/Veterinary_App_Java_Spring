PGDMP  $    *                 |            vetapp    16.2    16.2 7    %           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            &           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            '           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            (           1262    21797    vetapp    DATABASE     �   CREATE DATABASE vetapp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE vetapp;
                postgres    false            �            1259    21799    animals    TABLE     �  CREATE TABLE public.animals (
    animal_date_of_birth date NOT NULL,
    animal_customer_id bigint NOT NULL,
    animal_id bigint NOT NULL,
    animal_vaccine_id bigint,
    animal_breed character varying(255) NOT NULL,
    animal_color character varying(255) NOT NULL,
    animal_gender character varying(255) NOT NULL,
    animal_name character varying(255) NOT NULL,
    animal_species character varying(255) NOT NULL
);
    DROP TABLE public.animals;
       public         heap    postgres    false            �            1259    21798    animals_animal_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.animals_animal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.animals_animal_id_seq;
       public          postgres    false    216            )           0    0    animals_animal_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.animals_animal_id_seq OWNED BY public.animals.animal_id;
          public          postgres    false    215            �            1259    21898    appointments    TABLE     �   CREATE TABLE public.appointments (
    appointment_id bigint NOT NULL,
    appointment_date timestamp(6) without time zone NOT NULL,
    animal_appointment_id bigint NOT NULL,
    doctor_appointment_id bigint NOT NULL
);
     DROP TABLE public.appointments;
       public         heap    postgres    false            �            1259    21897    appointments_appointment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.appointments_appointment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.appointments_appointment_id_seq;
       public          postgres    false    225            *           0    0    appointments_appointment_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.appointments_appointment_id_seq OWNED BY public.appointments.appointment_id;
          public          postgres    false    224            �            1259    21905    available_dates    TABLE     �   CREATE TABLE public.available_dates (
    available_date_id bigint NOT NULL,
    available_date date NOT NULL,
    doctor_id bigint
);
 #   DROP TABLE public.available_dates;
       public         heap    postgres    false            �            1259    21904 %   available_dates_available_date_id_seq    SEQUENCE     �   CREATE SEQUENCE public.available_dates_available_date_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.available_dates_available_date_id_seq;
       public          postgres    false    227            +           0    0 %   available_dates_available_date_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.available_dates_available_date_id_seq OWNED BY public.available_dates.available_date_id;
          public          postgres    false    226            �            1259    21822 	   customers    TABLE     F  CREATE TABLE public.customers (
    customer_id bigint NOT NULL,
    customer_address character varying(255) NOT NULL,
    customer_city character varying(255) NOT NULL,
    customer_mail character varying(255) NOT NULL,
    customer_name character varying(255) NOT NULL,
    customer_phone character varying(255) NOT NULL
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    21821    customers_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.customers_customer_id_seq;
       public          postgres    false    218            ,           0    0    customers_customer_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;
          public          postgres    false    217            �            1259    21831    doctors    TABLE     8  CREATE TABLE public.doctors (
    doctor_id bigint NOT NULL,
    doctor_address character varying(255) NOT NULL,
    doctor_city character varying(255) NOT NULL,
    doctor_mail character varying(255) NOT NULL,
    doctor_name character varying(255) NOT NULL,
    doctor_phone character varying(255) NOT NULL
);
    DROP TABLE public.doctors;
       public         heap    postgres    false            �            1259    21839    doctors_available_dates    TABLE     s   CREATE TABLE public.doctors_available_dates (
    appointment_id bigint NOT NULL,
    doctor_id bigint NOT NULL
);
 +   DROP TABLE public.doctors_available_dates;
       public         heap    postgres    false            �            1259    21830    doctors_doctor_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.doctors_doctor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.doctors_doctor_id_seq;
       public          postgres    false    220            -           0    0    doctors_doctor_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.doctors_doctor_id_seq OWNED BY public.doctors.doctor_id;
          public          postgres    false    219            �            1259    21843    vaccines    TABLE       CREATE TABLE public.vaccines (
    vaccine_protection_end_date date NOT NULL,
    vaccine_protection_start_date date NOT NULL,
    vaccine_id bigint NOT NULL,
    vaccine_code character varying(255) NOT NULL,
    vaccine_name character varying(255) NOT NULL
);
    DROP TABLE public.vaccines;
       public         heap    postgres    false            �            1259    21842    vaccines_vaccine_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vaccines_vaccine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.vaccines_vaccine_id_seq;
       public          postgres    false    223            .           0    0    vaccines_vaccine_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.vaccines_vaccine_id_seq OWNED BY public.vaccines.vaccine_id;
          public          postgres    false    222            m           2604    21802    animals animal_id    DEFAULT     v   ALTER TABLE ONLY public.animals ALTER COLUMN animal_id SET DEFAULT nextval('public.animals_animal_id_seq'::regclass);
 @   ALTER TABLE public.animals ALTER COLUMN animal_id DROP DEFAULT;
       public          postgres    false    216    215    216            q           2604    21901    appointments appointment_id    DEFAULT     �   ALTER TABLE ONLY public.appointments ALTER COLUMN appointment_id SET DEFAULT nextval('public.appointments_appointment_id_seq'::regclass);
 J   ALTER TABLE public.appointments ALTER COLUMN appointment_id DROP DEFAULT;
       public          postgres    false    224    225    225            r           2604    21908 !   available_dates available_date_id    DEFAULT     �   ALTER TABLE ONLY public.available_dates ALTER COLUMN available_date_id SET DEFAULT nextval('public.available_dates_available_date_id_seq'::regclass);
 P   ALTER TABLE public.available_dates ALTER COLUMN available_date_id DROP DEFAULT;
       public          postgres    false    226    227    227            n           2604    21825    customers customer_id    DEFAULT     ~   ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);
 D   ALTER TABLE public.customers ALTER COLUMN customer_id DROP DEFAULT;
       public          postgres    false    217    218    218            o           2604    21834    doctors doctor_id    DEFAULT     v   ALTER TABLE ONLY public.doctors ALTER COLUMN doctor_id SET DEFAULT nextval('public.doctors_doctor_id_seq'::regclass);
 @   ALTER TABLE public.doctors ALTER COLUMN doctor_id DROP DEFAULT;
       public          postgres    false    220    219    220            p           2604    21846    vaccines vaccine_id    DEFAULT     z   ALTER TABLE ONLY public.vaccines ALTER COLUMN vaccine_id SET DEFAULT nextval('public.vaccines_vaccine_id_seq'::regclass);
 B   ALTER TABLE public.vaccines ALTER COLUMN vaccine_id DROP DEFAULT;
       public          postgres    false    223    222    223                      0    21799    animals 
   TABLE DATA           �   COPY public.animals (animal_date_of_birth, animal_customer_id, animal_id, animal_vaccine_id, animal_breed, animal_color, animal_gender, animal_name, animal_species) FROM stdin;
    public          postgres    false    216   �D                  0    21898    appointments 
   TABLE DATA           v   COPY public.appointments (appointment_id, appointment_date, animal_appointment_id, doctor_appointment_id) FROM stdin;
    public          postgres    false    225   DE       "          0    21905    available_dates 
   TABLE DATA           W   COPY public.available_dates (available_date_id, available_date, doctor_id) FROM stdin;
    public          postgres    false    227   vE                 0    21822 	   customers 
   TABLE DATA              COPY public.customers (customer_id, customer_address, customer_city, customer_mail, customer_name, customer_phone) FROM stdin;
    public          postgres    false    218   �E                 0    21831    doctors 
   TABLE DATA           q   COPY public.doctors (doctor_id, doctor_address, doctor_city, doctor_mail, doctor_name, doctor_phone) FROM stdin;
    public          postgres    false    220   F                 0    21839    doctors_available_dates 
   TABLE DATA           L   COPY public.doctors_available_dates (appointment_id, doctor_id) FROM stdin;
    public          postgres    false    221   NF                 0    21843    vaccines 
   TABLE DATA           �   COPY public.vaccines (vaccine_protection_end_date, vaccine_protection_start_date, vaccine_id, vaccine_code, vaccine_name) FROM stdin;
    public          postgres    false    223   kF       /           0    0    animals_animal_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.animals_animal_id_seq', 2, true);
          public          postgres    false    215            0           0    0    appointments_appointment_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.appointments_appointment_id_seq', 3, true);
          public          postgres    false    224            1           0    0 %   available_dates_available_date_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.available_dates_available_date_id_seq', 1, true);
          public          postgres    false    226            2           0    0    customers_customer_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.customers_customer_id_seq', 2, true);
          public          postgres    false    217            3           0    0    doctors_doctor_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.doctors_doctor_id_seq', 3, true);
          public          postgres    false    219            4           0    0    vaccines_vaccine_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.vaccines_vaccine_id_seq', 8, true);
          public          postgres    false    222            t           2606    21806    animals animals_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (animal_id);
 >   ALTER TABLE ONLY public.animals DROP CONSTRAINT animals_pkey;
       public            postgres    false    216            ~           2606    21903    appointments appointments_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (appointment_id);
 H   ALTER TABLE ONLY public.appointments DROP CONSTRAINT appointments_pkey;
       public            postgres    false    225            �           2606    21910 $   available_dates available_dates_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.available_dates
    ADD CONSTRAINT available_dates_pkey PRIMARY KEY (available_date_id);
 N   ALTER TABLE ONLY public.available_dates DROP CONSTRAINT available_dates_pkey;
       public            postgres    false    227            v           2606    21829    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    218            x           2606    21838    doctors doctors_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (doctor_id);
 >   ALTER TABLE ONLY public.doctors DROP CONSTRAINT doctors_pkey;
       public            postgres    false    220            z           2606    21850    vaccines vaccines_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.vaccines
    ADD CONSTRAINT vaccines_pkey PRIMARY KEY (vaccine_id);
 @   ALTER TABLE ONLY public.vaccines DROP CONSTRAINT vaccines_pkey;
       public            postgres    false    223            |           2606    21852 "   vaccines vaccines_vaccine_code_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.vaccines
    ADD CONSTRAINT vaccines_vaccine_code_key UNIQUE (vaccine_code);
 L   ALTER TABLE ONLY public.vaccines DROP CONSTRAINT vaccines_vaccine_code_key;
       public            postgres    false    223            �           2606    21911 (   appointments fke87gq9wetqkhp2rdcrf8fcc34    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT fke87gq9wetqkhp2rdcrf8fcc34 FOREIGN KEY (animal_appointment_id) REFERENCES public.animals(animal_id);
 R   ALTER TABLE ONLY public.appointments DROP CONSTRAINT fke87gq9wetqkhp2rdcrf8fcc34;
       public          postgres    false    216    225    4724            �           2606    21883 3   doctors_available_dates fkii2c4wpyjqqs53oecl0h77tc7    FK CONSTRAINT     �   ALTER TABLE ONLY public.doctors_available_dates
    ADD CONSTRAINT fkii2c4wpyjqqs53oecl0h77tc7 FOREIGN KEY (doctor_id) REFERENCES public.doctors(doctor_id);
 ]   ALTER TABLE ONLY public.doctors_available_dates DROP CONSTRAINT fkii2c4wpyjqqs53oecl0h77tc7;
       public          postgres    false    4728    220    221            �           2606    21921 +   available_dates fknb419ilm71d71rm584rk460pk    FK CONSTRAINT     �   ALTER TABLE ONLY public.available_dates
    ADD CONSTRAINT fknb419ilm71d71rm584rk460pk FOREIGN KEY (doctor_id) REFERENCES public.doctors(doctor_id);
 U   ALTER TABLE ONLY public.available_dates DROP CONSTRAINT fknb419ilm71d71rm584rk460pk;
       public          postgres    false    227    220    4728            �           2606    21853 #   animals fknjsvd8kplxqmf48ybxayrx6ru    FK CONSTRAINT     �   ALTER TABLE ONLY public.animals
    ADD CONSTRAINT fknjsvd8kplxqmf48ybxayrx6ru FOREIGN KEY (animal_customer_id) REFERENCES public.customers(customer_id);
 M   ALTER TABLE ONLY public.animals DROP CONSTRAINT fknjsvd8kplxqmf48ybxayrx6ru;
       public          postgres    false    4726    218    216            �           2606    21916 (   appointments fkqgdhmyb4n94fn02euj8yi8q92    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT fkqgdhmyb4n94fn02euj8yi8q92 FOREIGN KEY (doctor_appointment_id) REFERENCES public.doctors(doctor_id);
 R   ALTER TABLE ONLY public.appointments DROP CONSTRAINT fkqgdhmyb4n94fn02euj8yi8q92;
       public          postgres    false    225    4728    220            �           2606    21858 #   animals fkri1n24fec5mrsu8bhxl6kev3c    FK CONSTRAINT     �   ALTER TABLE ONLY public.animals
    ADD CONSTRAINT fkri1n24fec5mrsu8bhxl6kev3c FOREIGN KEY (animal_vaccine_id) REFERENCES public.vaccines(vaccine_id);
 M   ALTER TABLE ONLY public.animals DROP CONSTRAINT fkri1n24fec5mrsu8bhxl6kev3c;
       public          postgres    false    223    216    4730               6   x�3202�50"N# ��,I��,�t�)M��u�q�LL*�J-�LN,����� �          "   x�3�4202�50"+0�4�4����� U��      "      x�3�4202�50"Nc�=... "�         S   x�3�t,I,N��,��,.I�K*��LI+�II�H,NI�rH�M���K���tv�4B\Fxt���`��3����`F��qqq �^*�         ;   x�3�t,I,N��,��,.I�K*��L,N"��������\NǤҪ�"NS������ {A]            x������ � �         r   x��̱@0����]�{z[���HtQ��WE4A$�p�/$+8DH&1�j�2t
�FGc��f�Sq9�?47D"�S�]B ����Mn�y��e��w>
�1B��Y���5�Rj��;�     