clc; clear all; close all;

x = [0 1 0 0 1 1 1 0 1];
xx = zeros(1, 5 * length(x));
v = 1;

for i = 1:length(x)
    if x(i)==1 
        v=v*-1;
    end
  for j = 1:500
    xx((i - 1) * 500 + j) = v;
  end
end

plot(xx);
ylim([-2,2]);