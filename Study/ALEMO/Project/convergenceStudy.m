function [err1, err2] = convergenceStudy(apx, d, t, N)

    fileName = "vectorData/data_D500_N500000.mat";
    cmd = sprintf("load %s",fileName);
    eval(cmd);

    if days != d
        error('Number of days is not the same')
    endif

    ref = y;
    #printf("\tDays\tTimestep\nRef\t%g\t%g\nApx\t%g\t%g\n",days,Nt,d,N);

    r1 = ref(1,:);
    r2 = ref(2,:);

    a1 = apx(1,:);
    a2 = apx(2,:);

    b1 = interp1(t,a1,time,'spline');
    b2 = interp1(t,a2,time,'spline');


    err1 = norm(r1-b1);
    err2 = norm(r2-b2);

#   ax = plotyy (t, a1, t, a2);
#   legend("Osteoclasts","Osteoblasts")

endfunction
