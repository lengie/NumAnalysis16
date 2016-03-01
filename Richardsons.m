function [x]=Richardsons(A,b)
%
% Purpose: Use Richardson's iterative method to solve a system of linear
% equations
% [x]=Richardsons(A,b)
% x is the A matrix with multipliers imbedded
%
[n,m] = size(A);
    if m~=n
        disp('A must be a square matrix.')
        return;
    end;
    
x = zeros(n,1);
kmax = 100; %randomly chosen
I = eye(n);
epsilon=1e-5;

eigval = eig(A);
lambdamin = min(eigval);
lambdamax = max(eigval);
omega = 2/(lambdamin+lambdamax); %want an omega that minimizes I-omega*A

for k = 1:kmax
    y = x;
    x = (I-omega*A)*y + omega*b;
    if norm(x-y,2) < epsilon
        disp('Convergence')
        k
        x
        return
    end;
end;
disp('Maximum iteration reached')
end