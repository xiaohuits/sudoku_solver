function [C,flag] = findCandidate(X)
%FINDCANDIDATE Summary of this function goes here
%   X: zero means undetermined
%   C: array of cells containning valid candidates
flag = 0;
C{9,9} = [];
for i=1:9
    for j=1:9
        if X(i,j) == 0
            initialC = 1:9;
            column = getcolumn(X,i,j);
            row = getrow(X,i,j);
            block = getblock(X,i,j);
            for value = column
                initialC = initialC(initialC ~= value);
            end
            for value = row
                initialC = initialC(initialC ~= value);
            end
            for value = block
                initialC = initialC(initialC ~= value);
            end
            C{i,j} = initialC;
            if isempty(initialC)
                flag = 1;  %exist cell containning non candidates, no solution exist.
                C{i,j} = -1;
            end
        end
    end
end


end

