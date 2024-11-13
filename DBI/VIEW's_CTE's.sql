{\rtf1\ansi\ansicpg1252\cocoartf2819
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 --1\
CREATE OR REPLACE VIEW hf_intern AS\
    SELECT fid, name, status, groesse FROM flaeche WHERE hauptflaeche IS NULL\
WITH CHECK OPTION;\
--1b\
SELECT * FROM hf_intern WHERE groesse > 15;\
\
--2\
CREATE OR REPLACE VIEW hf_public_ignore_tf_stat AS\
    SELECT fid, name, status, groesse FROM flaeche WHERE status <> 'zu ermitteln'\
WITH READ ONLY;\
\
SELECT * FROM hf_public_ignore_tf_stat;\
\
--3\
CREATE OR REPLACE VIEW hf_public AS\
    SELECT fid, name, status, groesse FROM flaeche WHERE hauptflaeche IS NOT NULL AND status <> 'zu ermitteln'\
WITH READ ONLY;\
\
SELECT * FROM hf_public;\
\
--4\
CREATE OR REPLACE VIEW f_public AS\
    SELECT fid, name, status, groesse FROM flaeche WHERE hauptflaeche IS NULL AND status <> 'zu ermitteln' OR hauptflaeche IS NOT NULL AND status <> 'zu ermitteln'\
WITH READ ONLY;\
\
SELECT * FROM f_public;\
\
--5\
WITH \
    f_public_CTE AS (SELECT fid, name, status, groesse FROM flaeche WHERE hauptflaeche IS NULL AND status <> 'zu ermitteln')\
SELECT f.* FROM flaeche f\
    JOIN f_public_CTE ON (f.fid = f_public_CTE.fid);}