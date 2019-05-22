%% Task 2

%% Plotting the feasibility region.

% Variable Declaration
x = -20:20;
y1 = (36 - 6*x)/3;
y2 = (24 - 2*x)/3;
x1 = x*0;
y3 = x*0;

%Plot block
f1 = figure('Name','Feasibility Region','Position',[50,50,500,450]); hold on;
plot(x, y1, x, y2, x, x1, y3, x);
hold on;
title('Graph of Constraints to f(x,y) = 4x + 3y');
xlabel('x');
ylabel('y');
patch('Faces',[1,2,3,4],'Vertices',[0, 0; 0, 8; 3, 6; 6, 0],'FaceColor', 'g', 'FaceAlpha',0.1)
legend('6x+3y =< 36', '2x+3y =< 24', 'x >= 0', 'y >= 0');
xlim([-1 7]);
ylim([-1 9]);
annotation('textbox',[.3,.2,.2,.2],'String','Feasibility Region','FitBoxToText','on');

%% Computation of observed corners:
%
% We take the values of x,y at the corners of the feasibility region, ie,
% when two or more lines intersect. Then, by substituting those values for 
% x,y the in the objective function, we find feasible solutions to the
% problem and thier function value. We know that the maximum exists on
% these corners and hence by choosing the largest resulting function value,
% we also deduce the corresponding solutions at the maximum.
%
% Admittedly the following loop is too much code for a small set of 
% calculations such as we have, however the following loop could be 
% implemented into problems with a much larger number of corners to
% evaluate, saving the time required to perform many calculations by hand.

cornerY = [6, 8, 0];
cornerX = [3, 0, 6];
objFunc = zeros(length(cornerY));
for i= 1:length(cornerX)
    objFunc(i) = 4*cornerX(i) + 3*cornerY(i);    
    fprintf('\nWhen:          The objective function gives:\n x = %i          4x + 3y = %i\n y = %i', cornerX(i), objFunc(i), cornerY(i));
end
 maxIndex = find(max(objFunc));
 fprintf('\n\nHence the solutions are:\n x = %i\n y = %i\n\nAnd the maximum value: \n %i\n', cornerX(maxIndex), cornerY(maxIndex), objFunc(maxIndex));

%%
% Having observed the plot and considered the corners of the feasibility region, we mark the corner at which we found the maximum of the objective function. 
text(3,6, '    \leftarrow (3,6)');
plot(3,6,'r*');


