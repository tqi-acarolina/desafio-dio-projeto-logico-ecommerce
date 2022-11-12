-- Criação do banco de dados para o cenário de e-commerce

create database ecommerce;
use ecommerce;

-- Criação da tabela Cliente

CREATE TABLE IF NOT EXISTS Cliente (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NULL,
  `PrimeiroNome` VARCHAR(10) NOT NULL,
  `NomeMeioInicial` VARCHAR(3) NULL,
  `Sobrenome` VARCHAR(20) NULL COMMENT 'Adicionar constraint de unicidade para (Nome Completo)\nUnique (PrimeiroNome, NomeMeio_Inicial, Sobrenome)',
  `Endereco` VARCHAR(45) NULL,
  `TipoCliente` VARCHAR(45) NULL,
  `CPFCNPJ` CHAR(14) NULL,
  `DataNascimento` DATE NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;

-- Criação da tabela Produto 

CREATE TABLE IF NOT EXISTS Produto (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `PrimeiroNome` VARCHAR(10) NOT NULL, 
  `Categoria` ENUM('Eletrônico', 'Vestuário', 'Brinquedos', 'Alimentos', 'Móveis') NOT NULL,
  `Descricao` VARCHAR(45) NULL,
  `Valor` VARCHAR(45) NOT NULL,
  `Avaliacao` FLOAT DEFAULT 0,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;
SHOW TABLES;
-- Criação da tabela Pedido

CREATE TABLE IF NOT EXISTS `ecommerce`.`Pedido` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `StatusPedido` ENUM('Em Andamento', 'Processando', 'Enviado', 'Entregue') NULL DEFAULT 'Processando',
  `Descricao` VARCHAR(45) NULL,
  `idCliente` INT NOT NULL,
  `Frete` FLOAT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_Pedido_Cliente1_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `ecommerce`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- Criação da tabela Estoque
CREATE TABLE IF NOT EXISTS `ecommerce`.`Estoque` (
  `idEstoque` INT NOT NULL,
  `Local` VARCHAR(45) NULL,
  `Quantidade` FLOAT NOT NULL DEFAULT 0,
  PRIMARY KEY (`idEstoque`))
ENGINE = InnoDB;

-- Criação da tabela Fornecedor
CREATE TABLE IF NOT EXISTS `ecommerce`.`Fornecedor` (
  `idFornecedor` INT AUTO_INCREMENT NOT NULL,
  `RazaoSocial` VARCHAR(255) NULL,
  `CNPJ` CHAR(14) NOT NULL,
  CONSTRAINT FORNECEDOR_UNICO UNIQUE (`CNPJ`),
  PRIMARY KEY (`idFornecedor`))
ENGINE = InnoDB;


-- Criação da tabela Vendedor
CREATE TABLE IF NOT EXISTS `ecommerce`.`Vendedor` (
  `idVendedor` INT AUTO_INCREMENT NOT NULL,
  `TipoVendedor` ENUM('PJ', 'PF') NOT NULL,
  `RazaoSocial` VARCHAR(45) NOT NULL,
  `CPFCNPJ` VARCHAR(14) NOT NULL,
  `Local` VARCHAR(45) NULL,
  `NomeFantasia` VARCHAR(45) NOT NULL,
  CONSTRAINT CPFCNPJ_UNICO UNIQUE(`CPFCNPJ`),
  PRIMARY KEY (`idVendedor`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`ProdutoVendedor` (
  `idVendedor` INT NOT NULL,
  `idProduto` INT NOT NULL,
  `Quantidade` INT NULL,
  PRIMARY KEY (`idVendedor`, `idProduto`),
  INDEX `fk_Vendedor_has_Produto_Produto1_idx` (`idProduto` ASC) VISIBLE,
  INDEX `fk_Vendedor_has_Produto_Vendedor1_idx` (`idVendedor` ASC) VISIBLE,
  CONSTRAINT `fk_Vendedor_has_Produto_Vendedor1`
    FOREIGN KEY (`idVendedor`)
    REFERENCES `ecommerce`.`Vendedor` (`idVendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vendedor_has_Produto_Produto1`
    FOREIGN KEY (`idProduto`)
    REFERENCES `ecommerce`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`ProdutoPedido` (
  `idProduto` INT NOT NULL,
  `idPedido` INT NOT NULL,
  `QuantidadeProduto` VARCHAR(45) NOT NULL,
  `Status` ENUM('Disponível', 'Sem Estoque') NULL DEFAULT 'Disponível',
  PRIMARY KEY (`idProduto`, `idPedido`),
  INDEX `fk_Produto_has_Pedido_Pedido1_idx` (`idPedido` ASC) VISIBLE,
  INDEX `fk_Produto_has_Pedido_Produto1_idx` (`idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Pedido_Produto1`
    FOREIGN KEY (`idProduto`)
    REFERENCES `ecommerce`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Pedido_Pedido1`
    FOREIGN KEY (`idPedido`)
    REFERENCES `ecommerce`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- Criação tabela Pagamento 
CREATE TABLE IF NOT EXISTS `ecommerce`.`Pagamento` (
	`idCliente` INT NOT NULL,
	`idPagamento` INT AUTO_INCREMENT NOT NULL,
	`TipoPagamento` ENUM('Boleto', 'Cartão', 'Dois Cartões'),
	`ValorPagamento` DOUBLE NULL,
  PRIMARY KEY (`idPagamento`, `idCliente`),
  FOREIGN KEY (`idCliente`)
    REFERENCES `ecommerce`.`Cliente` (`idCliente`)
 )
ENGINE = InnoDB;


show tables;

show databases;

use information_schema;
show tables;

-- Inserção de dados e queries
use ecommerce;
show tables;

