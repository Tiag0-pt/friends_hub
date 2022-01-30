function [users,friends,categorias,interesses_docs,interesses_ass,names_ass,names_shingles,hash_param,Bloom_filter,bloom_hashf] = Init()

    users = readcell('users.txt','Delimiter',';');
    friends = readcell('friends.txt','Delimiter',' ');
    categorias = {'Andebol','Basquetebol','Escrita','Filmes','Fórmula 1','Fotografia','Gastronomia','História','Jogos','Leitura','Música','Pintura','Política','Programação','Redes Sociais','Ténis','Viagens'};
    save('friends');
    save('categorias');
    
    n_users = length(users);
    n_categories = length(categorias);
    
    % Interesses
    
    interesses_docs = zeros(n_users,n_categories);
    
    for i=1:n_users
        cell_i = users(i,4:end);
        
        % Como neste passo acabavam por aparecer muitas celulas com
        % missing procedemos ao seguinte:
        cell_i( cellfun( @(cell_i) isa(cell_i,'missing'), cell_i ) ) = {[]};
        cell_i = cell_i(~cellfun('isempty',cell_i));
        
        
        arr = zeros(1,n_categories);
        for j=1:17
            arr(j) = any(strcmp(cell_i,categorias{j}));
        end
        interesses_docs(i,:) = arr;
    end
    
    hash_param = InitHashFunctions(100000,100); % m para mod e numero de hash functions
    interesses_ass = minHash(interesses_docs',hash_param); % assinaturas
    save('interesses_ass');
    save('interesses_docs');
    
    
    % Users
    
    % Agora que temos o que queremos podemos simplesmente reduzir os
    % ultilizadores os seu IDs e nomes
    
    users = users(:,1:3);
    save('users');
    
    
    % Nomes
    
    names_shingles = Name_shingles(users);
    nshingles = length(names_shingles);
    
    names_docs = zeros(n_users,nshingles);
    
    for i=1:n_users
        name = users{i,2};
        arr = zeros(1,nshingles);
        for j=1:nshingles
            arr(j) = contains(name,names_shingles{j});
        end
        names_docs(i,:) = arr;
    end
    
    hash_param = InitHashFunctions(100000,100); % m para mod e numero de hash functions
    names_ass = minHash(names_docs',hash_param);
    save('names_ass');
    save('names_shingles');
    save('hash_param');
    
    
    % Bloom filter para a opção 3
    
    Bloom_filter = zeros(1,8000); % com o k ótimo de 6 temos uma probabilidade de falsos positivos á volta de 1 elemento em cada 46
    
    % hash functions
    
    bloom_hashf=cell(1,6);
    bloom_hashf{1}=@(u) string2hash(char(u), 'djb2');
    bloom_hashf{2}=@(u) string2hash(char(u), 'sdbm');
    bloom_hashf{3}=@(u) DJB31MA(char(u), 1234);
    
    for n=4:6
        bloom_hashf{n}=@(u) DJB31MA(char(u), 1234+n*10);
    end
    
    for i=1:n_users
         arr = adicionar_elemento(Bloom_filter,bloom_hashf,users{i,2});
         Bloom_filter(arr) = 1;
    end
    
    save('bloom_hashf');
    save('Bloom_filter');
    

end