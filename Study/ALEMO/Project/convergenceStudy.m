function [err1, err2] = convergenceStudy(apx, d, t, N)

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


    err1 = norm(r1-b1)  # Find error y1
    err2 = norm(r2-b2)  # Find error y2

#   ax = plotyy (t, a1, t, a2);
#   legend("Osteoclasts","Osteoblasts")

endfunction
