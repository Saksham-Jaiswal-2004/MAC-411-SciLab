clc;
clear;

n = input("Enter number of equations: ");
A = zeros(n,n);
b = zeros(n,1);
x = zeros(n,1);

for i=1:n
    for j=1:n
        A(i,j) = input("A("+string(i)+","+string(j)+")=");
    end
    b(i) = input("b("+string(i)+")=");
end

tol = input("Enter tolerance: ");

while 1
    x_old = x;
    for i=1:n
        sum = 0;
        for j=1:n
            if j <> i then
                sum = sum + A(i,j)*x(j); // use latest x values
            end
        end
        x(i) = (b(i) - sum)/A(i,i);
    end
    if norm(x - x_old, "inf") < tol then
        break;
    end
end

disp("Solution: ");
disp(x);
