-- 1.7 Escreva um programa que gere um inteiro que representa o ano de nascimento de uma pessoa no intervalo [1980, 2000] e gere um inteiro que  epresenta o ano atual no intervalo [2010, 2020]. O programa deve exibir a idade da pessoa em anos. Desconsidere detalhes envolvendo dias, meses, anos bissextos etc.
DO $$ 
DECLARE
   ano1 INT = RANDOM() * (2000 - 1980 + 1) + 1980;
   ano2 INT = RANDOM() * (2020 - 2010 + 1) + 2010;
BEGIN 
    RAISE NOTICE 'ano de nascimento % ano atual % idade %', ano1, ano2, ano2 - ano1;
END; 
$$