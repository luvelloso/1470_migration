SELECT 
df.ID_FXO AS "ID",
da.ID_TFX_ASS AS "ID_FLUXO",
df.NUMERO_FXO AS "NUM",
df.ANO_FXO AS "ANO_DOCUMENTO",
df.TITULO_FXO AS "ASSUNTO",
dft.NUM_FTR,
dft.TEXTO_FTR,
dft.DATAENVIO_FTR,
dft.LOGIN_INC_FTR, 
dft.TIPO_FTR AS "TIPO_TRAMITE",
dft.ID_ARQ_FTR, 
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
        END,        
        CONCAT (
        'Tipo de Tramitação:', df.TIPO_FTR,
        'Descrição: ', dft.TEXTO_FTR,
        'Disponibilidade de Assinatura: ', dft.DISPONIVELASS_FTR
        ) as conteudo,
  
        

--CONTEUDO
--PRIORIDADE
--CODIGO
--de_usuario_id	
--de_setor_id	
--para_usuario_id	
--para_setor_id	
--de_contato_id	
--para_contato_id
df.DTA_INC_FXO AS "DATA_HORA_RECEBIMENTO", --separar em dt e hr 
--data_hora_recebimento_gmt
df.ID_ASS_FXO,
da.DESCRICAO_ASS,
df.ID_UTRDE_FXO ,
df.STATUS_FXO,
df.SIGILOSO_FXO, 
df.TEMANEXO_FXO, 
df.ID_ARQ_FXO ,
df.ARQUIVADO_FXO, 
df.DATATRAMITE_FXO ,
df.QTDTRAMITE_FXO,
df.LOGIN_INC_FXO,
df.DTA_INC_FXO ,
df.LOGIN_ALT_FXO,
df.DTA_ALT_FXO,
dut.ID_UTR,
dut.ID_ORG_UTR,
do.NOME_ORG,
au.LOGIN_USR
FROM DOC_FLUXO df

-- ASSUNTO
LEFT JOIN DOC_ASSUNTO da 
ON df.ID_ASS_FXO  = da.ID_ASS 

-- UNIDADE DE TRAMITAÇÃO
LEFT JOIN DOC_UNIDADE_TRAMITACAO dut
ON df.ID_UTRDE_FXO = dut.ID_UTR 

-- ORGANOGRAMA TRAMITACAO
LEFT JOIN DOC_ORGANOGRAMA do 
ON dut.ID_ORG_UTR = do.ID_ORG 

-- USUARIO TRAMITACAO
LEFT JOIN AUT_USUARIO au  
ON dut.ID_USR_UTR = au.ID_USR 


-- UNIR PRIMEIROS DESPACHOS CONTEUDO 
LEFT JOIN DOC_FLUXO_TRAMITE dft 
ON df.ID_FXO = dft.ID_FXO_FTR
AND dft.NUM_FTR = 1 --numero 1 porque é o despacho inicial

-- VERIFICAR CARTA SERVIÇO







