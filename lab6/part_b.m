% Section 2.1 -> Process emails

% Processing the emails is a costly operation, so we
% ask instead of making it automatically
generate = input('Regenerate examples (y/n)? ', 's');
if generate == 'y'
  % Transform vocabulary into struct
  vocabulary_list = getVocabList();
  vocabulary = {};
  size_vocab = length(vocabulary_list);
  for i = 1:size_vocab
    vocabulary.(vocabulary_list{i}) = i;
  endfor

  % Generate spam training samples
  spam_filelist = readdir('files/spam');
  X_spam = processBatchEmails('files/spam', spam_filelist, vocabulary, size_vocab);
  % All the examples here are spam
  Y_spam = ones(rows(X_spam), 1);

  easy_ham_filelist = readdir('files/easy_ham');
  X_easy = processBatchEmails('files/easy_ham', easy_ham_filelist, vocabulary, size_vocab);
  Y_easy = zeros(rows(X_easy), 1);

  hard_ham_filelist = readdir('files/hard_ham');
  X_hard = processBatchEmails('files/hard_ham', hard_ham_filelist, vocabulary, size_vocab);
  Y_hard = zeros(rows(X_hard), 1);

  % Save processed data to a file
  printf('Saving generated samples...\n');
  save 'files/examples.mat' X_spam Y_spam X_easy Y_easy X_hard Y_hard
  printf('Done!\n');
endif

% Load examples
load('files/examples.mat');

% Create training set of spam + easy ham
X_train = [X_spam ; X_easy];
Y_train = [Y_spam ; Y_easy];

% Generate C and sigma pools
pool = generateValuePool([0.1; 0.3], 2);

generateModelsFromPool(X_train, Y_train, X_hard, Y_hard, pool, 'linear');
