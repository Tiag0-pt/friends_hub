function signatures = minHash (Set)
  
  nS = length(Set);  %Total ammount of Set elements
  nHash = 100;       %Total ammount of Hash Functions we'll usejava
  signatures = ones(nHash,size(Set,2))*999999999; %Each Row -> A Set entry ; Each Col -> Hashing of That Set's Entry
  
  h= waitbar(0,'Calculating');
  v = InitHashFunctions(100000,nHash);

  hcodes = zeros(nHash);
  for nu= 1:nS
      waitbar(nu/nS, h);

      for nh= 1:nHash
          hcodes(nh)= mod(v.a(nh)*(nu)+v.b(nh),v.p);
      end
      fs = Set(nu,:);

      for nf= 1:length(fs)
          if (fs(nf)==0)
              continue
          end
          for nh= 1:nHash
              if (hcodes(nh)<signatures(nh,nf))
                  signatures(nh,nf)=hcodes(nh);
              end
          end
      end
  end

%   for i = 1 : nS
%     waitbar(i/nS,h);
%     for j = 1 : nHash
%       hK = zeros(length(Set(i)));
%       for k=1 : length(Set(i))
%         hK(k) = mod(aVals(j) * Set{i}(k) + bVals(j),prime);
%       end
%       signatures(j,i) = min(hK);
%      end
%   end


  delete (h)
  
  
end
