-- 1.1 Faça um programa que gere um valor inteiro e o exiba
DO $$ 
BEGIN 
	RAISE NOTICE 'O valor gerado é: %', FLOOR(RANDOM() * 100)::INT; 
END; 
$$