data strength;
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
proc anova;
class mix;
model strength=mix;
means mix/tukey;
run;
proc anova;
class mix;
model strength=mix;
means mix/lsd tukey cldiff;
run;

