create database RelatorioVenda;
use RelatorioVenda;

create table Funcionarios (
	Id_funcionario int auto_increment primary key,
    Nome varchar (50) not null,
    Cargo varchar (40) not null,
	Salario decimal (10, 2) not null
);

create table Vendas (
	Id_venda int auto_increment primary key,
    Data_venda datetime not null,
    Valor_venda decimal (10, 2),
    Funcionarioid int, 
    foreign key(Funcionarioid) references Funcionarios(Id_funcionario)
);

insert into Funcionarios (Nome, Cargo, Salario) values
('Bianca', 'Vendedora 1', 1250.00),
('Carla', 'Gerente', 3700.89),
('Dima', 'Vendedora 2', 1250.05),
('Marcos', 'Coordenador', 4781.45);

insert into Vendas (Data_venda, Valor_venda, Funcionarioid) values
('2023-08-11', 800.30, 1),
('2023-01-28', 1200.10, 2),
('2023-03-14', 600.50, 3),
('2023-10-12', 1500.25, 4);

create view relatorio_vendas_funcionario as 
select f.Nome as nome_funcionario,
count(v.Id_venda) as numero_vendas,
sum(v.Valor_venda) as valor_total
from  Vendas v
join Funcionarios f on f.Id_funcionario = v.Funcionarioid
group by f.Id_funcionario, f.Nome;

select * from relatorio_vendas_funcionario;