create database RelatorioPagamento;
use RelatorioPagamento;

create table Clientes (
    Id_cliente int primary key auto_increment,
    Nome varchar(100) not null,
    Endereco varchar(100),
    Cidade varchar(100) not null
);

create table Pagamentos (
    Id_pagamento int primary key auto_increment,
    Id_cliente int,
    Data_pagamento date not null,
    Valor_pagamento decimal(10, 2) not null,
    foreign key (Id_cliente) references Clientes(Id_cliente)
);

insert into Clientes (Nome, Endereco, Cidade) values
('Gabriela', 'A', 'São Paulo'),
('Kaua', 'B', 'Rio de Janeiro'),
('Rosario', 'C', 'Salvador'),
('Bianca', 'D', 'Belo Horizonte');

insert into Pagamentos (Id_cliente, Data_pagamento, Valor_pagamento) values
(1, '2023-11-16', 1000.00),
(2, '2023-11-16', 250.35),
(3, '2023-11-16', 400.15),
(4, '2023-11-26', 70.00);

create view relatorio_pagamentos_cidade as
select c.Cidade as nome_cidade,
sum(p.Valor_pagamento) as valor_total_pagamentos
from Clientes c
join Pagamentos p on c.Id_cliente = p.Id_cliente
group by c.Cidade;

select * from relatorio_pagamentos_cidade;