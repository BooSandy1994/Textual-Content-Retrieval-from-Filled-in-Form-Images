function [out_sd] = sd(A)
   [r,c] = size(A);
   sum = 0;count = 1;
   for row=1:r
       for col=1:c
           if A(row,col) ~= 255
              data_array(count,1) = A(row,col);
              count = count + 1;
           end
       end
   end
   data_array = double(data_array);
   out_sd = std(data_array);
end