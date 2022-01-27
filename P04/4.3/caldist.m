function dist = caldist(doc1,doc2)
    rows = length(doc1);
    dist = 0;
    for i=1:rows
        dist = dist + (doc1(i,1)==doc2(i,1));
    end
    dist = 1 - (dist/rows);
end