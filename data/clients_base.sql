--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION;






--
-- Database creation
--

CREATE DATABASE clients_base WITH TEMPLATE = template0 OWNER = postgres;
CREATE DATABASE clients_base1 WITH TEMPLATE = template0 OWNER = postgres;
REVOKE ALL ON DATABASE template1 FROM PUBLIC;
REVOKE ALL ON DATABASE template1 FROM postgres;
GRANT ALL ON DATABASE template1 TO postgres;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect clients_base

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: address; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE address (
    id integer NOT NULL,
    client_id integer,
    country character varying(255) DEFAULT NULL::character varying,
    city character varying(255) DEFAULT NULL::character varying,
    rest character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_id_seq OWNER TO postgres;

--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE client (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    surname character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_id_seq OWNER TO postgres;

--
-- Name: history; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE history (
    id integer NOT NULL,
    client_id integer,
    action character varying(255) DEFAULT NULL::character varying,
    desription character varying(255) DEFAULT NULL::character varying,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.history OWNER TO postgres;

--
-- Name: history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_id_seq OWNER TO postgres;

--
-- Name: migration_versions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE migration_versions (
    version character varying(14) NOT NULL,
    executed_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.migration_versions OWNER TO postgres;

--
-- Name: COLUMN migration_versions.executed_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN migration_versions.executed_at IS '(DC2Type:datetime_immutable)';


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO address VALUES (9, 4, 'Россия', 'Липецк', 'улица Хорошавина, дом 5, квартира 84');
INSERT INTO address VALUES (10, 4, 'Россия', 'Воронеж', 'улица Ворошилова, дом 3, квартира 45');
INSERT INTO address VALUES (13, 6, 'Россия', 'Липецк', 'улица Хорошавина, дом 5, квартира 84');
INSERT INTO address VALUES (14, 6, 'Россия', 'Воронеж', 'улица Ворошилова, дом 3, квартира 45');
INSERT INTO address VALUES (15, 7, 'Россия', 'Липецк', 'улица Хорошавина, дом 5, квартира 84');
INSERT INTO address VALUES (16, 7, 'Россия', 'Воронеж', 'улица Ворошилова, дом 3, квартира 45');
INSERT INTO address VALUES (17, 8, 'Россия', 'Воронеж', 'улица Хорошавина, дом 5, квартира 84');
INSERT INTO address VALUES (18, 8, 'Россия', 'Липецк', 'улица Ворошилова, дом 3, квартира 45');
INSERT INTO address VALUES (19, 9, 'Россия', 'Воронеж', 'улица Хорошавина, дом 5, квартира 84');
INSERT INTO address VALUES (20, 9, 'Россия', 'Липецк', 'улица Ворошилова, дом 3, квартира 45');
INSERT INTO address VALUES (21, 10, 'Россия', 'Воронеж', 'улица Хорошавина, дом 5, квартира 84');
INSERT INTO address VALUES (22, 10, 'Россия', 'Липецк', 'улица Ворошилова, дом 3, квартира 45');
INSERT INTO address VALUES (24, 29, 'Россия', 'Воронеж', 'Улица Хорошавина, дом 5, квартира 84');
INSERT INTO address VALUES (25, 29, 'Россия', 'Липецк', 'улица Ворошилова, дом 3, квартира 45');
INSERT INTO address VALUES (26, 11, 'Россия', 'Воронеж', 'улица Хорошавина, дом 5, квартира 84');
INSERT INTO address VALUES (27, 11, 'Россия', 'Воронеж', 'улица Ворошилова, дом 3, квартира 45');
INSERT INTO address VALUES (28, 12, 'Россия', 'Воронеж', 'улица Хорошавина, дом 5, квартира 84');
INSERT INTO address VALUES (29, 12, 'Россия', 'Липецк', 'улица Ворошилова, дом 3, квартира 45');
INSERT INTO address VALUES (30, 15, 'Россия', 'Воронеж', 'улица Хорошавина, дом 5, квартира 84');
INSERT INTO address VALUES (31, 15, 'Россия', 'Липецк', 'улица Ворошилова, дом 3, квартира 45');
INSERT INTO address VALUES (32, 16, 'Россия', 'Воронеж', 'улица Хорошавина, дом 5, квартира 84');
INSERT INTO address VALUES (33, 16, 'Россия', 'Липецк', 'улица Ворошилова, дом 3, квартира 45');
INSERT INTO address VALUES (34, 17, 'Россия', 'Воронеж', 'улица Хорошавина, дом 5, квартира 84');
INSERT INTO address VALUES (35, 17, 'Россия', 'Липецк', 'улица Ворошилова, дом 3, квартира 45');
INSERT INTO address VALUES (36, 21, 'Россия', 'Воронеж', 'улица Хорошавина, дом 5, квартира 84');
INSERT INTO address VALUES (37, 21, 'Россия', 'Липецк', 'улица Ворошилова, дом 3, квартира 45');
INSERT INTO address VALUES (38, 23, 'Россия', 'Воронеж', 'улица Хорошавина, дом 5, квартира 84');
INSERT INTO address VALUES (39, 23, 'Россия', 'Липецк', 'улица Ворошилова, дом 3, квартира 45');
INSERT INTO address VALUES (40, 22, 'Россия', 'Воронеж', 'улица Хорошавина, дом 5, квартира 84');
INSERT INTO address VALUES (41, 22, 'Россия', 'Липецк', 'улица Ворошилова, дом 3, квартира 45');


--
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('address_id_seq', 41, true);


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO client VALUES (6, 'Наталья', 'Самохвалова', '+7-905-875-43-74', 'samokhvalova@yandex.ru', '2019-10-21 23:15:43', '2019-10-22 03:37:23');
INSERT INTO client VALUES (7, 'Лариса', 'Павлова', '+7-902-864-63-63', 'pavlova@yandex.ru', '2019-10-21 23:16:49', '2019-10-22 03:37:39');
INSERT INTO client VALUES (8, 'Андрей', 'Баршев', '+7-904-685-43-56', 'barshev@yandex.ru', '2019-10-21 23:17:35', '2019-10-22 03:38:04');
INSERT INTO client VALUES (9, 'Захар', 'Оверченков', '+7-903-355-22-55', 'overchenkov@yandex.ru', '2019-10-21 23:18:38', '2019-10-22 03:38:21');
INSERT INTO client VALUES (10, 'Оксана', 'Бодалян', '+7-907-435-96-64', 'bodalyan@yandex.ru', '2019-10-21 23:19:54', '2019-10-22 03:38:35');
INSERT INTO client VALUES (11, 'Александр', 'Герасимов', '+7-904-859-45-38', 'gerasimov@yandex.ru', '2019-10-21 23:27:03', '2019-10-22 03:39:25');
INSERT INTO client VALUES (12, 'Софья', 'Леденева', '+7-903-857-03-75', 'ledeneva@yandex.ru', '2019-10-21 23:28:04', '2019-10-22 03:40:07');
INSERT INTO client VALUES (15, 'Яков', 'Архипов', '+7-903-958-93-55', 'arkhipov@yandex.ru', '2019-10-21 23:30:46', '2019-10-22 03:40:42');
INSERT INTO client VALUES (16, 'Екатерина', 'Гусева', '+7-903-958-93-55', 'guseva@yandex.ru', '2019-10-21 23:31:29', '2019-10-22 03:41:36');
INSERT INTO client VALUES (17, 'Анна', 'Трофимова', '+7-903-853-35-25', 'trofimova@yandex.ru', '2019-10-21 23:32:21', '2019-10-22 03:42:05');
INSERT INTO client VALUES (21, 'Валентин', 'Кириллов', '+7-906-684-44-46', 'kirillov@yandex.ru', '2019-10-22 02:06:16', '2019-10-22 03:43:19');
INSERT INTO client VALUES (23, 'Наталья', 'Самохвалова', '+7-905-875-43-74', 'samokhvalova@yandex.ru', '2019-10-22 02:07:11', '2019-10-22 03:43:59');
INSERT INTO client VALUES (22, 'Игорь', 'Игнатьев', '+7-903-853-35-25', 'ignatev@yandex.ru', '2019-10-22 02:06:37', '2019-10-22 03:44:33');
INSERT INTO client VALUES (29, 'Николай', 'Зощенко', '+7-904-685-43-56', 'zochenko@mail.ru', '2019-10-22 03:36:39', '2019-10-22 03:44:55');
INSERT INTO client VALUES (4, 'Валентин', 'Кириллов', '+7-903-958-93-55', 'kirillov@yandex.ru', '2019-10-21 23:12:50', '2019-10-22 03:48:24');


--
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('client_id_seq', 29, true);


--
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO history VALUES (10, 4, 'Изменение', 'kirillov@mail.ru -> kirillov@yandex.ru', '2019-10-22 03:37:03');
INSERT INTO history VALUES (11, 6, 'Изменение', 'samokhvalova@mail.ru -> samokhvalova@yandex.ru', '2019-10-22 03:37:23');
INSERT INTO history VALUES (12, 7, 'Изменение', 'pavlova@mail.ru -> pavlova@yandex.ru', '2019-10-22 03:37:39');
INSERT INTO history VALUES (13, 8, 'Изменение', 'barshev@mail.ru -> barshev@yandex.ru', '2019-10-22 03:38:04');
INSERT INTO history VALUES (14, 9, 'Изменение', 'overchenkov@mail.ru -> overchenkov@yandex.ru', '2019-10-22 03:38:21');
INSERT INTO history VALUES (15, 10, 'Изменение', 'bodalyan@mail.ru -> bodalyan@yandex.ru', '2019-10-22 03:38:35');
INSERT INTO history VALUES (16, 11, 'Изменение', 'gerasimov@mail.ru -> gerasimov@yandex.ru', '2019-10-22 03:39:25');
INSERT INTO history VALUES (17, 12, 'Изменение', 'ledeneva@mail.ru -> ledeneva@yandex.ru', '2019-10-22 03:40:07');
INSERT INTO history VALUES (18, 15, 'Изменение', 'arkhipov@mail.ru -> arkhipov@yandex.ru', '2019-10-22 03:40:42');
INSERT INTO history VALUES (19, 16, 'Изменение', 'guseva@mail.ru -> guseva@yandex.ru', '2019-10-22 03:41:36');
INSERT INTO history VALUES (20, 17, 'Изменение', 'trofimova@mail.ru -> trofimova@yandex.ru', '2019-10-22 03:42:05');
INSERT INTO history VALUES (21, 21, 'Изменение', 'kirillov@mail.ru -> kirillov@yandex.ru', '2019-10-22 03:43:19');
INSERT INTO history VALUES (22, 23, 'Изменение', 'samokhvalova@mail.ru -> samokhvalova@yandex.ru', '2019-10-22 03:43:59');
INSERT INTO history VALUES (23, 22, 'Изменение', 'ignatev@mail.ru -> ignatev@yandex.ru', '2019-10-22 03:44:33');
INSERT INTO history VALUES (24, 29, 'Изменение', 'zochenko@yandex.ru -> zochenko@mail.ru', '2019-10-22 03:44:55');
INSERT INTO history VALUES (25, 4, 'Изменение', '+7-906-684-44-46 -> +7-903-958-93-55', '2019-10-22 03:48:24');


--
-- Name: history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('history_id_seq', 25, true);


--
-- Data for Name: migration_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO migration_versions VALUES ('20191021195905', '2019-10-21 19:59:21');


--
-- Name: address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- Name: history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY history
    ADD CONSTRAINT history_pkey PRIMARY KEY (id);


--
-- Name: migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY migration_versions
    ADD CONSTRAINT migration_versions_pkey PRIMARY KEY (version);


--
-- Name: idx_27ba704b19eb6921; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_27ba704b19eb6921 ON history USING btree (client_id);


--
-- Name: idx_d4e6f8119eb6921; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_d4e6f8119eb6921 ON address USING btree (client_id);


--
-- Name: fk_27ba704b19eb6921; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY history
    ADD CONSTRAINT fk_27ba704b19eb6921 FOREIGN KEY (client_id) REFERENCES client(id);


--
-- Name: fk_d4e6f8119eb6921; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address
    ADD CONSTRAINT fk_d4e6f8119eb6921 FOREIGN KEY (client_id) REFERENCES client(id) ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect clients_base1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: address; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE address (
    id integer NOT NULL,
    client_id integer,
    country character varying(255) DEFAULT NULL::character varying,
    city character varying(255) DEFAULT NULL::character varying,
    rest character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_id_seq OWNER TO postgres;

--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE client (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    surname character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_id_seq OWNER TO postgres;

--
-- Name: history; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE history (
    id integer NOT NULL,
    client_id integer,
    action character varying(255) DEFAULT NULL::character varying,
    desription character varying(255) DEFAULT NULL::character varying,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.history OWNER TO postgres;

--
-- Name: history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_id_seq OWNER TO postgres;

--
-- Name: migration_versions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE migration_versions (
    version character varying(14) NOT NULL,
    executed_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.migration_versions OWNER TO postgres;

--
-- Name: COLUMN migration_versions.executed_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN migration_versions.executed_at IS '(DC2Type:datetime_immutable)';


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('address_id_seq', 1, false);


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('client_id_seq', 1, false);


--
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('history_id_seq', 1, false);


--
-- Data for Name: migration_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO migration_versions VALUES ('20191021193203', '2019-10-21 19:32:28');


--
-- Name: address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- Name: history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY history
    ADD CONSTRAINT history_pkey PRIMARY KEY (id);


--
-- Name: migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY migration_versions
    ADD CONSTRAINT migration_versions_pkey PRIMARY KEY (version);


--
-- Name: idx_27ba704b19eb6921; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_27ba704b19eb6921 ON history USING btree (client_id);


--
-- Name: idx_d4e6f8119eb6921; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_d4e6f8119eb6921 ON address USING btree (client_id);


--
-- Name: fk_27ba704b19eb6921; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY history
    ADD CONSTRAINT fk_27ba704b19eb6921 FOREIGN KEY (client_id) REFERENCES client(id);


--
-- Name: fk_d4e6f8119eb6921; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address
    ADD CONSTRAINT fk_d4e6f8119eb6921 FOREIGN KEY (client_id) REFERENCES client(id) ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

