clc


% Step A: Define the transition matrix tM
transitionMatrix = [
      0, 1/2, 0, 1/2, 0, 0, 0, 0, 0;
      1/4, 0, 1/4, 0, 1/4, 0, 0, 1/4, 0;
      0, 1/2, 0, 0, 0, 1/2, 0, 0, 0;
      1/3, 0, 0, 0, 1/3, 0, 1/3, 0, 0;
      0, 1/4, 0, 1/4, 0, 1/4, 0, 1/4, 0;
      0, 0,  1/3, 0, 1/3, 0, 0, 0, 1/3;
      0, 0, 0, 1/2, 0, 0, 0, 1/2, 0;
      0, 1/4, 0, 0, 1/4, 0, 1/4, 0, 1/4; 
      0, 0, 0, 0, 0,  1/2, 0, 1/2, 0; 
      ];

% Step B: Create the frequency vector and number of vertices
numVertices = size(transitionMatrix, 1);
frequencyVector = zeros(1, numVertices);

% Step C: Choose a random starting vertex from numVertices
currentVert = randi(numVertices);

% Step D: Loop
numIterations = 100000; 



for iter = 1:numIterations
   
    % a) take the momentary position into account (+1 in the frequency vector)
    frequencyVector(currentVertex) = frequencyVector(currentVertex) + 1;
    
    % b) move from the momentary vertex in the maze to an adjacent vertex (with respect to the given propabilities in tM) 
    probabilities = transitionMatrix(currentVertex, :);
    nextVertex = find(rand <= cumsum(probabilities), 1);
    
    % c) updates the current vertex
    currentVertex = nextVertex;

   
end

% Step E: Plot the frequencies
figure;
bar(frequencyVector);
xlabel('Vertex');
ylabel('Frequency');
title('Frequency of Visits for Each Vertex');