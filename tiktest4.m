lambda = alpha;

A_aug = [sqrt(lambda) .* A; ones(1, size(A, 2))];
b_aug = [sqrt(lambda) .* b; M];

[U, S, V] = svd(A_aug, 'econ');


x = V * ((S'.*S + lambda.*eye(size(S, 1))) \ (S'.*(U'.*b_aug)));