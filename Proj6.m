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
    x = [x,rand(n,1)];
end

%Box-Muller, m must be even (or can set up where n must be even)
z = [];
for i=1:n 
    for j=1:2:m-1
        z(i,j) = sqrt(-2*log(x(i,j)))*cos(2*pi*x(i,j+1));
        z(i,j+1) = sqrt(-2*log(x(i,j)))*sin(2*pi*x(i,j+1));
    end;
end;

mu = mean(z);
sigma = cov(z);
R = chol(sigma);

%pdf, doesn't quite work like this. The matrix mult => 0
V = cov(x);
e = eig(V);
prob=1;
for k=1:n
    prob = prob*(1/(sqrt(eig(k,k)))*exp(-(x*(V^(-1))*x')/2));
end;
prob = prob*(1/((2*pi)^(n/2)));

%empirical covariance
VN = x*x';
S = svd(VN);


end