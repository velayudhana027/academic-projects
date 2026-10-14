%% reference image feature extraction

a=imread('Ref.jpg');
A=rgb2gray(a);
tic
refpoints = detectMSERFeatures(A);
toc
figure;
imshow(A);
title('REFERENCE IMAGE MSER REGION IDENTIFICATION');
hold on;
plot(refpoints,'showPixelList',true,'showEllipses',false);
figure;
imshow(A);
title('REFERENCE IMAGE PIXEL LIST');
hold on;
plot(refpoints(1:500));
[refFeatures, refPoints] = extractFeatures(A,refpoints(1:500));

%% transformed image feature extraction 45 deg rotation
c=imread('190.jpg');
C=rgb2gray(c);
degfourfivepoints = detectMSERFeatures(C);
figure;
imshow(C);
title('to be compared');
hold on;
plot(degfourfivepoints,'showPixelList',true,'showEllipses',false);
figure;
imshow(C);
title('to be compared boundary');
hold on;
plot(degfourfivepoints(1:500));
[cFeatures, cPoints] = extractFeatures(C, degfourfivepoints(1:500));

%% Finding Putative Point Matches
tic
refPairs = matchFeatures(refFeatures, cFeatures);
toc
matchedRefPoints = refPoints(refPairs(:,1), :);
matchedcPoints = cPoints(refPairs(:, 2), :);
figure;
showMatchedFeatures(A, C, matchedRefPoints,matchedcPoints, 'montage');
title('Matched Points in 1.9 scaled');

