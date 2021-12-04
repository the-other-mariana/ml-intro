function [W1, W2] = multiclass(W1, W2, X, D, max_epoch)
  global m
  for epoch=1:max_epoch
    % each training data
    for i=1:m
      % inner layer output v1
      v1 = W1 * X(i,:)';
      y1 = sigmoid(v1);
      % next layer output v
      v = W2 * y1;
      y = softmax(v);
    end
  end
end