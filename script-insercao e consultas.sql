-- Inserção de dados do projeto E-commerce
-- drop database ecommerce;
create database if not exists ecommerce;
USE ecommerce;

-- ---------------------------
-- Tabela Client
-- ---------------------------
INSERT INTO Client (Fname, Minit, Lname, CPF, Address, Date_nasc) VALUES
('Maria','M','Silva', '12345678901', 'Rua Silva de Prata 29, Carangola - Cidade das Flores', '1988-02-05'),
('Matheus','O','Pimentel', '98765432100', 'Rua Alameda 289, Centro - Cidade das Flores', '1955-07-01'),
('Ricardo','F','Silva', '45678913022', 'Avenida Vinha 1009, Centro - Cidade das Flores', '2000-09-25'),
('Julia','S','Franca', '78912345655', 'Rua Laranjeiras 861, Centro - Cidade das Flores', '1997-04-15'),
('Roberta','G','Assis', '98745631099', 'Avenida Koller 19, Centro - Cidade das Flores', '1980-10-10'),
('Isabela','M','Cruz', '65478912333', 'Rua das Flores 28, Centro - Cidade das Flores', '2001-03-07'),
('Felipe','A','Souza', '32165498700', 'Rua das Palmeiras 123, Jardim - Cidade das flores', '1995-08-20'),
('Camila','B','Lopes', '74125896311', 'Rua das Acácias 77, Centro - Cidade das flores', '1990-12-01'),
('Renato','D','Moura', '85214796322', 'Avenida Brasil 500, Bairro Novo', '1987-11-30'),
('Beatriz','F','Ferreira', '95175385244', 'Rua Rio Branco 88, Centro - Cidade das flores', '1992-06-15');

-- ---------------------------
-- Tabela Product
-- ---------------------------
INSERT INTO Product (Pname, Classification_Kids, Category, Assessment, Size, `Value`) VALUES
('Fone de ouvido', FALSE, 'Eletronico', 4, NULL, 120.20),
('Barbie Elsa', TRUE, 'Brinquedos', 3, NULL, 40.99),
('Body Carters', TRUE, 'Vestimenta', 5, NULL, 50.00),
('Microfone Vedo - Youtuber', FALSE, 'Eletronico', 4, NULL, 99.00),
('Sofa retrátil', FALSE, 'Móveis', 3, '3x57x80', 1000.00),
('Farinha de arroz', FALSE, 'Alimentos', 2, NULL, 7.70),
('Fire Stick Amazon', FALSE, 'Eletronico', 3, NULL, 350.00),
('Notebook Dell', FALSE, 'Eletronico', 5, '35x25x3', 4200.00),
('Geladeira Consul', FALSE, 'Móveis', 4, '180x70x60', 2900.00),
('Cadeira Gamer', FALSE, 'Móveis', 4, '120x70x60', 899.00),
('Lego Star Wars', TRUE, 'Brinquedos', 5, NULL, 499.00),
('Bicicleta Infantil', TRUE, 'Brinquedos', 4, NULL, 799.00);

-- ---------------------------
-- Tabela Order
-- ---------------------------
INSERT INTO `Order` (StatusOrder, Description, freight, Client_idClient) VALUES
('Processando', 'Compra via aplicativo', NULL, 1),
('Processando', 'Compra via aplicativo', 50, 2),
('Enviado', NULL, NULL, 3),
('Processando', 'Compra via website', 150, 4),
('Em andamento', 'Pedido gerado pelo site', 60, 5),
('Entregue', 'Compra concluída', NULL, 6),
('Processando', 'Compra via mobile', 30, 7),
('Em andamento', 'Compra no site', 70, 8),
('Processando', 'Compra web', 90, 9),
('Entregue', 'Compra completa', NULL, 10);

