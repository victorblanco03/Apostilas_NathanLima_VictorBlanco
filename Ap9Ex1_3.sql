-- 1.3 Função de menu para operações de soma, subtração, multiplicação e divisão (usando IF ELSE)
CREATE OR REPLACE FUNCTION menu(operacao INTEGER, op1 INTEGER, op2 INTEGER)
RETURNS TEXT AS $$
DECLARE
    resultado TEXT;
BEGIN
    IF operacao = 1 THEN
        resultado := op1 || ' + ' || op2 || ' = ' || (op1 + op2);
    ELSIF operacao = 2 THEN
        resultado := op1 || ' - ' || op2 || ' = ' || (op1 - op2);
    ELSIF operacao = 3 THEN
        resultado := op1 || ' * ' || op2 || ' = ' || (op1 * op2);
    ELSIF operacao = 4 THEN
        IF op2 = 0 THEN
            resultado := 'Erro: divisão por zero!';
        ELSE
            resultado := op1 || ' / ' || op2 || ' = ' || (op1 / op2);
        END IF;
    ELSE
        resultado := 'Erro: operação inválida!';
    END IF;
    RETURN resultado;
END;
$$ LANGUAGE plpgsql;