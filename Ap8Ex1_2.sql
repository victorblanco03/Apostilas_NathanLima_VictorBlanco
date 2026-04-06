-- 1.2 Faça um programa que gere um valor real e o exiba
DO $$ 
DECLARE
    valor NUMERIC := RANDOM() * 10;
BEGIN 
	RAISE NOTICE 'O valor gerado é: %', ROUND(valor,2); 
END; 
$$