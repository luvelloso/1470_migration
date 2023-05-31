SELECT
df.ID_FXO AS "id",
'' AS "id_fluxo", -- decidir id do fluxo, todos serão dentro do mesmo.
df.NUMERO_FXO AS "num",
df.ANO_FXO AS "ano_documento",
df.TITULO_FXO AS "assunto",
dft.TEXTO_FTR AS "conteudo",
'' AS "prioridade",
'' AS "codigo",
'' AS "pasta",
dut.TIPO_USR_ORIGEM, --usar isso p/ criar regra se é contato ou user
dudestino.ID_1DOC AS "pessoa_origem_1doc",
dut.ID_USR_UTR_O AS "pessoa_origem_flowdocs",
dsorigem.ID_1DOC AS "de_setor_id",
dut.TIPO_USR_DESTINO,
dudestino.ID_1DOC AS "pessoa_destino_1doc", 
dut.ID_USR_UTR_D AS "pessoa_destino_flowdocs",
dsdestino.ID_1DOC AS "para_setor_id",
'' AS "de_contato_id",
'' AS "para_contato_id",
dft.DATAENVIO_FTR AS "data_hora", --dividir NO php
'' AS "data_hora_recebimento_gmt",



-- CAMPOS PRA CONCATENAR NO CONTEUDO NO PHP 
duorigem.login AS "conteudo_login_origem", -- LOGIN USR ORIGEM
dudestino.login AS "conteudo_login_destino", -- LOGIN USER DESTINO

-- tipo de tramite
CASE
WHEN dft.TIPO_FTR = 0 THEN 'Normal'
WHEN dft.TIPO_FTR = 1 THEN 'Informacao Adicionada'
WHEN dft.TIPO_FTR = 2 THEN 'Apensado'
WHEN dft.TIPO_FTR = 3 THEN 'Notificação'
WHEN dft.TIPO_FTR = 4 THEN 'Relacionado'
WHEN dft.TIPO_FTR = 5 THEN 'Arquivado'
WHEN dft.TIPO_FTR = 6 THEN 'Desarquivado'
WHEN dft.TIPO_FTR = 7 THEN 'Solicitação de Assinatura'
WHEN dft.TIPO_FTR = 8 THEN 'Assinatura'
WHEN dft.TIPO_FTR = 9 THEN 'Publicação DOE'
WHEN dft.TIPO_FTR = 10 THEN 'Cancelamento DOE'
WHEN dft.TIPO_FTR = 11 THEN 'Publicação cancelada DOE'
WHEN dft.TIPO_FTR = 12 THEN 'Recusa de assinatura'
WHEN dft.TIPO_FTR = 13 THEN 'Responder'
WHEN dft.TIPO_FTR = 14 THEN 'Desapensar'
WHEN dft.TIPO_FTR = 15 THEN 'Cancelamento da solicitação de assinatura'
WHEN dft.TIPO_FTR = 16 THEN 'Cancelamento do trâmite'
WHEN dft.TIPO_FTR = 17 THEN 'Prolongar prazo do fluxo'
ELSE 'Não especificado'
END AS conteudo_tipo_tramitacao,

-- status
CASE
WHEN df.STATUS_FXO = 0 THEN 'Não possui'
WHEN df.STATUS_FXO = 1 THEN 'Em andamento '
WHEN df.STATUS_FXO = 2 THEN 'Indeferido'
WHEN df.STATUS_FXO = 3 THEN 'Deferido'
WHEN df.STATUS_FXO = 4 THEN 'Excluído'
ELSE 'Não especificado'
END AS conteudo_status_do_fluxo

-- CAMPOS QUE VÃO SER UTEIS DEPOIS
--df.ID_ARQ_FXO AS "pasta_anexo",
--dft.ID_ARQ_FTR AS "arquivo_anexo",
--dut.ID_ORG_UTR_O AS "org_origem_flowdocs",
--dut.ID_ORG_UTR_D AS "org_destino_flowdocs",

FROM
DOC_FLUXO df


-- ASSUNTO
LEFT JOIN DOC_ASSUNTO da
ON df.ID_ASS_FXO  = da.ID_ASS

-- TRAMITES
LEFT JOIN DOC_FLUXO_TRAMITE dft
ON df.ID_FXO = dft.ID_FXO_FTR

-- TRAMITAÇÃO  + UNIDADE DE TRAMITAÇÃO (tabela + importante)
LEFT JOIN dados_tramitacao_sem_repetir dut
ON dft.ID_FTR =  dut.ID_FTR_FTO 
-- de x para de setores origem

LEFT JOIN DEXPARA_SETORES dsorigem
ON dut.ID_ORG_UTR_O = dsorigem.ID_FLOWDOCS

-- de x para setores destino

LEFT JOIN DEXPARA_SETORES dsdestino
ON dut.ID_ORG_UTR_D = dsdestino.ID_FLOWDOCS

-- de x para usuarios origem

LEFT JOIN DEXPARA_USUARIOS duorigem
ON dut.ID_USR_UTR_O = duorigem.ID_FLOWDOCS

-- de x para usuarios destino

LEFT JOIN DEXPARA_USUARIOS dudestino
ON dut.ID_USR_UTR_D = dudestino.ID_FLOWDOCS

WHERE dft.NUM_FTR = 1 -- restringe p/ apenas a emissão pai.



-- campos importantes flowdocs tabela docs
-- da.ID_TFX_ASS: id do fluxo flowdocs
-- dut.id_ftr_fto: id da unidade de tramitação flowdocs
-- dft.NUM_FTR: filtra o que é emissão pai. o resto é despacho.
-- dut.ID_FTO: id do despacho da tabela de tramitacao para identificar depois
-- dut.ID_UTRDE_FTO: id da unidade de tramitação origem
-- df.ARQUIVADO_FXO: se já está arquivado
-- df.QTDTRAMITE_FXO: importante para ver a quantidade de despachos do documento
-- df.LOGIN_INC_FXO: login que incluiu o documento no fluxo
-- df.ID_ASS_FXO: id do assunto
-- df.ID_ARQ_FXO: id da PASTA onde estará o anexo da emissão pai
-- dft.ID_ARQ_FTR: id do ANEXO da emissao pai
-- dut.ID_ORG_UTR_DE: setor flowdocs
-- dut.ID_USR_UTR_DE: usuário ou contato
-- da.DESCRICAO_ASS: assunto texto
-- df.ID_ASS_FXO: id do assunto flowdocs
-- df.TEMANEXO_FXO: se tem anexo
