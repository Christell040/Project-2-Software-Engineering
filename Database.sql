PGDMP     5                    z            student    14.2    14.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24655    student    DATABASE     k   CREATE DATABASE student WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE student;
                postgres    false            ?            1255    24731    calc_outstanding_fee(integer)    FUNCTION     ?  CREATE FUNCTION public.calc_outstanding_fee(studentid integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE 
outstandingfee integer;
BEGIN 

-- SELECT *,(amount-amont_paid) INTO outstanding_fee FROM public.student_fees;
SELECT sum(amount-amount_paid) INTO outstandingfee FROM student_fees WHERE student_fees.student_id=studentid;
	UPDATE student_fees
	SET outstanding_fees = outstandingfee
	WHERE student_fees.student_id=studentid;
RETURN outstandingfee;
END;
$$;
 >   DROP FUNCTION public.calc_outstanding_fee(studentid integer);
       public          postgres    false            ?            1259    24695    course_enrolement    TABLE     ?   CREATE TABLE public.course_enrolement (
    course_id integer NOT NULL,
    course_name character varying(100) NOT NULL,
    lecturer_id integer NOT NULL
);
 %   DROP TABLE public.course_enrolement;
       public         heap    postgres    false            ?            1259    24700    lecturer    TABLE     ?   CREATE TABLE public.lecturer (
    lecturer_id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    course_id integer NOT NULL
);
    DROP TABLE public.lecturer;
       public         heap    postgres    false            ?            1259    24684    student_fees    TABLE     ?   CREATE TABLE public.student_fees (
    payment_id integer NOT NULL,
    student_id integer NOT NULL,
    amount integer NOT NULL,
    amount_paid integer NOT NULL,
    outstanding_fees integer
);
     DROP TABLE public.student_fees;
       public         heap    postgres    false            ?            1259    24659    student_info    TABLE       CREATE TABLE public.student_info (
    student_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    age integer NOT NULL,
    contact integer NOT NULL,
    email character varying(100) NOT NULL
);
     DROP TABLE public.student_info;
       public         heap    postgres    false            ?            1259    24713    ta    TABLE     ?   CREATE TABLE public.ta (
    ta_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    lecturer_id integer NOT NULL,
    course_id integer NOT NULL
);
    DROP TABLE public.ta;
       public         heap    postgres    false            
          0    24695    course_enrolement 
   TABLE DATA           P   COPY public.course_enrolement (course_id, course_name, lecturer_id) FROM stdin;
    public          postgres    false    211   ?                  0    24700    lecturer 
   TABLE DATA           Q   COPY public.lecturer (lecturer_id, first_name, last_name, course_id) FROM stdin;
    public          postgres    false    212   ?        	          0    24684    student_fees 
   TABLE DATA           e   COPY public.student_fees (payment_id, student_id, amount, amount_paid, outstanding_fees) FROM stdin;
    public          postgres    false    210   ?                  0    24659    student_info 
   TABLE DATA           ^   COPY public.student_info (student_id, first_name, last_name, age, contact, email) FROM stdin;
    public          postgres    false    209   F!                 0    24713    ta 
   TABLE DATA           R   COPY public.ta (ta_id, first_name, last_name, lecturer_id, course_id) FROM stdin;
    public          postgres    false    213   ?!       r           2606    24699 (   course_enrolement course_enrolement_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.course_enrolement
    ADD CONSTRAINT course_enrolement_pkey PRIMARY KEY (course_id);
 R   ALTER TABLE ONLY public.course_enrolement DROP CONSTRAINT course_enrolement_pkey;
       public            postgres    false    211            u           2606    24706    lecturer lecturer_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.lecturer
    ADD CONSTRAINT lecturer_pkey PRIMARY KEY (lecturer_id);
 @   ALTER TABLE ONLY public.lecturer DROP CONSTRAINT lecturer_pkey;
       public            postgres    false    212            p           2606    24688    student_fees student_fees_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.student_fees
    ADD CONSTRAINT student_fees_pkey PRIMARY KEY (payment_id);
 H   ALTER TABLE ONLY public.student_fees DROP CONSTRAINT student_fees_pkey;
       public            postgres    false    210            m           2606    24663    student_info student_info_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.student_info
    ADD CONSTRAINT student_info_pkey PRIMARY KEY (student_id);
 H   ALTER TABLE ONLY public.student_info DROP CONSTRAINT student_info_pkey;
       public            postgres    false    209            x           2606    24717 
   ta ta_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY public.ta
    ADD CONSTRAINT ta_pkey PRIMARY KEY (ta_id);
 4   ALTER TABLE ONLY public.ta DROP CONSTRAINT ta_pkey;
       public            postgres    false    213            s           1259    24712    fki_course_id    INDEX     G   CREATE INDEX fki_course_id ON public.lecturer USING btree (course_id);
 !   DROP INDEX public.fki_course_id;
       public            postgres    false    212            v           1259    24723    fki_lecturer_id    INDEX     E   CREATE INDEX fki_lecturer_id ON public.ta USING btree (lecturer_id);
 #   DROP INDEX public.fki_lecturer_id;
       public            postgres    false    213            n           1259    24694    fki_student_info    INDEX     O   CREATE INDEX fki_student_info ON public.student_fees USING btree (student_id);
 $   DROP INDEX public.fki_student_info;
       public            postgres    false    210            z           2606    24707    lecturer course_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.lecturer
    ADD CONSTRAINT course_id FOREIGN KEY (course_id) REFERENCES public.course_enrolement(course_id) NOT VALID;
 <   ALTER TABLE ONLY public.lecturer DROP CONSTRAINT course_id;
       public          postgres    false    211    212    3186            |           2606    24724    ta course_id    FK CONSTRAINT     s   ALTER TABLE ONLY public.ta
    ADD CONSTRAINT course_id FOREIGN KEY (ta_id) REFERENCES public.ta(ta_id) NOT VALID;
 6   ALTER TABLE ONLY public.ta DROP CONSTRAINT course_id;
       public          postgres    false    3192    213    213            {           2606    24718    ta lecturer_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.ta
    ADD CONSTRAINT lecturer_id FOREIGN KEY (lecturer_id) REFERENCES public.lecturer(lecturer_id) NOT VALID;
 8   ALTER TABLE ONLY public.ta DROP CONSTRAINT lecturer_id;
       public          postgres    false    213    212    3189            y           2606    24689    student_fees student_info    FK CONSTRAINT     ?   ALTER TABLE ONLY public.student_fees
    ADD CONSTRAINT student_info FOREIGN KEY (student_id) REFERENCES public.student_info(student_id) NOT VALID;
 C   ALTER TABLE ONLY public.student_fees DROP CONSTRAINT student_info;
       public          postgres    false    210    209    3181            
      x?3??M,?H?M,?L.?4?????? F??            x?3?H-J???JL?.???4?????? Q,?      	   ;   x?%??  Cѳ?@Q?0???m???G??'???
P??ˡ??l?mT???H?s?o?m??         ?   x?Uα
? ????0A?6?5?%t??EDT?	hl_??Xh???q.????0?M4V9?8Db"???6*:?DD0???6G5?T??m??&^-?[??b???VWҾӳaS???????ϫ	????(??4Ȋ????g??/??A         "   x?34??M,/???I-)I??4?4?????? e ?     