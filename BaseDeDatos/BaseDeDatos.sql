-- Creación de la tabla 'pacientes'
CREATE TABLE pacientes (
    id_paciente INTEGER PRIMARY KEY,  -- PK
    nombre TEXT,
    apellido TEXT,
    fecha_nacimiento DATE,
    sexo TEXT,
    telefono TEXT,
    email TEXT
);

-- Creación de la tabla 'consulta'
CREATE TABLE consulta (
    id_consulta INTEGER PRIMARY KEY,  -- PK
    id_paciente INTEGER,  -- FK
    fecha DATE,
    notas_medicas TEXT,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
);

-- Creación de la tabla 'diagnostico'
CREATE TABLE diagnostico (
    id_diagnostico INTEGER PRIMARY KEY,  -- PK
    id_paciente INTEGER,  -- FK
    id_consulta INTEGER,  -- FK
    codigo_snomed TEXT,
    descripcion TEXT,
    fecha_diagnostico DATE,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
    FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta)
);

-- Creación de la tabla 'resultados_laboratorio'
CREATE TABLE resultados_laboratorio (
    id_resultado INTEGER PRIMARY KEY,  -- PK
    id_paciente INTEGER,  -- FK
    id_consulta INTEGER,  -- FK
    tipo_prueba TEXT,
    valor TEXT,
    fecha_prueba DATE,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
    FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta)
);

-- Crear la tabla de Medicaciones
CREATE TABLE Medicaciones (
    id_medicacion INT PRIMARY KEY,
    id_paciente INT,
    id_diagnostico INT,
    id_consulta INT,
    nombre_medicacion VARCHAR(255),
    dosis_y_frecuencia VARCHAR(255),
    codigo_snomed VARCHAR(255),
    fecha_inicio DATE,
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_diagnostico) REFERENCES Diagnosticos(id_diagnostico),
    FOREIGN KEY (id_consulta) REFERENCES Consultas(id_consulta)
);

-- Insertar pacientes
INSERT INTO pacientes (id_paciente, nombre, apellido, fecha_nacimiento, sexo, telefono, email) VALUES
(1, 'Carlos', 'Sánchez', '1985-07-10', 'M', '555-0101', 'carlos.sanchez@example.com'),
(2, 'María', 'Gómez', '1990-02-20', 'F', '555-0102', 'maria.gomez@example.com'),
(3, 'Luis', 'Martínez', '1975-09-15', 'M', '555-0103', 'luis.martinez@example.com'),
(4, 'Ana', 'Fernández', '1965-12-05', 'F', '555-0104', 'ana.fernandez@example.com'),
(5, 'Pedro', 'Rodríguez', '1982-04-30', 'M', '555-0105', 'pedro.rodriguez@example.com'),
(6, 'Laura', 'Hernández', '1995-11-17', 'F', '555-0106', 'laura.hernandez@example.com'),
(7, 'Juan', 'López', '1978-03-25', 'M', '555-0107', 'juan.lopez@example.com'),
(8, 'Clara', 'González', '1988-06-30', 'F', '555-0108', 'clara.gonzalez@example.com'),
(9, 'Felipe', 'Pérez', '1992-01-11', 'M', '555-0109', 'felipe.perez@example.com'),
(10, 'Carla', 'Vásquez', '1980-05-22', 'F', '555-0110', 'carla.vasquez@example.com'),
(11, 'Ricardo', 'Díaz', '1962-08-05', 'M', '555-0111', 'ricardo.diaz@example.com'),
(12, 'Joaquín', 'Morales', '1987-03-13', 'M', '555-0112', 'joaquin.morales@example.com'),
(13, 'Silvia', 'Ruiz', '1970-07-17', 'F', '555-0113', 'silvia.ruiz@example.com'),
(14, 'Gabriel', 'Jiménez', '1983-10-25', 'M', '555-0114', 'gabriel.jimenez@example.com'),
(15, 'Lucía', 'Torres', '1996-12-19', 'F', '555-0115', 'lucia.torres@example.com');

