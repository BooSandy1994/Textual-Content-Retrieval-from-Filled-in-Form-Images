%this calculates the stroke width of the lower diagonal
function [ out_l_dia ] = l_diagonal(row,col,bw)
   pad_bw = padarray(bw,[4,4],1,'both');
   out_l_dia = 0;
   i = (row+4) + 1; j = (col+4) + 1;
   while(pad_bw(i,j)==0)
       out_l_dia = out_l_dia + 1;
       i = i + 1; j = j + 1;
   end
   i = (row+4) - 1; j = (col+4) - 1;
   while(pad_bw(i,j)==0)
       out_l_dia = out_l_dia + 1;
       i = i - 1; j = j - 1;
   end
end

