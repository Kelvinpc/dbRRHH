

INSERT INTO departamentos (departemento) VALUES
('Amazonas'),
('Áncash'),
('Apurímac'),
('Arequipa'),
('Ayacucho'),
('Cajamarca'),
('Callao'),
('Cusco'),
('Huancavelica'),
('Huánuco'),
('Ica'),
('Junín'),
('La Libertad'),
('Lambayeque'),
('Lima'),
('Loreto'),
('Madre de Dios'),
('Moquegua'),
('Pasco'),
('Piura'),
('Puno'),
('San Martín'),
('Tacna'),
('Tumbes'),
('Ucayali');



INSERT INTO provincias (provincia, iddepartamento)
VALUES 
-- Lima (id 1)
('Lima', 1),
('Huaral', 1),
('Barranca', 1),
('Cañete', 1),
('Arequipa', 2),
('Camaná', 2),
('Caravelí', 2),
('Cusco', 3),
('La Convención', 3),
('Urubamba', 3),
('Trujillo', 4),
('Chepén', 4),
('Pacasmayo', 4),
('Piura', 5),
('Sullana', 5),
('Talara', 5),
('Huancayo', 6),
('Tarma', 6),
('Chanchamayo', 6),
('Cajamarca', 7),
('Jaén', 7),
('Cutervo', 7),
('Huaraz', 8),
('Santa', 8),
('Huaylas', 8),('Ica', 9),
('Chincha', 9),
('Pisco', 9),
('Puno', 10),
('Juliaca', 10),
('Azángaro', 10);



INSERT INTO distritos (distrito, idprovincia) VALUES
('Lima', 1),
('Ate', 1),
('San Juan de Lurigancho', 1),
('Miraflores', 1),
('Huaral', 2),
('Aucallama', 2),
('Chancay', 2),
('Barranca', 3),
('Paramonga', 3),
('Pativilca', 3),
('San Vicente de Cañete', 4),
('Imperial', 4),
('Asia', 4),
('Arequipa', 5),
('Cayma', 5),
('Cerro Colorado', 5),
('Ica', 26),
('Parcona', 26),
('La Tinguiña', 26),
('Chincha Alta', 27),
('Grocio Prado', 27),
('Sunampe', 27),
('Pisco', 28),
('San Andrés', 28),
('Paracas', 28);



INSERT INTO sucursales (sucursal, direccion, referencia, iddistrito)
VALUES ('Yonda Perú', 'Panamericana Sur Km 199, puerta 201', 'Frente a grifo Primax', 20);



INSERT INTO areas (area, idsucursal) VALUES
('Recursos Humanos', 1),
('Marketing', 1),
('Ventas', 1),
('Logística', 1),
('Contabilidad', 1),
('Finanzas', 1),
('Sistemas', 1),
('Atención al Cliente', 1),
('Compras', 1),
('Servicio Técnico', 1),
('Gerencia', 1),
('Calidad', 1),
('Producción', 1),
('Legal', 1);


INSERT INTO cargos (cargo, idarea) VALUES
-- Recursos Humanos
('Jefe de Recursos Humanos', 1),
('Asistente de Recursos Humanos', 1),
-- Marketing
('Coordinador de Marketing', 2),
('Diseñador Gráfico', 2),
-- Ventas
('Jefe de Ventas', 3),
('Ejecutivo de Ventas', 3),
('Asesor Comercial', 3),
-- Logística
('Encargado de Almacén', 4),
('Supervisor de Logística', 4),
-- Contabilidad
('Contador General', 5),
('Asistente Contable', 5),
-- Finanzas
('Analista Financiero', 6),
('Jefe de Finanzas', 6),
-- Sistemas
('Administrador de Sistemas', 7),
('Técnico de Soporte', 7),
('Desarrollador de Software', 7),
-- Atención al Cliente
('Representante de Atención', 8),
('Supervisor de Atención', 8),
-- Compras
('Jefe de Compras', 9),
('Analista de Compras', 9),
-- Servicio Técnico
('Técnico de Reparaciones', 10),
('Supervisor de Servicio', 10),
-- Gerencia General
('Gerente General', 11),
('Asistente de Gerencia', 11),
-- Calidad
('Inspector de Calidad', 12),
('Jefe de Control de Calidad', 12),
-- Producción
('Operario de Producción', 13),
('Supervisor de Producción', 13),
-- Legal
('Asesor Legal', 14),
('Abogado Corporativo', 14);




