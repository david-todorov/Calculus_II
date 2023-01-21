
format long

%Length of the arms as col vector
armsLength =[5 ; 3];
%Ending point of the equation
endPoint = [-5 ; 4];
%The given epsilion
epsilon = 10^(-5);
%Initial (gues) vector
init_vector = [-1 ; 1];

iterations = 0;
while true
%Calculating the given function with init_vector's values
given_function = [armsLength(1) * cos(init_vector(1)) + armsLength(2) * cos(init_vector(2)) - endPoint(1);
     armsLength(1) * sin(init_vector(1)) + armsLength(2) * sin(init_vector(2)) - endPoint(2)];

%Calculating the Jacobian matrix with the init_vector's values
J = [armsLength(1) * -sin(init_vector(1)), armsLength(2) * -sin(init_vector(2));
         armsLength(1) * cos(init_vector(1)), armsLength(2) * cos(init_vector(2))];

% delta_vector is J^{-1}*f but more reliable, I saw it on internet why...
delta_vector = J\given_function;

%calculating the new_vector with the given formula
new_vector = init_vector - delta_vector;

%Finding the difference between the old and new vector
difference = new_vector - init_vector;

if(norm(difference) < epsilon)
    break
end

%Assigning the new value
init_vector = new_vector;

%Iteration increamenting
iterations = iterations + 1;
end

%Printing the result
final_answer = init_vector;
final_answer
fprintf('The vector is being calculated after: %d', iterations);
fprintf(' iterations.\n');






