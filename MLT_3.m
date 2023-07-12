clc; clear; close;

x = [0 1 0 1 1 0 1 1];
xx = zeros(1,length(x)*500);

level = [1 0 -1 0];
v = 0;
k=0;

for i=1:length(x)
    if x(i)==1
        k=mod(k,4)+1;
        v=level(k);
    end
    for j=1:500
        xx((i-1)*500+j) = v;
    end
end

plot(xx);
ylim([-2,2]);
