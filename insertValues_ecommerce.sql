insert into Cliente (Nome, PrimeiroNome, NomeMeioInicial, Sobrenome, Endereco, TipoCliente, CPFCNPJ, 
			DataNascimento) values
            ('Maria Joana R Silva', 'Maria', 'R', 'Silva', 'Rua Mecanico', 'PF', '12304516658', '1987-01-01'),
            ('Matheus O Pimentel', 'Matheus', 'O', 'Pimentel', 'Rua Encanador', 'PF', '12304513258', '1989-10-01'),
            ('Ana Carolina R Silva', 'Ana', 'R', 'Silva', 'Rua Wander Costa', 'PF', '11404818600', '1995-12-31'),
            ('Roberta G Assis', 'Roberta', 'G', 'Assis', 'Avenida Liberdade', 'PJ', '12304516000190', '2000-01-25');

insert into Produto (PrimeiroNome, Categoria, Descricao, Valor, Avaliacao)
			values 	('Fone', 'Eletrônico', 'Fone de Ouvido JBL', '450.99', 9.8),
					('Barbie', 'Brinquedos', 'Coleção Barbie', '99.99', 10),
					('Body', 'Vestuário', 'Body Carters', '24.99', 6.0),
					('Sofá', 'Móveis', 'Sofá Retrátil', '5899.99', 8.7);
                    
select * from Cliente;
select * from Produto;

insert into Pedido (idCliente, StatusPedido, Descricao, Frete) 
		values 	(1,'Em Andamento', 'Compra via APP', 28.9),
				(2, 'Em Andamento', 'Compra via site', 95.1),
				(3, 'Em Andamento', 'Compra na loja', 0);
                
select * from Pedido;

insert into ProdutoPedido (idProduto, idPedido, QuantidadeProduto, Status)
		values 	(5, 1, 3, null),
				(6, 1, 1, null),
                (7, 2, 5, null),
                (8, 3, 1, null);
                

select * from ProdutoPedido;

insert into Vendedor (TipoVendedor, RazaoSocial, CPFCNPJ, Local, NomeFantasia)
			values 	('PF', 'João Almeida Borges', '11122244467', 'Uberlândia', 'João Vendedor'),
					('PF', 'Mariana Silva Maria', '11133247467', 'Uberaba', 'Mariana Vendedora'),
                    ('PJ', 'Nunes Vendas', '11122244467231', 'Divinópolis', 'Vende Mais');
                    
select * from Vendedor;

insert into ProdutoVendedor (idVendedor, idProduto, Quantidade)
			values 	(1, 5, 80),
					(2, 6, 108),
                    (3, 8, 20);
                    
select count(*) from Cliente;
select * from Cliente c, Pedido p where c.idCliente = p.idCliente;

select PrimeiroNome, Sobrenome, idPedido, StatusPedido 
from Cliente c, Pedido p
where c.idCliente = p.idCliente; 

select * from Cliente c inner join Pedido p on c.idCliente = p.idCliente
						inner join ProdutoPedido pr on pr.idPedido = pr.idPedido
                        inner join Produto pro on pro.idProduto = pr.idProduto;
                        
select c.idCliente, Nome, count(*) as NumeroPedido 
from Cliente c 
inner join Pedido p on c.idCliente = p.idCliente
group by idCliente;

select c.idCliente, Nome, count(*) as NumeroPedido 
from Cliente c 
inner join Pedido p on c.idCliente = p.idCliente
group by idCliente
having count(*) = 1;

insert into Pagamento (idCliente, TipoPagamento, ValorPagamento)
			values 	(1, 'Boleto', 24.9),
					(1, 'Dois Cartões', 245.9),
                    (2, 'Cartão', 224.9),
                    (3, 'Boleto', 25.9),
                    (3, 'Cartão', 298.9);


select c.idCliente, count(distinct TipoPagamento) as TipoPagamento 
from Cliente c
inner join Pagamento pag on c.idCliente = pag.idCliente
group by c.idCliente
having TipoPagamento > 1;