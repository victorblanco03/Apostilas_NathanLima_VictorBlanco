-- 1.4 Faça um programa que gere três valores reais a, b, e c e mostre o valor de delta: aquele que calculamos para chegar às potenciais raízes de uma equação do segundo grau.
DO $$ 
DECLARE
    a NUMERIC := RANDOM() * 10;
    b NUMERIC := RANDOM() * 10;
    c NUMERIC := RANDOM() * 10;
    delta NUMERIC;
    x1 NUMERIC;
    x2 NUMERIC;
BEGIN 
	delta :=  (b ^ 2) - (4 * a * c);
  
    RAISE NOTICE 'DELTA %', delta;
END; 
$$

