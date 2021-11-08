function [ out_u_dia ] = u_diagonal(row,col,bw)
   pad_bw = padarray(bw,[4,4],1,'both');
   i = (row+4) - 1; j = (col+4) + 1; 
   out_u_dia = 0;
   while(pad_bw(i,j)==0)
       out_u_dia = out_u_dia + 1;
       i = i - 1; j = j + 1;
   end
   i = (row+4) + 1; j = (col+4) - 1;
   while(pad_bw(i,j)==0)
       out_u_dia = out_u_dia + 1;
       i = i + 1; j = j - 1;
   end
end

