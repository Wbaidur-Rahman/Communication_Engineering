clc; clear; close;

bits = [1 0 1 1 0 0 1];

time = 0:1/500:length(bits)-1/500;
s1 = 2*sin(2*pi*3*time);
s2 = 2*sin(2*pi*9*time);
s = zeros(1,length(time));

for i = 1:length(bits)
    if bits(i)==0
        for j=1:500
            s((i-1)*500+j)=s1((i-1)*500+j);
        end
    else
        for j=1:500
            s((i-1)*500+j)=s2((i-1)*500+j);
        end
    end
end

plot(time, s);
ylim([-6,6]);
grid on;

%demodulation
n = length(s)/500;
dem = ones(1,n);

for i = 1:length(dem)
    if s((i-1)*500+100)== s1((i-1)*500+100)
       dem(i)=0;
    end
end

disp(dem);
