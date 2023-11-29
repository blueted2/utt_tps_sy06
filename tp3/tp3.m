clear;
close all;

Fe =3000; % frequence d ' echantillonnage

Fdo =523.25; % frequence fondamentale de la note DO
Fre =587.33; % frequence fondamentale de la note RE
Fmi =659.26; % frequence fondamentale de la note MI

t =0:1/ Fe :.25; % vecteur temps sur 0.25 s - duree de chaque note
xdo = sin (2* pi * Fdo * t); % signal sonore pour la note DO
xre = sin (2* pi * Fre * t); % signal sonore pour la note RE
xmi = sin (2* pi * Fmi * t); % signal sonore pour la note   MI

x_notes =[ xdo xre xmi ]; % concatenation des trois signaux
t_notes = (0:length(x_notes) - 1) / Fe;


% [s, f, t] = TF_glissante(x_notes, 50, 0, Fe);
% 
% figure();
% mesh(t, f, abs(s'));
% view(2), axis tight


% %% 
% Fe = 1e3; % frequence d ' echantillonnage
% t = 0:1/ Fe :2; % vecteur temps sur 2 s
% x_chirp_lin = chirp(t ,100 ,1 ,250) ; % chirp lineaire
% 
% figure();
% 
% [s, f, t] = TF_glissante(x_chirp_lin, 50, 25, Fe);
% 
% mesh(t, f, abs(s'));
% view(2), axis tight
% 
% 
% %% 
% Fe = 1e3; % frequence d ' echantillonnage
% t = 0:1/ Fe :2; % vecteur temps sur 2 s
% x_chirp_quad = chirp(t ,100 ,1 ,250 , 'quadratic') ; % chirp quadratique
% 
% figure();
% 
% [s, f, t] = TF_glissante(x_chirp_quad, 50, 25, Fe);
% 
% mesh(t, f, abs(s'));
% view(2), axis tight



% %%
% bird = load('bird.mat');
% 
% figure();
% [s, f, t] = TF_glissante(bird.data', 100, 25, bird.fs);
% 
% mesh(t, f, abs(s'));
% view(2), axis tight


%%
dolphin = load('gd_dauphin.mat');

figure();
[s, f, t] = TF_glissante(dolphin.y(:, 1)', 10000, 0, dolphin.fs);

mesh(t, f, abs(s'));
view(2), axis tight





