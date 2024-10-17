
CREATE TABLE medicamentos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    valor_unitario DECIMAL(10, 2),
    quantidade INT,
    unidade VARCHAR(50)
);


CREATE TABLE tutores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    data_nascimento DATE
);


CREATE TABLE pacientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    peso DECIMAL(5, 2)
);


CREATE TABLE receitas (
    id SERIAL PRIMARY KEY,
    data DATE
);


CREATE TABLE itens_receita (
    id SERIAL PRIMARY KEY,
    receita_id INT REFERENCES receitas(id),
    valor DECIMAL(10, 2)
);

SELECT * FROM VETERINARIA v ;

SELECT SUM(quantidade) AS total_medicamentos_estoque 
FROM medicamentos;


SELECT AVG(EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM data_nascimento)) AS media_idade_tutores 
FROM tutores;


SELECT MIN(valor_unitario) AS menor_valor_unitario 
FROM medicamentos;


SELECT MAX(peso) AS maior_peso 
FROM pacientes;


SELECT COUNT(*) AS total_tutores 
FROM tutores;


SELECT unidade, SUM(valor_unitario * quantidade) AS valor_total_estoque 
FROM medicamentos 
GROUP BY unidade;


SELECT r.id AS receita_id, SUM(i.valor) AS total_valor 
FROM receitas r
JOIN itens_receita i ON r.id = i.receita_id 
GROUP BY r.id 
HAVING SUM(i.valor) > 100;
