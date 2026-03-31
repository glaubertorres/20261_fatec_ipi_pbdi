DO $$
DECLARE
	--1. DECLARAÇÃO
	cur_delete REFCURSOR;
	tupla RECORD;
BEGIN
	--2. ABERTURA
	-- scroll para voltar ao começo
	OPEN cur_delete SCROLL FOR
	SELECT * FROM tb_top_youtubers;

	LOOP
	--3. RECUPERAÇÃO
		FETCH cur_delete INTO tupla;
		EXIT WHEN NOT FOUND;
		IF tupla.video_count IS NULL THEN
			DELETE FROM tb_top_youtubers WHERE CURRENT OF cur_delete;
		END IF;
	END LOOP;

	-- loop para exibir itens de baixo pra cima
	LOOP
		FETCH BACKWARD FROM cur_delete INTO tupla;
		EXIT WHEN NOT FOUND;
		RAISE NOTICE '%', tupla;
	END LOOP;
	--4. FECHAMENTO
	CLOSE cur_delete;
END;
$$


-- DO $$
-- DECLARE
-- v_ano INT := 2010;
-- v_inscritos INT := 60000000;
-- cur_ano_inscritos CURSOR (ano INT, inscritos INT) FOR SELECT youtuber FROM
-- tb_top_youtubers WHERE started >= ano AND subscribers >= inscritos;
-- v_youtuber VARCHAR(200);
-- BEGIN
-- --execute apenas um dos dois comandos OPEN a seguir
-- -- passando argumentos pela ordem
-- --OPEN cur_ano_inscritos (v_ano, v_inscritos);
-- --passando argumentos por nome
-- OPEN cur_ano_inscritos (inscritos := v_inscritos, ano := v_ano);
-- LOOP
-- FETCH cur_ano_inscritos INTO v_youtuber;
-- EXIT WHEN NOT FOUND;
-- RAISE NOTICE '%', v_youtuber;
-- END LOOP;
-- CLOSE cur_ano_inscritos;
-- END;
-- $$


-- DO $$
-- DECLARE
-- 	v_ano INT := 2010;
-- 	v_inscritos INT := 60000000;

-- 	--cursor vinculado:
-- 	--1. Declaração
-- 	cur_ano_inscritos CURSOR (ano INT, inscritos INT)
-- 	FOR SELECT youtuber FROM tb_top_youtubers
-- 	WHERE started >= ano AND subscribers >= inscritos;
-- 	v_youtuber := VARCHAR(200);
-- BEGIN
-- 	--2. Abertura
-- 	-- ex pela ordem
-- 	OPEN cur_ano_inscritos(v_ano, v_inscritos);
-- 	-- ex parametros nomeados
-- 	-- OPEN cur_ano_inscritos(
-- 	-- 	inscritos := v_inscritos,
-- 	-- 	ano := v_ano
-- 	-- );
-- 	LOOP
-- 	--3. recuperação
-- 	FETCH cur_ano_inscritos INTO v_youtubers;
-- 	EXIT WHEN NOT FOUND;
-- 	RAISE NOTICE '%', v_youtuber;
-- 	END LOOP;
-- 	--4.FECHAMENTO
-- 	CLOSE cur_ano_inscritos;
-- END;
-- $$


-- fazer um cursor vinculado para exibir o nome de cada youtuber e seu número de inscrições



-- exibir nomes dos youtubers que começaram a partir de um ano específico
-- DO $$
-- DECLARE
-- 	--
-- 	cur_nomes_a_partir_de REFCURSOR;
-- 	v_youtuber VARCHAR(200);
-- 	v_ano INT := 2008;
-- 	v_nome_tabela VARCHAR(200) := 'tb_top_youtubers';
-- BEGIN
-- 	--
-- 	OPEN cur_nomes_a_partir_de FOR EXECUTE
-- 	format(
-- 	'
-- 	SELECT youtuber FROM %s 
-- 	WHERE started >= $1
-- 	', 
-- 	v_nome_tabela
-- 	)USING v_ano;
-- 	LOOP
-- 	--3. Recuperação dos dados de interesse
-- 	FETCH cur_nomes_a_partir_de INTO v_youtuber;
-- 	EXIT WHEN NOT FOUND;
-- 	RAISE NOTICE '%', v_youtuber;
-- 	END LOOP;
-- 	--
-- 	CLOSE cur_nomes_a_partir_de;
-- 	RAISE NOTICE 'Acabou...';
-- END;
-- $$

-- DO $$
-- DECLARE
-- 	cur_nomes_youtubers REFCURSOR;
-- 	v_youtuber VARCHAR(200);
-- BEGIN
-- 	OPEN cur_nomes_youtubers FOR
-- 	SELECT youtuber FROM tb_top_youtubers
-- 	WHERE started > 2000;
	
-- 	LOOP
-- 	--3. Recuperação dos dados de interesse
-- 	FETCH cur_nomes_youtubers INTO v_youtuber;
-- 	EXIT WHEN NOT FOUND;
-- 	RAISE NOTICE '%', v_youtuber;
-- 	END LOOP;
-- 	CLOSE cur_nomes_youtubers;
-- END;
-- $$



-- DO $$
-- DECLARE
-- --1. Declaração do cursos
-- --não vinculado(unbound)
-- cur_nomes_youtubers REFCURSOR;
-- v_youtuber VARCHAR(200);
-- BEGIN
-- 	--2. Abertura do Cursor
-- 	OPEN cur_nomes_youtubers FOR
-- 	SELECT youtuber FROM tb_top_youtubers;

-- 	RAISE NOTICE '%',
-- 	LOOP
-- 	--3. Recuperação dos dados de interesse
-- 	FETCH cur_nomes_youtubers INTO v_youtuber;
-- 	EXIT WHEN NOT FOUN v_youtuber;
-- 	END LOOP;
-- 	-- 4. Fechamento do cursor
-- 	CLOSE cur_nomes_youtubers;
-- END;
-- $$



-- CREATE TABLE tb_top_youtubers(
-- 	cod_top_youtubers SERIAL PRIMARY KEY,
-- 	rank INT,
-- 	youtuber VARCHAR(200),
-- 	subscribers INT,
-- 	video_views VARCHAR(200),
-- 	video_count INT,
-- 	category VARCHAR(200),
-- 	started INT
-- );