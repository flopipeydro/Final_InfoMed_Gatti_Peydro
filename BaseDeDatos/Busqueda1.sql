--Medicaciones activas de pacientes con citas pendientes
SELECT 
    p.id_paciente,
    p.nombre || ' ' || p.apellido AS nombre_completo,
    m.nombre_medicacion,
    m.dosis_y_frecuencia,
    c.fecha AS fecha_consulta_pendiente
FROM 
    pacientes p
JOIN 
    medicaciones m ON p.id_paciente = m.id_paciente
JOIN 
    consulta c ON p.id_paciente = c.id_paciente
WHERE 
    m.fecha_inicio >= DATE('now', '-30 days') 
    AND c.fecha > DATE('now')
ORDER BY 
    c.fecha ASC;
