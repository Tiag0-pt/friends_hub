function out=membro(B, k, elem, hf)
    size=length(B);
    i=0;
    while 1
        i=i+1;
        h=hf{i}(elem);
        h=mod(h, size);
        if ((i==k)||(B(h+1)==0)) %h+1 pq indices comecam com 1.
            break;
        end
    end

    if i==k
        out=(B(h+1)==1);
    else
        out=0;
    end
end