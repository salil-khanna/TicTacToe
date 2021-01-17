function [n] = convertToNum(numArray)

n = 0;

for i = 1:length(numArray)

    n = n + (10^(length(numArray)-i)) * numArray(:,i);

end


