    function y = audio_delay(x, fs, mtpair)
% AUDIO_DELAY   Delays the channel outputs of a stereo audio signal.

lmt  = mtpair(1);
rmt  = mtpair(2);

T = 1 / fs;

rmt_sec = rmt / 1000; 
lmt_sec = lmt / 1000; 
x_1 = x(:,1);
x_2 = x(:,2);

sample_delay_rmt = floor(rmt_sec/T);
sample_delay_lmt = floor(lmt_sec/T);

x_1_delayed = delayseq(x_1,sample_delay_lmt);
x_2_delayed = delayseq(x_2,sample_delay_rmt);

x_after_delay = [x_1_delayed, x_2_delayed];

y = x_after_delay;



    end
 