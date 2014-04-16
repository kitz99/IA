%% Datele de intrare
x = [-2,2; -2,3; -1,1; -1,4; 0,0; 0,1; 0,2; 0,3; 1,0; 1,1; 2,1; 2,2; 3,-1; 3,0; 3,1; 3,2; 4,-2; 4,1; 5,-1; 5,0]';
t = [-1 -1 -1 -1 -1 -1 -1 -1 1 -1 1 -1 1 1 1 1 1 1 1 1]';

%% Antrenarea elementului ADALINE folosind batch
[w,y] = adaline(x,t,100,0.001);

%% Plotarea punctelor si a hiperplanului de separatie invatat de ADALINE
figure(1);
plotpv(x,(t' + 1) / 2);
plotpc(w',0);