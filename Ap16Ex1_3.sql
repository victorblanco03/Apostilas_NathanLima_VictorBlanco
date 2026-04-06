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