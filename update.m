function [X,flag] = update(X,canditate)
%UPDATE Summary of this function goes here
%   Detailed explanation goes here
flag = 0;
for i=1:9
    for j=1:9
        if length(canditate{i,j}) == 1
            X(i,j) = canditate{i,j};
            flag = 1;
            return       % ensure to update only one cell.
        end
    end
end
end

