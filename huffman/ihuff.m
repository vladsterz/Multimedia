%function [q,n] = ihuff(b,s) decodes the bitsream b,with s as the huffman
%look-up table, to the symbol indeces q as they appear in the message. If
%any bits are not assigned to a symbol,function returns the number as n.
function [q,n] = ihuff(b,s)
for i=1:numel(s) %strings
    s{i}=num2str(s{i},'%d');
end

counter=0;
i=1;
%If symbolLength is the length of the symbol with the index i,compare the
%symbolLength first bits of b with the code s{i}.If they match,delete the
%word from the bitstream b and save the symbol index in q.If they don't
%match,try the next symbol.
while i<=numel(s)
    symbolLength=numel(s{i});
    if numel(b)<symbolLength
        i=i+1;
        continue;
    end
    if strcmp(b(1:symbolLength),s{i})
        counter=counter+1;
        q(counter)=i;
        b(1:symbolLength)=[];
        i=0;
    end
    i=i+1;
end
n=numel(b);
q=q(1:counter)';
end