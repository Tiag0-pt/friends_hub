function [ids_amigos, interesses_amigos] = obterAmigos(ID, friends, interesses)
    interesses_amigos = [];
    ids_amigos = {};
    for i=1:length(friends)
        if(friends{i,1} == ID)
            num = friends{i,2};
            interesses_amigos = [interesses_amigos interesses(num,:)'];
            ids_amigos{end+1} = friends{i,2};
            if(friends{i+1,1}~=ID)
                break;
            end
        end
    end
end

