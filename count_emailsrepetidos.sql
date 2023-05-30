SELECT "email", Count(*) FROM CONTATOS_COMPLETO cc 
GROUP BY "email"
HAVING Count(*) > 1