-- 1.5 Faça um programa que gere um número inteiro e mostre a raiz cúbica de seu antecessor e a raiz quadrada de seu sucessor
DO $$ 
DECLARE
    valor INT = FLOOR(RANDOM() * 100)::INT;
    cubica NUMERIC = (valor - 1) ^ (1.0/3);  
    quadrada NUMERIC = (valor + 1) ^ 0.5;    
BEGIN 
    RAISE NOTICE 'valor % cubica % quadrada %', valor, cubica, quadrada;
END; 
$$