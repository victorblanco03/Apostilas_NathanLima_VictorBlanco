-- 1.3 Faça um programa que gere um valor real entre 20 e 30, que represente um valor em celcius e faça a conversao em fahrenheit
DO $$ 
DECLARE
    valor NUMERIC := RANDOM() * (30 - 20 + 1) + 20;
BEGIN 
	RAISE NOTICE 'O valor gerado é: % resultado em Fahrenheit: %', ROUND(valor,2), ROUND( (valor * 1.8) + 32, 2 ) ; 

END; 
$$