function sim = linearKernel(x1, x2)
% Returns a similarity b/w x1 and x2 using a linera kernel

% Ensure that x1 and x2 are column vectors
x1 = x1(:); x2 = x2(:);

% Compute the kernel
sim = x1' * x2;  % dot product

end