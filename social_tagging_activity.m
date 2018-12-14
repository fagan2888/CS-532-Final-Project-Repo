%% Settings and intialiation
clear; clc;
% add helper function folder and data folder to path
addpath('./helper_funcs');
addpath('./data');
%% Part 1
A(:,:,1) = [1 1 0; 0 0 0; 0 1 0];
A(:,:,2) = [0 0 0; 0 0 0; 1 0 0];
A(:,:,3) = [1 0 0; 1 0 0; 0 1 0];
A_mode_1 = ndim_unfold(A, 1);
A_mode_2 = ndim_unfold(A, 2);
A_mode_3 = ndim_unfold(A, 3);
%% Part 2
%Find U of A_mode_1, A_mode_2, A_mode_3

%% Part 3
%Find S
%Make sure A equals tprod(S, U) 

%% Part 4
[S, U, sv] = hosvd(A);
U{1} = U{1}(:,1:2);
U{2} = U{2}(:,1:2);
U{3} = U{3}(:,1:2);
S = S(1:2,1:2,1:2);
A_approx = tprod(S, U);
%% Part 5
[A1, A2, A3] = size(A);
Ahat = A;
rank = 2;
Aprev = ones(A1,A2,A3)*1000;
tol = .00001;
while (norm(ndim_unfold(Ahat,1) - ndim_unfold(Aprev,1)) > tol)
    Aprev = Ahat;
    [S, U, sv] = hosvd(Aprev);
    U{1} = U{1}(:,1:rank);
    U{2} = U{2}(:,1:rank);
    U{3} = U{3}(:,1:rank);
    S = S(1:rank,1:rank,1:rank);
    Ahat = tprod(S, U);
    for j1 = 1:A1
        for j2 = 1:A2
            for j3 = 1:A3
                if (A(j1, j2, j3) == 1)
                    Ahat(j1,j2,j3) = 1;
                end
            end
        end
    end
end
%% Part 6
M(:,:,1) = [0 0 1 0 0 0; 0 0 0 0 1 1; 0 1 0 0 0 0; 1 0 0 0 1 0; 0 0 0 1 0 1; 1 0 0 1 0 0];
M(:,:,2) = [0 0 0 0 1 0; 0 0 0 1 1 0; 1 1 0 0 0 0; 1 1 0 0 0 1; 0 1 0 0 1 0; 1 0 0 0 1 0];
M(:,:,3) = [0 0 0 0 1 0; 0 1 0 1 1 0; 1 0 0 1 0 0; 1 1 0 0 0 0; 0 0 0 1 0 0; 0 0 0 0 1 0];
M(:,:,4) = [0 0 1 0 0 0; 1 0 0 0 1 1; 0 0 0 0 1 0; 0 1 1 1 0 0; 0 0 0 0 1 0; 1 0 0 0 1 0];
M(:,:,5) = [0 0 0 1 1 0; 1 0 0 0 0 0; 0 0 0 0 1 0; 0 1 0 0 0 0; 0 0 0 1 0 0; 0 0 0 0 1 0];
M(:,:,6) = [1 0 0 0 0 0; 1 0 1 0 1 1; 0 1 0 0 1 0; 0 1 1 0 0 0; 0 0 0 0 1 0; 0 0 0 1 1 0];
Mhat = M;
[M1, M2, M3] = size(M);
rank = 2;
Mprev = ones(M1,M2,M3)*1000;
tol = .00001;
count = 0;
while (norm(ndim_unfold(Mhat,1) - ndim_unfold(Mprev,1)) > tol)
    count = count + 1;
    Mprev = Mhat;
    [S, U, sv] = hosvd(Mprev);
    U{1} = U{1}(:,1:rank);
    U{2} = U{2}(:,1:rank);
    U{3} = U{3}(:,1:rank);
    S = S(1:rank,1:rank,1:rank);
    Mhat = tprod(S, U);
    for j1 = 1:M1
        for j2 = 1:M2
            for j3 = 1:M3
                if (M(j1, j2, j3) == 1)
                    Mhat(j1,j2,j3) = 1;
                end
            end
        end
    end
end