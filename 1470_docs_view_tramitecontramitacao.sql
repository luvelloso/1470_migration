CREATE VIEW tramiteytramitacao AS 
SELECT
	dft.ID_FTR,
	dft.TIPO_FTR,
	dft.ID_DST_FTR,
	dft.ID_FTRA_FTR,
	dft.ID_FTRO_FTR,
	dft.ID_FXO_FTR,
	dft.ID_MOT_FTR,
	dft.ID_TPA_FTR,
	dft.ID_ARQ_FTR,
	dft.DATAENVIO_FTR,
	dft.TEXTO_FTR,
	dft.ID_DOE_FTR,
	dft.DISPONIVELASS_FTR,
	dft.EXTERNO_FTR,
	dft.NUM_FTR,
	dft.SIGILOSO_FTR,
	dft.ENVIA_COPIAINTERESSADO_FTR,
	dft.LOGIN_INC_FTR,
	dft.DTA_INC_FTR,
	dft.LOGIN_ALT_FTR,
	dft.DTA_ALT_FTR,
	dftao.id_fto,
	-- apenas para confirmar
	dftao.id_ftr_fto,
	--apenas para confirmar
	dftao.ID_UTRDE_FTO AS "ID_ORIGEM",
	dftao.ID_UTRPARA_FTO AS "ID_DESTINO"
FROM
	DOC_FLUXO_TRAMITE dft
	
LEFT JOIN DOC_FLUXO_TRAMITACAO dftao 
ON dft.ID_FTR = dftao.ID_FTR_FTO 

WHERE dft.NUM_FTR = 1
