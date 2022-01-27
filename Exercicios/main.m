[users,friends,interesses] = inicialization();

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
            
        case 5
            return;
    end           
end