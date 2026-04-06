-- ap8

-- 1.1 Faça um programa que gere um valor inteiro e o exiba
DO $$ 
BEGIN 
	RAISE NOTICE 'O valor gerado é: %', FLOOR(RANDOM() * 100)::INT; 
END; 
$$

-- 1.2 Faça um programa que gere um valor real e o exiba
DO $$ 
DECLARE
    valor NUMERIC := RANDOM() * 10;
BEGIN 
	RAISE NOTICE 'O valor gerado é: %', ROUND(valor,2); 
END; 
$$

-- 1.3 Faça um programa que gere um valor real entre 20 e 30, que represente um valor em celcius e faça a conversao em fahrenheit
DO $$ 
DECLARE
    valor NUMERIC := RANDOM() * (30 - 20 + 1) + 20;
BEGIN 
	RAISE NOTICE 'O valor gerado é: % resultado em Fahrenheit: %', ROUND(valor,2), ROUND( (valor * 1.8) + 32, 2 ) ; 

END; 
$$
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

-- 1.7 Escreva um programa que gere um inteiro que representa o ano de nascimento de uma pessoa no intervalo [1980, 2000] e gere um inteiro que  epresenta o ano atual no intervalo [2010, 2020]. O programa deve exibir a idade da pessoa em anos. Desconsidere detalhes envolvendo dias, meses, anos bissextos etc.
DO $$ 
DECLARE
   ano1 INT = RANDOM() * (2000 - 1980 + 1) + 1980;
   ano2 INT = RANDOM() * (2020 - 2010 + 1) + 2010;
BEGIN 
    RAISE NOTICE 'ano de nascimento % ano atual % idade %', ano1, ano2, ano2 - ano1;
END; 
$$

-- ap9

-- Função para gerar valor aleatório entre limite inferior e superior
CREATE OR REPLACE FUNCTION valor_aleatorio_entre(lim_inferior INT, lim_superior INT)
RETURNS INT AS $$
BEGIN
    RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
END;
$$ LANGUAGE plpgsql;

-- 1.1 Programa que verifica se um número é múltiplo de 3 (usando IF ELSE)
DO $$
DECLARE
    valor INT := valor_aleatorio_entre(1, 100);
BEGIN
    RAISE NOTICE 'O valor gerado é: %', valor;
    IF valor % 3 = 0 THEN
        RAISE NOTICE '% é divisível por 3', valor;
    ELSE
        RAISE NOTICE '% não é divisível por 3', valor;
    END IF;
END;
$$;

-- 1.1 Programa que verifica se um número é múltiplo de 3 (usando CASE)
DO $$ 
DECLARE
	valor INT := valor_aleatorio_entre(1, 100); 
BEGIN 
	RAISE NOTICE 'O valor gerado é: %', valor; 
	CASE 
		WHEN valor % 3 = 0 THEN
			RAISE NOTICE '% é divisivel por 3', valor; 
		ELSE 
			RAISE NOTICE '% não é divisivel por 3', valor; 
	END CASE; 
END; 
$$

-- 1.2 Programa que verifica se um número é múltiplo de 3 ou de 5 (usando IF ELSE)
DO $$
DECLARE
    valor INT := valor_aleatorio_entre(1, 100);
BEGIN
    RAISE NOTICE 'O valor gerado é: %', valor;
    IF valor % 3 = 0 THEN
        RAISE NOTICE '% é divisível por 3', valor;
    ELSIF valor % 5 = 0 THEN
        RAISE NOTICE '% é divisível por 5', valor;
    ELSE
        RAISE NOTICE '% não é divisível por 3 ou 5', valor;
    END IF;
END;
$$;

-- 1.2 Programa que verifica se um número é múltiplo de 3 ou de 5 (usando CASE)
DO $$ 
DECLARE
	valor INT := valor_aleatorio_entre(1, 100); 
BEGIN 
	RAISE NOTICE 'O valor gerado é: %', valor; 
	CASE 
		WHEN valor % 3 = 0 THEN
			RAISE NOTICE '% é divisivel por 3', valor;
		WHEN valor % 5 = 0 THEN
			RAISE NOTICE '% é divisivel por 5', valor;
		ELSE 
			RAISE NOTICE '% não é divisivel por 3 ou 5', valor; 
	END CASE; 
END; 
$$

