--Medicaciones recetadas para diagnósticos de enfermedades crónicas

SELECT 
    p.id_paciente,
    p.nombre || ' ' || p.apellido AS nombre_completo,
    d.codigo_snomed AS codigo_diagnostico,
    d.descripcion AS descripcion_diagnostico,
    m.nombre_medicacion,
    m.dosis_y_frecuencia,
    m.fecha_inicio
FROM 
    pacientes p
JOIN 
    diagnostico d ON p.id_paciente = d.id_paciente
JOIN 
    medicaciones m ON d.id_diagnostico = m.id_diagnostico
WHERE 
    d.codigo_snomed IN ('I10', 'E11', 'J44', 'C18', 'C50') -- Hipertensión, Diabetes tipo 2, EPOC, Cáncer de colon, Cáncer de mama
ORDER BY 
    m.fecha_inicio DESC;