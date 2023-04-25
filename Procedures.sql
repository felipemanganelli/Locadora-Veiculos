-- PROCEDURES

DELIMITER //
CREATE PROCEDURE listar_locacoes_por_cliente(IN cliente_id INT)
BEGIN
    SELECT 
        l.id_locacao,
        v.modelo,
        v.marca,
        v.placa,
        l.data_locacao,
        l.data_entrega,
        p.tipo_multa,
        p.data,
        p.status_pagamento
    FROM locacoes l
    JOIN veiculos v ON v.id_veiculo = l.id_veiculo
    JOIN pagamento p ON p.id_locacao = l.id_locacao
    WHERE l.id_cliente = cliente_id;
END //
DELIMITER ;

-- CALL listar_locacoes_por_cliente (1);



DELIMITER //
CREATE PROCEDURE clientes_com_locacao_em_aberto()
BEGIN
    SELECT DISTINCT c.nome, c.cnh, c.data_validade_cnh, c.cpf, c.endereco, c.telefone, c.email
    FROM clientes AS c
    JOIN locacoes AS l ON c.id_cliente = l.id_cliente
    WHERE l.data_entrega IS NULL;
END; //

-- CALL clientes_com_locacao_em_aberto;