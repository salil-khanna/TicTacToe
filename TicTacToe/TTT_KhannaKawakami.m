clc;
clear;

% MATLAB Lab #3
% S.Khanna and J.Kawakami (With help from mathworkshelpsite
% and William from FYELIC)
% Tic Tac Toe
% This program allows you to play tic tac toe with one other player.

%asks for users names to be used throughout the program
playera = input('What is your name Player A? : ', 's');
playerb = input('What is your name Player B? : ', 's');

%display message for the program
fprintf('\nHello %s and %s, and welcome to tic tac toe!\n', playera, playerb)
disp("Presented and Programmeked by Salil Khanna and Justin Kawakami")

%creates a while loop for game repeatability
startgame=0;
while startgame==0
    %asks for player a's choice of heads or tails
    fprintf('\n%s, ' , playera);
    playerachoice=input('heads or tails?: ', 's');
    
    %sets a current variable for x(the variable used as the player choice)
    x=2;
    
    %code simulates a coin flip by having a 50/50 chance of being 0 or 1
    %(heads or tails) and saves that to a variable to later be compared 
    %with the player choice
    y=randi([0,1]);
    
    %this if/elseif statement converts playera's choice into a variable to
    %be compared with y (the coin flip)
    if playerachoice=='heads'
        x=0;
    elseif playerachoice=='tails'
        x=1;
    end
    
    %creates a variable for if player a or player b goes first, 0 means they
    %currently go second
    playerafirst=0;
    playerbfirst=0;
    
    %if the coin flip landed on heads and player a guessed correctly, a
    %video of a coin landing on heads plays and player a is assigned to
    %going first (assigning the variable to 1 means they go first), while
    %player b remains at going second
    if x==y&&y==0
        %Found implay function on mathworks helpsite
        h = implay('heads.avi');
        h.Parent.Position = [100 100 700 550];
        play(h.DataSource.Controls)
        fprintf('\n%s goes first.\n',playera);
        fprintf('%s goes second. \n\n',playerb);
        playerafirst=1;
     
    %if the coin flip landed on tails and player a guessed correctly, a
    %video of a coin landing on tails plays and player a is assigned to
    %going first, while player b remains at going second    
    elseif x==y&&y==1
        t = implay('tails.avi');
        t.Parent.Position = [100 100 700 550];
        play(t.DataSource.Controls)
        fprintf('\n%s goes first.\n',playera);
        fprintf('%s goes second. \n\n',playerb);
        playerafirst=1;
    
    %if the coin flip landed on heads and player a did not guess correctly, a
    %video of a coin landing on heads plays and player b is assigned to
    %going first, while player a remains at going second    
    elseif x~=y&&y==0
        h = implay('heads.avi');
        h.Parent.Position = [100 100 700 550];
        play(h.DataSource.Controls)
        fprintf('\n%s goes first.\n',playerb);
        fprintf('%s goes second. \n\n',playera);
        playerbfirst=1;
    
    %if the coin flip landed on tails and player a did not guess correctly, a
    %video of a coin landing on tails plays and playerb is assigned to
    %going first, while player a remains at going second
    elseif x~=y&&y==1
        t = implay('tails.avi');
        t.Parent.Position = [100 100 700 550];
        play(t.DataSource.Controls)
        fprintf('\n%s goes first. \n',playerb);
        fprintf('%s goes second. \n\n',playera);
        playerbfirst = 1;        
    end
    
    %creates a while loop to give the player time to read who was assigned
    %to go first and who goes second
    cont = 'n';
    while cont ~= 'y'
        cont = input('Type the letter y to continue : ','s');
        
    end
    
    %displays the rules of the game
    disp("Rules:")
    disp("In this tic tac toe game, the player who won the coin toss will go first,")
    disp("using X's as their symbol while the loser of the coin toss will be using O's and")
    disp("will be going second. These players will then be alternating turns until a winner")
    disp("of the game has been determined or all the spots in the board have been filled,")
    disp("resulting in a tie. A winner is resulted from having 3 consecutive symbols in a row,")
    disp("in a diagonal or in a column. The most important rule is to have fun!")
    fprintf("\n")
    
    %creates a while loop to give the player time to read the rules
    cont = 'n';
    while cont ~= 'y'
        cont = input('Type the letter y to continue : ','s');
        
    end
    
    %shows that the game has started, creates an array full of zeroes, and
    %uses the function boardplot to convert the input of array into a game board for
    %tic tac toe. 
    fprintf("Game begins\n\n")
    TTT = zeros(3,3);
    Boardplot_KK(TTT);
    
    %Assigns win equal to 0 to show that no one has won the game so far and
    %is used for a while loop that determines if a game has been won, and 
    %if so, the game ends; the variable turns is equal to 1 for
    %another while loop for the game to be over after 9 turns
    win= 0;
    turns = 1;
    while win ~= 1
        while turns <= 9
            %creates a variable determining the remainder of the 
            %current amount of turns, helping determine whos turn it is 
            r =rem(turns,2);
            
            % if player a is the one to go first and the remainder is odd,
            % all the lines under the if statement are run through
            if r == 1 && playerafirst == 1
                %sets a variable named valid to false for a while loop
                valid = false;
                while valid == false
                    %prints out that it is player a's turn and asks them for
                    %what x-coordinate and y-coordinate they want to put
                    %their X symbol in
                    fprintf("%s's turn (X's)\n", playera);
                    xc=input('What X-Coordinate? ');
                    yc=input('What Y-Coordinate? ');
                    disp(" ")
                    
                    %this function checks if the given x-coordinate and
                    %y-coordinate are already being used for another symbol
                    %and if so, displays that a symbol has already been
                    %placed there. It takes the inputs of the array and the
                    %x and y coordinates
                    check = checktaken_KK(xc, yc, TTT);
                    if check == 1
                        valid = false ;
                        disp("Invalid position, a symbol has already been placed there, try again.");
                    
                    %else if a symbol has not been played in that
                    %x and y-coordinate location a 1 representing X is
                    %placed in that location, the code changes the variable valid
                    %to true to escape the while loop, and uses the same previous
                    %boardplot function to update the tic tac toe board
                    else
                        TTT(xc,yc)=1;
                        valid = true ;
                        Boardplot_KK(TTT);
                    end
                    
                    %a function takes an input of the array and checks if
                    %the game has been won through an if function. If the
                    %game has been indeed won by the player, it prints out
                    %a statement with their name and ends the game with a
                    %+6 to the turns, automatically ending the game
                    win = Checkwin_KK(TTT);
                    if win == 1
                        fprintf('The game has been won by %s!!!\n\n', playera);
                        turns = turns + 6;
                    end
                end
                
            % if player b is the one to go second and the remainder is even,
            % all the lines under the if statement are run through 
            elseif r == 0 && playerbfirst == 0
                %sets a variable named valid to false for a while loop
                valid = false;
                while valid == false
                    %prints out that it is player b's turn and asks them for
                    %what x-coordinate and y-coordinate they want to put
                    %their X symbol in
                    fprintf("%s's turn (O's)\n", playerb);
                    xc=input('What X-Coordinate? ');
                    yc=input('What Y-Coordinate? ');
                    disp(" ")
                    
                    %this function checks if the given x-coordinate and
                    %y-coordinate are already being used for another symbol
                    %and if so, displays that a symbol has already been
                    %placed there. It takes the inputs of the array and the
                    %x and y coordinates
                    check = checktaken_KK(xc, yc, TTT);
                    if check == 1
                        valid = false ;
                        disp("Invalid position, a symbol has already been placed there, try again.");
                    
                    %else if a symbol has not been played in that
                    %x and y-coordinate location a 2 representing O is
                    %placed in that location, the code changes the variable valid
                    %to true to escape the while loop, and uses the same previous
                    %boardplot function to update the tic tac toe board
                    else
                        TTT(xc,yc)=2;
                        valid= true;
                        Boardplot_KK(TTT);
                    end
                    
                    %a function takes an input of the array and checks if
                    %the game has been won through an if function. If the
                    %game has been indeed won by the player, it prints out
                    %a statement with their name and ends the game with a
                    %+6 to the turns, automatically ending the game
                    win = Checkwin_KK(TTT);
                    if win == 2
                        fprintf('The game has been won by %s!!!\n\n', playerb);
                        turns = turns + 6;
                    end
                end
            
            % if player b is the one to go first and the remainder is odd,
            % all the lines under the if statement are run through
            elseif r == 1 && playerbfirst == 1
                %sets a variable named valid to false for a while loop
                valid = false;
                while valid == false
                    %prints out that it is player b's turn and asks them for
                    %what x-coordinate and y-coordinate they want to put
                    %their X symbol in
                    fprintf("%s's turn (X's)\n", playerb);
                    xc=input('What X-Coordinate? ');
                    yc=input('What Y-Coordinate? ');
                    disp(" ")
                    
                    %this function checks if the given x-coordinate and
                    %y-coordinate are already being used for another symbol
                    %and if so, displays that a symbol has already been
                    %placed there. It takes the inputs of the array and the
                    %x and y coordinates
                    check = checktaken_KK(xc, yc, TTT);
                    if check == 1
                        valid = false ;
                        disp("Invalid position, a symbol has already been placed there, try again.");
                   
                    %else if a symbol has not been played in that
                    %x and y-coordinate location a 1 representing X is
                    %placed in that location, the code changes the variable valid
                    %to true to escape the while loop, and uses the same previous
                    %boardplot function to update the tic tac toe board    
                    else
                        TTT(xc,yc)=1;
                        valid = true ;
                        Boardplot_KK(TTT);
                    end
                    
                    %a function takes an input of the array and checks if
                    %the game has been won through an if function. If the
                    %game has been indeed won by the player, it prints out
                    %a statement with their name and ends the game with a
                    %+6 to the turns, automatically ending the game
                    win = Checkwin_KK(TTT);
                    if win == 1
                        fprintf('The game has been won by %s!!!\n\n', playerb)
                        turns = turns + 6;
                    end
                end
                
            % if player a is the one to go second and the remainder is even,
            % all the lines under the if statement are run through    
            elseif r == 0 && playerafirst == 0
                %sets a variable named valid to false for a while loop
                valid = false;
                while valid == false
                    %prints out that it is player a's turn and asks them for
                    %what x-coordinate and y-coordinate they want to put
                    %their X symbol in
                    fprintf("%s's turn (O's)\n", playera)
                    xc=input('What X-Coordinate? ');
                    yc=input('What Y-Coordinate? ');
                    disp(" ")
                    
                    %this function checks if the given x-coordinate and
                    %y-coordinate are already being used for another symbol
                    %and if so, displays that a symbol has already been
                    %placed there. It takes the inputs of the array and the
                    %x and y coordinates
                    check = checktaken_KK(xc, yc, TTT);
                    if check == 1
                        valid = false ;
                        disp("Invalid position, a symbol has already been placed there, try again.");
                   
                    %else if a symbol has not been played in that
                    %x and y-coordinate location a 2 representing O is
                    %placed in that location, the code changes the variable valid
                    %to true to escape the while loop, and uses the same previous
                    %boardplot function to update the tic tac toe board
                    else
                        TTT(xc,yc)=2;
                        valid= true ;
                        Boardplot_KK(TTT);
                    end
                    
                    %a function takes an input of the array and checks if
                    %the game has been won through an if function. If the
                    %game has been indeed won by the player, it prints out
                    %a statement with their name and ends the game with a
                    %+6 to the turns, automatically ending the game
                    win = Checkwin_KK(TTT);
                    if win == 2
                        fprintf('The game has been won by %s!!!\n\n', playera)
                        turns = turns + 6;
                    end
                end 
            end     
            %adds 1 to turns to help proceed the while loop
            turns = turns + 1;
        end
        %sets win to 1 to escape the while loop
        win=1;
    end
    
    %if all the numbers in the matrix = 13, it indicates a full board, thus
    %meaning that the game was a tie
    if sum(TTT(1,:))+sum(TTT(2,:))+sum(TTT(3,:))==13
        disp("Game has ended in a tie");
        fprintf("\n")
    end
    
    %asks if the game wants to be played again, corresponding to the first
    %while loop
    startgame = input('Enter 0 to play again (any other number to exit): ');
end

fprintf("\nThanks for playing tic tac toe!");