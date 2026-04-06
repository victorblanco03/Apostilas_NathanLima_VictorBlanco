--1.4 Função para calcular o preço de venda com base no lucro (usando IF ELSE)
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