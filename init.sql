PGDMP       $                }            postgres    16.4    16.4 0    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     |   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    4844                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    5            �            1259    17694    appointments    TABLE     J  CREATE TABLE public.appointments (
    appointment_id integer NOT NULL,
    patient_id integer NOT NULL,
    doctor_id integer NOT NULL,
    appointment_date timestamp without time zone NOT NULL,
    status character varying(20) DEFAULT 'Запланированно'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT appointments_status_check CHECK (((status)::text = ANY ((ARRAY['Запланированно'::character varying, 'Завершенно'::character varying, 'Отмененно'::character varying])::text[])))
);
     DROP TABLE public.appointments;
       public         heap    postgres    false    5            �            1259    17693    appointments_appointment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.appointments_appointment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.appointments_appointment_id_seq;
       public          postgres    false    221    5            �           0    0    appointments_appointment_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.appointments_appointment_id_seq OWNED BY public.appointments.appointment_id;
          public          postgres    false    220            �            1259    17686    doctors    TABLE     U  CREATE TABLE public.doctors (
    doctor_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    specialty character varying(100) NOT NULL,
    phone character varying(20),
    email character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.doctors;
       public         heap    postgres    false    5            �            1259    17685    doctors_doctor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.doctors_doctor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.doctors_doctor_id_seq;
       public          postgres    false    219    5            �           0    0    doctors_doctor_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.doctors_doctor_id_seq OWNED BY public.doctors.doctor_id;
          public          postgres    false    218            �            1259    17729    patientappointments    TABLE     h  CREATE TABLE public.patientappointments (
    record_id integer NOT NULL,
    patient_id integer NOT NULL,
    doctor_id integer NOT NULL,
    appointment_id integer NOT NULL,
    booking_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(20) DEFAULT 'Забронированно'::character varying,
    CONSTRAINT patientappointments_status_check CHECK (((status)::text = ANY ((ARRAY['Забронированно'::character varying, 'Посещенно'::character varying, 'Пропущенно'::character varying, 'Отмененно'::character varying])::text[])))
);
 '   DROP TABLE public.patientappointments;
       public         heap    postgres    false    5            �            1259    17728 !   patientappointments_record_id_seq    SEQUENCE     �   CREATE SEQUENCE public.patientappointments_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.patientappointments_record_id_seq;
       public          postgres    false    5    225            �           0    0 !   patientappointments_record_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.patientappointments_record_id_seq OWNED BY public.patientappointments.record_id;
          public          postgres    false    224            �            1259    17673    patients    TABLE       CREATE TABLE public.patients (
    patient_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    date_of_birth date NOT NULL,
    gender character varying(10) NOT NULL,
    phone character varying(20),
    email character varying(100),
    address text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT patients_gender_check CHECK (((gender)::text = ANY ((ARRAY['М'::character varying, 'Ж'::character varying])::text[])))
);
    DROP TABLE public.patients;
       public         heap    postgres    false    5            �            1259    17672    patients_patient_id_seq    SEQUENCE     �   CREATE SEQUENCE public.patients_patient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.patients_patient_id_seq;
       public          postgres    false    5    217            �           0    0    patients_patient_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.patients_patient_id_seq OWNED BY public.patients.patient_id;
          public          postgres    false    216            �            1259    17714    registration    TABLE     �   CREATE TABLE public.registration (
    registration_id integer NOT NULL,
    patient_id integer NOT NULL,
    registration_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    notes text
);
     DROP TABLE public.registration;
       public         heap    postgres    false    5            �            1259    17713     registration_registration_id_seq    SEQUENCE     �   CREATE SEQUENCE public.registration_registration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.registration_registration_id_seq;
       public          postgres    false    223    5            �           0    0     registration_registration_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.registration_registration_id_seq OWNED BY public.registration.registration_id;
          public          postgres    false    222            3           2604    17697    appointments appointment_id    DEFAULT     �   ALTER TABLE ONLY public.appointments ALTER COLUMN appointment_id SET DEFAULT nextval('public.appointments_appointment_id_seq'::regclass);
 J   ALTER TABLE public.appointments ALTER COLUMN appointment_id DROP DEFAULT;
       public          postgres    false    220    221    221            1           2604    17689    doctors doctor_id    DEFAULT     v   ALTER TABLE ONLY public.doctors ALTER COLUMN doctor_id SET DEFAULT nextval('public.doctors_doctor_id_seq'::regclass);
 @   ALTER TABLE public.doctors ALTER COLUMN doctor_id DROP DEFAULT;
       public          postgres    false    218    219    219            8           2604    17732    patientappointments record_id    DEFAULT     �   ALTER TABLE ONLY public.patientappointments ALTER COLUMN record_id SET DEFAULT nextval('public.patientappointments_record_id_seq'::regclass);
 L   ALTER TABLE public.patientappointments ALTER COLUMN record_id DROP DEFAULT;
       public          postgres    false    225    224    225            /           2604    17676    patients patient_id    DEFAULT     z   ALTER TABLE ONLY public.patients ALTER COLUMN patient_id SET DEFAULT nextval('public.patients_patient_id_seq'::regclass);
 B   ALTER TABLE public.patients ALTER COLUMN patient_id DROP DEFAULT;
       public          postgres    false    217    216    217            6           2604    17717    registration registration_id    DEFAULT     �   ALTER TABLE ONLY public.registration ALTER COLUMN registration_id SET DEFAULT nextval('public.registration_registration_id_seq'::regclass);
 K   ALTER TABLE public.registration ALTER COLUMN registration_id DROP DEFAULT;
       public          postgres    false    222    223    223            �          0    17694    appointments 
   TABLE DATA           s   COPY public.appointments (appointment_id, patient_id, doctor_id, appointment_date, status, created_at) FROM stdin;
    public          postgres    false    221   \@       �          0    17686    doctors 
   TABLE DATA           h   COPY public.doctors (doctor_id, first_name, last_name, specialty, phone, email, created_at) FROM stdin;
    public          postgres    false    219   y@       �          0    17729    patientappointments 
   TABLE DATA           u   COPY public.patientappointments (record_id, patient_id, doctor_id, appointment_id, booking_date, status) FROM stdin;
    public          postgres    false    225   �@       �          0    17673    patients 
   TABLE DATA              COPY public.patients (patient_id, first_name, last_name, date_of_birth, gender, phone, email, address, created_at) FROM stdin;
    public          postgres    false    217   �@       �          0    17714    registration 
   TABLE DATA           ]   COPY public.registration (registration_id, patient_id, registration_date, notes) FROM stdin;
    public          postgres    false    223   �@       �           0    0    appointments_appointment_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.appointments_appointment_id_seq', 1, false);
          public          postgres    false    220            �           0    0    doctors_doctor_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.doctors_doctor_id_seq', 1, false);
          public          postgres    false    218            �           0    0 !   patientappointments_record_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.patientappointments_record_id_seq', 1, false);
          public          postgres    false    224            �           0    0    patients_patient_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.patients_patient_id_seq', 1, false);
          public          postgres    false    216            �           0    0     registration_registration_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.registration_registration_id_seq', 1, false);
          public          postgres    false    222            C           2606    17702    appointments appointments_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (appointment_id);
 H   ALTER TABLE ONLY public.appointments DROP CONSTRAINT appointments_pkey;
       public            postgres    false    221            A           2606    17692    doctors doctors_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (doctor_id);
 >   ALTER TABLE ONLY public.doctors DROP CONSTRAINT doctors_pkey;
       public            postgres    false    219            G           2606    17737 ,   patientappointments patientappointments_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.patientappointments
    ADD CONSTRAINT patientappointments_pkey PRIMARY KEY (record_id);
 V   ALTER TABLE ONLY public.patientappointments DROP CONSTRAINT patientappointments_pkey;
       public            postgres    false    225            ?           2606    17682    patients patients_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (patient_id);
 @   ALTER TABLE ONLY public.patients DROP CONSTRAINT patients_pkey;
       public            postgres    false    217            E           2606    17722    registration registration_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_pkey PRIMARY KEY (registration_id);
 H   ALTER TABLE ONLY public.registration DROP CONSTRAINT registration_pkey;
       public            postgres    false    223            H           2606    17708 (   appointments appointments_doctor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES public.doctors(doctor_id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.appointments DROP CONSTRAINT appointments_doctor_id_fkey;
       public          postgres    false    4673    221    219            I           2606    17703 )   appointments appointments_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(patient_id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.appointments DROP CONSTRAINT appointments_patient_id_fkey;
       public          postgres    false    217    221    4671            K           2606    17748 ;   patientappointments patientappointments_appointment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.patientappointments
    ADD CONSTRAINT patientappointments_appointment_id_fkey FOREIGN KEY (appointment_id) REFERENCES public.appointments(appointment_id) ON DELETE CASCADE;
 e   ALTER TABLE ONLY public.patientappointments DROP CONSTRAINT patientappointments_appointment_id_fkey;
       public          postgres    false    225    4675    221            L           2606    17743 6   patientappointments patientappointments_doctor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.patientappointments
    ADD CONSTRAINT patientappointments_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES public.doctors(doctor_id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.patientappointments DROP CONSTRAINT patientappointments_doctor_id_fkey;
       public          postgres    false    4673    225    219            M           2606    17738 7   patientappointments patientappointments_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.patientappointments
    ADD CONSTRAINT patientappointments_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(patient_id) ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.patientappointments DROP CONSTRAINT patientappointments_patient_id_fkey;
       public          postgres    false    217    225    4671            J           2606    17723 )   registration registration_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(patient_id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.registration DROP CONSTRAINT registration_patient_id_fkey;
       public          postgres    false    223    217    4671            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     