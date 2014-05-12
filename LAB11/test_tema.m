noisyZero = cifre(:, 3) + randn(35,1) * 0.2; 
A2 = sim(net,noisyZero);
A2 = compet(A2); 
answer = find(compet(A2) == 1); 

figure(1);
noisyZero = reshape(noisyZero, 7, 5);
imagesc(noisyZero);

figure(2);
RS = cifre(:, answer);
RS = reshape(RS, 7, 5);
imagesc(RS);


