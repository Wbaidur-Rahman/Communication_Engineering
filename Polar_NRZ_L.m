clc; clear all; close all;

x = [1 0 1 1 0 0 1];
xx = zeros(1, 5 * length(x));
v = 0;

for i = 1:length(x)
    if x(i)==0 
        v=-1;
    else
        v=1;
    end
  for j = 1:500
    xx((i - 1) * 500 + j) = v;
  end
end

plot(xx);
ylim([-2,2]);