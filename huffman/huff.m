%function b=huff(q,s) returns the bitstream,as a string,for the message
%q,using the look-up table s
%q has the indices of the symbols
function b=huff(q,s)
N=numel(q);%number of symbols in message
temp=[];
for i=1:N
    temp=[temp s{q(i)}];%bitstream
end
b=num2str(temp,'%d');%bitstream as string
end