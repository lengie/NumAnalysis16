function [QH,RH,QGS,RGS]=Proj4(eps)
%
% Purpose: Compare QR factorization with Gauss Schmidt and Householder's
% methods
% [QH,RH,QGS,RGS]=Proj4(eps)
% 

A = [1, 1+eps, 1+eps+(eps^3);
     1, 1-eps, 1-eps+(eps^2);
     1, 1+eps, e+eps-(eps^2)];

%[vec,val] = eig(A);
[m,n]=size(A);

RGS = zeros(m);
RGS(1,1) = norm(A(:,1));
QGS = [];
QGS(:,1) = A(:,1)/RGS(1,1);

for k = 2:n
    RGS(1:k-1,k) = QGS(:,1:k-1)'*A(:,k);
    QGS(:,k) = A(:,k)-QGS(:,1:k-1)*RGS(1:k-1,k);
    RGS(k,k) = norm(QGS(:,k));
    QGS(:,k) = QGS(:,k)/RGS(k,k); 
end

QH = eye(m);
I = eye(m);
RH = A;
for j=1:n
    e = I(:,j);
    x = RH(:,j);
    x(1:j-1) = zeros(j-1,1);
    u = x + sign(x(j))*norm(x)*e;
    H = I - 2*(u*u')/(u'*u);
    
    RH = H*RH;
    QH = H*QH;
end
QH = QH';

end