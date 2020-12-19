function znew = solveNR(gfun,Lfun,z1)

err = 1;
k = 0;
znew = z1;

while (err>1e-10)&&(k<=10000)
    %STORE the old solution
    zold = znew;
    %Increment iteration index k
    k = k+1;
    %COMPUTE THE FUNCTION
    g = gfun(zold);
    %COMPUTE THE GRADIENT
    L = Lfun(zold);
    %UPDATE Z
    znew = zold - inv(L) * g;

    %ERROR ESTIMATION
    err = max(norm(g),norm(zold-znew));
    end

    if err>1e-10
        error('Newton Raphson did not converge! Try increasing the error tolerance or the number of iterations!')
    end

end
