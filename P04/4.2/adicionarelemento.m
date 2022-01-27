function adicionarelemento(B,hf,string)
    size = length(B);
    for i=1:length(hf)
        h = hf{i}(string);
        h = mod(h,size);
        B(h+1) = 1;
    end
end