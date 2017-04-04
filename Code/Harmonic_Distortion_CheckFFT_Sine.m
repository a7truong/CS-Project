% Andy Truongclear all; close all;pkg load signal;pkg load statistics;% from the original file, we look at the recorded FFT and see if any other harmonics are introduced (fundamental freq = 100)% frequencies should be multiple of 100s, if something that is not a multiple of 100, we would say a distortion and another freq% was introduced% Original Signal[x_org, Fs] = wavread('Sin_440_Org.wav');# use only half, since the recorded dies down for some reasonsx_org = x_org(1:max(size(x_org))/2);X_org = fft(x_org);f = (0:length(X_org)-1)*Fs/length(X_org);figure();plot(f, abs(X_org));title('Original Signal - Sine 440Hz FFT');[x_rec, Fs] = wavread('Sin_440_Rec.wav');% make them the same sizeif (max(size(x_rec)) != (max(size(x_org))))  x_rec = x_rec(1:max(size(x_org)));end% normalizex_rec = x_rec/max(x_rec);X_rec = fft(x_rec);f = (0:length(X_rec)-1)*Fs/length(X_rec);figure();plot(f, abs(X_rec));title('Recorded Signal - Sine 440Hz FFT');