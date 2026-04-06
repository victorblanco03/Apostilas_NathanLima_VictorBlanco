-- 1.1 Programa que verifica se um número é múltiplo de 3 (usando CASE)
DO $$
DECLARE
    valor INT;
BEGIN
    valor := valor_aleatorio_entre(1, 100);

    RAISE NOTICE 'O valor gerado é: %', valor;

    CASE
        WHEN valor % 3 = 0 THEN
            RAISE NOTICE '% é divisível por 3', valor;
        ELSE
            RAISE NOTICE '% não é divisível por 3', valor;
    END CASE;

END $$;