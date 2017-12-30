function flag = issolved(X)
%ISSOLVED Determine if sudoku is solved or not.
%   Detailed explanation goes here
flag = 1;
for i=1:9
    for j=1:9
        if X(i,j) == 0
            flag = 0;
        end
    end
end
end

