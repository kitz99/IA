%ceva rezonabil, trebuie continuat
function[y]=KNN(K,trainImages,trainLabels,testImages)

[w1 h1 n1]=size(trainImages)
[w2 h2 n2]=size(testImages)

for i=1:1:n2
    imgx=testImages(:,:,i)
    v=zeros(1,n1)
    for j=1:1:n1
        
        
        imgy=trainImages(:,:,j)
        dif=(imgx - imgy).^2
        D=sum(dif(:))/(w1*h1)
        v(j)=D
    end
    