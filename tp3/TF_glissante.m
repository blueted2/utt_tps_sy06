function [s, f, t] = TF_glissante(x, width, overlap, Fs)

    len = length(x);
    step_size = width - overlap;

    nb_steps = floor(len / step_size);

    H = hamming(width);
  
    for step = 0:nb_steps-2
        offset = step * step_size;

        w = rectpuls((1:len) - offset - width / 2, width);
        
        % w = zeros(1, len);

        % w(1 + offset : offset + width) = H;
    
        section = x .* w;

        F = fft(section);
        
        s(step+1, :) = F(1:floor(len/2));
    end

    t = (0:nb_steps-2) * step_size / Fs;

    f = (0:floor(len/2) - 1) * Fs / len;

end