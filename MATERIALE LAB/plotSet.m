function [ ] = plotSet( x, y, w )

clf;
hold on;

red = find(y == 1);
blue = find(y == 0);
plot(x(red, 1), x(red, 2), '.r');
plot(x(blue, 1), x(blue, 2), '.b');

% a*X + b*Y + c = 0 ==> b*Y = - c - a*X ==> Y = -c/b - a/b * X
X = [min(x(:)) - 1, max(x(:)) + 1];
Y = -w(3)/w(2) - w(1)/w(2) * X;
plot(X, Y);

hold off;
end

