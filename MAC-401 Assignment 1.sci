deff('y = f(x)', 'y = 3*x - cos(x) - 1')
x = linspace(-1, 1, 5000)
y = f(x)

a = gca();
a.x_location = "origin";
a.y_location = "origin";
plot(x, y)
