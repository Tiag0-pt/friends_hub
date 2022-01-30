
files = {'users','friends','categorias','interesses_docs','interesses_ass','names_ass','hash_param','names_shingles','Bloom_filter','bloom_hashf'};
n_files = length(files);
for i=1:n_files
    try
        load(files{i});
    catch
        [users,friends,categorias,interesses_docs,interesses_ass,names_ass,hash_param,names_shingles,Bloom_filter,bloom_hashf] = Init();
        break;
    end
    
end


ID = input("Insert Valid user ID:\n\n");

while 1
    opt = input("\n\n1- Your friends\n2- Interest from most similar user \n3- Search Name\n4- Find most similar users based in list of interests\n5-Exit\nSelect choice:\n\n");
    
    
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
            [ids_amigos, interesses_amigos] = obterAmigos(ID, friends, interesses_docs);
    
            Set = {};
            for i=1:size(interesses_amigos,2)
                Set{end+1}=getInterestsStrings(interesses_amigos(:,i), categorias);
            end

            Nu = length(Set);
            % Calcula a distaˆncia de Jaccard entre todos os pares pela definicnao.
            J=zeros(1,Nu); % array para guardar distaˆncias
            for n2= 2:Nu
                i=intersect(Set{1},Set{n2});
                u=union(Set{1},Set{n2});
                J(1,n2)=1-(length(i)/length(u));
            end

            [m,most_similar_user]=min(J(1,2:end));
            most_similar_user = ids_amigos{most_similar_user+1};

            fprintf("Amigo mais similar aos seus interesses:\nId: %d Nome: %s %s\n\n",most_similar_user,users{most_similar_user,2},users{most_similar_user,3});
            
            interesses_de_msu = interesses_docs(most_similar_user,:)';
            fprintf("Interesses de %d:\n",most_similar_user);
            for i=1: length(categorias)
                if (interesses_de_msu(i)==1)
                    fprintf("%s\n",categorias{i});
                end
            end

            interesses_de_msu = interesses_docs(most_similar_user,:)';
            fprintf("\nNovas sugestoes para %d:\n",ID);
            for i=1: length(categorias)
                if (interesses_de_msu(i)==1 && interesses_docs(ID,i)==0)
                    fprintf("%s\n",categorias{i});
                end
            end
            
            
        case 3
            
            name = inputdlg("Intruduza o nome completo de quem pretende procurar:\n\n");
            
            name = name(find(~isspace(name)));
            
            ver_array = membro(name,Bloom_filter,bloom_hashf);
            
            if(sum(Bloom_filter(ver_array)) == length(ver_array))
                doc = zeros(1,length(names_shingles));

                for j=1:length(names_shingles)
                    doc(j) = contains(name,names_shingles{j});
                end

                doc = doc';
                
                ass_name = minHash(doc,hash_param);

                probs = zeros(1,1000);

                for i=1:1000
                    probs(i) = sum(names_ass(:,i) == ass_name)/100;
                end

                candidates = sort(find(probs(i)>0.7),'descend');

                for i=1:length(probs)
                    if(probs(i)>0.7)
                        Id = users{i,1};
                        name = users{i,2};
                        second_name = users{i,3};
                        
                        fprintf("ID: %d Nome: %s %s",Id,name,second_name);
                    end
                    
                    
                end
                
            else
                fprintf("Ultlizador não encontrado");
            end
            
            
            
            
        case 4
            fprintf("\n");
            for i=1:length(friends)
                if(friends{i,1} == ID)
                    fprintf("Id: %d Nome: %s %s\n",friends{i,2},users{friends{i,2},2},users{friends{i,2},3});
                    if(friends{i+1,1}~=ID)
                        break;
                    end
                end
            end
    
            friend_id = input("\nchoose one of the friends:\n\n");
            similar_users=findMostSimilarUsers(friend_id,interesses_ass,3);

            fprintf("\nUsers mais similares aos interesses de\nId: %d Nome: %s %s\n====================\n",friend_id,users{friend_id,2},users{friend_id,3});
           
            for i=1: length(similar_users)
                    fprintf("\nId: %d Nome: %s %s",similar_users(i),users{similar_users(i),2},users{similar_users(i),3});
            end
        case 5
            return;
    end           
end