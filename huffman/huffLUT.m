%function s=huffLUP(p) returns the Huffman look-up table for some symbols
%which appear in a message with probabilty p(i) where i is the index of the
%symbol.
function s = huffLUT(p)
if iscolumn(p)
    p=p';
end

N=numel(p);%Number of different symbols
[p,index]=sort(p);%ascending sort with indexing

si=num2cell(1:N);
si=si(index);
codes=cell(N,1);

%Here is the classic Huffman encoding algorithm
while length(p)>1 %while there are more than 1 symbols
    %merging the first 2 symbols,since p is sorted
    left=si{1};%left child 
    right=si{2};%right child

    codes(left)=addC(codes(left),1);%assume every left child is 1 and every right is 0
    codes(right)=addC(codes(right),0);

    si=[{[left right]} si(3:end)];%replace symbols that merged
    p=[p(1)+p(2) p(3:end)];%and sum their probabilities
    [p,index]=sort(p);%sort to find the 2 least probabilities
    si=si(index);
end

s=codes;
end

%functin new=addC(old,val) adds the val value to every sub-tree
function new=addC(old,val) 
new=cell(size(old));
for i=1:numel(old)
    new{i}=[val old{i}];
end
end
