% q=Quant(x,D) returns the symbol q for a value x,after quantization,using
% decision levels D. The intervals are (-oo,D(1)] , (D(1),D(2)] e.t.c.
%Symbols are the index of each interval [1,2...]
function q = Quant(x,D)

temp=find(x<=D,1);%Finding the first index of D that  x<=D(i),which is the symbol

if(isempty(temp))%if there is no such D that x<=D,then q=number of decision levels+1
    q=numel(D)+1;
else
    q=temp;%else its the first index of desicion level that x<=D
end

end