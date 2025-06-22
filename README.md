# Desafio-Projeto-de-Modelagem-de-Banco-de-Dados---E-commerce
Repositorio contendo o desafio do curso de PowerBI da Suzano na Dio

# 💻 Projeto de Modelagem de Banco de Dados - E-commerce

Este repositório contém a modelagem lógica, o script SQL de criação de tabelas e consultas avançadas desenvolvidas como parte de um desafio educacional de banco de dados. O objetivo é simular o funcionamento de um sistema de e-commerce com base em um modelo refinado e estruturado, incorporando boas práticas de modelagem e escrita SQL.

## 🔄 Alterações no Cenário

> ⚠️ Este projeto é uma continuação/refinamento de um desafio anterior.  
> O cenário original de e-commerce sofreu alterações para atender a novos requisitos, incluindo:

- Diferenciação entre cliente Pessoa Física (PF) e Pessoa Jurídica (PJ), de forma que uma conta só pode ser de um tipo;
- Inclusão de múltiplas formas de pagamento por cliente;
- Sistema de entregas com status e código de rastreio;
- Considerações sobre relacionamento entre vendedores e fornecedores;
- Novas perguntas para apoiar consultas SQL mais complexas.

## 🧠 Objetivos do Projeto

- Construção da modelagem lógica refinada;
- Criação do esquema SQL completo (DDL);
- Inserção de dados fictícios para testes (DML);
- Execução de queries SQL complexas incluindo:
  - `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`, `HAVING`, `JOIN`
  - Atributos derivados (campos calculados)

## ⚙️ Tecnologias Utilizadas

- **SGBD:** MySQL  
- **Script de criação:** MYSQL
- **Dados populados:** O banco foi preenchido com dados fictícios para permitir testes reais e execução de consultas.

## 🧾 Consultas Implementadas

Exemplos de perguntas respondidas pelas queries:

### 🔍 SELECT
- Quais são os nomes de todos os produtos cadastrados?
- Quais são os nomes dos clientes e seus CPFs?
- Nome dos produtos, categoria, avaliação e fornecedor.

### 🎯 WHERE
- Quais produtos pertencem à categoria 'Eletrônico'?
- Quais pedidos estão com o status 'Processando'?

### ➕ Campos Calculados
- Valor do produto com 10% de imposto.
- Idade dos clientes.
- Valor total de cada pedido.

### 📑 ORDER BY
- Produtos em ordem alfabética.
- Clientes do mais novo para o mais velho.
- Pedidos por status e valor de frete decrescente.

### 🗂️ GROUP BY
- Quantos pedidos cada cliente realizou?
- Quantos produtos existem por categoria?

### 🔍 HAVING
- Clientes que fizeram mais de 1 pedido.
- Categorias com mais de 2 produtos.
- Produtos com mais de 3 unidades vendidas.

### 🔗 JOINs
- Clientes com seus pedidos.
- Produtos comprados por pedido e quantidade.
- Clientes, produtos, fornecedores e status de entrega.


