%function y=changefs(x,fs1,fs2) returns returns the signal x,which has been
%sampled with sampling frequency fs1, resampled with the frequency fs2.
%Method of resampling: Linear Interpolation
function y =changefs(x,fs1,fs2)

T=(numel(x)-1)/fs1;%Total  time of the signal

i=(0:1/fs1:T)';%points of original sampling

k=(0:1/fs2:T)';%points to be computed

y=interp1(i,x,k); % linear interpolation

N=floor((fs2/fs1)*(numel(x)-1));%Number of samples after resampling

y=y(1:N);
end
