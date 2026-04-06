-- 1.2 Programa que verifica se um número é múltiplo de 3 ou de 5 (usando IF ELSE)
DO $$
DECLARE
    valor INT := valor_aleatorio_entre(1, 100);
BEGIN
    RAISE NOTICE 'O valor gerado é: %', valor;
    IF valor % 3 = 0 THEN
        RAISE NOTICE '% é divisível por 3', valor;
    ELSIF valor % 5 = 0 THEN
        RAISE NOTICE '% é divisível por 5', valor;
    ELSE
        RAISE NOTICE '% não é divisível por 3 ou 5', valor;
    END IF;
END;
$$;