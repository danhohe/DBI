{\rtf1\ansi\ansicpg1252\cocoartf2819
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 CREATE USER anna IDENTIFIED BY anna;\
CREATE USER berta IDENTIFIED BY berta;\
\
GRANT CONNECT, UNLIMITED TABLESPACE TO anna;\
\
GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE TO berta;\
\
-- annatable wird nicht funktionieren da sie weder RESOURCE noch CREATE TABLE \
-- als Rolle bzw privileg besitzt, bertatable funktioniert da sie RESOURCE als \
-- Rolle zugewiesen hat.\
\
GRANT INSERT ON bertatable TO anna;\
\
CREATE ROLE downer;\
\
CREATE ROLE DUSER;\
\
-- Benutzer     SELECT      INSERT      UPADTE      DELETE\
\
-- A               X           X           X           X\
-- B               X           X           X           X\
-- C               X           X           X           X\
-- D               X           X           X           X\
\
\
-- REVOKE SELECT, INSERT ON T FROM C;\
-- Benutzer     SELECT      INSERT      UPADTE      DELETE\
\
-- A               X           X           X           X\
-- B               X           X           X           X\
-- C                                       X           X\
-- D               X           X           X           X\
\
-- REVOKE DELETE ON T FROM B;\
-- Benutzer     SELECT      INSERT      UPADTE      DELETE\
\
-- A               X           X           X           X\
-- B               X           X           X           \
-- C                                       X           X\
-- D               X           X           X           X\
\
-- REVOKE GRANT OPTION FOR SELECT ON T FROM B;\
-- Benutzer     SELECT      INSERT      UPADTE      DELETE\
\
-- A               X           X           X           X\
-- B               X           X           X           \
-- C                                       X           X\
-- D                           X           X           X\
\
-- REVOKE UPDATE ON T FROM C;\
-- Benutzer     SELECT      INSERT      UPADTE      DELETE\
\
-- A               X           X           X           X\
-- B               X           X           X           \
-- C                                                   X\
-- D                           X           X           X}