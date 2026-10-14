%% reference image feature extraction
figure;
a=imread('Ref.jpg');
A=rgb2gray(a);
tic
refpoints = detectMinEigenFeatures(A);
toc
imshow(A);
title('REFERENCE IMAGE');
hold on;
num=500;
plot(selectStrongest(refpoints,num));%plot strongest 50 of identifiable points
x=length(A);%number of identifiable points
%refloc=selectStrongest(refpoints,num).Location% location of the strongest 50
[refFeatures, refPoints] = extractFeatures(A, selectStrongest(refpoints,num));


%% transformed image feature extraction 45 deg rotation
figure;
c=imread('190.jpg');
C=rgb2gray(c);
degfourfivepoints = detectMinEigenFeatures(C);
imshow(C);
title('noise median');
hold on;
plot(degfourfivepoints.selectStrongest(num));%plot strongest 50 of identifiable points
x=length(C);%number of identifiable points
cloc=degfourfivepoints.selectStrongest(num).Location% location of the strongest 50
[cFeatures, cPoints] = extractFeatures(C, degfourfivepoints.selectStrongest(num));

%% Finding Putative Point Matches
tic
refPairs = matchFeatures(refFeatures, cFeatures);
toc
matchedRefPoints = refPoints(refPairs(:,1), :);
matchedcPoints = cPoints(refPairs(:, 2), :);
figure;
showMatchedFeatures(A, C, matchedRefPoints,matchedcPoints, 'montage');
title('Matched Points in median noise');

