function ax = individualPlot(y,time,Nt,days,toPlot=0)

    imageName = strcat("images/IMG_D",num2str(days),"_N",num2str(Nt),".eps");
    o1 = y(1,:);
    o2 = y(2,:);

    if (toPlot == 0 || toPlot == 1)
        figure(1);
        ax = plot(time, o1);
    elseif (toPlot == 0 || toPlot == 2)
        figure(2);
        ax = plot(time,o2);
    endif


    set(gca, "linewidth", 1.5, "fontsize", 14)

endfunction
