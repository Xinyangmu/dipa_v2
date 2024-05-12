clc;clear;

depth_2x = imread('depth_2x.png');
depth_2x = im2double(depth_2x);
[m1,n1] = size(depth_2x); 

interp_x = 240;
interp_y = 320;

m2 = linspace(1,m1,interp_x);
n2 = linspace(1,n1,interp_y);
P_all = zeros(interp_x,interp_y);

depth_2x = imread('depth_2x.png');
depth_2x = im2double(depth_2x);
[m1,n1] = size(depth_2x); 
% padding
new_1 = [depth_2x(:,1), depth_2x];
new_2 = [new_1(1,:); new_1];
new_3 = [new_2, new_2(:,end)];
new_4 = [new_3, new_3(:,end)];
new_5 = [new_4; new_4(end, :)];
new_6 = [new_5; new_5(end, :)];
new_7 = [new_6(1,:); new_6];
new_8 = [new_7(:,1), new_7];

depth_2x = new_8;

for x = 1 : interp_x
    for y = 1 : interp_y

t1 = m2(x);
t2 = n2(y);
t1_f = floor(t1) + 2;
t2_f = floor(t2) + 2;
delta_x = t1 - t1_f;
delta_y = t2 - t2_f;

a = -0.5; 

W_x1 = sw(1 + delta_x);
W_x2 = sw(delta_x);
W_x3 = sw(1 - delta_x);
W_x4 = sw(2 - delta_x);
W_x = [W_x1, W_x2, W_x3, W_x4];

W_y1 = sw(1 + delta_y);
W_y2 = sw(delta_y);
W_y3 = sw(1 - delta_y);
W_y4 = sw(2 - delta_y);
W_y = [W_y1; W_y2; W_y3; W_y4];

Q22_x = t1_f;Q22_y = t2_f;
Q11 = depth_2x(Q22_x - 1, Q22_y - 1);
Q12 = depth_2x(Q22_x - 1, Q22_y);
Q13 = depth_2x(Q22_x - 1, Q22_y + 1);
Q14 = depth_2x(Q22_x - 1, Q22_y + 2);

Q21 = depth_2x(Q22_x, Q22_y - 1);
Q22 = depth_2x(Q22_x, Q22_y);
Q23 = depth_2x(Q22_x, Q22_y + 1);
Q24 = depth_2x(Q22_x, Q22_y + 2);

Q31 = depth_2x(Q22_x + 1, Q22_y - 1);
Q32 = depth_2x(Q22_x + 1, Q22_y);
Q33 = depth_2x(Q22_x + 1, Q22_y + 1);
Q34 = depth_2x(Q22_x + 1, Q22_y + 2);

Q41 = depth_2x(Q22_x + 2, Q22_y - 1);
Q42 = depth_2x(Q22_x + 2, Q22_y);
Q43 = depth_2x(Q22_x + 2, Q22_y + 1);
Q44 = depth_2x(Q22_x + 2, Q22_y + 2);

Q = [Q11, Q12, Q13, Q14;
    Q21, Q22, Q23, Q24;
    Q31, Q32, Q33, Q34;
    Q41, Q42, Q43, Q44]

P_new = W_x * Q * W_y;

P_all(x,y) = P_new;

    end
end

imshow(P_all * 1.5)
