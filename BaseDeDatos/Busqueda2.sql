--Estadísticas poblacionales de enfermedades crónicas

SELECT 
    d.codigo_snomed,
    COUNT(d.id_diagnostico) AS cantidad_diagnosticos,
    ROUND(100.0 * COUNT(d.id_diagnostico) / (SELECT COUNT(*) FROM diagnostico), 2) AS porcentaje
FROM 
    diagnostico d
GROUP BY 
    d.codigo_snomed
ORDER BY 
    cantidad_diagnosticos DESC;
