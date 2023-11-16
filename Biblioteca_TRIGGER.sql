create database Biblioteca;
use Biblioteca;

create table Livros (
	Id_Livro int primary key auto_increment,
    Titulo varchar (100) not null,
    Autor varchar (100) not null,
    Quantidade_estoque int not null
);

create table Emprestimos (
	Id_Emprestimo int primary key auto_increment,
    Data_emprestimo datetime not null,
    Data_devolucao datetime not null,
    LivroID int not null,
    foreign key (LivroID) references Livros (Id_Livro)
);

DELIMITER //
	create trigger atualizar_estoque
    after insert on Emprestimos
    for each row
    begin update Livros set Quantidade_estoque = Quantidade_estoque - 1
    where Id_Livro = new.LivroID;
END;
//
DELIMITER ;

insert into Livros (Titulo, Autor, Quantidade_estoque) 
values ('Mundo Estranho','Reis Quinn','100'),
('Contos do Fogo','Stela Bispo','50');

insert into Emprestimos (Data_Emprestimo, Data_devolucao, LivroID)
values ('2023-11-15 10:00:00','2023-12-10 14:00:00','1'),
('2023-11-15 21:00:00','2023-12-05 14:00:00','2');

select * from Livros;