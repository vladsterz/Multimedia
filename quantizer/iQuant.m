%function x=iQuant(q,L) returns the dequantized value for symbol q,using
%the quantization levels L
function x = iQuant(q,L)
x=L(q); %return the quantization level for a symbol q,using the L
end