function M = boneMass(y,yss,t,Nt,k1,k2,BMi)

#        x1 = max(y(1,:)-yss(1),0)
#        x2 = max(y(2,:)-yss(2),0)
#        m = k1*x1 + k2*x2

#    x = max(y-yss,0);
#    m = k1*x(1,:) +  k2*x(2,:)

#    M=trapz(m)
#    plot(t,M)

#    x1 = max(y(1,:)-yss(1,:),0)
#    x2 = max(y(2,:)-yss(2,:),0)
#    m = k1*x1 + k2*x2

#    for i=2:length(t)
#        x1 = max(y(1,i)-yss(1));
#        x2 = max(y(2,i)-yss(2));
#        m = k1*x1 + k2*x2
#        M(i) = trapz(t(i),m);
#        printf("x1=%g, x2=%g,m=%g,M=%g\n",x1,x2,m,M(i));
#    endfor

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
#    ylim([98 101]);

endfunction
