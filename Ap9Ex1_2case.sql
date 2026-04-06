-- 1.2 Programa que verifica se um número é múltiplo de 3 ou de 5 (usando CASE)
DO $$
DECLARE
    valor INT;
BEGIN
    valor := valor_aleatorio_entre(1, 100);

    RAISE NOTICE 'O valor gerado é: %', valor;

    CASE
        WHEN valor % 3 = 0 THEN
            RAISE NOTICE '% é divisível por 3', valor;
        WHEN valor % 5 = 0 THEN
            RAISE NOTICE '% é divisível por 5', valor;
        ELSE
            RAISE NOTICE '% não é divisível por 3 ou 5', valor;
    END CASE;

END;
$$ LANGUAGE plpgsql;