%aplicatie 2 - lab 9
matrice = 2*rand(10, 5) -1;
targets = mean(matrice');

P = matrice';
T = targets;

%PERCEPTRON
net = newlin(P, T, 0, 0.1);
net.trainParam.epochs = 100;
net = train(net, P, T);

