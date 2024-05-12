clc;clear;

depth = imread("depth.png");
rgb = imread('rgb.jpg');

y = linspace(1,240,240);
x = linspace(1,320,320);
[X, Y] = meshgrid(x, y);

surf(X, Y, depth, rgb)
axis equal

