%sec43.m

% Ex 1.
udata=load('u.data'); % Carrega o ficheiro dos dados dos filmes
% Fica apenas com as duas primeiras colunas
u= udata(1:end,1:2); clear udata;
% Lista de utilizadores
users = unique(u(:,1)); % Extrai os IDs dos utilizadores
Nu= length(users); % Nu´mero de utilizadores
% Constro´i a lista de filmes para cada utilizador
Set= cell(Nu,1); % Usa ce´lulas
for n = 1:Nu % Para cada utilizador
    % Obte´m os filmes de cada um
    ind = find(u(:,1) == users(n));
    % E guarda num array. Usa ce´lulas porque utilizador tem um nu´mero
    % diferente de filmes. Se fossem iguais podia ser um array
    Set{n} = [Set{n} u(ind,2)];
end

ass = minHash(Set);


[rows,cols] = size(ass)

distances = ones(cols,cols-1);

for i=1:rows
    for j=i+1:rows
        distances(i) = caldist(ass(:,i),ass(j));
    end
end


imagesc(distances);



