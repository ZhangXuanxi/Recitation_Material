

% Example usage:
A = [2 1 2 2;
    1 -7 6 5;
    2 6 2 -5;
    2 5 -5 1];

B=[1 -5 5 2;
    -5 2 6 2; 
    5 6 -7 1;
    2 2 1 2];
 
T= tridiagonalize(A);
disp('Tridiagonal form of A:');
disp(T);


function T = tridiagonalize(A)
    % This function transforms a symmetric matrix A into tridiagonal form
    % using Householder reflections.
    
    % Ensure that A is symmetric
    if ~isequal(A, A')
        error('Matrix A must be symmetric.');
    end

    % Get the size of the matrix
    [n, ~] = size(A);
    T = A;  % Copy of A to work on

    for k = 1:n-2
        % Extract the column below the diagonal element at (k, k)
        x = T(k+1:n, k);

        % Construct Householder vector v
        e1 = zeros(length(x), 1);
        e1(1) = norm(x) * sign(x(1));
        v = x + e1;
        v = v / norm(v);


        % Update T 
        T(k+1:n,:) = T(k+1:n,:)-2*v*(v'*T(k+1:n,:));
        T(:,k+1:n) = T(:,k+1:n)-2*(T(:,k+1:n)*v)*v';
    end
end