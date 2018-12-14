%% Settings and intialiation
clear; clc;
% add helper function folder and data folder to path
addpath('./helper_funcs');
addpath('./data');

%% Section 1
N = 150;
[imgs, labels] = readMNIST('train-images-idx3-ubyte', 'train-labels-idx1-ubyte', N, 0);

figure('Name','Handwritten Digits -- Full')
colormap gray; 
subplot(2,2,1)
imagesc(imgs(:,:,1),[0 1])
axis off
hold on
subplot(2,2,2)
imagesc(imgs(:,:,2),[0 1])
axis off
hold on
subplot(2,2,3)
imagesc(imgs(:,:,3),[0 1])
axis off
hold on
subplot(2,2,4)
imagesc(imgs(:,:,4),[0 1])
axis off

%% Section 2
[S U sv] = hosvd(imgs);

sing_vals_3  = sv{3};

figure
plot(log10(sing_vals_3));  % plot log base 10 of singular vals
xlabel('index'); ylabel('log of sing vals');
title('Singular values of 3rd (Digit) Mode')

%% Section 3
[S1 U1 sv1] = hosvd(imgs, ones(20,20,N), 10);
A_reconstruct1 = tprod(S1,U1);

figure('Name','Handwritten Digits -- Low-Rank Approximation')
colormap gray; 
subplot(2,2,1)
imagesc(A_reconstruct1(:,:,1),[0 1])
axis off
hold on
subplot(2,2,2)
imagesc(A_reconstruct1(:,:,2),[0 1])
axis off
hold on
subplot(2,2,3)
imagesc(A_reconstruct1(:,:,3),[0 1])
axis off
hold on
subplot(2,2,4)
imagesc(A_reconstruct1(:,:,4),[0 1])
axis off

%% Section 4

threshold = 10;
[S1 U1 sv1] = hosvd(imgs, ones(20,20,N), threshold);
A_reconstruct1 = tprod(S1,U1);

figure('Name','Handwritten Digits -- Low-Rank Approximation')
colormap gray; 
subplot(2,2,1)
imagesc(A_reconstruct1(:,:,1),[0 1])
axis off
hold on
subplot(2,2,2)
imagesc(A_reconstruct1(:,:,2),[0 1])
axis off
hold on
subplot(2,2,3)
imagesc(A_reconstruct1(:,:,3),[0 1])
axis off
hold on
subplot(2,2,4)
imagesc(A_reconstruct1(:,:,4),[0 1])
axis off

%% Section 5: Specific-Digit
N = 3000;
[imgs, labels] = readMNIST('train-images-idx3-ubyte', 'train-labels-idx1-ubyte', N, 0);
ind = find(labels==0);
zero_figs = imgs(:,:,ind);
zero_labels = labels(ind);

figure('Name','Handwritten Digits -- Zeros, Full')
colormap gray; 
subplot(2,2,1)
imagesc(zero_figs(:,:,1),[0 1])
axis off
hold on
subplot(2,2,2)
imagesc(zero_figs(:,:,2),[0 1])
axis off
hold on
subplot(2,2,3)
imagesc(zero_figs(:,:,3),[0 1])
axis off
hold on
subplot(2,2,4)
imagesc(zero_figs(:,:,4),[0 1])
axis off

[S2 U2 sv2] = hosvd(imgs);

sing_vals_3_2  = sv2{3};

figure
plot(log10(sing_vals_3_2));  % plot log base 10 of singular vals
xlabel('index'); ylabel('log of sing vals');
title('Singular values of 3rd Mode')

threshold_2 = 50;
[S3 U3 sv3] = hosvd(zero_figs, ones(20,20,N), threshold_2);
imgs_reconstruct2 = tprod(S3,U3);


figure('Name','Handwritten Digits -- Zeros, Low-Rank Approximation')
colormap gray; 
subplot(2,2,1)
imagesc(imgs_reconstruct2(:,:,1),[0 1])
axis off
hold on
subplot(2,2,2)
imagesc(imgs_reconstruct2(:,:,2),[0 1])
axis off
hold on
subplot(2,2,3)
imagesc(imgs_reconstruct2(:,:,3),[0 1])
axis off
hold on
subplot(2,2,4)
imagesc(imgs_reconstruct2(:,:,4),[0 1])
axis off