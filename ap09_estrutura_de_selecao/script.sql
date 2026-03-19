DO $$
DECLARE
    data INT := 31062021;
    dia INT;
    mes INT; 
    ano INT; 
    data_valida BOOL := TRUE;

BEGIN
    dia := data / 1000000;
    mes := data % 1000000 / 10000;
    ano := data % 1000; 
    RAISE NOTICE 'A data é %/%/%', dia, mes, ano;
    IF ano >= 1 THEN
        CASE 
            WHEN mes > 12 OR mes < 1 OR dia < 1 OR dia > 31 THEN
            data_valida := FALSE;
            ELSE
                IF ((mes = 4 OR mes = 6 OR mes = 9 OR mes = 11) AND dia > 30) THEN
                data_valida := FALSE;
                ELSE
                    IF mes = 2 THEN
                        CASE
                            WHEN ano % 4 = 0 AND ano % 400 <> 0 THEN
                                IF dia > 29 THEN
                                    data_valida := FALSE;
                                END IF;
                            ELSE
                            IF dia > 28 THEN
                                data_valida := FALSE;
                            END IF;
                        END CASE;
                    END IF;
                END IF;
        END CASE;
    ELSE
    data_valida := FALSE;
    END IF;
    CASE 
        WHEN data_valida THEN
            RAISE NOTICE 'A Data % é Válida', data;
        ELSE
            RAISE NOTICE 'A Data % é Inválida', data;
    END CASE;
END;
$$


-- DO $$
-- DECLARE
--   valor INT := valor_aleatorio_entre(1, 12);
--   mensagem VARCHAR(200);
-- BEGIN
--   RAISE NOTICE 'Valor gerado: %', valor;
--   CASE valor
--     WHEN 1, 3, 5, 7, 9 THEN
--       mensagem := 'Ímpar';
--     WHEN 2, 4, 6, 8, 10 THEN
--       mensagem := 'Par';
--     ELSE
--       mensagem := 'Fora do intervalo';
--   END CASE;
--   RAISE NOTICE '%', mensagem;
-- END;
-- $$

-- DO $$
-- DECLARE
--   valor INT;
--   mensagem VARCHAR(200);
-- BEGIN
--   valor := valor_aleatorio_entre(1, 12);
--   RAISE NOTICE 'O valor gerado é %', valor;
--   CASE valor
--     WHEN 1 THEN
--       mensagem := 'Ímpar';
--     WHEN 3 THEN
--       mensagem := 'Ímpar';
--     WHEN 5 THEN
--       mensagem := 'Ímpar';
--     WHEN 2 THEN
--       mensagem := 'Par';
--     WHEN 4 THEN
--       mensagem := 'Par';
--     WHEN 6 THEN
--       mensagem := 'Par';
--     ELSE
--       mensagem := 'Valor fora do intervalo';
--   END CASE;
--   RAISE NOTICE '%', mensagem;
-- END;
-- $$


-- DO $$
-- DECLARE
--     a INT := valor_aleatorio_entre(0, 10);
--     b INT := valor_aleatorio_entre(0, 10);
--     c INT := valor_aleatorio_entre(0, 10);
--     delta NUMERIC (10, 2);
--     raizUm NUMERIC (10, 2);
--     raizDois NUMERIC (10,2);
-- BEGIN
--     RAISE NOTICE 'EQUAÇÃO %x% + %x% + % = 0', a, U&'\00B2', b, c;
--     IF a = 0 THEN
--         RAISE NOTICE 'Não é uma equação do segundo grau';
--     ELSE
--         -- calcular delta
--         -- se delta negativo, dizer que nao tem raiz
--         -- se delta for igual a zero, dizer que tem uma raiz e mostrar
--         -- se delta for maior do que zero, dizer que tem duas raizes e mostrar ambas
--         delta := (b*b) - 4 * a * c;
--         RAISE NOTICE 'O valor de delta: %', delta;
--         IF delta < 0  THEN 
--             RAISE NOTICE 'Não tem raiz'
--         ELSIF delta = 0 THEN
--             raizUm := (-b + /| delta) / (2 * a);
--             RAISE NOTICE
        
--         END IF;

--         IF delta = 0 THEN 
--         RAISE NOTICE 'Raiz %', delta
--         END IF;


-- DO $$
-- DECLARE
--     valor INT := valor_aleatorio_entre(1, 100);
-- BEGIN
--     RAISE NOTICE 'Valor gerado: %', valor;
--     IF valor % 2 = 0 THEN 
--     RAISE NOTICE '% é par', valor;
--     ELSE
--     RAISE NOTICE '% é impar', valor;
--     END IF;
-- END;

-- $$


-- DO $$
-- DECLARE
    -- valor INT;
-- BEGIN
    -- SELECT valor_aleatorio_entre(1, 30) INTO valor;
    -- RAISE NOTICE 'Valor gerado: %', valor;
    -- IF valor BETWEEN 1 AND 20 THEN
        -- RAISE NOTICE 'A metade fo valor % é %', valor, valor/2;
    -- END IF;
-- END;
-- $$

-- DO $$
-- DECLARE
--     valor INT;
-- BEGIN
--     valor := valor_aleatorio_entre(1, 30);
--     IF valor >= 20 THEN
--         RAISE NOTICE 'O valor % é maior do que 20', valor;
--     END IF;
-- END;




-- CREATE OR REPLACE FUNCTION valor_aleatorio_entre (lim_inferior INT, lim_superior
-- INT) RETURNS INT AS
-- $$
-- BEGIN
-- RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
-- END;
-- $$ LANGUAGE plpgsql;

-- SELECT valor_aleatorio_entre(5, 17);