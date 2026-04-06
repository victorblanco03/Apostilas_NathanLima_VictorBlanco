
-- 1.1.3 Leia dois valores inteiros X e Y. Imprima a soma de todos os valores ímpares entre eles.

-- Resposta em LOOP
DO $$ 
DECLARE 
    x INT := valor_aleatorio_entre(20,50);
    y INT := valor_aleatorio_entre(20,50);
    temp INT;
    soma INT := 0;
BEGIN
    IF x > y THEN
        temp := x;
        x := y;
        y := temp;
    END IF;

    x := x + 1; 
	RAISE NOTICE 'X e Y: %, %', x,y;
    LOOP
        EXIT WHEN x >= y; 

        IF x % 2 <> 0 THEN
            soma := soma + x;
        END IF;

        x := x + 1; 
    END LOOP;

    RAISE NOTICE 'Soma dos ímpares entre X e Y: %', soma;
END $$;

-- Resposta em WHILE
DO $$ 
DECLARE 
	x INT := valor_aleatorio_entre(20,50);
    y INT := valor_aleatorio_entre(20,50);
    temp INT;
    soma INT := 0;
BEGIN
    IF x > y THEN
        temp := x;
        x := y;
        y := temp;
    END IF;

    x := x + 1; 
	RAISE NOTICE 'X e Y: %, %', x,y;
    WHILE x < y LOOP
        IF x % 2 <> 0 THEN
            soma := soma + x;
        END IF;
        x := x + 1;
    END LOOP;

    RAISE NOTICE 'Soma dos ímpares entre X e Y: %', soma;
END $$;

-- Resposta em FOR
DO $$
DECLARE
	x INT := valor_aleatorio_entre(20,50);
    y INT := valor_aleatorio_entre(20,50);
    temp INT;
    soma INT := 0;
BEGIN
    IF x > y THEN
        temp := x;
        x := y;
        y := temp;
    END IF;

    FOR i IN (x + 1)..(y - 1) LOOP
        IF i % 2 <> 0 THEN
            soma := soma + i;
        END IF;
    END LOOP;
    
    RAISE NOTICE 'Soma dos ímpares: %', soma;
END $$;

-- Resposta em FOREACH
DO $$ 
DECLARE 
  numeros INT[]; 
  contador INT := 0;
  num INT;
BEGIN
    numeros := ARRAY(
        SELECT valor_aleatorio_entre(20,50) FROM generate_series(1,6)
    );

    FOREACH num IN ARRAY numeros LOOP
    	RAISE NOTICE '%, ', num;
        IF num > 0 THEN
            contador := contador + 1;
        END IF;
    END LOOP;

    RAISE NOTICE 'Total de números positivos: %', contador;
END $$;