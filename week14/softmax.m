function y=softmax(v)
  y = exp(v)/(sum(exp(v)));
end