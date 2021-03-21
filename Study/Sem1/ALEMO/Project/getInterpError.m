function [err1, err2] = getInterpError(apx, d, t, N)

    fileName = "vectorData/data_D500_N500000.mat";
    cmd = sprintf("load %s",fileName);
    eval(cmd);

    if days != d
        error('Number of days is not the same')
    endif

    ref = y;
    #printf("\tDays\tTimestep\nRef\t%g\t%g\nApx\t%g\t%g\n",days,Nt,d,N);

    r1 = ref(1,:);  # Reference 0.5M value y1 for 'time'
    r2 = ref(2,:);  # Reference 0.5M value y2 for 'time'

    a1 = apx(1,:);  # Approx Nt value y1 for 't'
    a2 = apx(2,:);  # Approx Nt value y2 for 't'

    b1 = interp1(t,a1,time,'spline');   # Interpolation y1
    b2 = interp1(t,a2,time,'spline');   # Interpolation y2


    printf('r1 = %g  a1 = %g b1 = %g  diff = %g\n',norm(r1), norm(a1), norm(b1),norm(b1-r1));
    printf('r2 = %g  a1 = %g b2 = %g  diff = %g\n',norm(r2), norm(a2), norm(b2),norm(b2-r2));
    err1 = norm(b1-r1)/norm(b1)  # Find error y1
    err2 = norm(b2-r2)/norm(b2)  # Find error y2

#    err1 = norm(b1-r1);
#    err2 = norm(b2-r2);

#    err1 = abs(norm(r1)-norm(b1))
#    err2 = abs(norm(r2)-norm(b2))
endfunction
