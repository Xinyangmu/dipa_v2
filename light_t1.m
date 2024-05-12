clc;clear;
rgb = imread('rgb.jpg');%读取图片
depth = imread("depth.png");

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


y = linspace(1,240*2,240*2);
x = linspace(1,320*2,320*2);
[X, Y] = meshgrid(x, y);

surf(X, Y, depth, rgb1)
axis equal
