function ans = boneMass(y,yss,t,k1,k2,BMi)

    M(1) = BMi;

#        x1 = max(y(1,:)-yss(1),0)
#        x2 = max(y(2,:)-yss(2),0)
#        m = k1*x1 + k2*x2

#    x = max(y-yss,0);
#    m = k1*x(1,:) +  k2*x(2,:)

#    M=trapz(m)
#    plot(t,M)

    for i=2:length(t)
        x1 = max(y(1,i)-yss(1));
        x2 = max(y(2,i)-yss(2));
        m = k1*x1 + k2*x2;
        M(i) = trapz(m);
        printf("x1=%g, x2=%g,m=%g,M=%g\n",x1,x2,m,M(i));

    endfor


endfunction
