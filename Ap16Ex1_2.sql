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