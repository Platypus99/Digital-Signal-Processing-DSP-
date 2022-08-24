function y = audio_pan(x, fs, f)
%     AUDIO_PAN  Pan audio signal with frequency f.

T = 1/fs;
t = (0:size(x,1)-1)*T;        % Time vector

arg = 2 * pi * f * t;


abs_sin = abs(sin(arg));
abs_cos = abs(cos(arg));


x_1 = x(:,1);
x_2 = x(:,2);

x_size = size(x,1);
filling_y_1 = zeros(x_size,1);
filling_y_2 = zeros(x_size,1);

for i = 1:x_size
    filling_y_1(i) = x_1(i) * abs_sin(i);
    filling_y_2(i) = x_2(i) * abs_cos(i);
end
y_1 = filling_y_1;
y_2 = filling_y_2;

y = [y_1, y_2];






end