-- ---------------------------
-- Tabela ProductOrder
-- ---------------------------
INSERT INTO ProductOrder (Order_idOrder, Product_idProduct, Quantity, `Status`) VALUES
(1, 1, 2, 'Disponivel'),
(1, 2, 1, 'Disponivel'),
(2, 3, 1, 'Disponivel'),
(2, 7, 1, 'Disponivel'),
(3, 4, 1, 'Disponivel'),
(4, 5, 1, 'Disponivel'),
(5, 6, 3, 'Disponivel'),
(6, 7, 2, 'Disponivel'),
(6, 8, 1, 'Disponivel'),
(7, 9, 1, 'Disponivel'),
(8, 10, 1, 'Disponivel'),
(9, 11, 2, 'Disponivel'),
(10, 12, 1, 'Disponivel');

-- ---------------------------
-- Tabela ProductStorage
-- ---------------------------
INSERT INTO ProductStorage (`Local`, Quantity) VALUES
('Rio de Janeiro', 1000),
('São Paulo', 500),
('Brasília', 200),
('Belo Horizonte', 300),
('Curitiba', 150);

-- ---------------------------
-- Tabela ProductStock
-- ---------------------------
INSERT INTO ProductStock (Product_idProduct, ProductStorage_idProductStorage) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5),
(11, 1),
(12, 2);

-- ---------------------------
-- Tabela Supplier
-- ---------------------------
INSERT INTO Supplier (CompanyName, CNPJ) VALUES
('Almeida e Filhos', '12345678912345'),
('Eletrônicos Silva', '85451964914345'),
('Eletrônicos Valma', '93456789393469'),
('Móveis Brasil', '11223344556677'),
('Importadora Kids', '22334455667788');

-- ---------------------------
-- Tabela ProductsSupplier
-- ---------------------------
INSERT INTO ProductsSupplier (Product_idProduct, Supplier_idSupplier) VALUES
(1, 1),
(2, 5),
(3, 5),
(4, 2),
(5, 4),
(6, 1),
(7, 2),
(8, 2),
(9, 4),
(10, 4),
(11, 5),
(12, 5);

-- ---------------------------
-- Tabela ThirdSeller (Vendedores)
-- ---------------------------
INSERT INTO ThirdSeller (BusinessName, TradeName, CNPJ, CPF, Location) VALUES
('Tech Eletronics', NULL, '12345678945632', NULL, 'Rio de Janeiro'),
('Boutique Durgas', NULL, NULL, '123456783', 'Rio de Janeiro'),
('Kids World', NULL, '45678912365448', NULL, 'São Paulo'),
('Game Store SP', NULL, '99887766554433', NULL, 'São Paulo'),
('Mega Moveis RJ', NULL, NULL, '987654321', 'Rio de Janeiro');

-- ---------------------------
-- Tabela ProductsSeller
-- ---------------------------
INSERT INTO ProductsSeller (ThirdSeller_idThirdSeller, Product_idProduct, Quantity) VALUES
(1, 1, 80),
(1, 7, 50),
(2, 3, 30),
(2, 10, 10),
(3, 2, 60),
(3, 11, 25),
(3, 12, 15),
(4, 4, 20),
(4, 8, 10),
(5, 5, 5),
(5, 9, 3);

