[users,friends,interesses] = inicialization();
categorias = {'Andebol','Basquetebol','Escrita','Filmes','Fórmula 1','Fotografia','Gastronomia','História','Jogos','Leitura','Música','Pintura','Política','Programação','Redes Sociais','Ténis','Viagens'};

ID = input("Insert Valid user ID:\n\n");

while 1
    opt = input("\n1- Your friends\n2- Interest from most similar user \n3- Search Name\n4- Find most similar users based in list of interests\n5-Exit\nSelect choice:\n\n");
    
    
    switch opt
        case 1
            fprintf("\n");
            for i=1:length(friends)
                if(friends{i,1} == ID)
                    fprintf("Id: %d Nome: %s %s\n",friends{i,2},users{friends{i,2},2},users{friends{i,2},3});
                    if(friends{i+1,1}~=ID)
                        break;
                    end
                end
            end
        case 2
            % Obter matriz dos interesses dos amigos de ID e seus IDs
            [ids_amigos, interesses_amigos] = obterAmigos(ID, friends, interesses);

            % Obter matriz de assinaturas
            signatures = minHash(interesses_amigos);

            most_similar_user = findSimilarUser(ids_amigos, signatures);
            most_similar_user = most_similar_user{1};
            
            fprintf("Amigo mais similar aos seus interesses:\nId: %d Nome: %s %s\n\n",most_similar_user,users{most_similar_user,2},users{most_similar_user,3});
            
            interesses_de_msu = interesses{most_similar_user};
            fprintf("Interesses de %d:\n",most_similar_user);
            for i=1: length(categorias)
                if (interesses_de_msu(i)==1)
                    fprintf("%s\n",categorias{i});
                end
            end

            interesses_de_msu = interesses{most_similar_user};
            fprintf("\nNovas sugestoes para %d:\n",ID);
            for i=1: length(categorias)
                if (interesses_de_msu(i)==1 && interesses{ID}(i)==0)
                    fprintf("%s\n",categorias{i});
                end
            end
        case 5
            return;
    end           
end