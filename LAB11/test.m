noisyJ = alphabet(:,1)+randn(35,1) * 0.2; 
figure(1);
plotchar(noisyJ); 
A2 = sim(net,noisyJ); 
A2 = compet(A2); 
answer = find(compet(A2) == 1); 
figure(2);
plotchar(alphabet(:,answer)); 
