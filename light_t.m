
rgb = imread('.jpg');%读取图片
figure(1),subplot(2,2,1);imshow(rgb);title('原图像');
[m,n,k] = size(rgb); %读取图片大小
hsv = rgb2hsv(rgb); %颜色空间转换
H = hsv(:,:,1); % 色调
S = hsv(:,:,2); % 饱和度
V = hsv(:,:,3); % 亮度
for i = 1:m %遍历每一个像素点，可以根据需要选择自己需要处理的区域
    for j = 1: n
        hsv(i,j,3) =1.3* hsv(i,j,3); %1.3是需要增强的倍数，可以根据图片情况动态调整
    end
end

rgb1 = hsv2rgb(hsv); %转为RGB，进行显示
figure(1),subplot(2,2,2);imshow(rgb1);title('加亮图像');

% temp = rgb2gray(rgb);%用已有的函数进行RGB到灰度图像的转换 
% rgb2 = 255 - temp;
% figure(1),subplot(2,3,4);imshow(temp);title('灰图图像');
% figure(1),subplot(2,3,5);imshow(rgb2);title('取反图像');
% 
% imgdata = im2double(temp);
% rgb3 = 1 * (imgdata .^0.5);
% figure(1),subplot(2,3,6);imshow(rgb3);title('增强对比度图像');


