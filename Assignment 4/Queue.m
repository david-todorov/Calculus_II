p = 0.5;
q = 0.6;

x = 100; 
W = zeros(1,x); % The queue itself, zeros represent no order and ones - an order
avgQueueLengths = zeros(1,x); % Average lengths of queues
probabilities = linspace(0 , 1, x); % Vector of probabilities with granularity 0.0101

for i = 1 : 100 % The outer loop adds average length of a Queue after 100 iterations

    size = 0; %Dynamic size of the queue and the index of the order whcih needs to be proccesed

    for j = 0 : 99
        probForAdding = probabilities(randi(length(probabilities))); % independent probability of an order to be added
        probForRemoving = probabilities(randi(length(probabilities))); % independent probability of an order to be proccessed

        if(p >= probForAdding) %If p is greater of equal to the probForAdding then an order should be added
            size = size + 1;
            W = circshift(W, 1);
            W(1) = 1;
        end

        if(q >= probForRemoving && size > 0) % If q is greater of equal to the probForRemoving then an orde should be proccessed
            W(size) = 0;
            size = size - 1;
        end
        % Adding and proccessing an order are two independent events, this is
        % why I used two different probabilities of event, I hope I am not
        % wrong otherwise everytime when an order is added, the same order
        % will be removed 
    end

    avgQueueLengths(i) = size; % Adding current length of a Queue after 100 iteration
end


fprintf('With p = 0.5 and q = 0.6 the average length is %f with total capacity of 100 ',round(mean(avgQueueLengths)));

