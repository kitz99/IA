Px = []; 
Tx=[];
for d = 0:0.05:0.5
    for i=1:10
        Pz = P + randn(R, Q) * d;
        Px = [Px Pz];
        Tx = [Tx targets];
    end
end

Yx = sim(net, Px);
Yx = compet(Yx);
Yx = mod(find(Yx == 1), Q);
Tx = mod(find(Tx == 1), Q);
e = numel(find(Tx ~= Yx))/length(Tx);
e