function ydot = KomarovaModel(y,a1,a2,b1,b2,g11,g12,g21,g22)
%% DO NOT MODIFY THIS PART--------------------------------
%check size of the input vector
if numel(y) ~= 2
    error('The input vector Y must have two elements')
endif
%%--------------------------------------------------------

    y1 = y(1);
    y2 = y(2);

    ydot1 = a1 * y1.^g11 * y2.^g21 - b1*y1;

    ydot2 = a2 * y1.^g12 * y2.^g22 - b2*y2;

%% DO NOT MODIFY THIS PART--------------------------------
%make sure that output argument ydot has the same
ydot = reshape([ydot1,ydot2],size(y));
%%--------------------------------------------------------
endfunction
