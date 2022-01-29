function v = InitHashFunctions(m, Nh)
    ff = 1000;
    pp = ff * max(m+1,76);
    pp = pp + ~mod(pp, 2);
    while (isprime(pp)==false)
        pp = pp + 2;
    end
    v.p = pp;

    v.a = randi([1,(pp-1)],1,Nh);
    v.b = randi([0,(pp-1)],1,Nh);
    v.c = randi([1,(pp-1)],1,Nh);
end