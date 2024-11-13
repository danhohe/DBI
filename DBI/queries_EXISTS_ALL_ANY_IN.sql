--Tennis-DB:
SELECT * FROM players;
SELECT * FROM penalties;
--1. NAME und INITIALS der Spieler, die 1980 keine Strafe erhalten haben
SELECT pl.name, pl.initials FROM players pl WHERE playerno NOT IN (SELECT playerno FROM penalties WHERE EXTRACT(year from pen_date) <> 1980);
--2. Ausgabe der Spieler, die mindestens eine Strafe über $80 erhalten haben
SELECT * FROM players p WHERE EXISTS (SELECT * FROM penalties pen WHERE pen.playerno = p.playerno AND pen.amount > 80);
--3. Ausgabe der Spieler, bei denen jede Strafe über $80 lag
SELECT * FROM players p WHERE EXISTS (SELECT * FROM penalties pen WHERE pen.playerno = p.playerno AND pen.amount >= 80);

--EMP-DEPT:
SELECT * FROM emp;
SELECT * FROM dept;
--4. Gesucht sind alle Mitarbeiter, deren Gehalt höher ist als das Durchschnittsgehalt ihrer Abteilung
SELECT * from emp e WHERE EXISTS ( SELECT * FROM emp e1 WHERE e.deptno = e1.deptno HAVING AVG(e1.sal) < e.sal);
--5. Ermittlung aller Abteilungen, die mindestens einen Mitarbeiter haben
SELECT * from dept WHERE deptno IN (SELECT deptno FROM emp);
--6. Ausgabe aller Abteilungen, die mindestens einen Mitarbeiter aufweisen, der über 1000,- verdient
SELECT * FROM dept WHERE deptno = ANY (SELECT deptno FROM emp WHERE sal >= 1000);
--7. Ausgabe aller Abteilungen, in der jeder Mitarbeiter mindestens 1000,- verdient
SELECT DISTINCT(deptno) FROM emp e WHERE 1000 <= ALL (SELECT sal FROM emp e1 WHERE e.deptno = e1.deptno);