clear all
close all
clc
%% MODEL PARAMETERS
a1= 3;
a2= 4;
b1= 0.2;
b2= 0.02;
g11= 1.1;
g12= 1;
g21=-0.5;
g22= 0;
k1= 0.18;
k2= 0.0014;
BMi = 92.123644277624891; % initial bone mass
%% INITIAL CONDITIONS
yss = [1.060660171777250 ; 2.121320343560527e+02];
y0 = yss + [10;0];


%% NUMERICAL PARAMETERS
Nt = 500000;
days = 500;
time = linspace(0,days,Nt+1);
%% HANDLE FUNCTIONS DEFINITION
ffun = @(t,y)KomarovaModel(y,a1,a2,b1,b2,g11,g12,g21,g22);
Jfun = @(t,y)KomarovaModel_Jac(y,a1,a2,b1,b2,g11,g12,g21,g22);
% since all the parameters are fixed fun only depends on t and
%% SOLUTION

tic
y = BwdEuler(time,ffun,Jfun,y0);
fileName = strcat("vectorData/data_D",num2str(days),"_N",num2str(Nt),".mat");
str = sprintf("save %s y time Nt days",fileName);
eval(str);
toc

#o1 = y(1,:);
#o2 = y(2,:);

#ax = plotyy (time, o1, time, o2);
#legend("Osteoclasts","Osteoblasts")
