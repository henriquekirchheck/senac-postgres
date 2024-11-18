CREATE DATABASE govdf ENCODING "UTF8";

CREATE TABLE IF NOT EXISTS remuneracao_2013_01 (
  id int primary key generated always as identity,
  nome text,
  cpf text,
  empresa text,
  cargo text,
  funcao text,
  grupo text,
  mes_referencia int,
  exercicio int,
  valor_liquido decimal(9, 2)
);

COPY remuneracao_2013_01 (
  nome,
  cpf,
  empresa,
  cargo,
  funcao,
  grupo,
  mes_referencia,
  exercicio,
  valor_liquido
) FROM '/shared/remuneracao-2013-01.csv'
DELIMITER ',' CSV HEADER;

SELECT count(*) FROM remuneracao_2013_01 WHERE valor_liquido > 10000;