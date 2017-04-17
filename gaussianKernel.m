function sim = gaussianKernel(x1, x2, sigma)
%% Returns a radial basis function b/w x1 and x2.
%% also called as a gaussian kernel

% Ensure that x1 and x2 are column vectors
x1 = x1(:); x2 = x2(:);

sim = 0;

%returns similarity b/w x1 and x2 using a gaussian kernel(sigma - bandwidth)
	sim = exp(-sum((x1-x2).^2) / (2*(sigma^2)));

end
