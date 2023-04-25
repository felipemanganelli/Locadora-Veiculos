-- CURSOR
DELIMITER //
CREATE PROCEDURE listar_locacoes()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE cliente_nome VARCHAR(100);
    DECLARE veiculo_placa VARCHAR(7);
    DECLARE locacao_data DATE;
    DECLARE cur CURSOR FOR 
        SELECT c.nome, v.placa, l.data_locacao 
        FROM clientes c 
        JOIN locacoes l ON c.id_cliente = l.id_cliente 
        JOIN veiculos v ON l.id_veiculo = v.id_veiculo;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO cliente_nome, veiculo_placa, locacao_data;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT CONCAT('Cliente: ', cliente_nome, ' | Placa do veículo: ', veiculo_placa, ' | Data da locação: ', locacao_data);
    END LOOP;

    CLOSE cur;
END//
DELIMITER ;

-- CALL listar_locacoes();
