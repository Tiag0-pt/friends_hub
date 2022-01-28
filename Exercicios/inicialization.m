function [users,friends,interesses,name_shingles] = inicialization()
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
    name_shingles = get_name_shingles(users);
end

%%%% Unique in cells

% test = {1,2,3,'No';1,3,2,'Yes';2,2,2,'Yes'};
% out = unique(cellfun(@num2str,test,'uni',0));