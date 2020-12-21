function plotNormal(y,time,Nt,days)

    imageName = strcat("images/IMG_D",num2str(days),"_N",num2str(Nt),".eps");
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



endfunction
