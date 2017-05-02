imshow(L988);
hold on
kk = rgb2hsv(L988);
[x0,y0]= find(kk(:,:,1)==1);
[x1,y1]=find(kk(:,:,2)==1);
[x2,y2]=find(kk(:,:,3)==0);

plot(y2,x2,'bo')
%plot(y1,x1,'bx')