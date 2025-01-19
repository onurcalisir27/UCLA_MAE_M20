%trial tests
function [x, y] = RandomWalk(x_n, y_n, Wall)
r = rand;
if r <= 0.2
    y = y_n + 1;
    x = x_n;
    if y_n == Wall(1)
        y = Wall(1);
    end
elseif r <= 0.4 && r > 0.2
    x = x_n;
    y = y_n - 1;
    if y_n == Wall(2)
        y = Wall(2);
    end
elseif r <= 0.6 && r > 0.4
    x = x_n - 1;
    y = y_n;
    if x_n == Wall(3)
        x = Wall(3);
    end
elseif r <= 0.8 && r > 0.6
    x = x_n + 1;
    y = y_n;
    if x_n == Wall(4)
        x = Wall(4);
    end
elseif r >0.8
    x = x_n;
    y = y_n;
end
end





