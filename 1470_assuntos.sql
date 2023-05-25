SELECT 
df.ID_ASS AS "id",
(dt.NOME_TFX || ' - ' || DESCRICAO_ASS) AS "assunto", --esse concatenar é específico do FIREBIRD. tentei usar concat mas não funciona.
'' AS "descricao",
'' AS "modelo",
'2' AS "status"
FROM DOC_ASSUNTO df

LEFT JOIN DOC_TIPOFLUXO dt 
on dt.ID_TFX = ID_TFX_ASS 

ORDER BY id_ass
