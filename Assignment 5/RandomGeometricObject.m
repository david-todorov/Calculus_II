randomPoints = rand(3,2); % Creating three random points
currentDot = randomPoints(1,:); % Setting the currentPoint 

M = zeros(10000 , 2); % Creating our Matrix M


for i = 1:10000   % Looping 10 000 times for better visualisation 
    M(i,:) = currentDot; %Setting the current CurrentPoint into the Matrix M

    k = randi(3); % Random Number between in {1,2,3}
    
    currentDot = currentDot + randomPoints(k,:); %Finding the arithmetic mean
    currentDot = currentDot / 2;


end

plot(M(:, 1), M(:, 2), '.'); %Plotting the matrix with symbol .
xlabel('X');
ylabel('Y');
title('Assignment II - Random Geometric Object');