-- Insertar consultas (3 pacientes con 3 consultas y 3 pacientes con 2 consultas)
INSERT INTO consulta (id_consulta, id_paciente, fecha, notas_medicas) VALUES
-- Paciente 1 (3 consultas)
(1, 1, '2024-01-10', 'Consulta de rutina, paciente con antecedentes de hipertensión.'),
(2, 1, '2024-03-15', 'Seguimiento de hipertensión, medicación ajustada.'),
(3, 1, '2024-05-20', 'Consulta de seguimiento de hipertensión, controles periódicos.'),
-- Paciente 2 (3 consultas)
(4, 2, '2024-02-20', 'Diagnóstico de diabetes tipo 2.'),
(5, 2, '2024-04-15', 'Control de glucosa, ajuste de medicación.'),
(6, 2, '2024-06-25', 'Chequeo general, seguimiento de diabetes.'),
-- Paciente 3 (3 consultas)
(7, 3, '2024-04-12', 'Consulta por dolor crónico en la espalda.'),
(8, 3, '2024-07-05', 'Control del dolor, se recomienda fisioterapia.'),
(9, 3, '2024-09-20', 'Seguimiento de dolor crónico, evaluación de progreso.'),
-- Paciente 4 (2 consultas)
(10, 4, '2024-06-01', 'Chequeo general, recomendación de control de colesterol.'),
(11, 4, '2024-08-10', 'Control de colesterol, seguimiento de dieta.'),
-- Paciente 5 (2 consultas)
(12, 5, '2024-08-10', 'Consulta por tos persistente.'),
(13, 5, '2024-09-15', 'Seguimiento de tos, paciente con antecedentes de EPOC.'),
-- Paciente 6 (2 consultas)
(14, 6, '2024-10-10', 'Consulta por dolor abdominal recurrente.'),
(15, 6, '2024-11-25', 'Seguimiento del dolor abdominal, tratamiento recomendado.'),
-- Paciente 7 (1 consulta)
(16, 7, '2024-07-20', 'Evaluación para cáncer de colon, antecedentes familiares.'),
-- Paciente 8 (1 consulta)
(17, 8, '2024-05-05', 'Chequeo preventivo.'),
-- Paciente 9 (1 consulta)
(18, 9, '2024-11-30', 'Diagnóstico de depresión y ansiedad.'),
-- Paciente 10 (1 consulta)
(19, 10, '2024-09-01', 'Consulta de seguimiento por cáncer de mama.'),
-- Paciente 11 (1 consulta)
(20, 11, '2024-08-12', 'Consulta por síntomas respiratorios crónicos.'),
-- Paciente 12 (1 consulta)
(21, 12, '2024-12-10', 'Chequeo para control de colesterol.'),
-- Paciente 13 (1 consulta)
(22, 13, '2024-11-15', 'Consulta para evaluación de cáncer de piel.'),
-- Paciente 14 (1 consulta)
(23, 14, '2024-09-25', 'Evaluación de cáncer de próstata.'),
-- Paciente 15 (1 consulta)
(24, 15, '2024-10-20', 'Chequeo de rutina con antecedentes familiares de cáncer.');

-- Insertar diagnósticos
INSERT INTO diagnostico (id_diagnostico, id_paciente, id_consulta, codigo_snomed, descripcion, fecha_diagnostico) VALUES
-- Paciente 1
(1, 1, 1, 'I10', 'Hipertensión esencial', '2024-01-10'),
(2, 1, 3, 'I10', 'Hipertensión controlada', '2024-05-20'),
-- Paciente 2
(3, 2, 4, 'E11', 'Diabetes tipo 2', '2024-02-20'),
(4, 2, 6, 'E11', 'Diabetes tipo 2 controlada', '2024-06-25'),
-- Paciente 3
(5, 3, 7, 'M54', 'Dolor lumbar crónico', '2024-04-12'),
(6, 3, 9, 'M54', 'Dolor lumbar crónico persistente', '2024-09-20'),
-- Paciente 4
(7, 4, 10, 'I10', 'Hipertensión', '2024-06-01'),
-- Paciente 5
(8, 5, 12, 'J44', 'EPOC', '2024-08-10'),
-- Paciente 6
(9, 6, 14, 'K59', 'Síndrome del colon irritable', '2024-10-10'),
(10, 6, 15, 'K59', 'Síndrome del colon irritable', '2024-11-25'),
-- Paciente 7
(11, 7, 16, 'C18', 'Cáncer de colon', '2024-07-20'),
-- Paciente 8
(12, 8, 17, 'Z00', 'Chequeo preventivo', '2024-05-05'),
-- Paciente 9
(13, 9, 18, 'F32', 'Depresión mayor', '2024-11-30'),
-- Paciente 10
(14, 10, 19, 'C50', 'Cáncer de mama', '2024-09-01'),
-- Paciente 11
(15, 11, 20, 'J44', 'Enfermedad pulmonar crónica', '2024-08-12'),
-- Paciente 12
(16, 12, 21, 'I10', 'Hipertensión', '2024-12-10'),
-- Paciente 13
(17, 13, 22, 'C43', 'Melanoma cutáneo', '2024-11-15'),
-- Paciente 14
(18, 14, 23, 'C61', 'Cáncer de próstata', '2024-09-25'),
-- Paciente 15
(19, 15, 24, 'Z80', 'Historia familiar de cáncer', '2024-10-20');

