function [L, U] = MyLU(A)
    % Get the size of the matrix A
    [n, m] = size(A);
    
    % Check if A is square
    if n ~= m
        error('Matrix must be square for LU decomposition');
    end
    
    % Initialize L and U
    L = eye(n); % L starts as an identity matrix
    U = A;      % U starts as a copy of A
    
    % Perform the decomposition
    for k = 1:n-1
        for i = k+1:n
            if U(k,k) == 0
                error('Zero pivot encountered');
            end
            L(i,k) = U(i,k) / U(k,k); % Calculate the multiplier
            U(i,k:n) = U(i,k:n) - L(i,k) * U(k,k:n); % Update row i of U
        end
    end
end
