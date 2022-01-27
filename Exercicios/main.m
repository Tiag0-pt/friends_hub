users = readcell('users.txt','Delimiter',';');
friends = readcell('friends.txt','Delimiter',' ');

interesses = cell(1,length(users));
for i=1:length(users)
    cell_i = users(i,4:end);
    cell_i( cellfun( @(cell_i) isa(cell_i,'missing'), cell_i ) ) = {[]};
    interesses{i} = cell_i;
end

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
            
            
    end
                
            
            
end