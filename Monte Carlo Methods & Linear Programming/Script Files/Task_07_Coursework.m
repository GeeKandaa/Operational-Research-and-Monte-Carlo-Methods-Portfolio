%% Task 7
%% Common Variable Declaration:

fun = @(u1,A,X) cos(2*pi*u1+dot(A,X));
X = zeros(4,1);

%% *Consideration #1*

% Variables and Container:
nSample = 10^6 ;
x = zeros(nSample , 1) ;
A = [1,1,1,1];
u1 = 1 ;

% Monte Carlo Loop
for i=1:nSample
  for j=1:4
      X(j)=rand();
  end
  x(i) = fun(u1,A,X); 
end

% Error Estimation:
err = std(x) / sqrt(nSample) ;

%% *Consideration #1 Results:*

meanr = mean(x) ;
funEXACT = cos(2*pi*u1+0.5*sum(A))*prod((2./A).*sin(A./2));
fprintf('\nConsideration #1\n(nsample=%i)\nu1 = %1.1f\nA = [%1.1f,  %1.1f,  %1.1f,  %1.1f]\nMonte Carlo estimate = %f +/- %f \nExact result = %f\n\n',nSample, u1, A, meanr , err, funEXACT);


%% *Consideration #2*

% Variables and Container:
nSample = 4*10^6 ;
x = zeros(nSample , 1) ;
% A = [1,1,1,1];    !!Unnecessary!! Kept for clarity
% u1 = 1 ;          !!Unnecessary!! Kept for clarity

% Monte Carlo Loop
for i=1:nSample
  for j=1:4
      X(j)=rand();
  end
  x(i) = fun(u1,A,X); 
end

% Error Estimation:
err = std(x) / sqrt(nSample) ;

%% *Consideration #2 Results:*

meanr = mean(x) ;
% funEXACT = cos(2*pi*u1+0.5*sum(A))*prod((2./A).*sin(A./2));   !!Unnecessary computation!! Kept for clarity
fprintf('Consideration #2\n(nsample=%i)\nu1 = %1.1f\nA = [%1.1f,  %1.1f,  %1.1f,  %1.1f]\nMonte Carlo estimate = %f +/- %f \nExact result = %f\n\n',nSample, u1, A, meanr , err, funEXACT);

%% *Consideration #3*

% Variables and Container:

A = [.1,.1,.1,.1];
u1 = 1 ;
err = [];
meanr = [];
NSample = [];

for k=1:3:4
    nSample = k*10^6 ;
    x = zeros(nSample , 1) ;
    

    % Monte Carlo Loop
    for i=1:nSample
        for j=1:4
            X(j)=rand();
        end
        x(i) = fun(u1,A,X); 
    end

    % Error Estimation:
    err = [err, std(x) / sqrt(nSample)] ;
    meanr = [meanr, mean(x)];
    NSample = [NSample,nSample];
end
%% *Consideration #3 Results* :

funEXACT = cos(2*pi*u1+0.5*sum(A))*prod((2./A).*sin(A./2));
fprintf('Consideration #3a\n(nsample=%i)\nu1 = %1.1f\nA = [%1.1f,  %1.1f,  %1.1f,  %1.1f]\nMonte Carlo estimate = %f +/- %f \nExact result = %f\n\n',NSample(1), u1, A, meanr(1) , err(1), funEXACT);
fprintf('Consideration #3b\n(nsample=%i)\nu1 = %1.1f\nA = [%1.1f,  %1.1f,  %1.1f,  %1.1f]\nMonte Carlo estimate = %f +/- %f \nExact result = %f\n\n',NSample(2), u1, A, meanr(2) , err(2), funEXACT);
%% Use of Monte Carlo Loop as a Function
% For clarity, I have omitted declaring the Monte Carlo loop in this code
% as a function. Typical utilisation however would dictate that the loop be
% defined in a separate function file or (as of version R2016b) at the end
% of this file.