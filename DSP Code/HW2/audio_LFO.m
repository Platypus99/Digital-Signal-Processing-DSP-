function y = audio_LFO(x, fs, f, mt)
%AUDIO_LFO  Low frequency oscillation on audio signal.

T = 1/fs;
x_1 = x(:,1);
x_2 = x(:,2);
mt_sec = mt / 1000;


p = mt_sec / T;
x_size= size(x,1);

y_1 = zeros(x_size,1);
y_2 = zeros(x_size,1);
for i = 1:x_size
    n = i-1
    q = (i-1) * T;
    
    sin_part = abs(sin(2 * pi * f * q));
    delayed_arg = n - floor(p * sin_part); 
    
    if n <= p

        y_1(i) = x_1(i);
        y_2(i) = x_2(i);
        
    else
        y_1(i) = x_1(delayed_arg);
        y_2(i) = x_2(delayed_arg);
          
        
    end
end
    
y = [y_1, y_2];



end