-- ---------------------------
-- Tabela Delivery
-- ---------------------------
INSERT INTO Delivery (ZIPCode, City, State, Road, Number, neighborhood, StatusDelivery, TrackingCode, TransportBoard, DateDelivery, Order_idOrder) VALUES
('20040002', 'Rio de Janeiro', 'RJ', 'Rua A', 123, 'Centro', 'Em preparação', 'RJ12345BR', 'ABC1D23', '2024-06-15', 1),
('01001000', 'São Paulo', 'SP', 'Av. Paulista', 1500, 'Bela Vista', 'Em rota de entrega', 'SP98765BR', 'DEF4G56', '2024-06-16', 2),
('30110010', 'Belo Horizonte', 'MG', 'Rua das Flores', 77, 'Savassi', 'Entregue', 'MG54321BR', 'HIJ7K89', '2024-06-13', 3),
('80010020', 'Curitiba', 'PR', 'Av. Brasil', 450, 'Centro', 'Aguardando Liberação', 'PR24680BR', 'LMN0P12', NULL, 4),
('60050030', 'Fortaleza', 'CE', 'Rua Mar', 321, 'Meireles', 'Entregue', 'CE13579BR', 'QRS3T45', '2024-06-14', 5),
('70070900', 'Brasília', 'DF', 'Esplanada', 1, 'Plano Piloto', 'Em preparação', 'DF11223BR', 'UVW6X78', NULL, 6),
('88010000', 'Florianópolis', 'SC', 'Av. Beira Mar', 200, 'Centro', 'Entregue', 'SC33445BR', 'YZA9B01', '2024-06-12', 7),
('40020000', 'Salvador', 'BA', 'Rua Oceano', 85, 'Barra', 'Em preparação', 'BA55667BR', 'CDE2F34', NULL, 8),
('64000000', 'Teresina', 'PI', 'Av. Frei Serafim', 98, 'Centro', 'Em rota de entrega', 'PI77889BR', 'GHI5J67', '2024-06-15', 9),
('50030000', 'Recife', 'PE', 'Rua do Sol', 400, 'Boa Vista', 'Entregue', 'PE99001BR', 'KLM8N90', '2024-06-11', 10);

-- ---------------------------
-- Tabela Payment
-- ---------------------------
INSERT INTO Payment (Name, Description, Type) VALUES
('PIX Itau', 'Pagamento via PIX do banco Itaú', 'Pix'),
('Cartão Visa', 'Pagamento no crédito', 'Cartão de Crédito'),
('Boleto Bancário', 'Pagamento via boleto', 'Boleto'),
('Transferência TED', 'Pagamento por TED', 'TED'),
('Dinheiro', 'Pagamento na entrega', 'Dinheiro'),
('Cartão Débito', 'Pagamento no débito', 'Cartão de Débito');

-- ---------------------------
-- Tabela Liberation
-- ---------------------------
INSERT INTO Liberation (Payment_idPayment, Order_idOrder, StatusPayment, DatePayment) VALUES
(1, 1, 'Pedido Pago', '2024-06-14'),
(2, 2, 'Pedido Pago', '2024-06-15'),
(3, 3, 'Aguardando Pagamento', '2024-06-16'),
(4, 4, 'Pedido Pago', '2024-06-13'),
(5, 5, 'Pedido Pago', '2024-06-14'),
(2, 6, 'Pedido Pago', '2024-06-12'),
(1, 7, 'Pedido Pago', '2024-06-14'),
(3, 8, 'Aguardando Pagamento', '2024-06-15'),
(4, 9, 'Pedido Pago', '2024-06-15'),
(5, 10, 'Pedido Pago', '2024-06-11');




-- Querys

select count(*) from client;
select * from Client c, `Order` o where c.idClient = Client_idClient;



select Fname, Lname, idOrder, StatusOrder from Client c, `Order` o where c.idClient = Client_idClient;

select concat(Fname,' ',Lname) as Client, idOrder as Request, StatusOrder as Status from Client c, `Order` o where c.idClient = Client_idClient;

insert into `Order` (idOrder, StatusOrder, Description, Freight, Client_idClient) VALUES
(2,default, 'Compra via aplicativo', NULL, 1);

select count(*) from Client c, `Order` o
where c.idClient = Client_idClient;

select * from `Order`;

-- recuperação de pedido com produto associado -- arrrumnarex
select * from Client c
inner join `Order` o ON c.idClient = o.Client_idClient
inner join ProductOrder p on p.Order_idOrder = o.idOrder;

-- Recuperar quantos pedidos foram realizados pelos clientes?
select c.idClient, Fname, count(*) as Number_of_orders from Client c
inner join `Order` o ON c.idClient = o.Client_idClient
group by idClient;


