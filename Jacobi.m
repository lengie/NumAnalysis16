function [x]=Jacobi(A,b)
%
% Purpose: Use Jacobi's iterative method to solve a system of linear
% equations
% [x,l]=Jacobi(A,b)
% x is the A matrix with multipliers imbedded
%
[n,m] = size(A);
    if m~=n
        disp('A must be a square matrix.')
        return;
    end;
    
x = zeros(n,1);
kmax = 100; %kind of a magic number
delta = 10e-10;
epsilon = 1e-5;

for k=1:kmax
    y = x;
    for i=1:n;
        sum = b(i);
        diag = A(i,i);
        if abs(diag)<delta
            disp('diagonal element too small')
            return
        end;
        for j=1:n
            if j~=i 
                sum = sum - A(i,j)*y(j);
            end;
        end;
        x(i) = sum/diag;
    end;
    if norm(x-y,2) < epsilon
        k
        x
        return
    end;
end;
disp('maximum iterations reached')
x
end
