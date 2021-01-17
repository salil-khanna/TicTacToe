function W = Checkwin_KK(GB)
%the function's purpose is to check if the game has been won by a certain player
%the inputs for the function are the tic tac toe array
%the output for the function is who won the game, or if no one has won yet

%Checks the input of array for all the winning combinations for the X marker and returns 1 if it's
%true th
if (GB(1,1)==1&&GB(1,2)==1&&GB(1,3)==1 || GB(2,1)==1&&...
    GB(2,2)==1&& GB(2,3)==1 || GB(3,1)==1&&GB(3,2)==1&&GB(3,3)==1 ||...
    GB(1,1)==1&&GB(2,1)==1&&GB(3,1)==1 || GB(1,2)==1&&GB(2,2)==1&&GB(3,2)==1 ...
    || GB(1,3)==1&&GB(2,3)==1&&GB(3,3)==1 || GB(1,1)==1&&GB(2,2)==1&&GB(3,3)==1 ...
    || GB(1,3)==1&&GB(2,2)==1&&GB(3,1)==1)

    W = 1;

%Checks the input array all the winning combinations for the O marker and returns 2 if it's
%true
elseif (GB(1,1)==2&&GB(1,2)==2&&GB(1,3)==2 || GB(2,1)==2&& GB(2,2)==2&&...
         GB(2,3)==2 || GB(3,1)==2&&GB(3,2)==2&&GB(3,3)==2 || GB(1,1)==2&&GB(2,1)==2&&...
         GB(3,1)==2 || GB(1,2)==2&&GB(2,2)==2&&GB(3,2)==2 || GB(1,3)==2&&GB(2,3)==2&&...
         GB(3,3)==2 || GB(1,1)==2&&GB(2,2)==2&&GB(3,3)==2 || GB(1,3)==2&&GB(2,2)==2&&GB(3,1)==2)
    
     W = 2;
%If neither are true, W becomes 0 (No winner yet)
else
    W = 0;
end

end
