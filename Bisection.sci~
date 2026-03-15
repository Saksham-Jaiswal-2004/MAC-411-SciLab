clc;
clear;

x0 = input("Enter lower bound x0: ");
x1 = input("Enter upper bound x1: ");
tol = input("Enter tolerance: ");

deff('y=f(x)', 'y = x^3 - x - 2');

while abs(x1 - x0) > tol
    xm = (x0 + x1)/2;
    if f(x0)*f(xm) < 0 then
        x1 = xm;
    else
        x0 = xm;
    end
end

disp("Root approx: " + string((x0 + x1)/2));