-- 1.3 Função de menu para operações de soma, subtração, multiplicação e divisão (usando IF ELSE)
CREATE OR REPLACE FUNCTION menu(operacao INTEGER, op1 INTEGER, op2 INTEGER)
RETURNS TEXT AS $$
DECLARE
    resultado TEXT;
BEGIN
    IF operacao = 1 THEN
        resultado := op1 || ' + ' || op2 || ' = ' || (op1 + op2);
    ELSIF operacao = 2 THEN
        resultado := op1 || ' - ' || op2 || ' = ' || (op1 - op2);
    ELSIF operacao = 3 THEN
        resultado := op1 || ' * ' || op2 || ' = ' || (op1 * op2);
    ELSIF operacao = 4 THEN
        IF op2 = 0 THEN
            resultado := 'Erro: divisão por zero!';
        ELSE
            resultado := op1 || ' / ' || op2 || ' = ' || (op1 / op2);
        END IF;
    ELSE
        resultado := 'Erro: operação inválida!';
    END IF;
    RETURN resultado;
END;
$$ LANGUAGE plpgsql;

-- 1.3 Função de menu para operações de soma, subtração, multiplicação e divisão (usando CASE)
CREATE OR REPLACE FUNCTION menu(operacao INTEGER, op1 INTEGER, op2 INTEGER)
RETURNS TEXT AS $$
DECLARE
    resultado TEXT;
BEGIN
    CASE operacao
        WHEN 1 THEN
            resultado := op1 || ' + ' || op2 || ' = ' || (op1 + op2);
        WHEN 2 THEN
            resultado := op1 || ' - ' || op2 || ' = ' || (op1 - op2);
        WHEN 3 THEN
            resultado := op1 || ' * ' || op2 || ' = ' || (op1 * op2);
        WHEN 4 THEN
            IF op2 = 0 THEN
                resultado := 'Erro: divisão por zero!';
            ELSE
                resultado := op1 || ' / ' || op2 || ' = ' || (op1 / op2);
            END IF;
        ELSE
            resultado := 'Erro: operação inválida!';
    END CASE;
    
    RETURN resultado;
END;
$$ LANGUAGE plpgsql;

-- 1.4 Função para calcular o preço de venda com base no lucro (usando IF ELSE)
CREATE OR REPLACE FUNCTION lucro(valor INTEGER)
RETURNS TEXT AS $$
DECLARE
    resultado TEXT;
BEGIN
    IF valor <= 20 THEN
        resultado := valor || ' menor que R$20 lucro de 45% valor total = '  || (valor + (valor * 0.45));
    ELSE
        resultado := valor || ' maior que R$20 lucro de 30% valor total = '  || (valor + (valor * 0.30));
    END IF;
    RETURN resultado;
END;
$$ LANGUAGE plpgsql;

-- 1.4 Função para calcular o preço de venda com base no lucro (usando CASE)
CREATE OR REPLACE FUNCTION lucro(valor INTEGER)
RETURNS TEXT AS $$
DECLARE
    resultado TEXT;
BEGIN
    CASE 
        WHEN valor <= 20 THEN
            resultado := valor || ' menor que R$20 lucro de 45% valor total = '  || (valor + (valor * 0.45) );
        
        ELSE
             resultado := valor || ' maior que R$20 lucro de 30% valor total = '  || (valor + (valor * 0.30) );
    END CASE;
    
    RETURN resultado;
END;
$$ LANGUAGE plpgsql;

-- 1.5 Função para calcular reajuste salarial de um funcionário (usando IF ELSE)
CREATE OR REPLACE FUNCTION calcular_reajuste(salario NUMERIC)
RETURNS TEXT AS $$
DECLARE
    resultado TEXT;
BEGIN
    IF salario <= 400 THEN
        resultado := 'Novo salario = ' || (salario + (salario * 0.15)) || 
                     ' Reajuste ganho = ' || salario * 0.15 || ' Percentual 15%';
    ELSIF salario <= 800 THEN
        resultado := 'Novo salario = ' || (salario + (salario * 0.12)) || 
                     ' Reajuste ganho = ' || salario * 0.12 || ' Percentual 12%';
    ELSIF salario <= 1200 THEN
        resultado := 'Novo salario = ' || (salario + (salario * 0.10)) || 
                     ' Reajuste ganho = ' || salario * 0.10 || ' Percentual 10%';
    ELSIF salario <= 2000 THEN
        resultado := 'Novo salario = ' || (salario + (salario * 0.07)) || 
                     ' Reajuste ganho = ' || salario * 0.07 || ' Percentual 07%';
    ELSE
        resultado := 'Novo salario = ' || (salario + (salario * 0.04)) || 
                     ' Reajuste ganho = ' || salario * 0.04 || ' Percentual 04%';
    END IF;
    RETURN resultado;
