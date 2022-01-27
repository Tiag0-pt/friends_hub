function out = membro(B,elemento,hf)
    out = 1;
    size = length(B);
    for i=1:length(hf);
        h = hf{i}(elemento);
        h = mod(h,size);
        if(B(h+1) ~= 1)
            out = 0;
            break;
        end
    end
end