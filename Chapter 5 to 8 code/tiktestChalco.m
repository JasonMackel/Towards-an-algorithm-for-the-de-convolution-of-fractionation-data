% Define the problem
A = B;  % Your matrix A
b = C;  % Your vector b
M = 1421.9;    % Total mass constraint
% Tikhonov regularization setup
lambda = 0.0000001;      % Example regularization parameter
L = eye(size(A,2)); % Common choice for L is the identity matrix

% Formulate the augmented system
A_augmented = [A; sqrt(lambda)*L; ones(1, size(A,2))];
b_augmented = [b; zeros(size(L,1), 1); M];

% Solve the augmented system
x = A_augmented \ b_augmented;

% Verify the solution
% Check the total mass
total_mass = sum(x);
fprintf('Total mass of the solution: %f\n', total_mass);

% Check the fit to the original problem
fit_error = norm(A*x - b);
fprintf('Fit error: %f\n', fit_error);

A1 = x;
alpha = lambda;