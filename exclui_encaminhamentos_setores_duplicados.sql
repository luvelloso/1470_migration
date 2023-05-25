SELECT *
FROM TRAMITACAO_ORG_USR2 fou1
WHERE NOT EXISTS (
    SELECT 1
    FROM TRAMITACAO_ORG_USR2 fou2
    WHERE fou2.ID_FTR_FTO = fou1.ID_FTR_FTO
    AND fou2.ID_FTO < fou1.ID_FTO -- Substitua "pk" pelo nome da coluna que representa a chave primária
)

-- Fiz direto na VIEW (essa view juntei tantos os dados de tramitação quanto organograma e usuario p/ ter tudo em uma unica tabela e ficar mais fácil.)
-- Nesse caso, eu tinha um registro duplicado p/ cada encamihamento diferente. 
-- Se era do setor X e encaminhava pro setor Y e Z, eu teria um registro (linha) pra cada Y e Z. 
-- Depois p/ adicionar o resto será necessário fazer uma distinção de quais não estão p/ poder trazer eles p/ encaminhamento como despacho. 
 