% Section 2.1 -> Process emails

% Load spam data
spam_filelist = readdir('files/spam');

printf('Processing spam');
for email = 1:numel(spam_filelist)
  printf('.');
  % Skip special files . and ..
  if (regexp (spam_filelist{email}, "^\\.\\.?$"))
    continue;
  endif
  % Load file
  filename = sprintf('files/spam/%s', spam_filelist{email});
  raw = readFile(filename);
  processed = processEmail(raw);

endfor
printf('Done!\n');
