function visualize_examples(examples)
  y = examples(:, 3);
  negatives = find(y == 0);
  positives = find(y == 1);
  plot(examples(negatives, 1), examples(negatives, 2), 'ko', examples(positives, 1), examples(positives, 2), '+', 'MarkerFaceColor', 'y', 'MarkerSize', 7);
  xlabel('Exam 1 score', 'fontsize', 10);
  ylabel('Exam 2 score', 'fontsize', 10);
  legend('Not Admitted', 'Admitted');
endfunction
