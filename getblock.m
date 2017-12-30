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

