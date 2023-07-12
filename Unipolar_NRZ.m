clc; clear all; close all;

x = [1 0 1 1 0 0 1];
xx = zeros(1, 5 * length(x));

for i = 1:length(x)
  for j = 1:500
    xx((i - 1) * 500 + j) = x(i);
  end
end

time = 0:1/500:length(x)-1/500;
plot(time,xx);

ylim([-2,2]);
grid on;