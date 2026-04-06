-- 1.5 Função para calcular reajuste salarial de um funcionário (usando IF ELSE)
CREATE OR REPLACE FUNCTION calcular_reajuste(salario NUMERIC)
RETURNS TEXT AS $$
DECLARE
    resultado TEXT;
BEGIN
    IF salario <= 400 THEN
        resultado := 'Novo salario = ' || (salario + (salario * 0.15)) ||
                     ' Reajuste ganho = ' || salario * 0.15 || ' Percentual 15%';
    ELSIF salario <= 800 THEN
        resultado := 'Novo salario = ' || (salario + (salario * 0.12)) ||
                     ' Reajuste ganho = ' || salario * 0.12 || ' Percentual 12%';
    ELSIF salario <= 1200 THEN
        resultado := 'Novo salario = ' || (salario + (salario * 0.10)) ||
                     ' Reajuste ganho = ' || salario * 0.10 || ' Percentual 10%';
    ELSIF salario <= 2000 THEN
        resultado := 'Novo salario = ' || (salario + (salario * 0.07)) ||
                     ' Reajuste ganho = ' || salario * 0.07 || ' Percentual 07%';
    ELSE
        resultado := 'Novo salario = ' || (salario + (salario * 0.04)) ||
                     ' Reajuste ganho = ' || salario * 0.04 || ' Percentual 04%';
    END IF;
    RETURN resultado;
END;
$$ LANGUAGE plpgsql;