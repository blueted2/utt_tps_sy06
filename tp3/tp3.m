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

figure;
spec_grid(x_notes, 50:50:200, 0:0.2:0.8, Fe);

%% 
Fe = 1e3; % frequence d ' echantillonnage
t = 0:1/ Fe :2; % vecteur temps sur 2 s
x_chirp_lin = chirp(t ,100 ,1 ,250) ; % chirp lineaire

figure;
spec_grid(x_chirp_lin, 50:50:200, 0:0.2:0.8, Fe);

%% 
Fe = 1e3; % frequence d ' echantillonnage
t = 0:1/ Fe :2; % vecteur temps sur 2 s
x_chirp_quad = chirp(t ,100 ,1 ,250 , 'quadratic') ; % chirp quadratique

figure;
spec_grid(x_chirp_quad, 50:50:200, 0:0.2:0.8, Fe);

%%
bird = load('bird.mat');

figure;
spec_grid(bird.data', 50:50:200, 0:0.2:0.8, bird.fs);

%
dolphin = load('gd_dauphin.mat');

figure;
spec_grid(dolphin.y(:, 1)', 200:400 :1000, 0:0.4:0.8, dolphin.fs);


function spec_grid(x, widths, overlaps, Fs)
    tiledlayout(length(widths), length(overlaps), 'Padding', 'none', 'TileSpacing', 'compact');
    for width=widths
        for o=overlaps
            overlap = floor(o * width);
            [s, f, t] = TF_glissante(x', width, overlap, Fs);
            
            nexttile;
            image(t, f, abs(s), 'CDataMapping', 'scaled');
            axis xy;
            title(compose("%d - %2.f%%", width, o * 100));
        end
    end
end



