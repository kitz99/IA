load('trainData.mat');
load('testData.mat');
y = KNN(3, trainImages, trainLabels, testImages);