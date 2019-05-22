%% Task 10

%Common Variables
num_iterations = 10000;
%% Standard Game Variant

% Debugging
%ind_game = input('Would you like to see individual game results? (Give boolean response)\n');

% Variable Declaration
AWin = 0;
BWin = 0;
GameLengths = zeros(num_iterations,1);
clc;

%Monte Carlo Loop
for i=1:num_iterations
    Astake = 2000 ;
    Bstake = 2000 ;
    bet_per_game = 50 ;
    count = 0 ;
    while( Astake > 0 && Bstake > 0 )
        rr = rand()  ;
        if(  rr < 0.49 )
            Astake = Astake + bet_per_game ;
            Bstake = Bstake - bet_per_game  ;
        else
            Astake = Astake - bet_per_game  ;
            Bstake = Bstake + bet_per_game  ;
        end 
    count = count +  1 ;
    end
    
    % Debugging Continued
    %if (ind_game == 1)
    %    fprintf('Player stake = £%d | Bank stake = £%d | Length of game = %d bets\n', Astake, Bstake,count)
    %end
    
    if (Bstake <= 0)
        AWin = AWin +1;
    else
        BWin = BWin +1;
    end
    GameLengths(i) = count;
end
Prob_A_Win = AWin/num_iterations*100;
Prob_B_Win = BWin/num_iterations*100;
mean_length = sum(GameLengths)/num_iterations;
error = std(GameLengths)/sqrt(num_iterations);
fprintf('\n\nThe probabilities of either player winning the game is as follows:\n\n   Player Wins (Player A) - %3.2f%%\n   Bank Wins (Player B)   - %3.2f%%\n\nThe mean length of each game is:\n\n   %1.0f \x00B1 %1.0f bets\n\n',Prob_A_Win,Prob_B_Win,mean_length,error)

%% Kelly Criterion Game Variant - Monte Carlo Evaluation

% Debugging
%Cont = input('Press enter to continue')
%ind_game = input('Would you like to see individual game results? (Give boolean response)\n');

% Variable Declaration
AWin = 0;
BWin = 0;
GameLengths = zeros(num_iterations,1);
clc;

%Monte Carlo Loop
for i=1:num_iterations
    Astake = 2000 ;
    Bstake = 2000 ;
    count = 0 ;
    bet_per_game = 0;
    % Complicated while loop, but will also check that each player can
    % uphold bet without going into negative finances.
    while((Astake > 0 && Bstake > 0) && (Astake >= bet_per_game && Bstake >= bet_per_game))
        rr = rand()  ;
        bet_per_game = Bstake*(0.51*(1+1)-1)/1 ;
        if(  rr < 0.49 )
            Astake = Astake + bet_per_game ;
            Bstake = Bstake - bet_per_game  ;
        else
            Astake = Astake - bet_per_game  ;
            Bstake = Bstake + bet_per_game  ;
        end 
    count = count +  1 ;
    end
    
    % Debugging Continued
    %if (ind_game == 1)
    %    fprintf('Player stake = £%f | Bank stake = £%f | Length of game = %d bets\n', Astake, Bstake,count)
    %end
    
    if (Bstake < Astake)
        AWin = AWin +1;
    else
        BWin = BWin +1;
    end
    GameLengths(i) = count;
end

%% Kelly Criterion Results Results
Prob_A_Win = AWin/num_iterations*100;
Prob_B_Win = BWin/num_iterations*100;
mean_length = sum(GameLengths)/num_iterations;
error = std(GameLengths)/sqrt(num_iterations);
fprintf('\n\nThe probabilities of either player winning the game is as follows:\n\n   Player Wins (Player A) - %3.2f%%\n   Bank Wins (Player B)   - %3.2f%%\n\nThe mean length of each game is:\n\n   %1.0f \x00B1 %1.0f bets\n\n',Prob_A_Win,Prob_B_Win,mean_length,error)