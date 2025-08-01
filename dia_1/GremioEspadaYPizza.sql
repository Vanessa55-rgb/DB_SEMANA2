/* CREACIÓN DE LA BASE DE DATOS Y TABLAS (DDL) */
-- Crear la base de datos
CREATE DATABASE GremioEspadaYPizza;
USE GremioEspadaYPizza;

-- Tabla de aventureros
CREATE TABLE Aventurero (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    clase VARCHAR(30),
    nivel INT
);

-- Tabla de misiones
CREATE TABLE Mision (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    dificultad VARCHAR(20),
    recompensa INT
);

-- Tabla de registros de misiones
CREATE TABLE RegistroMision (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_aventurero INT,
    id_mision INT,
    resultado ENUM('exito', 'fallo'),
    FOREIGN KEY (id_aventurero) REFERENCES Aventurero(id),
    FOREIGN KEY (id_mision) REFERENCES Mision(id)
);


/* INSERCIÓN DE DATOS (DML) */
-- Insertar aventureros
INSERT INTO Aventurero (nombre, clase, nivel) VALUES 
('Aria la Valiente', 'Guerrero', 12),
('Luz de Estrellas', 'Mago', 9),
('Bruno el Sigiloso', 'Pícaro', 11);

-- Insertar misiones
INSERT INTO Mision (nombre, dificultad, recompensa) VALUES 
('Derrotar al Dragón Rojo', 'Alta', 1000),
('Recolectar Hierbas Curativas', 'Baja', 200),
('Explorar la Cueva Prohibida', 'Media', 500);

-- Insertar registros de misiones
INSERT INTO RegistroMision (id_aventurero, id_mision, resultado) VALUES 
(1, 1, 'exito'),  -- Aria completó Dragón
(1, 2, 'exito'),  -- Aria completó Hierbas
(1, 3, 'fallo'),  -- Aria falló Cueva

(2, 2, 'exito'),  -- Luz completó Hierbas
(2, 3, 'exito'),  -- Luz completó Cueva
(2, 1, 'fallo'),  -- Luz falló Dragón

(3, 3, 'fallo'),  -- Bruno falló Cueva
(3, 2, 'exito');  -- Bruno completó Hierbas

/* CONSULTAS (DQL)*/
-- 1. ¿Qué aventurero ha completado más misiones con éxito?
SELECT A.nombre, COUNT(*) AS exitos
FROM RegistroMision R
JOIN Aventurero A ON R.id_aventurero = A.id
WHERE R.resultado = 'exito'
GROUP BY A.id
ORDER BY exitos DESC
LIMIT 1;

-- 2. ¿Cuál es la misión más popular?
SELECT M.nombre, COUNT(*) AS veces_asignada
FROM RegistroMision R
JOIN Mision M ON R.id_mision = M.id
GROUP BY M.id
ORDER BY veces_asignada DESC
LIMIT 1;

-- 3. ¿Cuánto oro ha ganado cada aventurero?
SELECT A.nombre, SUM(M.recompensa) AS oro_total
FROM RegistroMision R
JOIN Aventurero A ON R.id_aventurero = A.id
JOIN Mision M ON R.id_mision = M.id
WHERE R.resultado = 'exito'
GROUP BY A.id;

-- 4. ¿Qué aventurero ha fallado más misiones?
SELECT A.nombre, COUNT(*) AS fallos
FROM RegistroMision R
JOIN Aventurero A ON R.id_aventurero = A.id
WHERE R.resultado = 'fallo'
GROUP BY A.id
ORDER BY fallos DESC
LIMIT 1;

-- 5. ¿Cuántas misiones ha realizado cada aventurero, sin importar el resultado?
SELECT A.nombre, COUNT(*) AS total_misiones
FROM RegistroMision R
JOIN Aventurero A ON R.id_aventurero = A.id
GROUP BY A.id;

-- 6. ¿Cuál es el promedio de recompensa de todas las misiones completadas con éxito?
SELECT AVG(M.recompensa) AS promedio_recompensa
FROM RegistroMision R
JOIN Mision M ON R.id_mision = M.id
WHERE R.resultado = 'exito';

-- 7. ¿Cuál es la misión con mayor recompensa?
SELECT nombre, recompensa
FROM Mision
ORDER BY recompensa DESC
LIMIT 1;

-- 8. ¿Cuántos aventureros hay por clase (guerrero, mago, etc.)?
SELECT clase, COUNT(*) AS cantidad
FROM Aventurero
GROUP BY clase;

-- 9. ¿Quiénes son los aventureros con nivel mayor o igual a 10?
SELECT nombre, nivel
FROM Aventurero
WHERE nivel >= 10;

-- 10. ¿Hay misiones que aún no han sido asignadas a ningún aventurero?
SELECT nombre
FROM Mision
WHERE id NOT IN (
    SELECT DISTINCT id_mision FROM RegistroMision
);

/*  SEGURIDAD BÁSICA (DCL) */
-- Crear usuario aprendiz_mago con solo permisos de lectura sobre misiones
CREATE USER 'aprendiz_mago'@'localhost' IDENTIFIED BY 'Qwe.123*';

-- Otorgar solo permisos de SELECT sobre la tabla Mision
GRANT SELECT ON GremioEspadaYPizza.Mision TO 'aprendiz_mago'@'localhost';