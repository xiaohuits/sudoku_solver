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

function block = getblock(X,i,j)
%GETBLOCK get all existed values in the current block.
%   Detailed explanation goes here
block = [];
I = floor(i/3-0.01);
J = floor(j/3-0.01);
for r = (I*3+1):(I*3+3)
    for c = (J*3+1):(J*3+3)
        if X(r,c) ~= 0
            block = [block,X(r,c)];
        end
    end
end
end

function column = getcolumn(X,i,j)
%GETCOLUMN Summary of this function goes here
%   Detailed explanation goes here
column = [];
for r = 1:9
    if X(r,j) ~= 0
        column = [column,X(r,j)];
    end
end
end

function row = getrow(X,i,j)
%GETROW Summary of this function goes here
%   Detailed explanation goes here
row = [];
for c = 1:9
    if X(i,c) ~= 0
        row = [row,X(i,c)];
    end
end
end

end

