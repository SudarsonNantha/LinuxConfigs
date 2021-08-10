function K = getStiffness(L,E,b1,h1,t)

    b2 = b1 - t*2;
    h2 = h1 - t*2;
    I=(b1*h1^3 - b2*h2^3)/12;
    A = b1*h1 - b2*h2;

%    theta = pi/3;
%    s = sin(theta);
%    c = cos(theta);
%    s2 = s*s;
%    c2 = c*c;

    K = [   A*E/L       0               0            -A*E/L     0              0;
            0           12*E*I/L^3      6*E*I/L^2     0        -12*E*I/L^3     6*E*I/L^2;
            0           6*E*I/L^2       4*E*I/L       0        -6*E*I/L^2      2*E*I/L;
            -A*E/L      0               0             A*E/L     0              0;
            0           -12*E*I/L^3    -6*E*I/L^2     0         12*E*I/L^3    -6*E*I/L^2;
            0           6*E*I/L^2       2*E*I/L       0        -6*E*I/L^2      4*E*I/L;    ];

%    k1 = A*c2 + 12*I*s2/L^2;
%    k2 = A*s2 + 12*I*c2/L^2;
%    k3 = s*c*(A-12*I/L^2);
%    k4 = 6*I*s/L;
%    k5 = 6*I*c/L;

%    K = [   k1  k3  -k4 -k1 -k3 -k4;
%            k3  k2  k5  -k3 -k2  k5;
%            -k4 k5  4*I k4  -k5 2*I;
%            -k1 -k3 k4  k1  k3   k4;
%            -k3 -k2 -k5 k3  k2  -k5;
%            -k4 k5  2*I k4  -k5 4*I; ];

    return

end
