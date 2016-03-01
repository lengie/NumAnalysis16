function [x,l]=GaussE(A,b)
%
% Purpose: Perform Gaussian Elimination on a 
% [x,l]=GaussE(A,b)
% x is the matrix A with multipliers imbedded, l is the index vector.
%
[n,m] = size(A);
    if m~=n
        disp('A must be a square matrix.')
        return;
    end;
    
s = zeros(n,1);
l = 1:n;
for i=1:n
    smax=0;
    for j=1:n
        smax = max(smax,abs(A(i,j)));
    end;
    s(i) = smax;
end;
for k=1:n
    rmax = 0;
    for i=k:n
        r = abs(A(l(i),k)/s(l(i)));
        if r > rmax
            rmax = r;
            jindex = i;
        end;
    end;
    temp = l(jindex);
    l(jindex) = l(k);
    l(k) = temp;
    for i = k+1:n
        xmult = A(l(i),k)/A(l(k),k);
        A(l(i),k) = xmult;
        b(l(i),1) = b(l(i),1) - xmult*b(l(k));
        for j = k+1:n
            A(l(i),j) = A(l(i),j) - xmult*A(l(k),j);
        end;
    end;
end;

A;
l;
b;
    for i=1:n
        x(i) = b(i)/A(l(i),l(i));
    end;
    x
end