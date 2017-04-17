function vocabList = getVocabList()
% Reads in a corpus of words commonly occuring in spams 
% and returns a cell array of the words in vocabList.


%% Read the fixed vocabulary list
fid = fopen('vocab.txt');

% Store all dictionary words in cell array vocab{}


n = 1899;  % Total number of words in the dictionary


vocabList = cell(n, 1); % Using a struct to map strings -> integers
for i = 1:n
    % Word Index (can ignore)
    fscanf(fid, '%d', 1);
    % Actual Word
    vocabList{i} = fscanf(fid, '%s', 1);
end
fclose(fid);

end
