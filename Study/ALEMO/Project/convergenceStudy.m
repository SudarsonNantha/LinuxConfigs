function convergenceStudy(days,ffun,Jfun,y0)
    a = 1000;
    for i=1:20
        N(i) = a;
        if a > 200000
            break;
        endif
        a = a * 2;
    endfor

    #N(i+1) = 500000;

    for i = 1:length(N)
        Nt = N(i);
        [y, time] = dataExist(days,Nt,ffun,Jfun,y0);
        [e1(i),e2(i)] = getInterpError(y,days,time,Nt);

        printf("\n");
    endfor

    ax1 = loglog(N,e1,'-o','MarkerSize',10,'LineWidth',1.5);
    hold on
    ax2 = loglog(N,e2,'-o','MarkerSize',10,'LineWidth',1.5);
    xlabel("Time Discretization Nt");
    ylabel("Norm (reference - approx)");
    legend("Osteoclast Error", "Osteoblast Error");
    set(gca, 'linewidth', 1.5, 'fontsize', 14);
    grid minor;
    titleName = strcat("Error plot for",{" "},num2str(days)," days");
    title(titleName);

    imageName = strcat("images/IMG_D",num2str(days),"_ErrorPlot.eps");
    str = sprintf("print -depsc %s", imageName);
    eval(str);

endfunction
