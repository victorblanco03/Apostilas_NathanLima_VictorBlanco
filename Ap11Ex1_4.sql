-- 1.1.4 Leia um conjunto não determinado de pares de valores M e N. Para cada par lido, mostre a sequência do menor até o maior e a soma dos inteiros consecutivos entre eles.

-- Resposta em LOOP
DO $$ 
DECLARE 
  m INT := valor_aleatorio_entre(1,100);
  n INT := valor_aleatorio_entre(1,100);
  temp INT;
  soma INT := 0;
	resultado TEXT;
BEGIN
    IF m > n THEN
        temp := m;
        m := n;
        n := temp;
    END IF;
  
    resultado := '';
    
    LOOP
        EXIT WHEN m > n;
        resultado := resultado || m || ' ';
        soma := soma + m;
        m := m + 1;
    END LOOP;
    resultado := resultado || 'Soma=' || soma;
    RAISE NOTICE 'LOOP: %', resultado;

	END $$; 

-- Resposta em WHILE

DO $$ 
DECLARE 
  m INT := valor_aleatorio_entre(1,100);
  n INT := valor_aleatorio_entre(1,100);
  temp INT;
  soma INT := 0;
	resultado TEXT;
BEGIN
	IF m > n THEN
        temp := m;
        m := n;
        n := temp;
    END IF;
  
   
    resultado := '';
    
	WHILE m <= n LOOP
        resultado := resultado || m || ' ';
        soma := soma + m;
        m := m + 1;
    END LOOP;
    resultado := resultado || 'Soma=' || soma;
    RAISE NOTICE 'WHILE: %', resultado;

END $$;

-- Resposta em FOR

DO $$ 
DECLARE 
  m INT := valor_aleatorio_entre(1,100);
  n INT := valor_aleatorio_entre(1,100);
  temp INT;
  soma INT := 0;
	resultado TEXT;
BEGIN
	IF m > n THEN
        temp := m;
        m := n;
        n := temp;
    END IF;
   
    resultado := '';
    
	FOR i IN m..n LOOP
        resultado := resultado || i || ' ';
        soma := soma + i;
    END LOOP;
    resultado := resultado || 'Soma=' || soma;
    RAISE NOTICE 'FOR: %', resultado;

END $$;

-- Resposta em FOREACH

DO $$ 
DECLARE 
  m INT := valor_aleatorio_entre(1,100);
  n INT := valor_aleatorio_entre(1,100);
  temp INT;
  soma INT := 0;
	resultado TEXT;
	numeros INT[]; 
	num INT;
BEGIN
    numeros := ARRAY(
        SELECT generate_series(m, n)
    );
 	resultado := '';
    
	FOREACH num IN ARRAY numeros LOOP
			resultado := resultado || num || ' ';
            soma := soma + num;
	END LOOP;
	resultado := resultado || 'Soma=' || soma;
	RAISE NOTICE 'FOREACH: %', resultado;
END $$;