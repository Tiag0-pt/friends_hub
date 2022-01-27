U1=fileread('wordlist-preao-20201103.txt');
U1=strsplit(U1);
U1=U1(1:1000); %1000 palavras

k=3;

B=inicializar(8000); % A definir
f=cell(1,3);
f{1}=@(u) string2hash(char(u), 'djb2');
f{2}=@(u) string2hash(char(u), 'sdbm');
f{3}=@(u) DJB31MA(char(u), 1234);

for i=1:length(U1)
    adicionarelemento(B,f,U(i));
end

for i=1:length(U1)
    if (membro(B,f,U1)==0)
        fprintf('NOT IN HERE!\n');
    end
end