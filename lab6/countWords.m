function [word_vector] = countWords(email, vocab_struct, size_vocab)
  word_vector = zeros(size_vocab, 1);
  while ~isempty(email)
    % For each word in the email
    [str, email] = strtok(email, [' ']);
    % Mark it in the word vector
    if isfield(vocab_struct, str)
      word_vector(vocab_struct.(str)) = 1;
    endif
  endwhile
endfunction
