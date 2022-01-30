function  arr = adicionar_elemento(B,hf,string)
    size = length(B);
    arr = zeros(1,6);
    for i=1:length(hf)
        h = hf{i}(string);
        h = mod(h,size);
        arr(i) = h;
    end
end