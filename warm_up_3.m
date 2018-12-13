%% Settings and intialiation
clear; clc;
% add helper function folder and data folder to path
addpath('./helper_funcs');
addpath('./data');

%% Warm-up 3
X(:,:,1) = [7 2 6 3; 2 9 7 9];
X(:,:,2) = [5 4 7 0;3 2 2 5];
X(:,:,3) = [7 7 4 5; 2 5 1 8];
[S U sv] = hosvd(X);

x = tprod(S, U);
%does X equal x?

%%
%How should U be changed to make s equal to S?
s = tprod(X, U);