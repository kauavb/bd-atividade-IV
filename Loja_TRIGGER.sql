create database Loja;
use Loja;

create table Produtos (
    Id_produto int primary key auto_increment,
    Nome varchar(255) not null,
    Quantidade_estoque int not null
);

create table Vendas (
    Id_venda int primary key auto_increment,
    Data_venda datetime not null
);

create table Itens_venda (
    Id_item_venda int primary key,
    Id_venda int not null,
    Id_produto int not null,
    Quantidade int not null,
    foreign key (id_venda) references vendas(id_venda),
    foreign key (id_produto) references produtos(id_produto)
);

delimiter //
create trigger verificar_estoque
before insert on Itens_venda
for each row
begin
    declare estoque_disponivel int;

    -- Obtém a quantidade em estoque do produto correspondente
    select Quantidade_estoque into estoque_disponivel
    from Produtos
    where Id_produto = new.Id_produto;

    -- Verifica se a quantidade em estoque é suficiente
    if estoque_disponivel < new.Quantidade then
        signal sqlstate '45000'
        set message_text = 'Produto está fora de estoque. Quantidade disponível: ' || cast(estoque_disponivel as char);
    end if;
end;
//
delimiter ;

insert into Produtos (Nome, Quantidade_estoque) values ('Make Boca Rosa', 20);
insert into Vendas (Data_venda) values ('2023-11-16 20:00:00');
insert into Itens_venda (Id_venda, Id_produto, Quantidade) values (1, 1, 25);