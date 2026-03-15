clc;
clear;

x0 = input("Enter lower bound x0: ");
x1 = input("Enter upper bound x1: ");
tol = input("Enter tolerance: ");

deff('y=f(x)', 'y = x^3 - x - 2');

xm = x0;
while abs(f(xm)) > tol
    xm = x1 - (f(x1)*(x1 - x0))/(f(x1) - f(x0));
    if f(x0)*f(xm) < 0 then
        x1 = xm;
    else
        x0 = xm;
    end
end

disp("Root approx: " + string(xm));