END;
$$ LANGUAGE plpgsql;

-- 1.5 Função para calcular reajuste salarial de um funcionário (usando CASE)
CREATE OR REPLACE FUNCTION calcular_reajuste(salario NUMERIC)
RETURNS TEXT AS $$
DECLARE
    resultado TEXT;
BEGIN
	CASE
		WHEN salario <= 400 THEN 
			resultado := 'Novo salario = '  || (salario + (salario * 0.15) || ' Reajuste ganho = ' || salario * 0.15 || ' Percentual 15%');
		WHEN salario <= 800 THEN
			resultado := 'Novo salario = '  || (salario + (salario * 0.12) || ' Reajuste ganho = ' || salario * 0.12 || ' Percentual 12%');
		WHEN salario <= 1200 THEN
			resultado := 'Novo salario = '  || (salario + (salario * 0.10) || ' Reajuste ganho = ' || salario * 0.10 || ' Percentual 10%');
		WHEN salario <= 2000 THEN
			resultado := 'Novo salario = '  || (salario + (salario * 0.07) || ' Reajuste ganho = ' || salario * 0.07 || ' Percentual 07%');
		ELSE
			resultado := 'Novo salario = '  || (salario + (salario * 0.04) || ' Reajuste ganho = ' || salario * 0.04 || ' Percentual 04%');
	END CASE;
	
	RETURN resultado;
END;
$$ LANGUAGE plpgsql;

--ap10

-- 1.1 Resolva cada exercício a seguir usando LOOP, WHILE, FOR e FOREACH. Quando o enunciado disser que é preciso “ler” algum valor, gere-o aleatoriamente.


-- 1.1.1 Escreva um programa que imprima todos os números pares entre 1 e 100, incluindo-os se for o caso.

-- Resposta em LOOP
DO $$
DECLARE
	contador INT := 1; 
BEGIN 
	LOOP 
		IF contador > 100 THEN 
			 EXIT; 
		END IF; 
		
		IF contador % 2 = 0 THEN 
			RAISE NOTICE '%', contador;
		END IF;  
		
		contador := contador + 1; 
	END LOOP;
END;
$$;

-- Resposta em WHILE
DO $$ 
DECLARE 
    contador INT := 2;
BEGIN
    WHILE contador <= 100 LOOP
        RAISE NOTICE '%', contador;
        contador := contador + 2;
    END LOOP;
END;
$$;

-- Resposta em FOR
DO $$ 
BEGIN 
	FOR contador IN 2..100 BY 2 
	LOOP 
		RAISE NOTICE '%', contador; 
	END LOOP; 
END; 
$$;

-- Resposta em FOREACH
DO $$ 
DECLARE 
    contador INT[];  
    item INT;   
BEGIN
    contador := ARRAY(SELECT generate_series(2, 100, 2));

    FOREACH item IN ARRAY contador LOOP
        RAISE NOTICE '%', item;
    END LOOP;
END;
$$;

-- 1.1.2 Escreva um programa que leia 6 números. Esses números serão apenas positivos ou negativos (desconsidere valores nulos). Imprima o total de números positivos.

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


-- 1.2 Faça um programa que calcule o determinante de uma matriz quadrada de ordem 3 utilizando a regra de Sarrus.
DO $$
DECLARE
    matriz INT[3][3];
    determinante INT;
