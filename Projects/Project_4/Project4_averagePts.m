function[xa] =averagePts(xs,w)
  % This function calculates the weighted average of the three nearest 
  % neighbors, including the current element itself.Where w1, w2, w3 are 
  % the elements of the [1x3] input vector w, after normalization.
  % Function will assume that the vector "wraps around" on itself
  % ,such that xs(1) and xs(last) are adjacent. 
  %%
  if w(1)+w(2)+w(3) == 0
      error('Error: The sum of weights must be not be zero.\n');
  else
      w = w/sum(w);
      array_size= length(xs);
      for i = 1:array_size
          if i == 1
              start_point = array_size;
          else
              start_point = i - 1;
          end
          if i == array_size
              end_point = 1;
          else
              end_point = i + 1;
          end
          xa(i) = w(1)*xs(start_point) + w(2)*xs(i) + w(3)*xs(end_point);
      end
  end
end
