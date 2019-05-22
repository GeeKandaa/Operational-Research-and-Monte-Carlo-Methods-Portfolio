%% Task 8

% Common Variables and Container Variable
myfun = @(x) (x./sin(x)).^4;
Nsample = 10000 ; 
Ncopy = 10 ;
xxx = zeros(Ncopy,1) ;
I = -((pi^3)/12)+2*pi*log(2)+((pi^3)*log(2)/3)-(3/2)*pi*1.202056903159594285399738161511449990764986292;

% *Using Matlab Integral Function*
I0 = integral(myfun, 0, pi/2);

% Matlab Integral Function Results
fprintf('Matlab Integral = %1.16f\n Exact Value = %1.16f\n\n' , I0,I) ;

% Using Standard Monte Carlo Method
x = zeros(Nsample , 1) ;
for i=1:Nsample
    rx = pi/2*rand() ;
    x(i) = pi/2*myfun(rx) ;
end

% Basic Monte Carlo Results:
meanr = mean(x) ; 
err = std(x) / sqrt(Nsample) ;
fprintf('Monte Carlo estimate (nsample=%d) = %1.16f +/- %1.16f \n Exact Value = %1.16f\n\n' ,Nsample, meanr , err, I) ;

% *Using Monte Carlo 2-Stratified*
for ic=1:Ncopy
    r1 = pi/4 * rand(Nsample/2 , 1) ;
    r2 = pi/4 + pi/4 * rand(Nsample/2 , 1) ;
    r1f = myfun(r1) ; 
    r2f = myfun(r2) ;
    xxx(ic) = pi/4*(mean(r1f) + mean(r2f)) ;
end


% Monte Carlo 2-Stratified Results:
xm = mean(xxx) ; xerr = std(xxx)/sqrt(Nsample) ;
fprintf('2-Stratified MC estimate (nsample=%d, Ncopy=%d) = %1.16f+/- %1.16f \n Exact Value = %1.16f\n\n' , Nsample, Ncopy, xm , xerr, I) ;


% *Using Monte Carlo 4-Stratified*
for ic=1:Ncopy
    r1 = pi/8 * rand(Nsample/4 , 1) ;
    r2 = pi/8 + pi/8 * rand(Nsample/4 , 1) ;
    r3 = pi/4 + pi/8 *rand(Nsample/4, 1) ;
    r4 = 3*pi/8 + pi/8 *rand(Nsample/4, 1) ;
    r1f = myfun(r1) ; 
    r2f = myfun(r2) ;
    r3f = myfun(r3) ; 
    r4f = myfun(r4) ;
    xxx(ic) = pi/8*(mean(r1f) + mean(r2f)+mean(r3f) + mean(r4f)) ;
end

% Monte Carla 4-Stratified Results:
xm = mean(xxx) ; xerr = std(xxx)/sqrt(Nsample) ;
fprintf('4-Stratified MC estimate (nsample=%d, Ncopy=%d) = %1.16f+/- %1.16f \n Exact Value = %1.16f\n\n' , Nsample, Ncopy, xm , xerr, I) ;