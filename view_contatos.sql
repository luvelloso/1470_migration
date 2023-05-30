CREATE VIEW contatos_telfixo AS 
SELECT ID_PCO, ID_PES_PCO, NOME_PES, DOCUMENTO_PES, ID_TCO_PCO, CONTATO_PCO
FROM CONTATOS
WHERE ID_TCO_PCO = 4 -- alterei o id para cada tipo (celular, telefone, email)
