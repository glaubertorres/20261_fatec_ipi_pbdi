-- fazer um cursor vinculado para exibir o nome de cada youtuber e seu número de inscrições



-- exibir nomes dos youtubers que começaram a partir de um ano específico
DO $$
DECLARE
	--
	cur_nomes_a_partir_de REFCURSOR;
	v_youtuber VARCHAR(200);
	v_ano INT := 2008;
	v_nome_tabela VARCHAR(200) := 'tb_top_youtubers';
BEGIN
	--
	OPEN cur_nomes_a_partir_de FOR EXECUTE
	format(
	'
	SELECT youtuber FROM %s 
	WHERE started >= $1
	', 
	v_nome_tabela
	)USING v_ano;
	LOOP
	--3. Recuperação dos dados de interesse
	FETCH cur_nomes_a_partir_de INTO v_youtuber;
	EXIT WHEN NOT FOUND;
	RAISE NOTICE '%', v_youtuber;
	END LOOP;
	--
	CLOSE cur_nomes_a_partir_de;
	RAISE NOTICE 'Acabou...';
END;
$$

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
D;
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