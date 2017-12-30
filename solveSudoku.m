function solution = solveSudoku(X)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
while(~issolved(X))
    [C,flag] = findCandidate(X);
    if flag == 1
        % existance_flag = 0;
        solution = X;
        return 
    end
    [X, singleton_flag] = update(X,C);
    if singleton_flag == 0   % no singleton exist, carry out trial and error way.
        z = find(X == 0, 1);
        for t = C{z}
            X_try = X;
            X_try(z) = t;
            Y = solveSudoku(X_try);     % recursive backtracking.
            if issolved(Y)
                solution = Y;
                return
            end
        end
        if ~issolved(Y)   %tried all candidate but still can't find a solution.
            break
        end
        %break
    end
    %
end
solution = X;
end

