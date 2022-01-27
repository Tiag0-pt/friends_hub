users = readcell('users.txt','Delimiter',';');
friends = readcell('friends.txt','Delimiter',';');

str = input("Insert Valid user ID:\n");
ID = str2num(str);
while 1
    str = input("\n1- Your friends\n 2- Interest from most similar user \n3- Search Name\n4- Find most similar users based in list of interests\n5-Exit\nSelect choice:\n");
    opt = str2num(str);
    
    switch opt
        case 1:
            for i=0:length(friends)
                if(friends{1})
                
                
            end
            
            
end