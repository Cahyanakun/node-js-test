PGDMP                         {            db_dans_test_dev    12.8    12.6     e           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            f           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            g           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            h           1262    65338    db_dans_test_dev    DATABASE     n   CREATE DATABASE db_dans_test_dev WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
     DROP DATABASE db_dans_test_dev;
                postgres    false                        3079    65344 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            i           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            ?            1259    65339    SequelizeMeta    TABLE     R   CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);
 #   DROP TABLE public."SequelizeMeta";
       public         heap    postgres    false            ?            1259    65355    accounts    TABLE     1  CREATE TABLE public.accounts (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    email character varying(255),
    password text,
    is_admin boolean,
    phone_number character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.accounts;
       public         heap    postgres    false    2            ?            1259    65364    admins    TABLE     *  CREATE TABLE public.admins (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    account_id uuid,
    full_name character varying(255),
    bod timestamp with time zone,
    address text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.admins;
       public         heap    postgres    false    2            ?            1259    65378    users    TABLE     )  CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    account_id uuid,
    full_name character varying(255),
    bod timestamp with time zone,
    address text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false    2            _          0    65339    SequelizeMeta 
   TABLE DATA           /   COPY public."SequelizeMeta" (name) FROM stdin;
    public          postgres    false    203          `          0    65355    accounts 
   TABLE DATA           g   COPY public.accounts (id, email, password, is_admin, phone_number, created_at, updated_at) FROM stdin;
    public          postgres    false    204   W       a          0    65364    admins 
   TABLE DATA           a   COPY public.admins (id, account_id, full_name, bod, address, created_at, updated_at) FROM stdin;
    public          postgres    false    205   t       b          0    65378    users 
   TABLE DATA           `   COPY public.users (id, account_id, full_name, bod, address, created_at, updated_at) FROM stdin;
    public          postgres    false    206   ?       ?           2606    65343     SequelizeMeta SequelizeMeta_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
 N   ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
       public            postgres    false    203            ?           2606    65363    accounts accounts_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_pkey;
       public            postgres    false    204            ?           2606    65372    admins admins_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_pkey;
       public            postgres    false    205            ?           2606    65386    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    206            ?           2606    65373    admins admins_account_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts(id) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_account_id_fkey;
       public          postgres    false    205    204    3034            ?           2606    65387    users users_account_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts(id) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_account_id_fkey;
       public          postgres    false    3034    204    206            _   E   x?32026020320406?M.JM,I?MLN?/?+??*?2?+026D(H???C?66?I???dc???? J}8      `      x?????? ? ?      a      x?????? ? ?      b      x?????? ? ?     