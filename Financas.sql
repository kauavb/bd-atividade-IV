create database Financas;
use Financas;

create table Contas (
	Id_conta int primary key auto_increment,
    Nome varchar (100) not null,
    Saldo decimal(10,2) not null
);

create table Transacoes (
	Id_transacao int primary key auto_increment,
    Tipo varchar (100) not null,
    Valor decimal(10,2) not null,
    ContaID int not null,
    foreign key (ContaID) references Contas (Id_conta)
);

DELIMITER //
	create trigger atualizar_saldo
	after insert on Transacoes
	for each row
	begin
		if new.Tipo = 'Entrada' then
			update Contas
			set Saldo = Saldo + new.Valor
			where Id_conta = ContaID;
		end if;
		if new.Tipo = 'Saida' then
			update Contas
			set Saldo = Saldo - new.Valor
			where Id_conta = ContaID;
		end if;
end;
//
insert into Contas (Nome, Saldo) 
values ('Isabel Dias', '2000.00');

insert into Transacoes (Tipo, Valor, ContaID)
values ('Entrada', '200.00', 1);



drop database Financas;