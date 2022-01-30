function out = membro(elemento,B,hf)
    out = zeros(1,6);
    size = length(B);
    for i=1:length(hf);
        h = hf{i} (elemento);
        h = mod(h,size);
        out(i) = h;
    end
end