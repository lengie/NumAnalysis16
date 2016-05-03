function final()
%
% Computational aspects of Math 501 Final 
%

%3C) Numerical experiment to evaluate integral
%bounds
a1=0;
a2=0;
b1=1;
b2=1;

n=100; %number of points per approximation
m=10e6; %number of iterations of integral approximation

output=[];
for j=1:m
    x=rand(1,n);
    y=rand(1,n);
    
    for i=1:n;
        %columns are different runs, rows are values per run
        output(i,j) = (1\(2*pi))*exp(-((x(i)^2)+(y(i)^2))/2);
    end;

    avg = mean(output);
    error = std(output);
end
end