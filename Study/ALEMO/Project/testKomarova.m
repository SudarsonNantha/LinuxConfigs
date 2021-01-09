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
Nt = 128000;
days = 500;
time = linspace(0,days,Nt+1);
%% HANDLE FUNCTIONS DEFINITION
ffun = @(t,y)KomarovaModel(y,a1,a2,b1,b2,g11,g12,g21,g22);
Jfun = @(t,y)KomarovaModel_Jac(y,a1,a2,b1,b2,g11,g12,g21,g22);
% since all the parameters are fixed fun only depends on t and
%% SOLUTION

plotOutput = 0;
plotOverlap = 0;
plotConvergence = 0;
plotBMi = 1;


tic

#[y, time] = dataExist(days,Nt,ffun,Jfun,y0);

#plot(time,y(1,:));
#plot(time,y(2,:));
#plotvsReference(y,time,Nt,days);
#imageName = strcat("images/IMG_D",num2str(days),"_N",num2str(Nt),".eps");

if plotOutput == 1
    [y, time] = dataExist(days,Nt,ffun,Jfun,y0);
    plotNormal(y,time,Nt,days);
endif


if plotOverlap == 1
    for i=1:5
        N(i) = i*i*1000;
    endfor
    N
    leg = cell(length(N)+1,1);
    for c=1:2
        for i=1:length(N)
            Nt = N(i);
            [y, time] = dataExist(days,Nt,ffun,Jfun,y0);
            individualPlot(y,time,Nt,days,c);
            leg(i) = strcat("Nt = ",{" "},num2str(Nt));
            hold on;
        endfor
        [yex, nex, dex, tex] = getReference();
        ax = individualPlot(yex,tex,nex,dex,c);
        set(ax, "linewidth", 1.5, "linestyle", "-.")
        leg(length(N)+1) = "Reference";
        legend(leg);
        if c ==1
            ost = "Osteoclast";
            os = "OC";
        else
            ost = "Osteoblast";
            os = "OB";
        endif
        titleName = strcat(ost," comparison for different Nt");
        title(titleName);
        xlabel('Time [days]');
        ylabel("Cell Count");
        grid minor;
        imageName = strcat("images/IMG_",os,"_Comparison_",num2str(days),"_N",num2str(N(1)),"-N",num2str(N(length(N))),".eps");
        str = sprintf("print -depsc %s", imageName);
        eval(str);
    endfor
endif

if plotConvergence == 1
    convergenceStudy(days,ffun,Jfun,y0);
endif

if plotBMi == 1
    [y, time] = dataExist(days,Nt,ffun,Jfun,y0);
    boneMass(y,yss,time,days,Nt,k1,k2,BMi);
endif

toc
