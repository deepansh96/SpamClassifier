% Main script for spam classification using SVM's
%% Initialization
clear ; close all; clc

%% Pre-processing & Feature extraction %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('\nDetecting spam in the given Email\n');
fprintf('\nPreprocessing email and extracting features\n');

% Feature extraction - extract feature from the word_indices
% Make a vector of length of vocab-corpus, with binary values
% corresponding to the words in vocab.(1-if found, 0-if not found)

file_contents = readFile('email.txt');
word_indices  = processEmail(file_contents);
features      = emailFeatures(word_indices);

% Print Stats
fprintf('Length of feature vector: %d\n', length(features));
fprintf('Number of non-zero entries: %d\n', sum(features > 0));

fprintf('Press enter to continue.\n');
pause;

%% We'll make predictions on this email after we've trained it on training data





%% Train Linear SVM for Spam Classification %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Loading the Spam Email dataset. The SVM will be trained on this
% X,y are loaded in the environment
load('spamTrain.mat');

fprintf('\nTraining Linear SVM (Spam Classification)\n')
fprintf('(please wait...this may take 1 to 2 minutes) ...\n')

C = 0.1;
model = svmTrain(X, y, C, @linearKernel);

p = svmPredict(model, X);

fprintf('Training Accuracy: %f\n', mean(double(p == y)) * 100);





%% Testing on test data and calculating test error %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Load the test dataset
load('spamTest.mat'); % We'll have Xtest and ytest in environment
 
fprintf('\nEvaluating the trained Linear SVM on a test set ...\n')

p = svmPredict(model, Xtest);

fprintf('Test Accuracy: %f\n', mean(double(p == ytest)) * 100);
fprintf('Press enter to continue.\n');
pause;




%% Classifying the given Email by the user %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read and predict
% pre processing and extracting features again
fprintf('Detecting if the given mail is spam or not\n');
fprintf('Per-processed form:\n');

file_contents = readFile('email.txt');
word_indices  = processEmail(file_contents);
features      = emailFeatures(word_indices);
p = svmPredict(model, features);

filename = 'email.txt';

fprintf('\nProcessed %s\n\nSpam Classification: %d\n', filename, p);
fprintf('(1 indicates spam, 0 indicates not spam)\n\n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%