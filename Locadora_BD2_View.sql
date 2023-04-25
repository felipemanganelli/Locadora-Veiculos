-- VIEWS

CREATE VIEW aluguel_carro AS
SELECT
  l.id_locacao,
  c.nome,
  c.cpf,
  c.cnh,
  v.modelo,
  l.data_locacao,
  l.data_entrega,
  l.valor_total
FROM
  locacoes l
  JOIN clientes c ON l.id_cliente = c.id_cliente
  JOIN veiculos v ON l.id_veiculo = v.id_veiculo;

-- SELECT * FROM aluguel_carro;
  
  
  
CREATE VIEW pagamento_por_locacao AS
SELECT
  l.id_locacao,
  c.nome,
  
  COUNT(p.id_pagamento) AS total_de_adicionais,
  SUM(p.valor + l.valor_total) AS valor_total_pagamento
FROM
  locacoes l
JOIN clientes c ON c.id_cliente = l.id_cliente
JOIN pagamento p ON p.id_locacao = l.id_locacao
GROUP BY
  l.id_locacao, l.id_cliente;
  
-- SELECT * FROM pagamento_por_locacao;