------------------------------------------------------------
-------------------- QUERYS DESAFIO ------------------------
------------------------------------------------------------

-- Quantos pedidos foram feitos por cada cliente?
select concat(Fname,' ',Lname) as Cliente, count(*) as Quantidade_de_Pedidos
from Client c, `Order` o
where c.idClient=o.Client_idClient
group by Cliente;

-- Algum vendedor também é fornecedor?
Select BusinessName as Razão_Social, TradeName as Nome_Fantasia, s.CNPJ
from ThirdSeller c, Supplier s
where c.CNPJ=s.CNPJ;

-- Relação de produtos fornecedores e estoques;
Select CompanyName, CNPJ, Pname as Nome_Produto, Category, Quantity
from Supplier s join ProductsSupplier d on s.idSupplier=d.Supplier_idSupplier
				join Product p on p.idProduct=d.Product_idProduct
                join ProductStock l on l.Product_idProduct=p.idProduct
                join ProductStorage k on k.idProductStorage=l.ProductStorage_idProductStorage;

-- Relação de nomes dos fornecedores e nomes dos produtos;
Select CompanyName, Pname as Nome_Produto
from Supplier s join ProductsSupplier d on s.idSupplier=d.Supplier_idSupplier
				join Product p on p.idProduct=d.Product_idProduct;

-- 🔍 Recuperações Simples — SELECT Statement
-- Fácil: Quais são os nomes de todos os produtos cadastrados?
select Pname as Name_Product
from Product;

-- Intermediária: Quais são os nomes dos clientes e seus CPFs?
select concat(Fname,' ', Minit,' ',Lname) as Complete_Name, CPF
FROM Client;

-- Difícil: Liste o nome dos produtos, sua categoria e avaliação, juntamente com o nome do fornecedor que fornece cada produto.
Select Pname as Product_Name, Category, Assessment, CompanyName as Supplier
from Product p join ProductsSupplier k on p.idProduct=k.Product_idProduct
			   join Supplier s on s.idSupplier=k.Supplier_idSupplier;

-- 🎯 Filtros — WHERE Statement
-- Fácil: Quais produtos pertencem à categoria 'Eletronico'?
Select Pname as Product_Name, Category
from Product
where Category='Eletronico';

-- Intermediária: Quais pedidos estão com o status 'Processando'?
select idOrder, Pname as Product_Name, `Description`, StatusOrder as Status_Order
from `Order` o join ProductOrder k on o.idOrder=Order_idOrder
			   join Product p on p.idProduct=Product_idProduct
where StatusOrder='Processando';

-- Difícil: Quais clientes nasceram depois do ano 2000 e possuem pedidos em andamento?
select concat(Fname,' ', Minit,' ',Lname) as Complete_Name, idOrder, Pname as Product_Name, `Description`, StatusOrder as Status_Order
from `Order` o join ProductOrder k on o.idOrder=Order_idOrder
			   join Product p on p.idProduct=Product_idProduct
               join Client c on c.idClient=o.Client_idClient
where StatusOrder='Em andamento' and YEAR(Date_nasc) > 2000;

-- ➕ Expressões para Atributos Derivados — Campos Calculados
-- Fácil: Liste o nome dos produtos e o valor acrescido de 10% (simular imposto).
Select Pname as Product_Name, round(Value*1.10,2) as Tax_Value
FROM Product;

-- Intermediária: Liste o nome dos clientes e a idade de cada um.
Select concat(Fname,' ', Minit,' ',Lname) as Complete_Name, (YEAR(CURDATE()) - YEAR(Date_nasc)) AS Approximate_Age
from Client;