BEGIN
    -- Definição da matriz 3x3 com valores aleatórios entre 1 e 10
    matriz := ARRAY[
        [valor_aleatorio_entre(1,12), valor_aleatorio_entre(1,12), valor_aleatorio_entre(1,12)],
        [valor_aleatorio_entre(1,12), valor_aleatorio_entre(1,12), valor_aleatorio_entre(1,12)],
        [valor_aleatorio_entre(1,12), valor_aleatorio_entre(1,12), valor_aleatorio_entre(1,12)]
    ];
    
    -- Cálculo do determinante pela Regra de Sarrus
    determinante := (
        (matriz[1][1] * matriz[2][2] * matriz[3][3]) + 
        (matriz[1][2] * matriz[2][3] * matriz[3][1]) + 
        (matriz[1][3] * matriz[2][1] * matriz[3][2]) - 
        (matriz[1][3] * matriz[2][2] * matriz[3][1]) - 
        (matriz[1][1] * matriz[2][3] * matriz[3][2]) - 
        (matriz[1][2] * matriz[2][1] * matriz[3][3])
    );
    
    RAISE NOTICE 'Matriz: %', matriz;
    RAISE NOTICE 'Determinante: %', determinante;
END $$;

--ap16

-- 1.1 Escreva um cursor que exiba as variáveis rank e youtuber de toda tupla que tiver video_count pelo menos igual a 1000 e cuja category seja igual a Sports ou Music.

-- Resposta com cursor vinculado
DO $$
DECLARE
    cur_channels CURSOR FOR
        SELECT rank, youtuber
        FROM  tb_top_youtubers
        WHERE video_count >= 1000
          AND category IN ('Sports', 'Music');
    
    v_rank INT;
    v_youtuber TEXT;
BEGIN
    OPEN cur_channels;

    LOOP
        FETCH cur_channels INTO v_rank, v_youtuber;
        EXIT WHEN NOT FOUND;

        RAISE NOTICE 'Rank: %, Youtuber: %', v_rank, v_youtuber;
    END LOOP;

    CLOSE cur_channels;
END $$;

-- resposta com cursor naovinculado
DO $$
DECLARE
    ref refcursor;
    v_rank INT;
    v_youtuber TEXT;
BEGIN
    OPEN ref FOR
        SELECT rank, youtuber
        FROM  tb_top_youtubers
        WHERE video_count >= 1000
          AND category IN ('Sports', 'Music');

    LOOP
        FETCH ref INTO v_rank, v_youtuber;
        EXIT WHEN NOT FOUND;
        RAISE NOTICE 'Rank: %, Youtuber: %', v_rank, v_youtuber;
    END LOOP;

    CLOSE ref;
END $$;

-- 1.2 Escreva um cursor que exibe todos os nomes dos youtubers em ordem reversa

-- resposta com cursor vinculado
DO $$
DECLARE
    cur_reverse CURSOR FOR
        SELECT youtuber
        FROM  tb_top_youtubers
        ORDER BY youtuber ASC;
    
    v_youtuber TEXT;
BEGIN
    OPEN cur_reverse;

    FETCH LAST FROM cur_reverse INTO v_youtuber;

    WHILE FOUND LOOP
        RAISE NOTICE 'Youtuber: %', v_youtuber;

        FETCH PRIOR FROM cur_reverse INTO v_youtuber;
    END LOOP;

    CLOSE cur_reverse;
END $$;

-- resposta com cursor nao vinculado
DO $$
DECLARE
    ref refcursor;
    v_youtuber TEXT;
BEGIN
    OPEN ref SCROLL FOR
        SELECT youtuber
        FROM  tb_top_youtubers
        ORDER BY youtuber ASC;

    FETCH LAST FROM ref INTO v_youtuber;

    WHILE FOUND LOOP
        RAISE NOTICE 'Youtuber: %', v_youtuber;
        FETCH PRIOR FROM ref INTO v_youtuber;
    END LOOP;

    CLOSE ref;
END $$;

-- 1.3 Faça uma pesquisa sobre o anti-pattern chamado RBAR - Row By Agonizing Row. Explique com suas palavras do que se trata.

-- RBAR (Row-By-Agonizing-Row) é um anti-padrão em bancos de dados que ocorre quando você processa os dados linha por linha, geralmente com cursores ou loops, ao invés de usar comandos que manipulam conjuntos de dados.

-- Problemas principais:

-- Mais lento e ineficiente
-- Usa mais memória e CPU
-- Não aproveita a otimização do SQL

-- Exemplo de RBAR (em PL/pgSQL):
DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT id FROM users LOOP
        UPDATE users SET active = TRUE WHERE id = rec.id;
    END LOOP;
END $$;

-- Forma ideal:
UPDATE users SET active = TRUE;