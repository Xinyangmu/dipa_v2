clc;clear;
depth_4x = imread('depth_4x.png');
depth_4x = im2double(depth_4x);

[m1,n1] = size(depth_4x); 
% [deltax, 1- deltax] * Q * [deltay; 1- deltay]

interp_x = 240;
interp_y = 320;

m2 = linspace(1,m1,interp_x);
n2 = linspace(1,n1,interp_y);
P_all = zeros(interp_x,interp_y);

for x = 2:interp_x  
    for y = 2:interp_y

        t1 = m2(x);
        t2 = n2(y);
        t1_c = ceil(t1);
        t2_c = ceil(t2);
        Q = [depth_4x(t1_c-1, t2_c-1), depth_4x(t1_c-1, t2_c);depth_4x(t1_c, t2_c-1), depth_4x(t1_c, t2_c)];
        deltax = t1_c - t1;
        deltay = t2_c - t2;
        P_new = [deltax, 1- deltax] * Q * [deltay; 1- deltay];
        P_all(x,y) = P_new;

    end
end

for x = 1
    for y = 2 : interp_y

       t2 = n2(y);
       t2_c = ceil(t2);
       Q = [depth_4x(1,t2_c-1); depth_4x(1,t2_c)];
       delta = [t2_c-t2, 1+t2-t2_c];
       P_new  = delta*Q;
       P_all(x,y) = P_new;

    end
end

for x = 2 : interp_x
    for y = 1
        
       t1 = m2(x);
       t1_c = ceil(t1);
       Q = [depth_4x(t1_c-1,1); depth_4x(t1_c,1)];
       delta = [t1_c-t1, 1+t1-t1_c];
       P_new  = delta*Q;
       P_all(x,y) = P_new;

    end
end

P_all(1,1) = depth_4x(1,1);

imshow(P_all)

