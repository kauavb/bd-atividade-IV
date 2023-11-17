create database Pedido;
use Pedido;

create table Clientes (
	Id_cliente int primary key auto_increment not null,
    Nome varchar (100) not null,
    Email varchar (100) not null unique,
    Telefone varchar (100) not null unique
);

create table Pedidos (
    Id_pedidos int primary key auto_increment,
    Data_pedido datetime not null,
    Valor_total decimal(10, 2) not null,
    Clienteid int not null,
    foreign key (Clienteid) references Clientes(Id_cliente)
);

insert into Clientes(Nome, Email, Telefone) values 
('Robeert', 'robs@gmail.com', '(71)5485-4441'),
('Sasha', 'saha@gmail.com', '(81)25685-1346'),
('Pedros', 'pepe@gmail.com', '(64)31588-1118'),
('Gabriel', 'gabriel@gmail.com', '(75)94591-1546');

insert into Pedidos (Data_pedido, Valor_total, Clienteid) values 
('2023/07/22', 12.05, 2),
('2023/02/12', 99.99, 1),
('2023/03/15', 49.50, 3),
('2023/12/01', 70.52, 4);

create view relatorio_pedidos_clientes as 
select c.Nome as nome_cliente, c.Id_cliente, COUNT(p.Id_pedidos) as num_pedidos, 
sum(p.Valor_total) as t_gasto from Clientes c
join Pedidos p on  c.Id_cliente = p.Clienteid
group by c.Id_cliente, c.Nome;


select * from relatorio_pedidos_clientes;