clc; clear; close;

x = [1 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0];
cnt0=0;
cnt1=0;
v=1;

for i=1:length(x)
   if x(i)==0
       cnt0=cnt0+1;
   else
       cnt1=cnt1+1;
       x(i)=v;
       v = v*-1;
       cnt0=0;
   end
   if cnt0>3
      if mod(cnt1,2)==0
          x(i-3)=v;
          x(i)=v;
          v=v*-1;
      else
          x(i)=v*-1;
      end
      cnt1=0;
      cnt0=0;
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
cnt = 0;

for i=1:n
    if xx(i*500)~=0
        s(i)=1;
    end
    cnt=cnt+xx(i*500);
    if(cnt==2 || cnt==-2)
        for j=i-3:i
            s(j)=0;
        end
    cnt=0;
    end   
end

disp(s);

