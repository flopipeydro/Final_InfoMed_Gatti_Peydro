--Pacientes con más de una consulta registrada
SELECT 
    p.id_paciente,
    p.nombre || ' ' || p.apellido AS nombre_completo,
    COUNT(c.id_consulta) AS cantidad_consultas
FROM 
    pacientes p
JOIN 
    consulta c ON p.id_paciente = c.id_paciente
GROUP BY 
    p.id_paciente, nombre_completo
HAVING 
    COUNT(c.id_consulta) > 1
ORDER BY 
    cantidad_consultas DESC;