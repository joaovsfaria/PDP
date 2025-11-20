10 INPUT "Digite a primeira nota: "; np1
20 INPUT "Digite a segunda nota: "; np2

30 LET media = (VAL(np1) + VAL(np2)) / 2
40 IF media > 60 THEN GOTO 70
50 IF media < 30 THEN GOTO 80 
60 IF media >= 30 AND media <= 60 THEN GOTO 90

70 PRINT "Aprovado"; 
75 END
80 PRINT "Reprovado"
85 END
90 INPUT "Digite a nota da NP3: "; np3
95 IF np3 > 50 THEN PRINT "Aprovado pela NP3" ELSE PRINT "Reprovado pela NP3"
100 END