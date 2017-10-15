function w = lpcoeffs(x,m)
if isrow(x)
    x=x';
end

r=xcorr(x,m);
start=(numel(r)-1)/2 + 1; %index of lagg=0
R=toeplitz(r(start:end-1)); %autocorrelation matrix
p=-r(start+1:end);

w=R\p;%Yule-Walker equation
w=-w;

end