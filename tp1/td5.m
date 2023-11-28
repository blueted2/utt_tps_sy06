close all;
clear;

D = 5;
d = 1;

N = 5;
phi = 0;


% F_a = 1;
% F_dbe = 1/2 * N * F_a * (1 - d/D * cos(phi));
% F_dbi = 1/2 * N * F_a * (1 + d/D * cos(phi));

F_a = 100;
f_0 = 10000;

F_dbe = 480;
H_dbi = 520;


Fs = 1e+5;

Ts = 1/Fs;

t = 1:Ts:2;

lambda = 10;

s = exp(-lambda .* t) .* sin(2 * pi * f_0 .* t) .* (t > 0);


subplot(2, 1, 1);
plot(t, s);

subplot(2, 1, 2);
L = length(t);      % Signal length

f = Fs * (-L/2:L/2-1)/L;

S = fftshift(fft(s));
semilogy(f, abs(S));


x_e = zeros(1, L);

for n=-1000:1000
    x = min(L, Fs*n/F_dbe);
    x = max(x, 1);
    x = floor(x);
    f = s(x: L);

    

    x_e = x_e + 
end

figure;
plot(x_e);
