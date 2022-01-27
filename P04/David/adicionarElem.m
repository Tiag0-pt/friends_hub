function out=adicionarElem(B, k, elem, hf)
    size=length(B);
    for i=1:k
        h=hf{i}(elem);
        h=mod(h,size);
        B(h+1)=1;
    end
    out=B;
end