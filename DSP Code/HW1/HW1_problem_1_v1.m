%% DSP 
%% Problem 1
%% HW #1

N = 60;
n = (-30:1:30);

arg = ((6*n*pi / N) + (4 * pi / 3));
x1 = sin(arg);

x2_arg = (j * 6 * n * pi / N);
x2 = exp(x2_arg);

real_part_x2 = real(x2);
imag_part_x2 = imag(x2);

x3 = 0.5 * sqrt(3) * real_part_x2 + 0.5 * imag_part_x2;

plot_1 = x1;
plot_2 = real(x2);
plot_3 = imag(x2);
plot_4 = abs(x2);
plot_5 = atan((imag(x2)) ./ (real(x2)));
plot_6 = x3;


x = (-30:1:30);

subplot(3,2,1)
stem(x, plot_1, '.')
title('x_1')
xlabel('n')
ylabel('x_1[n]')

subplot(3,2,2)
stem(x, plot_2, '.')
title('real  x_2')
xlabel('n')
ylabel('real x_2[n]')

subplot(3,2,3)
stem(x, plot_3, '.')
title('imag x_2')
xlabel('n')
ylabel('imag x_2[n]')

subplot(3,2,4)
stem(x, plot_4, '.')
title('abs x_2')
xlabel('n')
ylabel('abs x_2[n]')

subplot(3,2,5)
stem(x, plot_5, '.')
title('angle x_2')
xlabel('n')
ylabel('angle x_2[n]')

subplot(3,2,6)
stem(x, plot_6, '.')
title('x_3')
xlabel('n')
ylabel('x_3[n]')


% Problem 2


m = (-10:1:10);
s = 21;

h1 = zeros(1,s);
h2 = zeros(1,s);
h3 = zeros(1,s);

sigma = 2;

temp_h3_func = -1 / (2 * sigma^2);


for i = 1:s
    if abs(m(1,i)) >= 2 & abs(m(1,i)) <= 6  
        h1(1,i) = 1;
    else h1(1,i) = 0;
    end
    
    
    if m(1,i) == 0
        h2(1,i) = -1;
    elseif m(1,i) == 1
        h2(1,i) = 1;
    else h2(1,i) = 0;
    end
    
    if m(1,i) >= -10 | m(1,i) <= -10;
        h3(1,i) = exp((m(1,i))^2 * temp_h3_func);
    else h3(1,i) = 0;
    end
end

% y(n) = x(n) * h(n)


y_11 = conv(h1, x1);
y_12 = conv(h2, x1);
y_13 = conv(h3, x1);


m_plus_n = (-40:1:40);

figure

subplot(3,2,1)
stem(m, h1, '.')
title('h_1')
xlabel('m')
ylabel('h_1[m]')

subplot(3,2,2)
stem(m_plus_n, y_11, '.')
title('y_1_1')
xlabel('m + n')
ylabel('y_1_1[m + n]')

subplot(3,2,3)
stem(m, h2, '.')
title('h_2')
xlabel('m')
ylabel('h_2[m]')

subplot(3,2,4)
stem(m_plus_n, y_12, '.')
title('y_1_2')
xlabel('m + n')
ylabel('y_1_2[m + n]')

subplot(3,2,5)
stem(m, h3, '.')
title('h_3')
xlabel('m')
ylabel('h_3[m]')

subplot(3,2,6)
stem(m_plus_n, y_13, '.')
title('y_1_3')
xlabel('m + n')
ylabel('y_1_3[m + n]')





