function [users,friends,interesses,name_doc,Bloom_filter,ass_names,interests_sig,nh_param,name_shingles,bloom_hashf] = inicialization()
    users = readcell('users.txt','Delimiter',';');
    friends = readcell('friends.txt','Delimiter',' ');
    interesses = cell(1,length(users));
    categorias = {'Andebol','Basquetebol','Escrita','Filmes','Fórmula 1','Fotografia','Gastronomia','História','Jogos','Leitura','Música','Pintura','Política','Programação','Redes Sociais','Ténis','Viagens'};
    for i=1:length(users)
        cell_i = users(i,4:end);
        cell_i( cellfun( @(cell_i) isa(cell_i,'missing'), cell_i ) ) = {[]};
        cell_i = cell_i(~cellfun('isempty',cell_i));
        arr = zeros(1,17);
        for j=1:17
            arr(j) = any(strcmp(cell_i,categorias{j}));
        end
        interesses{i} = arr;
    end
    users = users(:,1:3);
    
    interesses_post = [];
    for i=1:length(users)
        interesses_post = [interesses_post interesses{i}'];
    end
    s = InitHashFunctions(100000,100);
    interests_sig = minHash(interesses_post,s);
    % Create names docs
%     
    name_shingles = get_name_shingles(users);
    name_doc = cell(1,length(users));
    
    for i=1:length(users)
        second_name = users{i,3};
        second_name = second_name(find(~isspace(second_name)));
        name = strcat(users{i,2},second_name);
        
        arr = zeros(1,length(name_shingles));
        for j=1:length(name_shingles)
            arr(j) = contains(name,name_shingles{j});
        end
        name_doc{i} = arr;
    end
    
    ass_names = [];
    for i=1:length(users)
        ass_names = [ass_names name_doc{i}'];
    end
    
    nh_param = InitHashFunctions(100000,100);
    ass_names = minHash(ass_names,nh_param);
    
    % docs_per_interests
    
    docs_per_interests = cell(1,17);
    
    for i=1:17
        cell_i = cell(1,1);
        l = 1;
        for j=1:length(interesses)
            u = interesses{j};
            if(u(i) == 1)
                cell_i{l} = u;
                l = l+1;
            end
        end
        docs_per_interests{i} = cell_i;
    end
    
    % Creating bloom filter
    
    Bloom_filter = zeros(1,8000); % with optimal k you only get rougfly 1 in 46 false positives, we are ok with that
    bloom_hashf=cell(1,3);
    bloom_hashf{1}=@(u) string2hash(char(u), 'djb2');
    bloom_hashf{2}=@(u) string2hash(char(u), 'sdbm');
    bloom_hashf{3}=@(u) DJB31MA(char(u), 1234);
    
    for n=4:6
        bloom_hashf{n}=@(u) DJB31MA(char(u), 1234+n*10);
    end

    for i=1:length(users)
         second_name = users{i,3};
         second_name = second_name(find(~isspace(second_name)));
         name = strcat(users{i,2},second_name);
         adicionarelemento(Bloom_filter,bloom_hashf,name);
    end
    
    
end