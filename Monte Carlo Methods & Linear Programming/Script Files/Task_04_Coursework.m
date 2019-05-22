%% Task 4

%% Defining the problem:
fprintf('\nProblem:\n\n   Objective:\n     Maximise\n\n   Objective function:\n     f(x1,x2,x3,x4) = (3*x1) + (4*x2) + x3 + (5*x4)\n\n   Domain:\n     x1 \x2265 0\n     x2 \x2265 0\n     x3 \x2265 0\n     x4 \x2265 0\n\n   Constraints:\n     x1 + x2 + (4*x3) \x2264 20\n    (2*x2) + (5*x3) \x2264 40\n    (2*x1) + (6*x3) + (4*x4) \x2264 50\n     x2 + x3 + (3*x4) \x2264 30\n\n');


%% Variable Declaration

% The objective function
f = [-3, -4, -1, -5];

% Matrix containing vectors of decision variable coefficients derived from 
% the LHS of the constraining inequalities.
A = [1,1,4,0; % <-- e.g. values taken from LHS of x1 + x2 + (4*x3) <= 20
    0,2,5,0;
    2,0,6,4;
    0,1,1,3;
    -1,0,0,0;
    0,-1,0,0;
    0,0,-1,0;
    0,0,0,-1];

% Vector containing RHS of constraining inequalities 
b = [20; % <-- e.g. value taken from RHS of x1 + x2 + (4 * x3) <= 20
    40;50;30;0;0;0;0];

%% Running the function

[x, fval] = linprog(f, A, b);

% Solutions
fprintf('Solutions:\n   x1 = %4.2f\n   x2 = %4.2f\n   x3 = %4.2f\n   x4 = %4.2f\n\n   Maximum Value of Objective Function = %4.2f', x(1),x(2),x(3),x(4), -fval);