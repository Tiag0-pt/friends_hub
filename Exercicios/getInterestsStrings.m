function interests = getInterestsStrings(mask, categorias)
    interests = {};
    for i=1: length(categorias)
        if (mask(i)==1)
            interests{end+1} = categorias{i};
        end
    end
end