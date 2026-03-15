A = input("Enter coefficient matrix A: ");
b = input("Enter constant matrix b: ");

[n,n] = size(A);
Aug = [A b];

col_swap = 1:n;

for k = 1:n-1
    
    sub = abs(Aug(k:n,k:n));
    [maxval, pos] = max(sub);
    [row, col] = ind2sub(size(sub), pos);
    
    row = row + k - 1;
    col = col + k - 1;
    
    if row <> k then
        temp = Aug(k,:);
        Aug(k,:) = Aug(row,:);
        Aug(row,:) = temp;
    end
    
    if col <> k then
        temp = Aug(:,k);
        Aug(:,k) = Aug(:,col);
        Aug(:,col) = temp;
        
        temp2 = col_swap(k);
        col_swap(k) = col_swap(col);
        col_swap(col) = temp2;
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

x_final = zeros(n,1);
for i = 1:n
    x_final(col_swap(i)) = x(i);
end

disp("Solution is:");
disp(x_final);
