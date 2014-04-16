function [w, y] = adaline(x, t, epochs, miu)

%% Plotarea suprafetei de errorare
figure(3);
hold on
[W1,W2] = meshgrid(-0.5:0.01:0.5, -0.5:0.01:0.5);
[p1,p2] = size(W1);

JW = zeros(p1,p2);
for i = 1:(p1 * p2)
    w = [W1(i) W2(i)]';
    JW(i) = sum((t - x' * w).^2);
end

surf(W1,W2,JW);

%% Initializare
[n,m] = size(x);
w = [0 0]';

% Pentru plotarea diferentei ||w* - w^k||
diff = zeros(1,epochs);
wStar = (x * x')^-1 * x * t;  

%% Algoritumul batch pentru ADALINE
for step = 1:epochs
    
    s = [0 0]';
    y = zeros(m,1);
    
    for i = 1:m
        y(i) = x(:,i)' * w;
        s = s + (t(i) - y(i)) * x(:,i);
    end
    
    w = w + miu * s;
    
    J = sum((t - x' * w).^2);
    plot3(w(1),w(2),J,'wo');
    
    % Retine diferenta ||w* - w^k||
    diff(step) = norm(w - wStar);
end

hold off

%% Plotarea diferentei
figure(2);
plot(diff);
end

