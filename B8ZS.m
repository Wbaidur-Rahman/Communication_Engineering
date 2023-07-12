clc; clear; close;

x = [1 1 0 0 0 0 0 0 0 0 1 1 1 1 1 0 0 0 0 0 0 0 0 1];
cnt=0;
v=1;
vv=1;

for i=1:length(x)
   if x(i)==0
       cnt=cnt+1;
   else
       x(i)=v;
       vv=v;
       v = v*-1;
       cnt=0;
   end
   if cnt>7
       x(i-4) = vv;
       x(i-3) = -vv;
       x(i-1) = -vv;
       x(i) = vv;
       cnt =0;
   end
end

xx = zeros(1,length(x)*500);

for i=1:length(x)
    for j=1:500
       xx((i-1)*500+j) = x(i);
    end
end

time = 0:1/500:length(x)-1/500;
plot(time,xx);
ylim([-2,2]);
grid on;

%demodulation

n = length(xx)/500;
s = zeros(1,n);

for i=1:n
    if i < n-1 && xx(i*500)~=0 && xx(i*500)==xx((i+2)*500) && xx((i+1)*500) == 0
        for j=i:i+3
            xx(j*500)=0;
        end
        s(i-1) = 0;
    elseif xx(i*500) ~= 0
        s(i) = 1;
    end
end

disp(s);
   
