function M = boneMass(y,yss,t,days,Nt,k1,k2,BMi)

    x1 = max(y(1,:)-yss(1,:),0);
    x2 = max(y(2,:)-yss(2,:),0);

    for i = 2:Nt+1
        dt = t(i)-t(i-1);
        m = k1*(x1(i)+x1(i-1)) + k2*(x2(i)+x2(i-1));
        M(i) = 0.5 * dt*m;
    endfor

    M0 = BMi;
    M = (M0-M)/M0 * 100;

    plot(t,M);
    ylim([99.98,100.001]);
    xlabel("Time [days]");
    ylabel("Bone Mass %");
    grid minor;
    set(gca, 'LineWidth', 1.5, 'FontSize', 14);
    titleName = strcat("Bone Mass Density for",{" "},num2str(Nt)," time steps");
    title(titleName);

    imageName = strcat("images/IMG_BMi_D",num2str(days),"_N",num2str(Nt),".eps");
    str = sprintf("print -depsc %s", imageName);
    eval(str);

#    for i = 2:Nt+1
#        I = 0;
#        for j = 2:i
#            dt = t(j) - t(j-1);
#            m = k1*(x1(j)+x1(j-1)) + k2*(x2(j)+x2(j-1));
#            I = I + 0.5 * dt * m;
#        endfor
#        M(i) = I;
#    endfor
#
##    M = (BMi - M)/BMi * 100;
##    plot(t,M);

endfunction
