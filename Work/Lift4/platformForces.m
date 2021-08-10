% Returns internal forces at points M and N
function [Fp1, Mp1, Fp2, Mp2] = platformForces()

    L = 1.63;
    d = 0.91;
    q = 500/L;
    F = 250;

    % Global eqm
    Ya = q*L/2 - F*d/L;
    Yb = q*L/2 + F*(1 + d/L);

    % First element
    N1 = 0;
    V1 = @(x) qx - Ya;
    M1 = @(x) x^2 * q/2 + Ya*x;

    %Second Element
    N2 = 0;
    V2 = F;
    M2 = -F*d;

    Fp1 = -Ya;
    Mp1 = 0;

    Fp2 = -F;
    Mp2 = -F*d;

    return;

endfunction
