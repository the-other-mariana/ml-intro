function [W1, W2, conv] = multiclass(W1, W2, X, D, max_epoch)
  global m
  alpha = 0.1;
  for epoch=1:max_epoch
    % each training data
    for i=1:m
      % inner layer output v1
      v1 = W1 * X(i,:)';
      y1 = sigmoid(v1);
      % next layer output v
      v = W2 * y1;
      y = softmax(v);
      % retropropagation
      e = D(i,:)'-y;
      delta = e;
      % vector of errors of size m (for each training data point)
      error(i) = sum(abs(e));
      
      e1 = W2'*delta;
      delta1 = y1.*(1 - y1).*e1;
      % delta rule: learning rule
      dW1 = alpha*delta1*X(i,:);
      W1 = W1 + dW1;
      dW2 = alpha*delta*y1';
      W2 = W2 + dW2;
    end
    % conv: vector of error per epoch
    conv(epoch) = sum(error);
  end
end