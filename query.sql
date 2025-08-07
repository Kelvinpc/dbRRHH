SELECT
    AST.idasistencia,
    AST.diamarcado,
    CONCAT(PER.apepaterno, ' ', PER.apematerno,' ', PER.nombres) 'trabajador',
    AST.entrada, AST.iniciorefrigerio, AST.finrefrigerio, AST.salida, AST.minnolaborados
    FROM asistencias AST
    INNER JOIN HORARIOS HOR ON HOR.idhorario = AST.idhorario
    INNER JOIN CONTRATOS CNT ON CNT.idcontrato = HOR.idcontrato
    INNER JOIN PERSONAS PER ON PER.idpersona = CNT.idpersona
    WHERE CNT.idcontrato = 1 AND (AST.diamarcado BETWEEN '2025-07-21' AND '2025-07-25')
	 ORDER BY AST.diamarcado;
	 
-- ALGORITMO PARA MARCADO Y CÁLCULO DE MINNOLABORADOS
-- 1. IDENTIFICAR EL DÍA ACTUAL (lunes, martes, miércoles, etc.)
SET lc_time_names = 'es_ES';
SELECT DATE_FORMAT(CURDATE(), '%W') AS day_name_spanish;

-- Buscamos el horario para el trabajador según el día de la semana (lunes, martes, miércoles, etc.)
-- Paso 2:
SELECT
	HOR.idhorario, HOR.dia, HOR.entrada, HOR.iniciorefrigerio, HOR.finrefrigerio, HOR.salida
	FROM horarios HOR
	INNER JOIN contratos CON ON CON.idcontrato = HOR.idcontrato
	WHERE 
		CON.idcontrato = 2 AND 
		CON.fechafin <= CURDATE() AND
		HOR.dia = DATE_FORMAT(CURDATE(), '%W') ;

-- Verificar las marcaciones del día actual
-- PASO 3: Identificar cuál de las 4 marcaciones está realizando
SELECT
	COUNT(AST.idasistencia) 'total'
	FROM asistencias AST
	INNER JOIN horarios HOR ON HOR.idhorario = AST.idhorario
	INNER JOIN contratos CON ON CON.idcontrato = HOR.idcontrato
	WHERE 
		AST.diamarcado = CURDATE() AND
		CON.idcontrato = 2;
	
	-- NOTA:
	-- Si la consulta anterior retorna 0, significa que este trabajador NO MARCÓ ASISTENCIA ESTE DÍA
	-- el algoritmo debe obtener entonces su horario y compararlo con la hora, aperturamos (INSERT INTO...) un nuevo
	-- registro de ENTRADA.
	
	-- Si la consulta anterior retorna 1, significa que este trabajar SI MARCÓ ESTE DÍA, entonces
	-- NO ESTÁ MARCANDO ENTRADA, debemos construir un algoritmo para determinar cuál de las 3 
	-- posibles marcaciones es: iniciorefrigerio, finrefrgierio, salida.

-- Crear un nuevo registro de ASISTENCIA
-- PASO 4:
SELECT * FROM asistencias;
INSERT INTO asistencias (diamarcado)
		

        SELECT

    p.idpersona,
    CONCAT(p.apepaterno, ' ', p.apematerno, ', ', p.nombres) AS trabajador,
    a.diamarcado,
        a.entrada AS entrada_real,
    a.iniciorefrigerio AS inicio_refrigerio_real,
    a.finrefrigerio AS fin_refrigerio_real,
    a.salida AS salida_real,
        GREATEST(TIMESTAMPDIFF(MINUTE, h.entrada, TIME(a.entrada)), 0) AS minutos_llegada_tarde,
    CASE 
        WHEN a.iniciorefrigerio IS NOT NULL THEN
            GREATEST(TIMESTAMPDIFF(MINUTE, TIME(a.iniciorefrigerio), h.iniciorefrigerio), 0)
        ELSE 0
    END AS minutos_inicio_refri_antes,
    CASE 
        WHEN a.finrefrigerio IS NOT NULL THEN
            GREATEST(TIMESTAMPDIFF(MINUTE, h.finrefrigerio, TIME(a.finrefrigerio)), 0)
        ELSE 0
    END AS minutos_retorno_tarde,
    CASE 
        WHEN a.salida IS NOT NULL THEN
            GREATEST(TIMESTAMPDIFF(MINUTE, TIME(a.salida), h.salida), 0)
        ELSE 0
    END AS minutos_salida_anticipada,
    (
        GREATEST(TIMESTAMPDIFF(MINUTE, h.entrada, TIME(a.entrada)), 0) +
        CASE 
            WHEN a.iniciorefrigerio IS NOT NULL THEN
                GREATEST(TIMESTAMPDIFF(MINUTE, TIME(a.iniciorefrigerio), h.iniciorefrigerio), 0)
            ELSE 0
        END +
        CASE 
            WHEN a.finrefrigerio IS NOT NULL THEN
                GREATEST(TIMESTAMPDIFF(MINUTE, h.finrefrigerio, TIME(a.finrefrigerio)), 0)
            ELSE 0
        END +
        CASE 
            WHEN a.salida IS NOT NULL THEN
                GREATEST(TIMESTAMPDIFF(MINUTE, TIME(a.salida), h.salida), 0)
            ELSE 0
        END
    ) AS total_minutos_no_laborados

FROM asistencias a
JOIN horarios h ON a.idhorario = h.idhorario
JOIN contratos c ON h.idcontrato = c.idcontrato
JOIN personas p ON c.idpersona = p.idpersona
ORDER BY p.idpersona, a.entrada;





SELECT * FROM horarios;

SELECT * 
    FROM asistencias AST
    INNER JOIN HORARIOS HOR ON HOR.idhorario = AST.idhorario
    INNER JOIN CONTRATOS CNT ON CNT.idcontrato = HOR.idcontrato
    INNER JOIN PERSONAS PES ON PES.idpersona = CNT.idpersona
    WHERE CNT.idcontrato = 1;

SELECT
    AST.idasistencia
    FROM asistencias AST
    INNER JOIN HORARIOS HOR ON HOR.idhorario = AST.idhorario
    INNER JOIN CONTRATOS CNT ON CNT.idcontrato = HOR.idcontrato
    INNER JOIN PERSONAS PES ON PES.idpersona = CNT.idpersona
    WHERE CNT.idcontrato = 1;