%suma numerelor
%x = [1 : 10];
%s = sum(x);

%for index = start:s:end

%    text
%end;
% suma nr pare din x;
x = randperm(100);
x = x(1:50);
sum = 0;
for i=1:1:50
    if mod(x(i), 2) == 0
        sum = sum + x(i);
    end
end
sum

%A, B
n = 10;
m = 8;
p = 5;

%A = randi(-1,1, [n,m]);
%B = randi(-1,1, [m, p]);
A = -1 + ((1+1).* rand([n, m]));
B = -1 + ((1+1).* rand([m, p]));
C = A * B;
C
aux = zeros(n, p);
for k=1:1:n
    for i = 1:1:p
        for j = 1:1:m
            aux(i, j) = aux(i, j) + A(i, k)*B(k, j);
        end
    end
end
C - aux

    






