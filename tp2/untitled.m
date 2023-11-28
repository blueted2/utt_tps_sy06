close all;
clear;

lamb = 0.18;
f_0 = 0.1273;

F_dbe = 0.0204;
F_dbi = 0.0304;
F_a = 0.002;

F_e = 1;

L = 4000;

t = 1:L;

hold on;
x_e = zeros(1, L);
for offset=0:1 / F_dbe:L
    t_offset = ceil(t - offset);
    s_offset = exp(-lamb .*t_offset) .* sin(2 * pi * f_0 .* t_offset) .* (t_offset > 0);

    plot(s_offset);

    x_e = x_e + s_offset;
end

hold off;



figure;
% % plot(x_e);

s = exp(-lamb .*t) .* sin(2 * pi * f_0 .* t) .* (t > 0);

L_se = floor(1 / F_dbe);
t_se = 1:L_se;
se = s(1:L_se);

% figure;
% plot(se);

x_e = repmat(se, 1, ceil(L / L_se));

x_e = x_e(1: L);

L_si = floor(1 / F_dbi);
t_si = 1:L_si;

si = exp(-lamb .*t_si) .* sin(2 * pi * f_0 .* t_si);

x_i = repmat(si, 1, ceil(L / L_si));

x_i = x_i(1: L);

x_i = x_i .* ( 1 + cos(2 * pi * F_a .* t));


subplot(2, 1, 1);
plot(x_e);
title("defaut externe");

subplot(2, 1, 2);
plot(x_i);
title("defaut interne");

figure;

f = (0:L-1) / L;

subplot(2, 1, 1);
plot(f, abs(fft(x_e)));
title("|F(x_e)|");

subplot(2, 1, 2);
plot(f, abs(fft(x_i)));
title("|F(x_i)|");

%% 

load('TP2_Exemple1.mat');
load('TP2_Exemple2.mat');

figure("Name","Signaux reels");
subplot(2, 1, 1);
plot(texemple1, xexemple1);
title("exemple 1");

subplot(2, 1, 2);
plot(f, abs(fft(xexemple1)));
title("|F(exemple 1)|");



figure;

L = length(xexemple1);

f = (0:L-1 ) / L;

subplot(2, 1, 1);
plot(texemple2, xexemple2);
title("exemple 2");

subplot(2, 1, 2);
plot(f, abs(fft(xexemple2)));
title("|F(exemple 2)|");