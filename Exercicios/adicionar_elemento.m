function arr = adicionar_elemento(B,hf,string)
    size = length(B);
    arr = B;
    for i=1:length(hf)
        h = hf{i}(string);
        h = mod(h,size);
        arr(h+1) = 1;
    end
end