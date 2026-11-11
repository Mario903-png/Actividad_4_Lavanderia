# Actividad 4: Diseño de Base de Datos para Lavandería

## Objetivo del Proyecto

Este proyecto representa el diseño de una base de datos relacional para administrar una lavandería. El sistema permite gestionar clientes, servicios ofrecidos y solicitudes de servicios realizadas por los clientes.

## Descripción de las Entidades

### 1. CLIENTES
**Tabla principal que almacena la información de los clientes de la lavandería.**

- **id_cliente**: Clave primaria, identificador único del cliente (INTEGER)
- **nombre**: Nombre del cliente (TEXT, NOT NULL)
- **apellido**: Apellido del cliente (TEXT, NOT NULL)
- **telefono**: Número de contacto del cliente (TEXT)
- **direccion**: Dirección del cliente (TEXT)

### 2. SERVICIOS
**Tabla que almacena los servicios ofrecidos por la lavandería.**

- **id_servicio**: Clave primaria, identificador único del servicio (INTEGER)
- **nombre_servicio**: Nombre del servicio (TEXT, NOT NULL)
- **descripcion**: Descripción detallada del servicio (TEXT)
- **precio**: Costo del servicio (REAL, NOT NULL, CHECK: precio >= 0)

### 3. SOLICITUDES
**Tabla intermedia que representa la relación muchos a muchos entre clientes y servicios.**

- **id_solicitud**: Clave primaria, identificador único de la solicitud (INTEGER)
- **id_cliente**: Clave foránea que referencia a CLIENTES (INTEGER, NOT NULL)
- **id_servicio**: Clave foránea que referencia a SERVICIOS (INTEGER, NOT NULL)
- **fecha**: Fecha en que se realizó la solicitud (TEXT, NOT NULL)
- **cantidad_prendas**: Número de prendas a lavar (INTEGER, NOT NULL, CHECK: cantidad_prendas > 0)
- **total**: Monto total de la solicitud (REAL, NOT NULL, CHECK: total >= 0)

## Relaciones entre Tablas

- **CLIENTES (1) → (N) SOLICITUDES**: Un cliente puede realizar múltiples solicitudes
- **SERVICIOS (1) → (N) SOLICITUDES**: Un servicio puede ser solicitado por múltiples clientes

Esto representa una relación muchos a muchos entre CLIENTES y SERVICIOS, resuelta mediante la tabla SOLICITUDES.

## Tecnologías Utilizadas

- **SQLite**: Sistema de gestión de bases de datos relacional (motor sin servidor)
- **SQL**: Lenguaje de consulta estructurada
- **Draw.io**: Herramienta para creación de diagramas ER y modelos relacionales
- **HTML**: Página de presentación

## Estructura de los Archivos

Actividad_4_Lavanderia/
├── Diagramas/
│   ├── Diagrama_ER.drawio      # Diagrama Entidad-Relación en formato Draw.io
│   ├── Modelo_Relacional.drawio # Modelo relacional en formato Draw.io
│   └── Diagramas_Actividad_4.png # Imagen resumen de ambos diagramas
├── Base_de_Datos/
│   ├── consulta.sql           # Archivo SQL con todas las sentencias DDL, DML y consultas
│   └── Lavanderia.db          # Archivo de base de datos SQLite generado
├── Presentacion/
│   └── index.html             # Página de presentación académica
└── README.md                  # Este archivo de documentación

## Cómo Abrir la Base de Datos

1. Instale SQLite si no lo tiene instalado:
   - **Windows**: Descargue desde https://www.sqlite.org/download.html
   - **macOS/Linux**: Use el gestor de paquetes del sistema

2. Abra la terminal/CLI y navegue al directorio `Base_de_Datos`

3. Inicie SQLite: `sqlite3 Lavanderia.db`

4. La base de datos ya contiene los datos de ejemplo y está lista para su consulta

## Cómo Ejecutar el Archivo SQL

1. Abra SQLite y conéctese a la base de datos: `sqlite3 Lavanderia.db`

2. En SQLite, ejecute el contenido del archivo `consulta.sql`:
   - Puede copiar y pegar todo el contenido
   - O cargar el archivo usando: `.read Base_de_Datos/consulta.sql`

3. El archivo incluye las sentencias CREATE TABLE, INSERTS y consultas SELECT

## Cómo Visualizar los Diagramas

1. **Draw.io**: Abra draw.io (https://draw.io) o descargue la aplicación de escritorio

2. **Cargar archivos**: Importe los archivos `.drawio` desde la carpeta `Diagramas/`

3. **Visualización**: Los diagramas muestran:
   - Las tres entidades con sus respectivos atributos
   - Claves primarias (PK) y foráneas (FK)
   - Relaciones cardinalidad 1:N
   - Modelo relacional con tablas físicas

## Pruebas y Validación

El archivo `consulta.sql` incluye:
- Configuración de claves foráneas
- Eliminación controlada de tablas anteriores
- Creación de todas las tablas con restricciones adecuadas
- Datos de ejemplo (5 registros por tabla)
- Consultas SELECT básicas
- Consulta INNER JOIN que relaciona las tres tablas

## Notas Técnicas

- Las claves foráneas están protegidas con `PRAGMA foreign_keys = ON`
- Todas las restricciones incluyen cláusulas CHECK para validación de datos
- Los precios y cantidades siempre son no negativos
- La relación muchos a muchos se implementa correctamente mediante la tabla intermedia

## Version Control

El proyecto está preparado para Git. Puede inicializar un repositorio:

```bash
cd Actividad_4_Lavanderia
git init
git add .
git commit -m "Commit inicial - Diseño de base de datos para lavandería"
```