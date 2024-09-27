function y = MyForward(L, b)
    % Get the size of L
    n = length(b);
    
    % Initialize the solution vector y
    y = zeros(n, 1);
    
    % Perform forward substitution
    for i = 1:n
        y(i) = (b(i) - L(i, 1:i-1) * y(1:i-1)) / L(i, i);
    end
end