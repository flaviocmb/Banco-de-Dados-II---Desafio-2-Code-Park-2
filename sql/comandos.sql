--
--
--
--
--
--
CREATE DATABASE loja;

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    data_cadastro DATE
);

INSERT INTO clientes (nome, data_cadastro) VALUES ('João', '2023-06-12');
INSERT INTO clientes (nome, data_cadastro) VALUES ('Maria', '2023-06-12');
INSERT INTO clientes (nome, data_cadastro) VALUES ('Fernando', '2023-06-12');
INSERT INTO clientes (nome, data_cadastro) VALUES ('Cláudia', '2023-06-12');
INSERT INTO clientes (nome, data_cadastro) VALUES ('Pedro', '2023-06-11');

INSERT INTO clientes (nome, data_cadastro) VALUES ('João', CURRENT_DATE);
INSERT INTO clientes (nome, data_cadastro) VALUES ('Maria', CURRENT_DATE);
INSERT INTO clientes (nome, data_cadastro) VALUES ('José', CURRENT_DATE);
INSERT INTO clientes (nome, data_cadastro) VALUES ('Fernando', CURRENT_DATE);
INSERT INTO clientes (nome, data_cadastro) VALUES ('Cláudia', CURRENT_DATE);
INSERT INTO clientes (nome, data_cadastro) VALUES ('Vanessa', CURRENT_DATE);

CREATE OR REPLACE FUNCTION contar_clientes_cadastrados(data_consulta DATE)
RETURNS INTEGER AS $$
DECLARE
    total_clientes INTEGER;
BEGIN
    SELECT COUNT(*) INTO total_clientes
    FROM clientes
    WHERE data_cadastro = data_consulta;

    RETURN total_clientes;
END;
$$ LANGUAGE plpgsql;

SELECT contar_clientes_cadastrados('2023-06-12');
SELECT contar_clientes_cadastrados(CURRENT_DATE);