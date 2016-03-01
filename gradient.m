function [x]=gradient(A,b)
%
% Purpose: Use steepest gradient method to solve a system of linear
% equations
% [x]=gradient(A,b,epsilon)
% epsilon is the convergence criterion, such as 1e-5
% 
[n,m] = size(A);
    if m~=n
        disp('A must be a square matrix.')
        return;
    end;
    
x = zeros(n,1);
k=0;
kmax = 100; %some arbitary number
epsilon = 1e-5;
r = b-A*x;
delta = r'*r; %inner product
check = epsilon*sqrt(b'*b);

while sqrt(delta)>check && k<kmax
    k = k+1;
    if k==1
        p = r;
    else
        beta = delta/deltaold;
        p = r+beta*p;        
    end;    
    w = A*p;
    alpha = delta/(p'*w);
    x = x + alpha*p
    r = r - alpha*w;
    deltaold = delta;
    delta = r'*r
end;
x
end