A = B;
b = C;
M = 1034;

alpha = 0.00001;
L = eye(size(A,2));

A_aug = [A; sqrt(alpha)*L];
b_aug = [b; zeros(size(L,1),1)];

mass_constraint = ones(1,size(A,2));
A_aug = [A_aug; mass_constraint];
b_aug = [b_aug; M];

x = A_aug \ b_aug;

% Verify the solution
% Total mass
total_mass = sum(x);
disp(['Total mass of the solution: ', num2str(total_mass)]);

% Fit error
fit_error = norm(A*x - b);
disp(['Fit error: ', num2str(fit_error)]);