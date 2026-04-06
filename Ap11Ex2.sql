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