-- Difícil: Liste cada pedido mostrando o valor total considerando o preço do produto vezes a quantidade (valor total do pedido).
select idOrder, `Description`, round(sum(K.Quantity*p.Value),2) as Total_Value_Order
from `Order` o join ProductOrder k on o.idOrder=k.Order_idOrder
			   join Product p on p.idProduct=k.Product_idProduct
group by idOrder;

-- 📑 Ordenação — ORDER BY
-- Fácil: Liste os produtos ordenados pelo nome em ordem alfabética.
select Pname as Product_Name
from Product
order by Product_Name asc;

-- Intermediária: Liste os clientes ordenados pela data de nascimento (do mais novo para o mais velho).
select concat(Fname,' ', Minit,' ',Lname) as Complete_Name, Date_nasc
from Client
Order by Date_nasc desc; 

-- Difícil: Liste os pedidos ordenados pelo status (alfabeticamente) e, dentro de cada status, pelo valor do frete em ordem decrescente.
select idOrder, `Description`, StatusOrder, Freight
from `Order`
order by StatusOrder asc, Freight asc;

-- 🗂️ Agrupamento — GROUP BY
-- Fácil: Quantos pedidos cada cliente realizou?
select c.idClient, concat(Fname,' ', Minit,' ',Lname) as Complete_Name, count(*) as Quant_Order
from Client c join `Order` o on c.idClient=o.Client_idClient
group by c.idClient, Complete_Name;

-- Intermediária: Quantos produtos existem em cada categoria?
select Category, count(*) as Quant_Product
from Product
group by Category;

-- Difícil: Quantas unidades de cada produto foram vendidas, considerando todos os pedidos?
select Pname as Product_Name, sum(Quantity) as Quantity_Sale
from Product p join ProductOrder o on p.idProduct=o.Product_idProduct
group by Product_Name;

-- 🔍 Filtro em Grupos — HAVING Statement
-- Fácil: Liste os clientes que fizeram mais de 1 pedido.
select c.idClient, concat(Fname,' ', Minit,' ',Lname) as Complete_Name, count(*) as Quant_Order
from Client c join `Order` o on c.idClient=o.Client_idClient
group by c.idClient, Complete_Name
having Quant_Order>1;

-- Intermediária: Liste as categorias de produtos que possuem mais de 2 produtos cadastrados.
select Category, count(*) as Quant_Product
from Product
group by Category
having Quant_Product>2;

-- Difícil: Quais produtos tiveram mais de 3 unidades vendidas no total?
select Pname as Product_Name, sum(K.Quantity)as Total_Sale
from ProductOrder k join Product p on p.idProduct=k.Product_idProduct
group by Product_Name
having Total_Sale>3;

-- 🔗 Junções — JOIN entre Tabelas
-- Fácil: Liste o nome dos clientes junto com seus pedidos.
select c.idClient, concat(Fname,' ', Minit,' ',Lname) as Complete_Name, `Description`, StatusOrder
from Client c join `Order` o on c.idClient=o.Client_idClient;

-- Intermediária: Liste os pedidos com os nomes dos produtos comprados e a quantidade de cada um.
select idOrder, `Description`,  Pname as Product_Name, Quantity
from `Order` o join ProductOrder k on o.idOrder=k.Order_idOrder
			   join Product p on p.idProduct=k.Product_idProduct;

-- Difícil: Liste o nome dos clientes, os produtos comprados, o nome do fornecedor de cada produto e o status da entrega de cada pedido.
select idOrder, concat(Fname,' ', Minit,' ',Lname) as Complete_Name, Pname as Product_Name, CompanyName as Name_Supplier, StatusDelivery
from Client c join  `Order` o on c.idClient=o.Client_idClient
			  join ProductOrder k on k.Order_idOrder=o.idOrder
              join Product p on p.idProduct=k.Product_idProduct
              join ProductsSupplier s on s.Product_idProduct=p.idProduct
              join Supplier v on s.Supplier_idSupplier=v.idSupplier
              join Delivery d on d.Order_idOrder=o.idOrder;



