-- Criação do banco de dados E-commerce
-- drop database ecommerce;
create database if not exists ecommerce;
use ecommerce;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Client`(
	idClient INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Fname VARCHAR(10) NOT NULL,
	Minit CHAR(3) NULL,
	Lname VARCHAR(20) NULL COMMENT 'Adicionar constraint de unicidade para (nome completo)\nunique (Nome, M, Sobrenome)',
	CPF CHAR(11) NOT NULL,
    Address VARCHAR(100) NULL comment 'Atributo composto por rua, bairro, complemento, cidade e estado - pode atributo unico ou separado, mas o correto em produção é separado',
    Date_nasc DATE NOT NULL,
    constraint unique_cpf_cliente unique(CPF)
);
alter table Client auto_increment=1;

-- desc client;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Order`(
  idOrder INT NOT NULL AUTO_INCREMENT,
  StatusOrder ENUM('Em andamento', 'Processando', 'Enviado', 'Entregue') DEFAULT 'Processando',
  `Description` VARCHAR(45) NULL,
  Freight FLOAT NULL, -- freight é frete em ingles
  Client_idClient INT NOT NULL,
  PRIMARY KEY (idOrder),
  -- INDEX fk_Order_Client_idx` (Client_idClient ASC) VISIBLE,   -- Serve para deixar mais rápidas as buscas, consultas e relacionamentos que usam essa coluna.
  CONSTRAINT fk_Order_Client FOREIGN KEY (Client_idClient) REFERENCES Client (idClient)
	on update cascade
);

alter table `Order` auto_increment=1;

-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Product(
  idProduct INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Pname varchar (45) not null,
  Classification_Kids bool default false,
  Category Enum('Eletronico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
  Assessment float default 0 comment 'assessment é avaliação',
  Size varchar(10), -- size=dimensão do produto
  `Value` float -- Valor do Produto
 );
alter table Product auto_increment=1;

-- -----------------------------------------------------
-- Table `mydb`.`Relação de Produto/Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ProductOrder (
  Order_idOrder INT NOT NULL,
  Product_idProduct INT NOT NULL,
  Quantity INT NOT NULL,
  `Status` ENUM('Disponivel', 'Sem estoque') NULL DEFAULT 'Disponivel',
  PRIMARY KEY (Order_idOrder, Product_idProduct),
  CONSTRAINT fk_Order_has_Produto_Order1 FOREIGN KEY (Order_idOrder) REFERENCES `Order` (idOrder),
  CONSTRAINT fk_Order_has_Product_Product1 FOREIGN KEY (Product_idProduct) REFERENCES Product (idProduct)
);

-- -----------------------------------------------------
-- Table `mydb`.`Terceiro - Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ThirdSeller(
  idThirdSeller INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  BusinessName VARCHAR(45) NOT NULL,
  Location VARCHAR(45),
  TradeName VARCHAR(45), -- Nome Fantasia
  CNPJ char(15),
  CPF char(9),
  CONSTRAINT unique_ThirdSeller_CNPJ UNIQUE (CNPJ),
  CONSTRAINT unique_ThirdSeller_CPF UNIQUE (CPF)
  );
alter table ThirdSeller auto_increment=1;

-- -----------------------------------------------------
-- Table `mydb`.`Produtos por Vendedor(Terceiro)`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ProductsSeller(
  ThirdSeller_idThirdSeller INT NOT NULL,
  Product_idProduct INT NOT NULL,
  Quantity INT NOT NULL,
  PRIMARY KEY (ThirdSeller_idThirdSeller, Product_idProduct),
  CONSTRAINT fk_ThirdSeller_has_Product_ThirdSeller1 FOREIGN KEY (ThirdSeller_idThirdSeller) REFERENCES ThirdSeller (idThirdSeller),
  CONSTRAINT fk_ThirdSeller_has_Product_Product1 FOREIGN KEY (Product_idProduct) REFERENCES Product (idProduct)
);


-- -----------------------------------------------------
-- Table `mydb`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Supplier(
  idSupplier INT AUTO_INCREMENT NOT NULL primary key,
  CompanyName VARCHAR(45) NOT NULL,
  CNPJ VARCHAR(15) NOT NULL,
  constraint unique_Supplier unique (CNPJ)
  );
alter table Supplier auto_increment=1;

-- -----------------------------------------------------
-- Table `mydb`.`Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ProductStorage(
  idProductStorage INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  `Local` VARCHAR(45) NOT NULL,
  Quantity INT NOT NULL DEFAULT 0
);
alter table ProductStorage auto_increment=1;

-- -----------------------------------------------------
-- Table `mydb`.`Produto_em_Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ProductStock(
  Product_idProduct INT NOT NULL,
  ProductStorage_idProductStorage INT NOT NULL,
  PRIMARY KEY (Product_idProduct, ProductStorage_idProductStorage),
  CONSTRAINT fk_ProductStock_Product1 FOREIGN KEY (Product_idProduct) REFERENCES Product (idProduct),
  CONSTRAINT fk_ProductStock_ProductStorage1 FOREIGN KEY (ProductStorage_idProductStorage) REFERENCES ProductStorage (idProductStorage)
);


-- -----------------------------------------------------
-- Table `mydb`.`Produto_Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ProductsSupplier(
  Product_idProduct INT NOT NULL,
  Supplier_idSupplier INT NOT NULL,
  PRIMARY KEY (Product_idProduct, Supplier_idSupplier),
  CONSTRAINT fk_Product_has_Supplier_Product1 FOREIGN KEY (Product_idProduct) REFERENCES Product (idProduct),
  CONSTRAINT fk_Product_has_Supplier_Supplier1 FOREIGN KEY (Supplier_idSupplier) REFERENCES Supplier (idSupplier)
);


-- -----------------------------------------------------
-- Table `mydb`.`Entrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Delivery(
  idDelivery INT AUTO_INCREMENT NOT NULL,
  ZIPCode CHAR(8) NOT NULL,
  City VARCHAR(15) NOT NULL,
  State VARCHAR(20) NOT NULL,
  Road VARCHAR(100) NULL,
  `Number` INT NULL,
  neighborhood VARCHAR(45) NULL, -- neighborhood é bairro em ingles
  StatusDelivery ENUM('Aguardando Liberação', 'Em preparação', 'Em rota de entrega', 'Entregue') NOT NULL,
  TrackingCode VARCHAR(45) NULL,
  TransportBoard CHAR(7) NOT NULL,
  DateDelivery DATE NULL,
  Order_idOrder INT NOT NULL,
  PRIMARY KEY (idDelivery),
  CONSTRAINT fk_Delivery_Order1 FOREIGN KEY (Order_idOrder) REFERENCES `Order` (idOrder)
);
alter table Delivery auto_increment=1;

-- -----------------------------------------------------
-- Table `mydb`.`Forma de Pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Payment(
  idPayment INT AUTO_INCREMENT NOT NULL primary key,
  Name VARCHAR(45) NOT NULL,
  `Description` VARCHAR(45) NULL,
  Type ENUM('Pix', 'Dinheiro', 'Boleto', 'TED', 'Cartão de Crédito', 'Cartão de Débito') NOT NULL
);
alter table Payment auto_increment=1;

-- -----------------------------------------------------
-- Table `mydb`.`Liberação`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Liberation (
  Payment_idPayment INT NOT NULL,
  Order_idOrder INT NOT NULL,
  StatusPayment ENUM('Aguardando Pagamento', 'Pedido Pago') NOT NULL,
  DatePayment DATE NOT NULL,
  PRIMARY KEY (Payment_idPayment, Order_idOrder),
  CONSTRAINT fk_Payment_has_Order_Payment1 FOREIGN KEY (Payment_idPayment) REFERENCES Payment (idPayment),
  CONSTRAINT fk_Payment_has_Order_Order1 FOREIGN KEY (Order_idOrder) REFERENCES `Order` (idOrder)
);


--
--
--
/*
show tables;
show databases;
use information_schema;
show tables;
desc table_constraints;
desc referential_constraints;

select * from referential_constraints where constraint_schema='ecommerce';
*/