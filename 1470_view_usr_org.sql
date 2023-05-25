--UNI A TABELA DE TRAMITACAO + UNIDADE DE TRAMITACAO
CREATE VIEW tramitacao_org_usr2 AS
SELECT
	tou.ID_FTO,
	tou.ID_FTR_FTO,
	tou.ID_UTRDE_FTO,
	CASE
	WHEN tou.TIPO_UTR = 0 THEN 'Usuário'
	WHEN tou.TIPO_UTR = 1 THEN 'Organograma'
    ELSE 'Não especificado'
    END AS tipo_unidade_origem,
	tou.ID_ORG_UTR AS "ID_ORG_UTR_DE",
	tou.ID_USR_UTR AS "ID_USR_UTR_DE",
	tou.ID_UTRPARA_FTO,
	CASE
	WHEN dut.TIPO_UTR = 0 THEN 'Usuário'
	WHEN dut.TIPO_UTR = 1 THEN 'Organograma'
    ELSE 'Não especificado'
    END AS tipo_unidade_destino,
	dut.ID_ORG_UTR AS "ID_ORG_UTR_PARA",
	dut.ID_USR_UTR AS "ID_USR_UTR_PARA",
	tou.LOGIN_INC_UTR,
	tou.DTA_INC_UTR
 
FROM TRAMITACAO_ORG_USR1 tou

LEFT JOIN DOC_UNIDADE_TRAMITACAO dut 

ON tou.ID_UTRPARA_FTO = dut.ID_UTR




