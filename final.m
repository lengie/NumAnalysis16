function [output,avg,error,val,y]=final()
%
% Computational aspects of Math 501 Final 
%[output,avg,error,val,y]=final()

%3C) Numerical experiment to evaluate integral
%bounds
a1 = 0;
a2 = 0;
b1 = 1;
b2 = 1;

n = 50; %number of points per approximation
m = 500000; %number of iterations of integral approximation

output = [];
avg = [];
for j=1:m
    x = rand(1,n);
    y = rand(1,n);
    
    for i=1:n;
        %columns are different runs, rows are values per run
        output(i,j) = (1/(2*pi))*exp(-((x(i)^2)+(y(i)^2))/2);
    end;
end
avg = mean(output);
val = mean(avg);
error = std(avg);

%plotting the error as m increases
intervals = 1:80;
errplot = [];
for i=1:length(intervals)
    errplot=[errplot,std(avg(1:intervals(i)))];
end;

figure;
plot(intervals,errplot)
xlabel('Iteration')
ylabel('Error')

%plotting using absolute difference
intervals2 = 1:50:499900;
absplot = [];
for i=1:length(intervals2)
    temp = 0.1165-mean(avg(1:intervals2(i)));
    absplot=[absplot,temp];
end;

figure;
plot(intervals2,absplot)
xlabel('Iteration')
ylabel('Absolute Error')

%4D) Validate condition on h if a = -100
A = -100;
h = 0:.001:.04; %range of step sizes
iter = 1001;
y(1:length(h)) = 1;

for hs=1:length(h)
    for i=2:iter
        k1 = y(i-1,hs) + h(hs)*A*y(i-1,hs);
        k2 = y(i-1,hs) + h(hs)*A*k1;
        k3 = y(i-1,hs) + h(hs)*A*k2;
        y(i,hs) = (1/4)*(k1+2*k2+k3);
    end;
end;

%plot of final values
figure;
hold on;
plot(h,y(41,:))

%plot of y(k) values over each iteration, for each value of h
figure;
hold on;
for i=1:length(h)
    plot((1:100),y(1:100,i))
end
end
