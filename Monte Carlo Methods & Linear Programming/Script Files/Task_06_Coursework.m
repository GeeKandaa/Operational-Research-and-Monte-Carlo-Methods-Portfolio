%% Task 6

%% Variable Declaration

lam = 0.5; 
k = 3; 
the = k/lam;
x = gamrnd(3,1/0.5,[10000,1]);
M = mean(x);

%% Comparison of Expected and Resulting Mean Values.

fprintf('The average mean of the randomly generated numbers of the erlang distribution:\n      %f\nThe theoretical mean:\n      k/\x03BB = %f\nThe difference between the theoretical mean and the exact mean:\n      %f\n', M, the, abs(M-the));

%% Plot of Solutions

histogram(x, 'Normalization', 'PDF')
hold on
y = 0:0.1:20; f = ((lam^k).*(y.^(k-1)).*exp(-lam*y))/factorial(k-1);
plot(y,f, 'LineWidth',1.5)

