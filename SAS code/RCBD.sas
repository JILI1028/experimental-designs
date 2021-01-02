/*problem 1*/
data tensile;
input mix strength;
datalines;
1 3129
1 3000
1 2865 
1 2890
2 3200
2 3300
2 2975
2 3150
3 2800
3 2900
3 2985
3 3050
4 2600 
4 2700
4 2600
4 2765
;
proc glm data=tensile;
class mix;
model strength=mix;
means mix/hovtest=bartlett;
output out=tensilefit p=yhat r=resid;
proc univariate data=tensilefit plot normal;
var resid;
run;
proc plot;
plot resid*yhat;
run;
/*problem2*/
data content;
input batch calcium;
datalines;
1 23.46
1 23.48
1 23.56
1 23.39
1 23.40
2 23.59
2 23.46
2 23.42
2 23.49
2 23.50
3 23.51
3 23.64
3 23.52
3 23.49
4 23.28
4 23.40
4 23.37
4 23.46
4 23.39
5 23.29
5 23.46
5 23.37
5 23.32
5 23.38
;
proc glm data=content;
class batch;
model calcium= batch;
random batch;
output out=contentfit p=yhat r=resid;
proc varcomp;
class batch;
model calcium=batch;
proc univariate data=contentfit plot normal;
var resid;
run;

/*problem3*/
data engine;
input oil truck fuel;
datalines;
1 1 .5
1 2 .634
1 3 .487
1 4 .329 
1 5 .512
2 1 .535
2 2 .675
2 3 .520
2 4 .435
2 5 .540
3 1 .513
3 2 .595
3 3 .488
3 4 .4
3 5 .51
;
proc glm;
class oil truck;
model fuel= oil truck;
means oil/lsd cldiff;
output out=enginefit p=yhat r=resid;
proc univariate data=enginefit plot normal;
var resid;
proc plot;
plot resid*yhat;
run;