-- Insertar resultados de laboratorio
INSERT INTO resultados_laboratorio (id_resultado, id_paciente, id_consulta, tipo_prueba, valor, fecha_prueba) VALUES
-- Paciente 1
(1, 1, 1, 'Glucosa', '90 mg/dL', '2024-01-10'),
(2, 1, 3, 'Presión arterial', '130/80 mmHg', '2024-05-20'),
-- Paciente 2
(3, 2, 4, 'Hemoglobina', '13.5 g/dL', '2024-02-20'),
(4, 2, 6, 'Glucosa', '120 mg/dL', '2024-06-25'),
-- Paciente 3
(5, 3, 7, 'Radiografía lumbar', 'Sin fracturas', '2024-04-12'),
(6, 3, 9, 'Resonancia lumbar', 'Hernia discal leve', '2024-09-20'),
-- Paciente 4
(7, 4, 10, 'Colesterol total', '200 mg/dL', '2024-06-01'),
-- Paciente 5
(8, 5, 12, 'Espirometría', 'Volumen normal', '2024-08-10'),
-- Paciente 6
(9, 6, 14, 'Examen de sangre', 'Leucocitos 8.5 x 10^9/L', '2024-10-10'),
(10, 6, 15, 'Examen de sangre', 'Leucocitos 9.2 x 10^9/L', '2024-11-25'),
-- Paciente 7
(11, 7, 16, 'Biopsia de colon', 'Células malignas', '2024-07-20'),
-- Paciente 8
(12, 8, 17, 'Examen de sangre', 'Normal', '2024-05-05'),
-- Paciente 9
(13, 9, 18, 'Examen de sangre', 'Deficiencia de hierro', '2024-11-30'),
-- Paciente 10
(14, 10, 19, 'Biopsia mamaria', 'Células malignas', '2024-09-01'),
-- Paciente 11
(15, 11, 20, 'Examen de sangre', 'Normal', '2024-08-12'),
-- Paciente 12
(16, 12, 21, 'Colesterol', '220 mg/dL', '2024-12-10'),
-- Paciente 13
(17, 13, 22, 'Biopsia de piel', 'Células malignas', '2024-11-15'),
-- Paciente 14
(18, 14, 23, 'PSA', 'Elevado', '2024-09-25'),
-- Paciente 15
(19, 15, 24, 'Examen de sangre', 'Normal', '2024-10-20');

-- Insertar datos de medicaciones
INSERT INTO Medicaciones (id_medicacion, id_paciente, id_diagnostico, id_consulta, nombre_medicacion, dosis_y_frecuencia, codigo_snomed, fecha_inicio)
VALUES
-- Paciente 1
(1, 1, 1, 1, 'Paracetamol', '500 mg, Cada 8 horas', '387517000', '2024-11-01'),
(2, 1, 2, 2, 'Ibuprofeno', '400 mg, Cada 12 horas', '388484003', '2024-11-15'),
-- Paciente 2
(3, 2, 3, 3, 'Amoxicilina', '250 mg, Cada 6 horas', '392521000', '2024-10-15'),
(4, 2, 4, 4, 'Aspirina', '100 mg, Diario', '391739003', '2024-10-20'),
-- Paciente 3
(5, 3, 5, 5, 'Loratadina', '10 mg, Diario', '373873005', '2024-09-10'),
(6, 3, 6, 6, 'Ranitidina', '150 mg, Diario', '367559003', '2024-09-15'),
-- Paciente 4
(7, 4, 7, 7, 'Salbutamol', '100 mcg, Cada 4 horas', '428136003', '2024-08-10'),
(8, 4, 8, 8, 'Omeprazol', '20 mg, Diario', '38341003', '2024-07-25'),
-- Paciente 5
(9, 5, 9, 9, 'Omeprazol', '20 mg, Diario', '38341003', '2024-10-05'),
(10, 5, 10, 10, 'Loperamida', '2 mg, Cuando sea necesario', '413823006', '2024-11-25'),
-- Paciente 6
(11, 6, 11, 11, 'Quimioterapia', 'Dosis personalizada, Cada 2 semanas', '28252003', '2024-07-20'),
-- Paciente 7
(12, 7, 12, 12, 'Multivitamínicos', '1 cápsula, Diario', '107024003', '2024-05-05'),
-- Paciente 8
(13, 8, 13, 13, 'Sertralina', '50 mg, Diario', '310189000', '2024-11-30'),
-- Paciente 9
(14, 9, 14, 14, 'Quimioterapia', 'Dosis personalizada, Cada 3 semanas', '28252003', '2024-09-01'),
-- Paciente 10
(15, 10, 15, 15, 'Broncodilatadores', 'Alivio rápido, Cuando sea necesario', '314307000', '2024-08-12'),
-- Paciente 11
(16, 11, 16, 16, 'Atorvastatina', '20 mg, Diario', '10725007', '2024-12-10'),
-- Paciente 12
(17, 12, 17, 17, 'Interferón', 'Dosis personalizada, Diario', '89931005', '2024-11-15'),
-- Paciente 13
(18, 13, 18, 18, 'Bicalutamida', '50 mg, Diario', '42006003', '2024-09-25'),
-- Paciente 14
(19, 14, 19, 19, 'Analgésicos', 'Según sea necesario, Según sea necesario', '444141000', '2024-10-20');