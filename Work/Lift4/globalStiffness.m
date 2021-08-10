function Kg = globalStiffness(L,E,b1,h1,t)
clc
    %%% Physical properties
    E=70*10^9;
    b1 = 0.077;
    h1 = 0.1;
    b1 = 0.7;
    h1 = 0.05;
    t = 0.001;
    b2 = b1 - t*2;
    h2 = h1 - t*2;
    I=(b1*h1^3 - b2*h2^3)/12;
    A = b1*h1 - b2*h2;

    %%% Variables to convert to local coordinates
    phi = pi/2.5;             % Angle of links
    theta = pi/2 - phi;
    sp = sin(phi);
    st = sin(theta);
    cp = cos(phi);
    ct = cos(theta);
    L = 1.63;
    d = 0.91;


    n = 14;     % Number of beams
    s = 6;      % Size of stiffness matrix

    K = getStiffness(L,E,b1,h1,t);              % Get link stiffness
    Kp = getStiffness(2.54,E,0.8,0.1,0.002);    % Get platform stiffness
    [Fp1, Mp1, Fp2, Mp2] = platformForces();    % Get platform forces

    %save stiffnessValues.mat K Kp

    %%% For links connected to point N
    % Global eqm
    Xa1 = -Fp2*cp;
    Yb1 = 2*(Fp2*sp - Mp2/L);
    Ya1 = 2*Mp2/L - Fp2*sp;

    % First element
    N11 = -Xa1;
    V11 = -Ya1;
    M11 = @(x) Ya1*x;

    %Second Element
    N12 = -Fp2*cp;
    V12 = -Fp2*sp;
    M12 = @(x) (x-L)*Fp2*sp;


    %%% For links connected to point M
    % Global eqm
    Xa2 = -Fp1*cp;
    Yb2 = 2*(Fp1*sp - Mp1/L);
    Ya2 = 2*Mp1/L - Fp1*sp;

    % First element
    N21 = -Xa2;
    V21 = -Ya2;
    M21 = @(x) Ya2*x;

    %Second Element
    N22 = -Fp1*cp;
    V22 = -Fp1*sp;
    M22 = @(x) (x-L)*Fp1*sp;

    l = L/2;

    force11 = [N11;V11;M11(0)];
    force1m = [N12;V12;M12(l)];
    force12 = [N12;V12;M12(L)];
    force21 = [N21;V21;M21(l)];
    force2m = [N22;V22;M22(l)];
    force22 = [N22;V22;M22(L)];
    forcep2 = [0;Fp2;Mp2];

    load = [force11;            % A
            force21;            % B
            force1m+force2m;    % C
            force22;            % D
            force21;            % E
            force1m+force2m;    % F
            force21;            % G
            force22;            % H
            force1m+force2m;    % I
            force22;            % J
            force12;            % K
            force1m+force2m;    % L
            force12;            % M
            force22;            % N
            forcep2;            % 0
            ];

    Kg = zeros((n+1)*s/2,(n+1)*s/2);

    %%% Assemble stiffness matrix
    for i = (1:n-1)
        p = 1+(i-1)*s/2;
        q = s/2 + i*s/2;

        if i == 10
            Kg(p:q, p:q) = Kg(p:q, p:q) + Kp;
        end
        Kg(p:q, p:q) = Kg(p:q, p:q) + K;
    end

    %%% Add beam NO to stiffness matrix
    p = p + s/2;
    q = q + s/2;
    Kg(p:q,p:q) = Kg(p:q,p:q) + Kp;

    save globalStiffnessMatrix.mat Kg

    %%% We assign displacements at points A and B to be 0 because they are fixed
    %   Hence the calculations start from C
    x = 7;

    % Calculate displacement vector
    displacement = Kg(x:end,x:end)\load(x:end)

    l = length(displacement);

    % Local Rotation Matrix
    R = [   ct  st  0;
            -st ct  0;
            0   0   1;  ];

    % Building of global rotation matrix
    Rg = zeros(l,l);
    for i = 1:n-1
        p = 1+(i-1)*3;
        q = p + 2;
        Rg(p:q,p:q) = Rg(p:q,p:q) + R;
    end

    % Displacement in global coordinates
    dr = Rg\displacement;

    % Extract vertical displacementlacement only
    c = 3;
    v(1) = 0;
    v(2) = 0;
    for i = 2:3:length(dr)
        v(c) = dr(i);
        c = c+1;
    end

    % Displ Along local beam axis inclined at theta degrees convering Ks to
    % K (disp/sin theta)
    v1 = 0;
    v2 = 0;

   node = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O"];
   for i = 1:3:length(v)
       fprintf("%s = %f mm\t\t%s = %f\t\t%s = %f\n", node(i),v(i),node(i+1),v(i+1),node(i+2),v(i+2));
       v1 = v1 + v(i);
       v2 = v2 + v(i+1);
   end

   fprintf("\nLeft = %f mm\tRight = %f mm",v1,v2);
end
