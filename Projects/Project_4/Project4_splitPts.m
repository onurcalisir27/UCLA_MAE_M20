function[xs] =splitPts(x)
  % This function calculates the midpoint of every two consecutive elements 
  % in  an array using the midpoint formula; the output of  splitPts is a
  % vector with twice the number of elements as x, where midpoints are
  % inserted every-other element with a value equal to the average of the
  % neighboring elements.
  %%
 array_size=length(x);
  for i = 1:array_size
      xs(2*i - 1) = x(i);
      if i == array_size
          xs(2*i) = (x(1) + x(i))/2;  
      else
          xs(2*i) = (x(i) + x(i + 1))/2;
      end
  end
end