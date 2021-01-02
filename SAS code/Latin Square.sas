data a;
input batch day ingredient $ time;
datalines;
1 1 A 8
1 2 B 7
1 3 D 1
1 4 C 7
1 5 E 3
2 1 C 11
2 2 E 2
2 3 A 7
2 4 D 3
2 5 B 8
3 1 B 4
3 2 A 9
3 3 C 10
3 4 E 1
3 5 D 5
4 1 D 6 
4 2 C 8
4 3 E 6
4 4 B 6
4 5 A 10
5 1 E 4
5 2 D 2
5 3 B 3
5 4 A 8
5 5 C 8
;
proc glm data=a;
class batch day ingredient;
model time=batch day ingredient;
random batch ingredient;

proc varcomp method=type1 data=a;
class batch day ingredient;
model time= day batch ingredient/fixed =1;
run;