INSERT INTO personas (
    apepaterno,apematerno, nombres, fechanac, genero, tipodoc, numdoc,
    direccion, referencia, estadocivil, iddistrito
) VALUES
-- 1. GIAN FRANCO ANTON FELIX
('ANTON','FELIX', 'GIAN FRANCO', '2002-05-14', 'M', 'DNI', '72145632',
 'Av. Los Libertadores 123', 'Frente al parque central', 'Soltero', 1),
-- 2. Kelvin Pipa Castilla
('PIPA','CASTILLA', 'KELVIN', '2001-11-22', 'M', 'DNI', '75896321',
 'Jr. Las Orquídeas 456', 'A espaldas del hospital', 'Soltero', 2),
-- 3. Erick Jhampier Pérez Saravia
('PEREZ','SARAVIA', 'ERICK JHAMPIER', '1999-07-09', 'M', 'DNI', '73456891',
 'Calle Los Sauces 789', 'Cerca al colegio nacional', 'Soltero', 3);




INSERT INTO contratos (
    fechainicio, fechafin, sueldobase, toleranciadiaria, toleranciamensual,
    idpersona, idcargo
) VALUES
-- Contrato de Gian Franco
('2024-01-01', '2024-12-31', 1400.00, 10, 30,
 1, 1),
-- Contrato de Kelvin
('2024-02-01', '2024-12-31', 1400.00, 10, 25,
 2, 2),
-- Contrato de Erick
('2024-03-01', '2024-12-31', 1400.00, 5, 20,
 3, 3);



 INSERT INTO horarios (dia, entrada, iniciorefrigerio, finrefrigerio, salida, idcontrato)
VALUES ('L', '08:00:00', '12:00:00', '13:30:00', '18:00:00', 1);
INSERT INTO horarios (dia, entrada, iniciorefrigerio, finrefrigerio, salida, idcontrato)
VALUES ('M', '08:00:00', '12:00:00', '13:30:00', '18:00:00', 1);
INSERT INTO horarios (dia, entrada, iniciorefrigerio, finrefrigerio, salida, idcontrato)
VALUES ('X', '08:00:00', '12:00:00', '13:30:00', '18:00:00', 1);
INSERT INTO horarios (dia, entrada, iniciorefrigerio, finrefrigerio, salida, idcontrato)
VALUES ('J', '08:00:00', '12:00:00', '13:30:00', '18:00:00', 1);
INSERT INTO horarios (dia, entrada, iniciorefrigerio, finrefrigerio, salida, idcontrato)
VALUES ('V', '08:00:00', '12:00:00', '13:30:00', '18:00:00', 1);

-- KELVIN (Contrato ID 2): refrigerio de 13:00 a 14:30
INSERT INTO horarios (dia, entrada, iniciorefrigerio, finrefrigerio, salida, idcontrato)
VALUES ('L', '08:00:00', '13:00:00', '14:30:00', '18:00:00', 2);
INSERT INTO horarios (dia, entrada, iniciorefrigerio, finrefrigerio, salida, idcontrato)
VALUES ('M', '08:00:00', '13:00:00', '14:30:00', '18:00:00', 2);
INSERT INTO horarios (dia, entrada, iniciorefrigerio, finrefrigerio, salida, idcontrato)
VALUES ('X', '08:00:00', '13:00:00', '14:30:00', '18:00:00', 2);
INSERT INTO horarios (dia, entrada, iniciorefrigerio, finrefrigerio, salida, idcontrato)
VALUES ('J', '08:00:00', '13:00:00', '14:30:00', '18:00:00', 2);
INSERT INTO horarios (dia, entrada, iniciorefrigerio, finrefrigerio, salida, idcontrato)
VALUES ('V', '08:00:00', '13:00:00', '14:30:00', '18:00:00', 2);
INSERT INTO horarios (dia, entrada, iniciorefrigerio, finrefrigerio, salida, idcontrato)
VALUES ('S', '08:00:00', 'NULL', 'NULL', '13:00:00', 2);


INSERT INTO asistencias (
    diamarcado, entrada, iniciorefrigerio, finrefrigerio, salida,
    minnolaborados,tipoasistencia, idhorario
) VALUES
('2025-07-14','07:58:00', '11:45:00', '13:15:00', '18:00:00', 0,"regular", 1),
('2025-07-15','08:02:00', '12:00:00', '13:30:00', '18:03:00', 0,"regular", 2),
('2025-07-16','08:00:00', '11:50:00', '13:20:00', '17:58:00', 0,"regular", 3),
('2025-07-17','08:01:00', '12:10:00', '13:40:00', '18:00:00', 0,"regular", 4),
('2025-07-18','07:56:00', '12:05:00', '13:35:00', '18:01:00', 0,"regular", 5);

