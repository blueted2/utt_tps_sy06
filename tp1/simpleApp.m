function simpleApp
    close all;
    clear;

    %% Constantes
    F_1 = 0.13;
    F_2 = 0.34;

    %% Generation des signaux a transmettre
    x1 = [zeros(2000, 1); hanning(2000); -hanning(2000); zeros(3000, 1)]';
    x2 = [zeros(2000, 1); -triang(2000); triang(2000); zeros(3000, 1)]';

    % Create figure window
    fig = uifigure;
    fig.Name = "My App";

    % Manage app layout
    gl = uigridlayout(fig, [6 2]);
    gl.ColumnWidth = {'fit', 40, 40, 40, 40, 40};

    % % Create UI components
    % lbl = uilabel(gl);
    % panel = uipanel(gl);

    a1_slider = uislider(gl, "Orientation", "vertical");
    a2_slider = uislider(gl, "Orientation", "vertical");

    f1_slider = uislider(gl, "Orientation", "vertical");
    f2_slider = uislider(gl, "Orientation", "vertical");

    low_pass_slider = uislider(gl, "Orientation", "vertical");

    a1 = 1;
    a2 = 1;

    a1_slider.Layout.Row        = [1 2];
    a2_slider.Layout.Row        = [1 2];
    f1_slider.Layout.Row        = [1 2];
    f2_slider.Layout.Row        = [1 2];
    low_pass_slider.Layout.Row  = [1 2];


    a1_slider.Layout.Column = 2;
    a2_slider.Layout.Column = 3;

    f1_slider.Layout.Column = 4;
    f2_slider.Layout.Column = 5;

    low_pass_slider.Layout.Column = 6;


    % % slider = uislider(gl);
    
    % % Lay out UI components
    % % Position label
    % lbl.Layout.Row = 1;
    % lbl.Layout.Column = 1;
    % % Position drop-down
    % freq.Layout.Row = 1;
    % freq.Layout.Column = 2;
    % % Position axes

    % panel.Layout.Row = 2;
    % panel.Layout.Column = [1 2];
    % panel.AutoResizeChildren ='off';
    
    % % Configure UI component appearance
    % lbl.Text = "Choose step:";

    % freq.Value = 0.001;
    % freq.Limits = [0.001 0.3];
    % % surf(ax, peaks);

    % % Assign callback function to drop-down
    % freq.ValueChangingFcn = @on_set_f_p;

    % nb_echantillons = length(x1);

    % ts = (1:nb_echantillons); % / F_E;
    % fs = ts / nb_echantillons;

    % %% Porteuse
    % porteuse_f1 = [];
    % % porteuse_f2 = cos(2 * pi * F_2 * ts);

    % x1_modu = [];

    % f_p = freq.Value;

    % update;
    
    % function on_set_f_p(src, event)
    %     f_p = event.Value;
    %     update;
    % end


    % function update
    %     draw_screen_one;
    % end



    % function draw_screen_one
    %     %% Porteuse
    %     porteuse_f1 = cos(2 * pi * f_p * ts);
    %     % porteuse_f2 = cos(2 * pi * F_2 * ts);

    %     x1_modu = (1 + 1 * x1) .* porteuse_f1;
    %     nb_echantillons = length(x1);

    %     ax = subplot(2, 1, 1, "Parent", panel);
    %     cla(ax);
    %     hold(ax, "on");
    %     plot(ax, ts, x1_modu)
    %     plot(ax, ts, x1 + 1)
    %     plot(ax, ts, -x1 - 1)
    % end
end