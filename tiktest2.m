% Define the problem
A = B; % Your matrix A
b = C; % Your vector b
M = 1034;   % Total mass constraint

% Tikhonov regularization setup
lambda = 0.00001;       % Example regularization parameter
L = eye(size(A, 2)); % Common choice for L is the identity matrix

% Formulate the augmented system
A_augmented = [A; sqrt(lambda) * L];
b_augmented = [b; zeros(size(L, 1), 1)];

% Define constraints
lb = zeros(s % Lower bound (x >= 0)
Aeq = ones(1, size(A, 2)); % Equality constraint mize(A, 2), 1);atrix for mass constraint
beq = M;                   % Equality constraint value for mass constraint

% Solve the problem
options = optimoptions('lsqlin', 'Algorithm', 'interior-point', 'Display', 'off');
x = lsqlin(A_augmented, b_augmented, [], [], Aeq, beq, lb, [], [], options);

% Verify the solution
% Check the total mass
total_mass = sum(x);
fprintf('Total mass of the solution: %f\n', total_mass);

% Check non-negativity
if all(x >= 0)
    disp('All elements of x are non-negative.');
else
    disp('Some elements of x are negative.');
end

% Check the fit to the original problem
fit_error = norm(A*x - b);
fprintf('Fit error: %f\n', fit_error);