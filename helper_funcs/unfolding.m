A = zeros(4,3,2);
A(:,:,1) = [1 2 3; 4 5 6; 7 8 9; 10 11 12];
A(:,:,2) = [13 14 15; 16 17 18; 19 20 21; 22 23 24];

% Unfold along 1st mode
A1 = reshape(A, 4, 6)

% Unfold along 2nd mode
A2 = [A(:,:,1)' A(:,:,2)']

% Unfold along 3rd mode
A3 = [reshape(A(:,:,1),1,12); reshape(A(:,:,2),1,12)]