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


#a1 = 3;
#a2 = 4;
#b1 = 0.2;
#b2 = 0.02;
#g11 = 1.105;
#g12 = 1;
#g21 = -0.5;
#g22 = 0.1;
#k1 = 0.285;
#k2 = 0.0008;

%% NUMERICAL PARAMETERS
Nt = 1000;
days = 500;
time = linspace(0,days,Nt+1);
%% HANDLE FUNCTIONS DEFINITION
ffun = @(t,y)KomarovaModel(y,a1,a2,b1,b2,g11,g12,g21,g22);
Jfun = @(t,y)KomarovaModel_Jac(y,a1,a2,b1,b2,g11,g12,g21,g22);
% since all the parameters are fixed fun only depends on t and
%% SOLUTION

normal = 0;
plotError = 0;
plotBMi = 0;

tic
imageName = strcat("images/IMG_D",num2str(days),"_N",num2str(Nt),".eps");
fileName = strcat("vectorData/data_D",num2str(days),"_N",num2str(Nt),".mat");
if exist(fileName)
    printf("%s exists. Loading data...\n",fileName);
    cmd = sprintf("load %s",fileName);
    eval(cmd);
else
    printf("%s does not exist. Calculating and saving data...\n",fileName);
    y = BwdEuler(time,ffun,Jfun,y0);
    str = sprintf("save %s y time Nt days",fileName);
    eval(str);
endif

#BwdEuler(time,ffun,Jfun,y0);
#boneMass(y,yss,time,Nt,k1,k2,BMi);
#convergenceStudy(y,days,time,Nt);

plotNormal(y,time,Nt,days);

if normal == 1
    o1 = y(1,:);
    o2 = y(2,:);
    [ax,l1,l2] = plotyy (time, o1, time, o2);
    set(l1, 'linestyle', '--', 'LineWidth', 1);
#    set(l2, 'marker', 'o', 'MarkerSize',10, 'LineWidth', 1);
    legend("Osteoclasts","Osteoblasts");
    xlabel('Time [days]');
    ylabel(ax(1), 'Cell Count  [OC]');
    ylabel(ax(2), 'Cell Count  [OB]');

    titleName = strcat("Osteoclast and  Osteoblast count over",{" "},num2str(days)," days");
    title(titleName);
    set(ax,'FontSize',14);
    set(ax,'LineWidth',1.5);
    str = sprintf("print -depsc %s",imageName);
    eval(str);
endif

if plotError == 1
    a = 1000;
    for i=1:20
        N(i) = a;
        if a > 200000
            break;
        endif
        a = a * 2;
    endfor

    for i = 1:length(N)
        Nt = N(i)
        fileName = strcat("vectorData/data_D",num2str(days),"_N",num2str(Nt),".mat");
        c = exist(fileName);
        time = linspace(0,days,Nt+1);

        if c == 2
            printf("%s already exists\n",fileName);
            cmd = sprintf("load %s",fileName);
            eval(cmd);
        else
            printf("%s does not exist. Calculating y and saving values...\n",fileName);
            y = BwdEuler(time,ffun,Jfun,y0);
            str = sprintf("save %s y time Nt days",fileName);
            eval(str);
        endif

    #    printf("Nt = %g\n",Nt);
        [e1(1,i),e2(1,i)] = convergenceStudy(y,days,time,Nt);

        printf("\n");
    endfor

    #ax = plotyy(N,e1,N,e2);
    loglog(N,e1,'-o','MarkerSize',10,'LineWidth',1.5);
    hold on
    loglog(N,e2,'-o','MarkerSize',10,'LineWidth',1.5);
    xlabel("Time Discretization Nt");
    ylabel("Norm (ref - approx)");
    legend("Error 1", "Error 2");
endif

if plotBMi == 1
    a = 1000;
    for i=1:20
        N(i) = a;
        if a > 200000
            break;
        endif
        a = a + 1000;
    endfor

    for i = 1:length(N)
        Nt = N(i)
        fileName = strcat("vectorData/data_D",num2str(days),"_N",num2str(Nt),".mat");
        c = exist(fileName);
        time = linspace(0,days,Nt+1);

        if c == 2
            printf("%s already exists\n",fileName);
            cmd = sprintf("load %s",fileName);
            eval(cmd);
        else
            y = BwdEuler(time,ffun,Jfun,y0);
            str = sprintf("save %s y time Nt days",fileName);
            eval(str);
        endif

        M(i) = boneMass(y,yss,time,Nt,k1,k2);

        printf("\n");
    endfor

    M(1) = BMi;
    plot(N,M,'-o','MarkerSize',10,'LineWidth',1.5);

endif


toc
