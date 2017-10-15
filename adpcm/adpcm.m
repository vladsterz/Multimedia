function [rq,wq] = adpcm(x,D,L,m,wmin,wmax,n)
addpath ../task2
w=lpcoeffs(x,m)';
rmpath ../task2


est_x = filter([0 w],1,x);	%Compute estimated signal

r = x-est_x;				%Prediction errors

addpath ../task3
[Dw,~] = quantLevels(n,wmin,wmax);
wq=zeros(1,numel(w));

for i=1:numel(w)
	wq(i) = Quant(w(i), Dw);
end

rq=zeros(1,numel(r));

for i=1:numel(r)
	rq(i) = Quant(r(i),D);
end


rmpath ../task3
end

	