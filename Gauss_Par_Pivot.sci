A = input("Enter coefficient matrix A: ");
b = input("Enter constant matrix b: ");

[n,n] = size(A);
Aug = [A b];

for k = 1:n-1
    
    [maxval, idx] = max(abs(Aug(k:n,k)));
    idx = idx + k - 1;
    
    if idx <> k then
        temp = Aug(k,:);
        Aug(k,:) = Aug(idx,:);
        Aug(idx,:) = temp;
    end
    
    for i = k+1:n
        factor = Aug(i,k)/Aug(k,k);
        Aug(i,k:n+1) = Aug(i,k:n+1) - factor*Aug(k,k:n+1);
    end
end

x = zeros(n,1);
x(n) = Aug(n,n+1)/Aug(n,n);

for i = n-1:-1:1
    sum = 0;
    for j = i+1:n
        sum = sum + Aug(i,j)*x(j);
    end
    x(i) = (Aug(i,n+1)-sum)/Aug(i,i);
end

disp("Solution is:");
disp(x);
