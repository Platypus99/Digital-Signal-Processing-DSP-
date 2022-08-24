%% DSP Problem 2

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