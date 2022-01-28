function S = shingles(txt, shingle_size)
  l = size(txt)(2) - shingle_size + 1;
  for i = 1:l
    t='';
    for j = i:(i + shingle_size - 2)
      t = strcat(t,txt{j},' ');
    end
    t = strcat(t, txt{i + shingle_size - 1});
    S{i} = t;
  end
