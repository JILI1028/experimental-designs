data machine;
input A B C life;
datalines;
0 0 0 22
0 0 0 31
0 0 0 25
1 0 0 32
1 0 0 43
1 0 0 29
0 1 0 35
0 1 0 34
0 1 0 50
1 1 0 55
1 1 0 47
1 1 0 46
0 0 1 44
0 0 1 45
0 0 1 38
1 0 1 40
1 0 1 37
1 0 1 36
0 1 1 60
0 1 1 50
0 1 1 54
1 1 1 39
1 1 1 41
1 1 1 47
;
proc glm;
class A B C;
model life=A B C A*B A*C B*C A*B*C;
estimate 'A' A -1 1;
estimate 'B' B -1 1;
estimate 'C' C -1 1;
estimate 'AB' A*B 1 -1 -1 1;
estimate 'AC' A*C 1 -1 -1 1;
estimate 'BC' B*C 1 -1 -1 1;
estimate 'ABC' A*B*C -1 1 1 -1 1 -1 -1 1;
run;





data machine;
input block A B C life;
datalines;
1 0 0 0 22
3 0 0 0 31
5 0 0 0 25
2 1 0 0 32
3 1 0 0 43
5 1 0 0 29
2 0 1 0 35
4 0 1 0 34
6 0 1 0 50
1 1 1 0 55
4 1 1 0 47
6 1 1 0 46
2 0 0 1 44
4 0 0 1 45
6 0 0 1 38
1 1 0 1 40
4 1 0 1 37
6 1 0 1 36
1 0 1 1 60
3 0 1 1 50
5 0 1 1 54
2 1 1 1 39
3 1 1 1 41
5 1 1 1 47
;
proc glm;
class block A B C;
model life=block A B C A*B A*C B*C A*B*C;
run;



data machine;
input block A B C life;
datalines;
1 0 0 0 22
3 0 0 0 31
5 0 0 0 25
2 1 0 0 32
4 1 0 0 43
5 1 0 0 29
2 0 1 0 35
4 0 1 0 34
6 0 1 0 50
1 1 1 0 55
3 1 1 0 47
6 1 1 0 46
2 0 0 1 44
4 0 0 1 45
6 0 0 1 38
1 1 0 1 40
3 1 0 1 37
6 1 0 1 36
1 0 1 1 60
3 0 1 1 50
5 0 1 1 54
2 1 1 1 39
4 1 1 1 41
5 1 1 1 47
;
proc glm;
class block A B C;
model life=block A B C A*B A*C B*C A*B*C;
run;
