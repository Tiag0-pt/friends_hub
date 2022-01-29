function users_ids = findMostSimilarUsers(id, signatures, n)
    min = 1;
    simArr = [];
    for i=1:length(signatures)
        sim=0;
        for k=1:size(signatures,1)
            if (signatures(k,id) == signatures(k,i))
                sim = sim + 1;
            end
        end
        simArr = [simArr 1-sim/size(signatures,1)];
    end

    % NOTE(): Make jaccard distance for identity 1 to make calculations easier
    simArr(id)=1;

    [B,users_ids]=mink(simArr,n);
end