SELECT
au.ID_USR,
dp.nome_pes AS "nome_razao_social",
-- email,
'' AS tipo_pessoa,
au.LOGIN_USR AS "cpf_cnpj",
-- ddd_telefone,
-- telefone,
-- ddd_celular,
-- celular,
-- data_nasc
'' AS "hora_cadastro",
'' AS "contato",
'' AS "organizacao",
'' AS "funcao",
d1.NOME_LOG AS "endereco1",
de.NOME_LOG_ENR AS "endereco2",
de.NUMERO_ENR AS "numero",
'' AS "complemento",
de.CEP_ENR AS "cep",
db.NOME_BAI AS "bairro1",
de.NOME_BAI_ENR AS "bairro2",
dm.NOME_MUN AS "cidade",
dest.sigla_est AS "uf",
'1' AS "status",
au.TIPO_USR

FROM AUT_USUARIO au

LEFT JOIN DOC_PESSOA dp -- p/ conseguir informações sobre a pessoa e não sobre usuario.
ON au.ID_PES_USR = dp.ID_PES 

--LEFT JOIN DOC_PESSOA_CONTATO dpc 
--ON au.ID_PES_USR = dpc.ID_PES_PCO 

LEFT JOIN DOC_PESSOA_ENDERECO DPE -- p/ conseguir id do endereço de pessoa
ON dpe.ID_PES_PEN = au.ID_PES_USR

LEFT JOIN DOC_ENDERECO de -- p/ conseguir cep
ON dpe.ID_ENR_PEN = de.ID_ENR

LEFT JOIN DOC_LOGRADOURO d1 -- p/ conseguir logradouro
ON d1.id_log = de.ID_LOG_ENR 

LEFT JOIN DOC_BAIRRO db -- p/ conseguir bairro
ON  de.ID_BAI_ENR = db.ID_BAI

LEFT JOIN DOC_MUNICIPIO dm -- p/ conseguir municipio
ON de.ID_MUN_ENR = dm.ID_MUN

LEFT JOIN DOC_ESTADO dest -- p/ conseguir uf
ON dm.ID_EST_MUN = dest.ID_EST 

WHERE 
au.TIPO_USR <> 0 -- pega apenas os usuários externos  e de integração
AND
au.id_pes_usr IS NOT NULL
AND 
au.id_usr <> 5 --esse usuario era bloqueado, sem nome
