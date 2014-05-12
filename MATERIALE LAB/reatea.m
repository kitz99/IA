p = [0 0 0 0.5 0.5 0.5 1 1; 0 0.5 1 0 0.5 1 0 0.5];
t = [1 1 1 1 -1 -1 -1 -1];
net = newp([0 1; 0 1], 1, 'hardlim');
net.adaptParam.passes = 100;
net.inputweights{1,1}.initFcn = 'rands';
net.biases{1}.initFcn = 'rands';

net = adapt(net, p, t);
plotpv(p, t);
hold on;
plotpc(net.IW{1,1}, net.b{1});

