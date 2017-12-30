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