INSERT INTO asistencias (
    diamarcado, entrada, iniciorefrigerio, finrefrigerio, salida,
    minnolaborados,tipoasistencia, idhorario
) VALUES
('2025-07-21', '07:58:00', '11:45:00', '13:15:00', '18:00:00', 0,"regular", 1),
('2025-07-22', '08:02:00', '12:00:00', '13:30:00', '18:03:00', 0,"regular", 2),
('2025-07-23', '08:00:00', '11:50:00', '13:20:00', '17:58:00', 0,"regular", 3),
('2025-07-24', '08:01:00', '12:10:00', '13:40:00', '18:00:00', 0,"regular", 4),
('2025-07-25', '07:56:00', '12:05:00', '13:35:00', '18:01:00', 0,"regular", 5);

INSERT INTO asistencias (
    diamarcado, entrada, iniciorefrigerio, finrefrigerio, salida,
    minnolaborados, tipoasistencia, idhorario
) VALUES
('2025-07-14', '08:12:00', '12:00:00', '13:30:00', '18:00:00', 12, "regular", 6),
('2025-07-15', '08:00:00', '12:10:00', '13:40:00', '17:45:00', 15, "regular", 7),
('2025-07-16', '08:05:00', '11:55:00', '13:25:00', '17:50:00', 15, "regular", 8),
('2025-07-17', '08:00:00', '12:05:00', '13:35:00', '18:00:00', 0, "regular", 9),
('2025-07-18', '08:10:00', '12:02:00', '13:32:00', '18:03:00', 10, "regular", 10),
('2025-07-19', '08:10:00', NULL, NULL, '13:03:00', 10, "regular", 11);



INSERT INTO asistencias (
    diamarcado, entrada, iniciorefrigerio, finrefrigerio, salida,
    minnolaborados, tipoasistencia, idhorario
) VALUES
('2025-07-21', '08:12:00', '12:00:00', '13:30:00', '18:00:00', 12, "regular", 6),
('2025-07-22', '08:00:00', '12:10:00', '13:40:00', '17:45:00', 15, "regular", 7),
('2025-07-23', '08:05:00', '11:55:00', '13:25:00', '17:50:00', 15, "regular", 8),
('2025-07-24', '08:00:00', '12:05:00', '13:35:00', '18:00:00', 0, "regular", 9),
('2025-07-25', '08:10:00', '12:02:00', '13:32:00', '18:03:00', 10, "regular", 10),
('2025-07-26', '08:10:00', NULL, NULL, '13:03:00', 10, "regular", 11);



INSERT INTO usuarios (nombreusuario, claveacceso, idcontrato
) VALUES
-- Usuario: Gian Franco Anton Felix
('ganton', '123456', 1),
-- Usuario: Kelvin Pipa Castilla
('kpipa', '123456', 2),
-- Usuario: Erick Jhampier Perez Saravia
('eperez', '123456', 3);

-- Feriados en Perú - Año 2025
INSERT INTO feriados (aniocurso, mes, dia, nombreferiado) VALUES
(2025, 1, 1,   'Año Nuevo'),
(2025, 3, 24,  'Jueves Santo'),
(2025, 3, 25,  'Viernes Santo'),
(2025, 5, 1,   'Día del Trabajo'),
(2025, 6, 29,  'San Pedro y San Pablo'),
(2025, 7, 28,  'Independencia del Perú'),
(2025, 7, 29,  'Fiesta Patriótica'),
(2025, 8, 30,  'Santa Rosa de Lima'),
(2025, 10, 8,  'Combate de Angamos'),
(2025, 11, 1,  'Todos los Santos'),
(2025, 12, 8,  'Inmaculada Concepción'),
(2025, 12, 25, 'Navidad');


-- ONP
INSERT INTO sistemapensiones (
    sistpensiones, nombre, pctjaportetrabajor, pctjcomision, pctjseguro, pctjaporteempleador, 
    fechainicio, fechafin
) VALUES (
    'ONP', 'Oficina de Normalización Previsional', 
    13, 0, 0, 13, 
    '2000-01-01 00:00:00', '2099-12-31 23:59:59'
);

-- AFP Prima (como ejemplo de AFP)
INSERT INTO sistemapensiones (
    sistpensiones, nombre, pctjaportetrabajor, pctjcomision, pctjseguro, pctjaporteempleador, 
    fechainicio, fechafin
) VALUES (
    'AFP', 'Prima AFP', 
    10, 1.74, 1.35, 13,
    '2000-01-01 00:00:00', '2099-12-31 23:59:59'
);