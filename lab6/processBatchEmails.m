function [X] = processBatchEmails(directory, filelist, vocabulary, size_vocab)
  file_count = numel(filelist);
  X = zeros(file_count, size_vocab);

  printf('Processing %s', directory);
  for email = 1:file_count
    % Skip special files . and ..
    if (regexp (filelist{email}, "^\\.\\.?$"))
      continue;
    endif
    % Load file
    filename = sprintf('%s/%s', directory, filelist{email});
    raw = readFile(filename);
    processed = processEmail(raw);
    % Generate attribute vector
    word_vector = countWords(processed, vocabulary, size_vocab);
    % Store it as a training example
    X(email, :) = word_vector;
    printf('.');
  endfor
  printf('Done!\n');
endfunction
