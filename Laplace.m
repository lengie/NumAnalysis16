function [A,f]=Laplace(N,a,b,c,d)
%
% Description: Produce the matrix approximation of the Laplace equation.
% Usage: [A,f]=Laplace(N,a,b,c,d)
%
A=zeros((N-1)*(N-1));
f=zeros((N-1)*(N-1),1);
%
%
for k=1:N-1
    for j=1:N-1
        i=(j-1)*(N-1)+k; %linearized indices
        A(i,i)=-4;
        if (a<=k/N) && (k/N<=b) && (c<=j/N) && (j/N<=d)
            f(i)=1;
        end;
        if k>1
            l=(j-1)*(N-1)+k-1;
            A(i,l)=1;
        end;
        if k<N-1
            l=(j-1)*(N-1)+k+1;
            A(i,l)=1;
        end;
        if j>1
            l=(j-2)*(N-1)+k;
            A(i,l)=1;
        end;
        if j<N-1
            l=j*(N-1)+k;
            A(i,l)=1;
        end;
    end;
end;
A=N^2*A;
return;
end