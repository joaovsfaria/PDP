10 rn = INT(RND() * 100)
12 PRINT rn
20 INPUT "Insira seu palpite: "; x
30 IF x=rn THEN GOTO 60 ELSE GOTO 40
40 IF x>rn THEN PRINT "é menor" ELSE PRINT "é maior"
50 GOTO 20
60 PRINT "Parabens"
70 END