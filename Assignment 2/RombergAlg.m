
f = @(x) exp(x); % Our function 
a = 0; % Lower bound
b = 2; % Upper bound
n = 5; % Number of intervalss
R = zeros(n , n); % Matrix n by n filled with zeros
R(1,1) = ((b-a)/2) * (f(a) + f(b)); % Our first entry R(1,1) from where every other will be calculated

for k = 2 : n % Starting from 2, keep in mind the indexis are adjusted
    p = 2^(k-1);
    h = (b - a) / p;
    A = zeros(1, 2^(k-2)); % Array of areas of other trapezoids of specific intervals 
    for i = 1 : 2^(k-2)
        A(i) = f(a + (2*i -1)*h); % Filling the array
    end
    R(k,1) =  0.5*R(k-1,1) + h*(sum(A));  % Calculating the other values into the firsts columns
end

% Calculating the rest entries recursively
for i = 2 : (n)
    power = 1;
    for k = i : n
        R(k,i) = (4^(power)*R(k,i-1) - R(k-1,i-1)) / (4^(power) - 1); % From the script
    end
    power= power + 1;
end
fprintf('My best approximation is %f',R(n,n))
R()