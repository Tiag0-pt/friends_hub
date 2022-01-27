% a)

% function out = ex1(N,imin,imax)
%     out = {N};
%     for i=1 : N
%         n = randi([imin,imax]);
%         string = "";
%         for j=1 : n
%             ascii = randi([65,90]);
%             if(rand()>0.5)
%                 ascii = ascii + 32;
%             end
%             string = strcat(string,char(ascii));
%         end
%         out{i} = string;
%     end
% end


%b


function out = ex1(N,imin,imax,prob)
    out = {N};
    for i=1:N
        n = randi([imin,imax]);
        string = "";
        for j=1:n
            ascii = sum( rand >= cumsum([0,prob])) + 96;
            string = strcat(string,char(ascii));
        end
        out{i} = string;
    end
    
end