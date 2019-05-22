%% Task 12

% Variable Declaration
fprintf('Problem:\n   Objective:\n     Maximise\n   Objective Function:\n     f(x1,x2,x3,x4) = x3 + x4\n   Domain:\n     x1,x2,x3,x4 \x2265 0\n     x3,x4 \x2264 32\n     x1,x2\n   Constraints:\n     (0.1 * x1) + (0.2 * x2) \x2264 1000\n     (0.002 * x1) + (0.001 * x2) - x3 = 0\n     (0.001 * x1) + (0.003 * x2) - x4 = 0\n\n');
f = -[0, 0, 1, 1];
intcon = 1:4;
A = [0.1,0.2,0,0];
b = [1000];
Aeq = [0.002,0.001,-1,0;0.001,0.003,0,-1];
Beq = [0;0];
lb = zeros(4,1);
ub = [inf;inf;32;32];

% In-Built Matlab Function
[x,fval]=intlinprog(f,intcon,A,b,Aeq,Beq,lb,ub);
%% Solutions
fprintf('Solutions:\n   x1 = %4.2f\n   x2 = %4.2f\n   x3 = %4.2f\n   x4 = %4.2f\n\n   f = %4.2f', x(1),x(2),x(3),x(4),-fval);