/****
	Função: Lista os PS dentro do Inscrições e Matrículas para configuração.
****/
 
SELECT
	SPSPROCESSOSELETIVO.CODFILIAL AS CODUNIDADE,
	SPSPROCESSOSELETIVO.NOME,
	FILIAL.NOME AS NOMEUNIDADE,
	CONCAT(SPSPROCESSOSELETIVO.CODCOLIGADA,'-',SPSPROCESSOSELETIVO.IDPS) AS CODEXTERNO
FROM SPSPROCESSOSELETIVO(NOLOCK)
OUTER APPLY(
	SELECT
		NOME,
		CODFILIAL
	FROM GFILIAL(NOLOCK)
	WHERE CODCOLIGADA = SPSPROCESSOSELETIVO.CODCOLIGADA
		AND CODFILIAL = SPSPROCESSOSELETIVO.CODFILIAL
) AS FILIAL
WHERE SPSPROCESSOSELETIVO.STATUS = 'T'
