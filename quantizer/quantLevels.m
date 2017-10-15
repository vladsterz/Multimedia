%function [D,L]=quantLevels(n,xmin,xmax) computes the decision (D) and
%quantization (L) levels for an uniform quantizer with range N=xmax-xmin
%using n bits.
function [D,L] = quantLevels(n,xmin,xmax)
L=zeros(2^n,1);

N=xmax-xmin;%range
dx=N/2^n;%intervals of decision levels

i=1:2^n -1;%indeces of intervals

D=xmin+i*dx;%computing the decision levels

%we assume that quanitzation levels are at the halfpoint of each desicion
%interval
L(1)=(xmin+D(1))/2;%first value 
L(end)=(xmax+D(end))/2;%last value

i=2:2^n -1;
L(i)=(D(i)+D(i-1))/2;%every other value

end