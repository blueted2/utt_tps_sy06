function [s, f, t] = TF_glissante(x, width, overlap, Fs)

    len = length(x);
    step_size = width - overlap;

    nb_steps = floor((len- width) / step_size);

    H = hamming(width)';
  
    for step = 0:nb_steps-1
        offset = step * step_size;
    
        section = x(1 + offset: offset + width) .* H;

        F = fft(section);
        
        s(:, step+1) = F(1:floor(width/2));
    end

    t = (0:nb_steps-2) * step_size / Fs;

    f = (0:floor(width/2) - 1) * Fs / width;

end