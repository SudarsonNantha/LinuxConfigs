function plotvsReference(y,time,Nt,days)

    [yex, nex, dex, tex] = getReference();

    imageName = strcat("images/IMG_D",num2str(days),"_N",num2str(Nt),"_vs_Reference.eps");

    hold on

    o1 = y(1,:);
    o2 = y(2,:);
    [ax,l1,l2] = plotyy (time, o1, time, o2);
    set(l1, 'linestyle', '-', 'LineWidth', 1.5);
    set(l2, 'linestyle', '-', 'LineWidth', 1.5);

    oex1 = yex(1,:);
    oex2 = yex(2,:);
    [axe, l1e, l2e] = plotyy(tex, oex1, tex, oex2);
    set(l1e, 'linestyle', ':', 'LineWidth', 1.5, 'color', 'k');
    set(l2e, 'linestyle', ':', 'LineWidth', 1.5, 'color', 'b');

    legend("Reference Osteoclasts", "Approx Osteoclasts", "Reference Osteoblasts", "Approx Osteoblasts");
    xlabel('Time [days]');
    ylabel(ax(1), 'Cell Count  [OC]');
    ylabel(ax(2), 'Cell Count  [OB]');

    titleName = strcat("Comparison with Reference Solution for",{" "},num2str(days)," days over",{" "},num2str(Nt)," time steps");
    title(titleName);
    set(ax,'FontSize',14);
    set(ax,'LineWidth',1.5);
    grid minor;
    str = sprintf("print -depsc %s",imageName);
    eval(str);

    hold off

endfunction
