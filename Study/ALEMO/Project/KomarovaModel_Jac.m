function J = KomarovaModel_Jac(y,a1,a2,b1,b2,g11,g12,g21,g22)
%% DO NOT MODIFY THIS PART--------------------------------
%check size of the input vector
if numel(y) ~= 2
    error('The input vector Y must have two elements')
endif
%%--------------------------------------------------------
y1 = y(1);
y2 = y(2);

% Jij is the derivative of ydot_i w.r.t. y_j

J11 = g11 * a1 * y1.^(g11-1) * y2.^g21 - b1;
J12 = g21 * a1 * y1.^g11     * y2.^(g21-1);
J21 = g12 * a2 * y1.^(g12-1) * y2.^g22;
J22 = g22 * a2 * y1.^g12     * y2.^(g22-1) - b2;

% J is a 2x2 matrix containing the J_(ij)'s
J = [J11, J12; J21, J22];

endfunction
