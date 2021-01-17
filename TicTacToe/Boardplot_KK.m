function Boardplot_KK(GB)
%the function's purpose is to graph the numbers in the array into a board plot of X's and O's
%the inputs for the function are the tic tac toe array
%the output for this funcion is the game board plot

%Creates nested for loop to analyze the input of the whole matrix
%Assisted by William in FYELIC(changing while nested loop to for nested
%loop
for xc = 1:3
    for yc = 1:3
        
        %Creates grid lines for tic tac toe board
        %Found on mathworks help site while searching for plotting vertical
        %and horizontal lines
        yline(0.5,'-k');
        yline(1.5,'-k');
        yline(2.5,'-k');
        yline(3.5,'-k');
        xline(0.5,'-k');
        xline(1.5,'-k');
        xline(2.5,'-k');
        xline(3.5,'-k');
        
        %if the game board array returns a 1, an X is used
        if GB(xc,yc)==1
            
            %Creates the limit of the axes
            axis([0.5 3.5 0.5 3.5]);
            
            %Plots the X marker as a point
            %Found scatter function on mathworks help site
            scatter(xc,yc,2000,'Xk');
            
            %Overlays the graph points onto one graph
            %Found hold function on mathworks help site (while searching to
            %overlay graphs)
            hold on;
        end
        
        %if the game board array returns a 1, an O is used
        if GB(xc,yc)==2
            
            %Creates the limit of the axes
            axis([0.5 3.5 0.5 3.5]);
            
            %Plots the X marker as a point
            scatter(xc,yc,2000,'Ok');
            
            %Overlays the graph points onto one graph
            hold on;
        end
    end
end

%formating the graph with a title, labels, and no grid
xlabel('X-Coordinate');
ylabel('Y-Coordinate');
grid off;
title('Tic Tac Toe');
end