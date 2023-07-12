clc; clear; close;

bits = [1 0 1 1 0 0 1];

time = 0:1/500:length(bits)-1/500;
modulation = 2*sin(2*pi*1*time);

for i = 1:length(bits)
    if bits(i)==0
        for j=1:500
            modulation((i-1)*500+j)=0;
        end
    end
end

plot(time, modulation);
grid on;

%demodulation
n = length(modulation)/500;
dem = zeros(1,n);

for i = 1:length(dem)
    if modulation((i-1)*500+100)~=0
       dem(i)=1;
    end
end

disp(dem)