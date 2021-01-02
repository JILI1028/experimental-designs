data light;
input glass temp output;
datalines;
1 1 580
1 1 568 
1 1 570
1 2 1090
1 2 1087
1 2 1085
1 3 1392
1 3 1380
1 3 1386
2 1 550
2 1 530
2 1 579
2 2 1070
2 2 1035
2 2 1000
2 3 1328
2 3 1312
2 3 1299
3 1 546
3 1 575
3 1 599
3 2 1045
3 2 1053
3 2 1066
3 3 867
3 3 904
3 3 889
;
proc glm;
class glass temp;
model output= glass temp glass*temp;
run;


data shear;
input pressure temp strength;
datalines;
1 1 9.6
1 2 11.28
1 3 9
2 1 9.69 
2 2 10.1 
2 3 9.57
3 1 8.43
3 2 11.01
3 3 9.03
4 1 9.98
4 2 10.44
4 3 9.8
;
proc glm;
class pressure temp;
model strength=pressure temp;
output out=sheartemp p=yhat;
run;
data sheartemp;
set sheartemp;
nonadd=yhat**2;
run;
proc glm data=sheartemp;
class pressure temp;
model strength=pressure temp nonadd;
run;



data light;
input time op temp output;
datalines;
1 1 1 23
1 1 1 24
1 1 1 25
1 2 1 27
1 2 1 28
1 2 1 26
1 3 1 31
1 3 1 32
1 3 1 29
2 1 1 36
2 1 1 35
2 1 1 36
2 2 1 34
2 2 1 38
2 2 1 39
2 3 1 33
2 3 1 34
2 3 1 35
3 1 1 28
3 1 1 24
3 1 1 27
3 2 1 35
3 2 1 35
3 2 1 34
3 3 1 26
3 3 1 27
3 3 1 25
1 1 2 24
1 1 2 23
1 1 2 28
1 2 2 38
1 2 2 36
1 2 2 35
1 3 2 34
1 3 2 36
1 3 2 39
2 1 2 37
2 1 2 39
2 1 2 35
2 2 2 34
2 2 2 38
2 2 2 36
2 3 2 34
2 3 2 36
2 3 2 31
3 1 2 26
3 1 2 29
3 1 2 25
3 2 2 36
3 2 2 37
3 2 2 34
3 3 2 28
3 3 2 26
3 3 2 24
;
proc glm;
class time op temp;
model output= time op temp time*op time*temp op*temp time*op*temp;
run;


data light;
input temp press day output;
datalines;
1 1 1 86.3
1 2 1 84
1 3 1 85.8
2 1 1 88.5
2 2 1 87.3
2 3 1 89
3 1 1 89.1
3 2 1 90.2
3 3 1 91.3
1 1 2 86.1
1 2 2 85.2
1 3 2 87.3
2 1 2 89.4
2 2 2 89.9
2 3 2 90.3
3 1 2 91.7
3 2 2 93.2
3 3 2 93.7
; 
proc glm;
class temp press day;
model output= temp press day temp*press;
run;





