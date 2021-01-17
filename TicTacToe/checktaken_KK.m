function Check = checktaken_KK(row,col,TTT)
%the function's purpose is to check if a spot in the array/gameboard has already been taken
%the inputs for this function are the row, column, and the tic tac toe array
%the output for this function is if the spot has already been taken 

%Checks if the coordinate entered is out of bounds of the matrix or
%already has a value assigned through the inputs of the x and y location
%and the array
if (row>3||row<1||col>3||col<1||TTT(row,col)==1||TTT(row,col)==2)
    Check = 1;
else
    Check = 0;
end
end
