function []=Proj6(n,m)
%
% Purpose: Multinomial normal random vector generation
%
% [] = Proj6(n,m)
% Input: 
%   m, size of desired sample
%   n, length of random vector

x = [];
for i=1:m
    x = [x;rand(1,n)];
end

%Box-Muller, m must be even (or can set up where n must be even)
z = [];
for i=1:n 
    for j=1:2:m-1
        z(j,i) = sqrt(-2*log(x(j,i)))*cos(2*pi*x(j+1,i));
        z(j+1,i) = sqrt(-2*log(x(j,i)))*sin(2*pi*x(j+1,i));
    end;
end;

mu = mean(z);
sigma = cov(z);
R = chol(sigma);

%pdf
V = cov(x);
e = eig(V);
prob=1;
for k=1:n
    prob = prod*(1/(sqrt(eig(k,k)))*exp(-(x'*(V^(-1))*x)/2));
end;
prob = prob*1/((2*pi)^(n/2));

end