%ex2

N = 1000;
Table_size = 1000/0.8;
arr = zeros(1,Table_size);

hash_vec_djb2 = zeros(1,N);
% hash_vec_sdbm = {N};
% hash_vec_hahstr = {N};
% hash_vec_DJB31 = {N};

data = fileread('prob_pt.txt');
probs = strsplit(data);
probs = str2double(probs);
probs = probs(2:end-1);
strings = ex1(N, 6, 20, probs);


for i=1:N
    hash_vec_djb2(i) = string2hash(convertStringsToChars(strings{i}),'djb2');
    j = mod(hash_vec_djb2(i),Table_size)+1;
    arr(j) = arr(j)+1;
end

max(arr);



