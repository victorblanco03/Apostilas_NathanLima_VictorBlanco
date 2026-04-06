-- 1.6 Faça um programa que gere medidas reais de um terreno retangular. Gere também um valor real no intervalo [60, 70] que representa o preço por metro quadrado. O programa deve exibir o valor total do terreno.
DO $$ 
DECLARE
    altura NUMERIC := RANDOM() * 10;
    largura NUMERIC := RANDOM() * 10;
    preco NUMERIC := RANDOM() * (70 - 60 + 1) + 60;
BEGIN 
    RAISE NOTICE 'altura % largura % preco % total %', ROUND(altura,2), ROUND(largura,2), ROUND(preco,2), ROUND(altura * largura * preco,2);
END; 
$$