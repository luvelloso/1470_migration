CREATE VIEW assuntos as
SELECT 
df.ID_ASS, 
df.ID_TFX_ASS, 
(dt.NOME_TFX || ' - ' || DESCRICAO_ASS) AS ASSUNTO, --esse concatenar é específico do FIREBIRD. tentei usar concat mas não funciona.
dt.NOME_TFX,
df.DESCRICAO_ASS 
FROM DOC_ASSUNTO df

LEFT JOIN DOC_TIPOFLUXO dt 
on dt.ID_TFX = ID_TFX_ASS 

ORDER BY id_ass
