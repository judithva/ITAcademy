-- Si us plau, descàrrega la base de dades del fitxer schema_universidad.sql, visualitza el diagrama E-R en un editor i efectua les següents consultes:

-- 1. Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;

-- 2. Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;

-- 3. Retorna el llistat dels alumnes que van néixer en 1999.
SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento)=1999;

-- 4. Retorna el llistat de professors que no han donat d'alta el seu número de telèfon en la base de dades i a més la seva nif acaba en K.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';

-- 5. Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

-- 6. Retorna un llistat dels professors juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT p.nombre, p.apellido1, p.apellido2, d.nombre FROM persona p INNER JOIN profesor pf ON p.id = pf.id_profesor  INNER JOIN departamento d ON  d.id = pf.id_departamento WHERE p.tipo = 'profesor' ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

-- 7. Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne amb nif 26902806M.
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin 
FROM asignatura a, curso_escolar ce 
WHERE a.curso = ce.id
AND   a.id  IN (SELECT id_asignatura FROM alumno_se_matricula_asignatura WHERE id_alumno = (SELECT id FROM persona  WHERE tipo = 'alumno' AND nif = '26902806M'))

-- Otra forma
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin, p.nif FROM asignatura a
INNER JOIN alumno_se_matricula_asignatura ama ON ama.id_asignatura = a.id 
INNER JOIN curso_escolar ce ON ce.id = ama.id_curso_escolar
INNER JOIN persona p ON p.id = ama.id_alumno AND p.tipo = 'alumno' WHERE p.nif = '26902806M'

-- 8. Retorna un llistat amb el nom de tots els departaments que tenen professors que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT nombre FROM departamento  WHERE id IN (
	SELECT id_departamento FROM asignatura a, profesor p 
	WHERE a.id_profesor = p.id_profesor AND a.id_grado = (
			SELECT id FROM grado WHERE nombre = 'Grado en Ingeniería Informática (Plan 2015)'
		)
	)

-- 9. Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT * FROM persona WHERE id IN (SELECT id_alumno FROM alumno_se_matricula_asignatura WHERE id_curso_escolar = (SELECT id FROM curso_escolar WHERE anyo_inicio = 2018 AND anyo_fin = 2019))

-- Estas serían las asignaturas en las que se han matriculado los 3 alumnos del listado anterior
SELECT * FROM asignatura WHERE id IN (SELECT id_asignatura FROM alumno_se_matricula_asignatura WHERE id_curso_escolar = (SELECT id FROM curso_escolar WHERE anyo_inicio = 2018 AND anyo_fin = 2019))


-- Resolgui les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

-- 1. Retorna un llistat amb els noms de tots els professors i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT d.nombre, p.apellido1, p.apellido2, p.nombre
FROM persona p
LEFT JOIN profesor pr ON pr.id_profesor = p.id
LEFT JOIN departamento d ON pr.id_departamento = d.id
WHERE p.tipo = 'profesor'
ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre ASC

-- 2. Retorna un llistat amb els professors que no estan associats a un departament.
SELECT d.nombre AS `departamento`, p.apellido1, p.apellido2, p.nombre, p.tipo FROM persona p
LEFT JOIN profesor pr ON pr.id_profesor = p.id
LEFT JOIN departamento d ON pr.id_departamento = d.id WHERE d.nombre IS NULL AND p.tipo = 'profesor'
ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre ASC

-- Otra forma >> no teniendo en cuenta la tabla de departamento
SELECT p.apellido1, p.apellido2, p.nombre, p.tipo FROM persona p
LEFT JOIN profesor pr ON pr.id_profesor = p.id WHERE id_departamento IS NULL AND p.tipo = 'profesor'
ORDER BY p.apellido1, p.apellido2, p.nombre ASC

-- 3. Retorna un llistat amb els departaments que no tenen professors associats.
SELECT d.id, d.nombre FROM profesor pr 
RIGHT JOIN departamento d ON pr.id_departamento = d.id 
WHERE pr.id_profesor IS NULL

-- 4. Retorna un llistat amb els professors que no imparteixen cap assignatura.
SELECT p.id, p.nif, p.nombre, p.apellido1, p.apellido2 
FROM persona p
LEFT JOIN asignatura a ON a.id_profesor = p.id 
WHERE p.tipo = 'profesor' AND a.id IS NULL

-- 5. Retorna un llistat amb les assignatures que no tenen un professor assignat.
SELECT a.id, a.nombre 
FROM persona p
RIGHT JOIN asignatura a ON a.id_profesor = p.id AND p.tipo = 'profesor'
WHERE p.id IS NULL

-- 6. Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT d.id, d.nombre FROM departamento d 
LEFT JOIN profesor pr ON pr.id_departamento = d.id 
LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor
WHERE a.curso IS NULL AND pr.id_profesor IS NULL

-- Consultes resum:

-- 1. Retorna el nombre total d'alumnes que hi ha.
SELECT COUNT(*) AS 'Total Alumnos' FROM persona WHERE tipo = 'alumno'

-- 2. Calcula quants alumnes van néixer en 1999.
SELECT COUNT(*) AS 'Alumnos' FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = '1999'

-- 3. Calcula quants professors hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors associats i haurà d'estar ordenat de major a menor pel nombre de professors.
SELECT d.nombre, COUNT(*) AS num
 FROM persona p
LEFT JOIN profesor pr ON pr.id_profesor = p.id 
LEFT JOIN departamento d ON pr.id_departamento = d.id
WHERE p.tipo = 'profesor' 
GROUP BY d.nombre
ORDER BY  num ASC

-- 4. Retorna un llistat amb tots els departaments i el nombre de professors que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors associats. Aquests departaments també han d'aparèixer en el llistat.
SELECT d.id,  d.nombre, COUNT(p.tipo) AS num
 FROM profesor pr 
RIGHT JOIN departamento d ON pr.id_departamento = d.id
LEFT JOIN persona p ON p.id = pr.id_profesor 
GROUP BY d.id, d.nombre, p.tipo
ORDER BY num ASC

-- 5. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingui en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT g.nombre, COUNT(a.nombre) AS num
FROM grado g
LEFT JOIN asignatura a ON a.id_grado = g.id
GROUP BY g.nombre
ORDER BY a.nombre DESC

-- 6. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT nombre, num
FROM (
	SELECT g.nombre AS 'nombre', COUNT(a.nombre) AS 'num'
	FROM grado g
	LEFT JOIN asignatura a ON a.id_grado = g.id
	GROUP BY g.nombre 
	ORDER BY a.nombre DESC
) AS temporal
WHERE num > 40

-- 7. Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
-- 8. Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
-- 9. Retorna un llistat amb el nombre d'assignatures que imparteix cada professor. El llistat ha de tenir en compte aquells professors que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
-- 10. Retorna totes les dades de l'alumne més jove.
-- 11. Retorna un llistat amb els professors que tenen un departament associat i que no imparteixen cap assignatura.