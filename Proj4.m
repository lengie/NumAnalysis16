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

QGS = [];
RGS = zeros(m);
for j = 1:n
    for i=1:j-1
        vj = A(:,j); % Take the jth original basis vector
        vi = A(i,:);
        s = vj*vi;
        vk = 
        rp = QGS'*v; % Project v onto previous basis vectors
    end
    vnorm = norm(v); % Get the normalizing factor
    v = v/vnorm; % Normalize what remains
    QGS = [QGS, v]; % Append the result to the basis
    RGS(1:j,j) = [rp; vnorm]; % update R
end

QH = eye(m);
RH = A;
for j=1:n
    normx = norm(RH(j:end,j));
    s = -sign(RH(j,j);
    u1 = RH(j,j) - s*normx;
    w = RH(j:end,j)/u1;
    w(1) = 1;
    tau = -s*u1/normx;
    
    RH(j:end,:) = RH(j:end,:)-(tau*w)*(w'*RH(j:end,:));
    QH(:,j:end) = QH(:,j:end)-(Q(:,j:end)*w)*(tau*w)';
end

end