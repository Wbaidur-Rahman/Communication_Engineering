clc; clear; close;

x = [0 1 0 0 1 1];
xx = zeros(1,length(x)*500);

v = 1;
for i=1:length(x)
    if x(i)==0
        v=v*-1;
    end
    for j=1:250
        xx((i-1)*500+j) = v;
    end
    v = v*-1;
    for j=251:500
        xx((i-1)*500+j) = v;
    end
end

xx(1)=1;

plot(xx);
ylim([-2,2]);
    