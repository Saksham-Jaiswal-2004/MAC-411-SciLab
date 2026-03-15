A = input("Enter coefficient matrix A: ");
b = input("Enter constant matrix b: ");

[n,n] = size(A);

L = eye(n,n);
U = A;

for k = 1:n-1
    for i = k+1:n
        factor = U(i,k)/U(k,k);
        L(i,k) = factor;
        U(i,k:n) = U(i,k:n) - factor*U(k,k:n);
    end
end

y = zeros(n,1);
for i = 1:n
    sum = 0;
    for j = 1:i-1
        sum = sum + L(i,j)*y(j);
    end
    y(i) = (b(i)-sum)/L(i,i);
end

x = zeros(n,1);
for i = n:-1:1
    sum = 0;
    for j = i+1:n
        sum = sum + U(i,j)*x(j);
    end
    x(i) = (y(i)-sum)/U(i,i);
end

disp("L matrix:");
disp(L);

disp("U matrix:");
disp(U);

disp("Solution is:");
disp(x);
