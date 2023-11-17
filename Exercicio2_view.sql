create database Estoque;
use Estoque;

create table Produtos (
	Id_produto int primary key auto_increment,
    Nome varchar (50) not null,
    Preco_unitario decimal (10, 2) not null,
    Categoria varchar (50) not null
);

create table Estoque (
	Quantidade int  not null,
    Produtoid int,
    foreign key(Produtoid) references Produtos(Id_produto)
);

create view estoque_critico as 
select p.Nome as nome_produto, e.Quantidade as quantidade_estoque
from Produtos p
join Estoque e on p.Id_produto = e.Produtoid
where e.Quantidade < 100; 

insert into Produtos (Nome, Preco_unitario, Categoria)  values
('Webcam Logitech', 530.50, 'Eletrônico'),
('Base Boca Rosa', 54.50, 'Cuidado e Pele'),
('Tapete', 129.90, 'Casa'),
('Ração Golden 1kg', 32.00, 'Pet');

insert  into Estoque (Quantidade, Produtoid) values
(150, 1),
(200, 2),
(20, 3),
(101, 4);

select * from estoque_critico;