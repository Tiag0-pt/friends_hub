function Sig = Min_hash(u,k)

    hf = cell(1,k);

%     prime = 100103;    %High prime number, used in our Hash Function
%     aVals = randi([1,(prime-1)],1,k);
%     bVals = randi([1,(prime-1)],1,k);
    
    for n=4:k
        hf{n}=@(var) DJB31MA(var, 1234+n*10);
    end
    
    Sig = zeros(k,length(u));

    for i=1:length(u)
        idx = 1;
        for n=1:k
            
            min = hf{n}(1);
            for j=2:length(u{i})
                hk = hf{n}(j);
                if(hk<=min & u{i}(j)==1)
                    min = hk;
                    idx = j;
                end
            end
        end
        Sig(n,i) = idx;
    end

end