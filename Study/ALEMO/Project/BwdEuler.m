function y = BwdEuler(t,ffun,Jfun,y1)
% SOLVE ydot = f(t,y)
% t   is the time stepping vector
% ffun is the function handle @(t,y) for the rhs of the ODE f(t,y)
% Jfun is the function handle @(t,y) for the gradient of f with respect to
% y
% y1 is the initial condition
%% DO NOT MODIFY THIS PART--------------------------------
if size(y1,2)~=1
    error('The initial condition must be a COLUMN vector')
endif
if min(size(t))~=1
    error('The time step vector must be either a COLUMN or a ROW')
endif
%%--------------------------------------------------------
% Allocate space for solution
y = zeros(size(y1,1),numel(t));
% Set initial condition
y(:,1)= y1;

#for i = 2:numel(t)
for i = 1:numel(t)-1
    % compute Delta t
    dt = t(i+1) - t(i);
    % set g fun
    gfun = @(z) (z - y(:,i) - dt*ffun(t(i),z));
    % Set L
    Lfun = @(z) (eye(2) - dt*Jfun(t(i),z));
    % solve nonlinear problem using the solution at previous time step as
    % initial guess
    y(:,i+1) = solveNR(gfun,Lfun,y(:,i));

    #gfun(y(:,i+1))
    %Display message
#    fprintf('Solved time step %d of %d\n',i,numel(time))
endfor


endfunction

