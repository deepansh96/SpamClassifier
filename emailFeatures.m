function x = emailFeatures(word_indices)
% Takes in a word_indices vector and produces a feature vector
% from the word indices

% Total number of words in the dictionary
n = 1899;

x = zeros(n, 1);

 
	for i=1:size(word_indices) % make a binary vector of length 1899(1- where the word is from vocab)
		x(word_indices(i)) = 1; %                                   (0- where the word is not from the vocab)
	end

end
