%% Settings and intialiation
clear; clc;
% add helper function folder and data folder to path
addpath('./helper_funcs');
addpath('./data');

%% Example

A = zeros(4,3,2);
A(:,:,1) = [1 2 3; 4 5 6; 7 8 9; 10 11 12];
A(:,:,2) = [13 14 15; 16 17 18; 19 20 21; 22 23 24];

% A = rand(20,20,40);

A1 = ndim_unfold(A, 1)
A2 = ndim_unfold(A, 2)
A3 = ndim_unfold(A, 3)
[S U sv] = hosvd(A)