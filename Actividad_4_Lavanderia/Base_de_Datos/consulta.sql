-- Configuración de claves foráneas mediante PRAGMA foreign_keys = ON
PRAGMA foreign_keys = ON;

-- Eliminación controlada de tablas anteriores, respetando el orden de dependencias
DROP TABLE IF EXISTS Solicitudes;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Servicios;

-- CREATE TABLE para CLIENTES
CREATE TABLE Clientes (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    telefono TEXT,
    direccion TEXT
);

-- CREATE TABLE para SERVICIOS
CREATE TABLE Servicios (
    id_servicio INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_servicio TEXT NOT NULL,
    descripcion TEXT,
    precio REAL NOT NULL CHECK (precio >= 0)
);

-- CREATE TABLE para SOLICITUDES
CREATE TABLE Solicitudes (
    id_solicitud INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER NOT NULL,
    id_servicio INTEGER NOT NULL,
    fecha TEXT NOT NULL,
    cantidad_prendas INTEGER NOT NULL CHECK (cantidad_prendas > 0),
    total REAL NOT NULL CHECK (total >= 0),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_servicio) REFERENCES Servicios(id_servicio)
);

-- INSERTS para Clientes
INSERT INTO Clientes (nombre, apellido, telefono, direccion) VALUES 
('Carlos', 'Martínez', '809-555-1234', 'Calle Principal #123, Santo Domingo'),
('María', 'García', '809-555-5678', 'Avenida Bolívar #456, Santiago'),
('Juan', 'López', '809-555-9012', 'Calle Las Flores #789, La Vega'),
('Ana', 'Sánchez', '829-555-3456', 'Calle El Sol #321, Puerto Plata'),
('Pedro', 'Ramírez', '849-555-7890', 'Calle La Luna #654, San Cristóbal');

-- INSERTS para Servicios
INSERT INTO Servicios (nombre_servicio, descripcion, precio) VALUES 
('Lavado Normal', 'Lavado estándar de ropa diaria', 50.00),
('Lavado en Seco', 'Servicio de lavado especializado sin agua', 150.00),
('Planchado', 'Planchado profesional de prendas', 30.00),
('Secado', 'Servicio de secado y suavizado', 20.00),
('Lavado de Ropa Delicada', 'Lavado especial para prendas delicadas', 80.00);

-- INSERTS para Solicitudes
INSERT INTO Solicitudes (id_cliente, id_servicio, fecha, cantidad_prendas, total) VALUES 
(1, 1, '2024-01-15', 5, 250.00),
(2, 2, '2024-01-16', 2, 300.00),
(3, 3, '2024-01-17', 3, 90.00),
(4, 4, '2024-01-18', 4, 80.00),
(5, 5, '2024-01-19', 1, 80.00);

-- Consultas SELECT básicas
SELECT * FROM Clientes;
SELECT * FROM Servicios;
SELECT * FROM Solicitudes;

-- Consulta SELECT utilizando INNER JOIN para relacionar las tres tablas
SELECT 
    C.nombre AS nombre_cliente,
    C.apellido AS apellido_cliente,
    S.nombre_servicio AS servicio_solicitado,
    Sol.fecha AS fecha_solicitud,
    Sol.cantidad_prendas AS cantidad_prendas,
    Serv.precio AS precio_servicio,
    Sol.total AS total_solicitud
FROM Clientes C
INNER JOIN Solicitudes Sol ON C.id_cliente = Sol.id_cliente
INNER JOIN Servicios Serv ON Sol.id_servicio = Serv.id_servicio
ORDER BY Sol.fecha;