function out = ex1(N, imin, imax, chars, probs)
 out={N};
 for n=1 : N
  dim = floor((imax+1-imin)*rand()+imin);
  string="";
  for i=0 : dim
   U=sum(rand >= cumsum([0, probs]))
   string=strcat(string,char(chars(U)));
  end

  out{n}=string;
 end
end

%letters = 'a':'z';
%data = fileread('prob_pt.txt');
%probs = strsplit(data);
%probs = str2double(probs);
%probs = probs(2:end-1);
%ex1(10^5, 6, 20, letters, probs);