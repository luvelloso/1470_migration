SELECT 
df.ID_FXO AS "id_doc",
df.ID_ASS_FXO AS "id_assunto"
FROM
DOC_FLUXO df

-- ASSUNTO

LEFT JOIN ASSUNTOS a  
ON df.ID_ASS_FXO  = a.ID_ASS 


