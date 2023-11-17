create database GerenciamentoAluno;
use GerenciamentoAluno;

create table Alunos (
    Id_aluno int primary key auto_increment,
    Nome varchar(100) not null,
    Data_nascimento date,
    Serie int not null
);

create table Matriculas (
    Id_matricula int primary key auto_increment,
    Id_aluno int,
    Data_matricula date,
    Status varchar(50),
    foreign key (Id_aluno) references Alunos(Id_aluno)
);

delimiter //

create trigger tr_verificar_idade_serie
before insert on Matriculas
for each row
begin
    declare Idade_aluno int;

    select TIMESTAMPDIFF(YEAR, a.Data_nascimento, CURDATE())
    into Idade_aluno
    from Alunos a
    where a.Id_aluno = NEW.Id_aluno;

    if Idade_aluno < NEW.Serie + 5 then
        signal sqlstate '45000'
        set message_text = 'Erro: O aluno não atende aos requisitos de idade para a série.';
    end if;
end;
//

delimiter ;


insert into Alunos (Nome, Data_nascimento, Serie) values
('Gabi', '2005-10-11', 5);


insert into matriculas (id_aluno, data_matricula, status) values
(1, '2023-01-25', 'Corrente');

drop database GerenciamentoAluno;