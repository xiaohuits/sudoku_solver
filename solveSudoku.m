function solution = solveSudoku(X)
%SOLVESUDOKU sudoku solver by trial and error and recursive
%backtracking.
%   X is 9-by-9 matrix containing numbers from 1 to 9. Use 0 to represent
%   unfilled slots. A solved X have all its rows, columns and blocks filled
%   by 1 to 9.

[C,flag] = findCandidate(X);
if flag == 1
        % existance_flag = 0;
        disp('Sudoku is not solvable')
        solution = X;
        return 
end
while(~issolved(X))
    [X,C,singleton_flag,existance_flag] = update(X,C);
    if existance_flag == 0
        solution = X;
        return
    end
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
            %disp('sudoku is not solvable')
            break
        end
        %break
    end
    %
end
solution = X;

function flag = issolved(X)
%ISSOLVED Determine if sudoku is solved or not.
%   Detailed explanation goes here
flag = 1;
for i = X(:).'
    if i==0
        flag = 0;  %sudoku not solved
        break
    end
end
end

function [X,candidate,flag1,flag2] = update(X,candidate)
%UPDATE update X and canditate.
% flag1: true if element of X has been placed by a singleton candidate.
% flag2: false if get empty candidate (no solution exist)
flag1 = 0;
flag2 = 1;
for i=1:9
    for j=1:9
        if length(candidate{i,j}) == 1
            X(i,j) = candidate{i,j};
            flag1 = 1;    % indicate a singleton has been repalced.
            %update candidate row
            for c = 1:9
                if ~isempty(candidate{i,c})
                    candidate{i,c} = candidate{i,c}(candidate{i,c} ~= X(i,j));
                    if isempty(candidate{i,c}) && c~=j
                        flag2 = 0;
                        return
                    end
                end
            end
            %update candidate colunm
            for r = 1:9
                if ~isempty(candidate{r,j})
                    candidate{r,j} = candidate{r,j}(candidate{r,j} ~= X(i,j));
                    if isempty(candidate{r,j})
                        flag2 = 0;
                        return
                    end
                end
            end
            %update candidate block
            I = floor(i/3-0.01);
            J = floor(j/3-0.01);
            for r = (I*3+1):(I*3+3)
                for c = (J*3+1):(J*3+3)
                    if ~isempty(candidate{r,c})
                        candidate{r,c} = candidate{r,c}(candidate{r,c} ~= X(i,j));
                        if isempty(candidate{r,c})
                            flag2 = 0;
                            return
                        end
                    end
                end
            end
            return       % ensure to update only one cell.
        end
    end
end
end
end

