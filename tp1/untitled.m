close all;
clear;

%% Constantes

F_E = 1;
F_1 = 0.13;
F_2 = 0.34;

%% Generation des signaux a transmettre
x1 = [ zeros(2000 ,1) ; hanning(2000) ; -hanning(2000)  ; zeros(3000 ,1)]';
x2 = [ zeros(2000 ,1) ; -triang(2000) ; triang(2000)    ; zeros(3000 ,1)]';

nb_echantillons = length(x1);

ts = (1: nb_echantillons); % / F_E;
fs = ts / nb_echantillons;



%% Porteuse
porteuse_f1 = cos(2 * pi * F_1 * ts);
porteuse_f2 = cos(2 * pi * F_2 * ts);

x1_modu = (1 + 1 * x1) .* porteuse_f1;
x2_modu = (1 + 1 * x2) .* porteuse_f2;

x_somme = x1_modu + x2_modu;

mod_x_somme = abs(fftshift(x_somme));

%%
figure("Name", "x1 et x2 modulés")
subplot(3, 1, 1);
hold on;
plot(ts, x1_modu)
plot(ts, x1 + 1)
plot(ts, -x1 - 1)
legend(["x1 modulé", "x1 + 1", "-(x1 + 1)"])


subplot(4, 1, 2)
hold on;
plot(ts, x2_modu)
plot(ts, x2 + 1)
plot(ts, -x2 - 1)
legend(["x2 modulé", "x2 + 1", "-(x2 + 1)"])

subplot(4, 1, 3)
plot(x1_modu + x2_modu)
title("Signaux modulés combinés")


subplot(4, 1, 4)
semilogy(fs - max(fs), mod_x_somme)
title("|FFT(x\_somme)|")

% figure("Name", "mod_x_somme")



% figure("Name", "x1 pp")
% subplot(2, 1, 1);
% semilogy(abs(fft(x1_modu)))

% subplot(2, 1, 2);
% x1_modu_pp = (x1 >0).*x1;

% semilogy(fs, abs(fft(x1_modu_pp)))



%% Generation des filtres

% Passe-bande
[b_f1, a_f1] = butter(4, [0.12 0.14] * 2); % autour de 0.13Hz
[b_f2, a_f2] = butter(4, [0.33 0.35] * 2); % autour de 0.34Hz

% Passe-bas
[b0, a0] = butter(4, 0.02);

figure("Name", "Butter");
subplot(3, 1, 1);
% Reponse frequentielle du filtre entre 0 et fe /2
[H , f ]= freqz (b_f1 ,a_f1 ,[] , F_E ) ;
plot(f, abs(H));
title("Passe-bande ~f1")
xlabel("Fréquence")
ylabel("Réponse")

subplot(3, 1, 2);
% Reponse frequentielle du filtre entre 0 et fe /2
[H , f ]= freqz (b_f2 ,a_f2 ,[] , F_E ) ;
plot(f, abs(H));
title("Passe-bande ~f2")
xlabel("Fréquence")
ylabel("Réponse")

subplot(3, 1, 3);
% Reponse frequentielle du filtre entre 0 et fe /2
[H , f ]= freqz (b0 ,a0 ,[] , F_E ) ;
plot(f, abs(H));
title("Passe-bas")
xlabel("Fréquence")
ylabel("Réponse")



% figure;
% plot(x_somme_pp);
x_somme_pp = (x_somme>0) .* x_somme;

y1_band = filter(b_f1, a_f1, x_somme);
y2_band = filter(b_f2, a_f2, x_somme);

y1_band_pp = (y1_band>0).*y1_band;
y2_band_pp = (y2_band>0).*y2_band;

mod_Y1_band = abs(fft(y1_band));
mod_Y2_band = abs(fft(y2_band));

mod_Y1_band_pp = abs(fft(y1_band_pp));
mod_Y2_band_pp = abs(fft(y2_band_pp));

y1_demodu = filter(b0, a0, y1_band_pp);
y2_demodu = filter(b0, a0, y2_band_pp);

% y1_norma = y1_demodu - mean(y1_demodu);
% y1_norma = y1_norma / max(y1_norma);

% y2_norma = y2_demodu - mean(y2_demodu);
% y2_norma = y2_norma / max(y2_norma);

y1_norma = rescale(y1_demodu, -1, 1);
y2_norma = rescale(y2_demodu, -1, 1);


figure("Name", "Démodulation de x1");
subplot(2, 2, 1)
plot(ts, y1_band);
title("y1 passe-bande")

subplot(2, 2, 2)
semilogy(fs, mod_Y1_band)
title("|Y1 passe-bande|")

subplot(2, 2, 4)
semilogy(fs, mod_Y1_band_pp)
title("|Y1 passe-bande partie positive|")

subplot(2, 2, 3)
plot(ts, y1_norma);
title("y1 démodulé et normalisé")


figure("Name", "Démodulation de x2");
subplot(2, 2, 1)
plot(ts, y2_band);
title("y2 passe-bande")

subplot(2, 2, 2)
semilogy(fs, abs(fft(y2_band)))
title("|Y2 passe-bande|")

subplot(2, 2, 4)
semilogy(fs, abs(fft(y2_band_pp)))
title("|Y2 passe-bande partie positive|")

subplot(2, 2, 3)
plot(ts, y2_norma);
title("y2 démodulé et normalisé")


