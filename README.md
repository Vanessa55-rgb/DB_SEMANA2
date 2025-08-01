# Resumen de Actividades – Gremio “Espada y Pizza”

## Día 1 – Mini Taller SQL
- **Objetivo:** Diseñar una base de datos para registrar aventureros, misiones y resultados.
- **Actividades:**
  - Creación de tablas (`aventureros`, `misiones`, `aventurero_mision`) con relaciones y llaves foráneas.
  - Inserción de datos de ejemplo (3 aventureros, 3 misiones, varios resultados).
  - Consultas SQL para responder:
    - Aventurero con más éxitos.
    - Misión más popular.
    - Oro ganado por aventurero.
    - Aventurero con más fallos.
    - Cantidad de misiones realizadas.
    - Promedio de recompensas exitosas.
    - Misión con mayor recompensa.
    - Aventureros por clase.
    - Aventureros con nivel >= 10.
    - Misiones sin asignar.
  - Creación de usuario `aprendiz_mago` con permisos solo de lectura en `misiones`.

## Día 3 – Integración CSV y MySQL con Node.js
- **Objetivo:** Poblar la base desde un archivo CSV.
- **Actividades:**
  - Conversión del Excel de aventureros a CSV.
  - Investigación y uso de librerías:
    ```js
    const fs = require('fs');
    const csv = require('csv-parser');
    const mysql = require('mysql2/promise');
    ```
  - Lectura del CSV y carga de datos en las tablas MySQL usando Node.js.
