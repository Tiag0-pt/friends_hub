% Ex 1.
U1=fileread('wordlist-preao-20201103.txt');
U1=strsplit(U1);
U1=U1(1:1000); %1000 palavras

k=3;
B=inicializar(8000);
f=cell(1,3);
f{1}=@(u) string2hash(char(u), 'djb2');
f{2}=@(u) string2hash(char(u), 'sdbm');
f{3}=@(u) DJB31MA(char(u), 1234);

for i=1:length(U1)
    B=adicionarElem(B,k,U1(i),f);
end

% Ex 2.
for i=1:length(U1)
    if (membro(B,k,U1(i),f)==0)
        fprintf('NOT IN HERE!\n');
    end
end

% Ex 3.
U2=fileread('wordlist-preao-20201103.txt');
U2=strsplit(U2);
U2=U2(1001:10000+1001); %10000 palavras

m=0;
for i=1:length(U2)
    if (membro(B,k,U2(i),f)==1)
        m=m+1;
    end
end
m=(m/length(U2))*100;
fprintf('%d\n', m);

% Ex 4.
n=length(B);
m=length(U1);
pfp=(1-exp(1)^(-k*m/n))^k;
pfp=pfp*100;

% Ex 5.
U1=fileread('wordlist-preao-20201103.txt');
U1=strsplit(U1);
U1=U1(1:1000); %1000 palavras

x=4:10;
y=[];
for k=4:10
    B=inicializar(8000);
    f=cell(1,k);
    f{1}=@(u) string2hash(char(u), 'djb2');
    f{2}=@(u) string2hash(char(u), 'sdbm');
    f{3}=@(u) DJB31MA(char(u), 1234);
    
    for n=4:k
        f{n}=@(u) DJB31MA(char(u), 1234+n*10);
    end

    for i=1:length(U1)
        B=adicionarElem(B,k,U1(i),f);
    end

    U2=fileread('wordlist-preao-20201103.txt');
    U2=strsplit(U2);
    U2=U2(1001:10000+1000); %10000 palavras
    
    m=0;
    for i=1:length(U2)
        if (membro(B,k,U2(i),f)==1)
            m=m+1;
        end
    end
    y(end+1)=(m/length(U2))*100;
end

% valor teorico: k(otimo)=n*ln(2)/m => 5.54; 

title('falsos positivos em funcao de k hash functions.');
xlabel('# hash functions');
ylabel('false positives %');
plot(x,y);