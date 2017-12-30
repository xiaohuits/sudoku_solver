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

