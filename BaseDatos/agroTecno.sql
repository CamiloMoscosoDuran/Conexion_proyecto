-- 1. Crear la Base de Datos
CREATE DATABASE agroTecno_db;

USE agroTecno_db;


-- 2. Crear Tabla Insumo
   CREATE TABLE insumo (
        id_insumo INT PRIMARY KEY IDENTITY(1,1),
        nombre VARCHAR(50) NOT NULL,
        descripcion VARCHAR(255) NULL,
        stock_actual DECIMAL(12,2) NOT NULL,
        stock_minimo DECIMAL(12,2) NOT NULL,
        medida VARCHAR(5) NOT NULL, 
        fecha_caducidad DATE NULL,
        ubicacion VARCHAR(MAX) NULL, 
        estado BIT NOT NULL DEFAULT 1, -- Usamos BIT para el Boolean de Insumo
        created_at DATETIME DEFAULT GETDATE(),
        updated_at DATETIME DEFAULT GETDATE(),
        deleted_at DATETIME NULL,
        restored_at DATETIME NULL
    );

-- 3. Crear Tabla Client
    CREATE TABLE client (
        client_id INT PRIMARY KEY IDENTITY(1,1),
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        document_type CHAR(3) NOT NULL,
        document_number VARCHAR(15) NOT NULL,
        phone CHAR(9),
        email VARCHAR(150),
        registration_date DATETIME NOT NULL DEFAULT GETDATE(),
        estado BIT NOT NULL DEFAULT 1, -- Coincide con tu String en Java
        created_at DATETIME DEFAULT GETDATE(),
        updated_at DATETIME DEFAULT GETDATE(),
        deleted_at DATETIME NULL,
        restored_at DATETIME NULL
    );

-- 4. Crear Tabla Formula
    CREATE TABLE formula (
        formula_id INT PRIMARY KEY IDENTITY(1,1),
        name VARCHAR(100) NOT NULL,
        description VARCHAR(MAX),
        standard_batch DECIMAL(12, 2),
        production_time INT, 
        estado BIT NOT NULL DEFAULT 1, -- Coincide con tu String en Java
        created_at DATETIME DEFAULT GETDATE(),
        updated_at DATETIME DEFAULT GETDATE(),
        deleted_at DATETIME NULL,
        restored_at DATETIME NULL
    );

-- 5. Insertar datos de prueba para verificar el GET
INSERT INTO insumo (nombre, descripcion, stock_actual, stock_minimo, medida, fecha_caducidad, ubicacion, estado)
VALUES 
    ('Semilla Maíz', 'Semilla de maíz de alta calidad para siembra', 100.50, 20.00, 'KG', '2026-12-31', 'Almacén A', 1),
    ('Fertilizante NPK', 'Fertilizante nitrogenado, fosfórico y potásico para cultivos', 250.00, 50.00, 'KG', '2025-06-30', 'Almacén B', 1),
    ('Pesticida Orgánico', 'Pesticida de origen orgánico sin químicos sintéticos', 45.75, 10.00, 'LT', '2026-03-15', 'Bodega C', 1),
    ('Herbicida', 'Herbicida para control de malezas no deseadas', 180.25, 30.00, 'LT', '2025-09-20', 'Bodega D', 1),
    ('Cal Agrícola', 'Cal para corrección de pH del suelo', 500.00, 100.00, 'KG', NULL, 'Almacén E', 1);

-- 2. Inserción en la tabla CLIENT
-- Nota: Aquí mantenemos el client_id ya que no lo definiste como IDENTITY en tu CREATE TABLE
INSERT INTO client (first_name, last_name, document_type, document_number, phone, email, registration_date, estado)
VALUES
    ('Juan', 'Pérez', 'DNI', '12345678', '987654321', 'juan.perez@example.com', '2026-01-10 08:00:00', '1'),
    ('María', 'González', 'DNI', '87654321', '987654322', 'maria.gonzalez@example.com', '2026-02-15 09:30:00', '1'),
    ('Carlos', 'Ramírez', 'DNI', '11223344', '987654323', 'carlos.ramirez@example.com', '2026-03-05 10:15:00', '1'),
    ('Ana', 'Lopez', 'DNI', '44332211', '987654324', 'ana.lopez@example.com', '2026-03-20 14:00:00', '1'),
    ('Luis', 'Martínez', 'DNI', '55667788', '987654325', 'luis.martinez@example.com', '2026-04-01 11:45:00', '1');

-- 3. Inserción en la tabla FORMULA
INSERT INTO formula (name, description, standard_batch, production_time, estado)
VALUES 
    ('Delcroix Calcio-Boro', 'Fertilizante foliar con Calcio, Boro, Zinc y Magnesio.', 100.00, 24, '1'),
    ('Delcroix Magnesio', 'Fitonutriente con 10% Mg y 13% N. Corrige clorosis.', 100.00, 24, '1'),
    ('Delcroix Potasio', 'Fertilizante con 45% K2O. Mejora el tamaño y color.', 100.00, 24, '1'),
    ('Delcroix Algas', 'Bioestimulante de Ascophyllum nodosum.', 100.00, 24, '1'),
    ('Ferti Taurus', 'Bioactivador con 7.5% Ácidos Fúlvicos.', 100.00, 24, '1'),
    ('Delcroix Calcio-Boro V2', 'Fertilizante foliar con 20% Ca y 2% B.', 100.00, 24, '1');


SELECT * FROM insumo;
SELECT * FROM client;
SELECT * FROM formula;
