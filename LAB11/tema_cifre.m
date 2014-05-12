%Tema cifre
%cifrele reprezentare ca matrice 7 x 5
A = [1 1 1 1 1; 1 0 0 0 1; 1 0 0 0 1; 1 0 0 0 1; 1 0 0 0 1; 1 0 0 0 1; 1 1 1 1 1];
B = [0 0 1 0 0; 0 1 1 0 0; 1 0 1 0 0; 0 0 1 0 0; 0 0 1 0 0; 0 0 1 0 0; 1 1 1 1 1];
C = [1 1 1 1 1; 0 0 0 1 0; 0 0 1 0 0; 0 0 1 0 0; 0 1 0 0 0; 1 0 0 0 0; 1 1 1 1 1];
D = [1 1 1 1 1; 1 0 0 0 1; 0 0 0 0 1; 0 1 1 1 1; 0 0 0 0 1; 1 0 0 0 1; 1 1 1 1 1];
E = [1 0 0 0 0; 1 0 0 1 0; 1 0 0 1 0; 1 1 1 1 1; 0 0 0 1 0; 0 0 0 1 0; 0 0 0 1 0];
F = [1 1 1 1 1; 1 0 0 0 0; 1 0 0 0 0; 1 1 1 1 1; 0 0 0 0 1; 0 0 0 0 1; 1 1 1 1 1];
G = [1 1 1 1 1; 1 0 0 0 0; 1 0 0 0 0; 1 1 1 1 1; 1 0 0 0 1; 1 0 0 0 1; 1 1 1 1 1];
H = [1 1 1 1 1; 0 0 0 0 1; 0 0 0 1 0; 0 0 1 0 0; 0 1 0 0 0; 0 1 0 0 0; 0 1 0 0 0];
I = [1 1 1 1 1; 1 0 0 0 1; 1 0 0 0 1; 1 1 1 1 1; 1 0 0 0 1; 1 0 0 0 1; 1 1 1 1 1];
J = [1 1 1 1 1; 1 0 0 0 1; 1 0 0 0 1; 1 1 1 1 1; 0 0 0 0 1; 1 0 0 0 1; 1 1 1 1 1];

%Matricea de intrare
cifre = [A(:) B(:) C(:) D(:) E(:) F(:) G(:) H(:) I(:) J(:)];
for i='A':'J'
    clear(i);
end
clear(i);
targets = eye(10);
%Initializarea retelei
S1 = 10; 
[R,Q] = size(cifre); 
[S2,Q] = size(targets); 
P = cifre; 
net = newff(minmax(P),[S1 S2],{'logsig' 'logsig'},'traingdx'); 
net.LW{2,1} = net.LW{2,1}*0.01; 
net.b{2} = net.b{2}*0.01; 
net.trainParam.epochs = 5000;
net.trainParam.goal = 0.1;
net.trainParam.mc = 0.95;
net.performFcn = 'sse';
%end
%antrenare retea
net = train(net, P, targets);
%end %
% l = alphabet(:, 24);
% l = reshape(l, 5, 7);
% l = l';
% l = l + randn(7, 5)*0.2;
% l(find(l>1))=1;
% imagesc(l);
net.trainParam.epochs = 300;
net.trainParam.goal = 0.6;
for i=1:10
    p1 = P + randn(R, Q) * 0.1;
    p2 = P + randn(R, Q) * 0.2;
    p1(find(p1<0))=0;
    p1(find(p1>1))=0;
    p2(find(p2<0))=0;
    p2(find(p2>1))=0;
    Pz = [P P p1 p2];
    Tz = [targets targets targets targets];
    net = train(net, Pz, Tz);
end
net.trainParam.epochs = 500;
net.trainParam.goal = 0.5;
net = train(net, P, targets);
%end
