-- 1.2 Escreva um programa que leia 6 números. Esses números serão apenas positivos ou negativos (desconsidere valores nulos). Imprima o total de números positivos.

-- Resposta em LOOP
DO $$ 
DECLARE 
    contador INT := 0;
    i INT := 1;
    num INT;
BEGIN
    LOOP
        EXIT WHEN i > 6;
        num := valor_aleatorio_entre(-50,50);
		RAISE NOTICE '%, ', num;
        IF num > 0 THEN
            contador := contador + 1;
        END IF;

        i := i + 1; 
    END LOOP;

    RAISE NOTICE 'Total de números positivos: %', contador;
END $$;

-- Resposta em WHILE
DO $$ 
DECLARE 
    contador INT := 0;
    i INT := 1;
    num INT;
BEGIN
    WHILE i <= 6 LOOP
        num := valor_aleatorio_entre(-50,50);
		RAISE NOTICE '%, ', num;
        IF num > 0 THEN
            contador := contador + 1;
        END IF;
        i := i + 1;
    END LOOP;

    RAISE NOTICE 'Total de números positivos: %', contador;
END $$;

-- Resposta em FOR
DO $$ 
DECLARE 
    contador INT := 0;
    num INT;
BEGIN
    FOR i IN 1..6 LOOP
        num := valor_aleatorio_entre(-50,50);
        RAISE NOTICE '%, ', num;
        IF num > 0 THEN
            contador := contador + 1;
        END IF;
    END LOOP;

    RAISE NOTICE 'Total de números positivos: %', contador;
END $$;

-- Resposta em FOREACH
DO $$ 
DECLARE 
    numeros INT[]; 
    contador INT := 0;
    num INT;
BEGIN
    numeros := ARRAY(
        SELECT valor_aleatorio_entre(-50,50) FROM generate_series(1,6)
    );

    FOREACH num IN ARRAY numeros LOOP
    	RAISE NOTICE '%, ', num;
        IF num > 0 THEN
            contador := contador + 1;
        END IF;
    END LOOP;

    RAISE NOTICE 'Total de números positivos: %', contador;
END $$;
