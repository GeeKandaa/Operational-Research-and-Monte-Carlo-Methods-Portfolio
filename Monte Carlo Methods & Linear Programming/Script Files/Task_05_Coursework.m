% Task 5
%% Defining the problem:
fprintf('\nProblem:\n\n   Objective:\n     Maximise\n\n   Objective function:\n     f(x1,x2) = -x1 - (1/3)*x2\n\n   Domain:\n     x1 \x2265 0\n     x2 \x2265 0\n\n   Constraints:\n     x1 + x2 \x2264 2\n     x1 + (1/4)*x2 \x2264 1\n     x1 - x2 \x2264 2\n     -(1/4)*x1 - x2 \x2264 1\n     -x1 - x2 \x2264 -1\n     -x1 + x2 \x2264 2\n\n');


%% Variable Declaration

% The objective function
f = [-1,-1/3];

% Matrix containing vectors of decision variable coefficients derived from 
% the LHS of the constraining inequalities. 
A = [1 1; % <-- e.g. values taken from LHS of x1 + x2 <= 2
    1 1/4; 1 -1; -1/4 -1; -1 -1; -1 1];

% Vector containing RHS of constraining inequalities
b = [2;% <-- e.g. value taken from RHS of x1 + x2 <= 2
    1; 2; 1; -1; 2];

% Variables required by the linprog() function to run, but whose vectors are
% in this case empty.

% Matrix containing vectors of decision variable coefficients derived from 
% the LHS of the constraining equalities. (In this case, an empty vector) 
Aeq = [];

% Vector containing RHS of constraining equalities (Again an empty vector).
beq = [];

%Upper and lower bounds, respectively.
lb = [];
ub = [];

%Starting value of x, unrequired by the interior-point linprog algorithm as
% X0 is defined by the algorithm, yet declared as function fails to run
% without the parameter.
x0 = [];

%% Running the function
x = linprog(f,A,b,Aeq,beq,lb,ub,x0,optimoptions('linprog','Algorithm','interior-point'));

% Solutions
fprintf('Solutions:\nx1 = %1.7f\nx2 = %1.7f\n', x(1), x(2))

