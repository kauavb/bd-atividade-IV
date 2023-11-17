create database RelatorioProduto;
use RelatorioProduto;

create table Categorias (
	Id_categoria int primary key auto_increment,
    Nome_categoria varchar (30) not null,
	Descricao varchar(255) not null
);

create table Produtos (
	Id_produto int primary key auto_increment,
    Nome varchar(30) not null,
    Preco_unitario decimal (10, 2)not null,
    Categoriaid int,
    foreign key(Categoriaid) references Categorias(Id_categoria)
);

create view relatorio_produtos_categoria as 
select c.Nome_categoria as nome,
count(p.Id_produto) as quantidade_produto
from Categorias c
join Produtos p on c.Id_categoria = p.Categoriaid
group by c.Id_categoria;

insert into Categorias (Nome_categoria, Descricao) values
('Casa', 'Diversos utensilios para sua casa'),
('Pet', 'Utensílios e comidas para pet'),
('Gamer', 'Turbine seu pc gamer'),
('Calçados', 'Calçados para todas as ocasiões');

insert into Produtos (Nome, Preco_unitario, Categoriaid) values
('Vassoura', 20.99, 1),
('Vasilha de Racao', 39.90, 2),
('Geforce 2060', 1558.75, 3),
('Tênis', 178.50, 4);

select * from relatorio_produtos_categoria;
