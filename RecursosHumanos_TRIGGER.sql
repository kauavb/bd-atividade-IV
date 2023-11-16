create database RecursosHumanos;
use RecursosHumanos;

CREATE TABLE Funcionarios (
    Id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Data_admissao DATE
);

DELIMITER //
	CREATE TRIGGER checar_data_admissao
		BEFORE INSERT ON funcionarios
		FOR EACH ROW
			BEGIN
				IF NEW.data_admissao <= CURDATE() THEN
				SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Data de admissão não pode ser igual a data atual. Tente Novamente';
				END IF;
		END;
//
DELIMITER ;

INSERT INTO Funcionarios (Nome, Data_admissao)
VALUES ('Kaua', '2023-11-16'); 

SELECT * FROM Funcionarios;
