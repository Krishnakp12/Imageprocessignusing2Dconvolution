clc
clear all
close all
X=imread('img0x.jpg'); %x= 1,2,3 (different images)
X=rgb2gray(X);
%imshow(X);
X=imnoise(X,'salt & pepper',0.1);
X=imnoise(X,'gaussian');
figure;imshow(X);
[M,N]=size(X);
Y=zeros(M,N);
alpha=6;
start=alpha+1;
fin=25-alpha;
for m=3:M-2
    for n=3:N-2
         k=1;
         wind=zeros(1,25);
        for i=m-2:m+2
            for j=n-2:n+2
                wind(k)=X(i,j);
                k=k+1;
            end
        end
        wind=sort(wind);
        Y(m,n)=wind(start);
        for j=start+1:fin
            Y(m,n)=Y(m,n)+wind(j);
        end
        Y(m,n)=Y(m,n)/(25-2*alpha);
    end
end
Z=mat2gray(Y);
Z1=imadjust(Z);
Z2=histeq(Z);
Z3=imsharpen(Z);
figure;imshow(Z);
figure;imshow(Z1);
figure;imshow(Z2);
figure;imshow(Z3);