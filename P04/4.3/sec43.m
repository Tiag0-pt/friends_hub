
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

% Calcula a distaˆncia de Jaccard entre todos os pares pela definicnao.
J=zeros(Nu,Nu); % array para guardar distaˆncias
h= waitbar(0,'Calculating');
tic
for n1= 1:Nu
    waitbar(n1/Nu,h);
    for n2= n1+1:Nu
        i=intersect(Set{n1},Set{n2});
        u=union(Set{n1},Set{n2});
        J(n1,n2)=1-(length(i)/length(u));
    end
end
delete (h)
toc

% Com base na distaˆncia, determina pares com
% distaˆncia inferior a um limiar pre´-definido
threshold =0.4; % limiar de decisa˜o
% Array para guardar pares similares (user1, user2, distaˆncia)
SimilarUsers= zeros(1,3);
k= 1;
tic
for n1= 1:Nu
    for n2= n1+1:Nu
        if J(n1,n2)<threshold
            SimilarUsers(k,:)= [users(n1) users(n2) J(n1,n2)];
            k= k+1;
            fprintf("Distance: %f -> user 1: %d ; user 2: %d\n",J(n1,n2),users(n1),users(n2));
        end
    end
end
toc

% Ex 2.
[users,Set] = createSet("u.data");

distances = jaccardDistance(users,Set);

threshold = 0.4;
similar = getSimilarities(users,distances,threshold);

%%Print results
N = length(similar);
tic
for k= 1:N
  fprintf("Distance: %f -> user 1: %d ; user 2: %d\n",similar{k}(3),similar{k}(1),similar{k}(2));
end
toc