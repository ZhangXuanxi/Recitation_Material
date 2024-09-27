function [P, L, U] = MyPLU(A)
    % Solve PA=LU
    % Get the size of the matrix A
    [n, m] = size(A);
    
    % Check if A is square
    if n ~= m
        error('Matrix must be square for LU decomposition');
    end
    
    % Initialize L as identity, U as A, and P as identity
    L = eye(n);
    U = A;
    P = eye(n);
    
    % Perform LU decomposition with partial pivoting
    for k = 1:n-1
        % Find the row with the maximum absolute value in column k (for pivoting)
        [~, pivot] = max(abs(U(k:n,k)));
        pivot = pivot + k - 1;
        
        % If the pivot row is not the current row, swap them
        if pivot ~= k
            % Swap rows in U
            U([k pivot], :) = U([pivot k], :);
            
            % Swap rows in P (track row swaps)
            P([k pivot], :) = P([pivot k], :);
            
            % Swap rows in L, but only the first k-1 columns
            if k > 1
                L([k pivot], 1:k-1) = L([pivot k], 1:k-1);
            end
        end
        
        % Perform Gaussian elimination as usual
        for i = k+1:n
            L(i,k) = U(i,k) / U(k,k);  % Multiplier for row reduction
            U(i,k:n) = U(i,k:n) - L(i,k) * U(k,k:n);  % Update row i of U
        end
    end
end
