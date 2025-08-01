# 🧙 Mini Taller SQL – Gremio “Espada y Pizza”

## 📋 Descripción del Proyecto

Este proyecto fue realizado por **Vanessa Gomez Lopez** y **Santiago Restrepo Arismendy** como parte de un mini taller SQL. Consiste en el diseño e implementación de una base de datos relacional para el gremio ficticio de aventureros **“Espada y Pizza”**, que busca modernizar su sistema de registro y gestión de misiones.

El objetivo principal fue construir una base de datos que permitiera:

- Registrar aventureros con su clase y nivel.
- Administrar misiones con su dificultad y recompensa.
- Controlar qué misiones ha realizado cada aventurero, y si fueron exitosas o fallidas.

Durante el desarrollo se aplicaron comandos SQL de:

- **DDL (Data Definition Language)**
- **DML (Data Manipulation Language)**
- **DQL (Data Query Language)**
- **DCL (Data Control Language)**

---

## 🏗️ Estructura de la Base de Datos

La base de datos consta de las siguientes tablas principales:

1. **Aventurero**
   - Contiene datos de los miembros del gremio: nombre, clase y nivel.
2. **Mision**
   - Incluye nombre, dificultad y recompensa en oro.
3. **RegistroMision**
   - Registra qué misiones ha realizado cada aventurero y si tuvo éxito o falló.

---

## 📦 Contenido del Script SQL (`GremioEspadaYPizza.sql`)

### 🔹 1. Creación de la Base de Datos y Tablas (DDL)
Se definieron las estructuras de las tablas, incluyendo claves primarias y foráneas.

### 🔹 2. Inserción de Datos (DML)
Se insertaron registros de ejemplo:
- 3 aventureros
- 3 misiones
- Varios intentos de misión con distintos resultados (`exito` o `fallo`)

### 🔹 3. Consultas SQL (DQL)
Se incluyeron consultas para responder a preguntas clave, tales como:
- ¿Qué aventurero ha tenido más éxito?
- ¿Cuál es la misión más popular?
- ¿Cuánto oro ha ganado cada aventurero?
- ¿Qué misiones aún no han sido asignadas?
- Otras estadísticas útiles para la administración del gremio.

### 🔹 4. Control de Permisos (DCL)
Se creó un usuario `aprendiz_mago` con **permisos de solo lectura** sobre la tabla `Mision`.

---

## 🧪 Cómo Probar el Proyecto

Puedes ejecutar el script en los siguientes entornos:

- **MySQL Workbench**
- Plataformas online como:
  - [OneCompiler](https://onecompiler.com/mysql)
  - [DB Fiddle](https://dbfiddle.uk/)

> ⚠️ Si usas plataformas online, comenta o elimina las líneas que contienen:
> - `CREATE DATABASE`
> - `USE`
> - `CREATE USER` y `GRANT`  
> Estos comandos requieren permisos de administrador que no están disponibles en dichos entornos.

---

## 👨‍💻 Autores

- **Vanessa Gomez Lopez**  
- **Santiago Restrepo Arismendy**
