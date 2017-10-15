function xd = iadpcm(rq,wq,L,wmin,wmax,n)

addpath ../task3

r = zeros(1,numel(rq));
for i=1:numel(rq)
	r(i) = iQuant(rq(i),L);
end

w = zeros(1,numel(wq));
[~,Lw] = quantLevels(n,wmin,wmax);
for i=1:numel(wq)
	w(i) = iQuant(wq(i),Lw);
end

xd = zeros(1,numel(r));
xd(1) = r(1);
m = numel(w);

for i=2:numel(xd) 
    if i<=m
        pred=xd(i-1:-1:1)*w(1:i-1)'; 
    else
        pred=xd(i-1:-1:i-m)*w';
    end
    xd(i)=r(i) + pred;
end

rmpath ../task3
end

