clc;
clear;

x = input("Enter initial guess x0: ");
tol = input("Enter tolerance: ");

deff('y=f(x)', 'y = x^3 - x - 2');
deff('y=df(x)', 'y = 3*x^2 - 1');

while abs(f(x)) > tol
    x = x - f(x)/df(x);
end

disp("Root approx: " + string(x));
