function shingles = get_name_shingles(users)
    k = cell(1,length(users));
    for i=1:length(users)
        k{i} = users{i,2};
    end
    names = unique(cellfun(@num2str,k,'uni',0));
    shingles = cell(1);
    for i=1:length(names)
        %fprintf('%s',names{i});
        name = strip(names{i});
        for j=1:(length(name)-1)
            if(~any(strcmp(shingles,name(j:j+1))))
                shingles{i} = name(j:j+1);
            end
        end
    end

    shingles = shingles(~cellfun('isempty',shingles));

end