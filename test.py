# -*- coding: utf-8 -*-
"""
Created on Mon Oct  7 21:57:52 2019

@author: qwy
"""
from skimage.io import imread
import matplotlib.pyplot as plt
import numpy as np
from mpl_toolkits.mplot3d import Axes3D
fig = plt.figure(figsize=(12, 8))
ax = Axes3D(fig,auto_add_to_figure=False)
'''
fig = plt.figure(figsize=(12, 8))
ax = fig.gca(projection='3d')
'''

depth = imread('depth.png')
rgb = imread('rgb.jpg')


# 生成代表X轴数据的列表
x = depth.shape[0]
# 生成代表Y轴数据的列表
y = depth.shape[1]
# 对x、y数据执行网格化
X, Y = np.meshgrid(x, y)
Z1 = np.exp(-X**2 - Y**2)
Z2 = np.exp(-(X - 1)**2 - (Y - 1)**2)
# 计算Z轴数据（高度数据）
Z = (Z1 - Z2) * 2
# 绘制3D图形
surf = ax.plot_surface(X, Y, Z,
                       rstride=1,  # rstride（row）指定行的跨度
                       cstride=1,  # cstride(column)指定列的跨度
                       cmap=plt.get_cmap('rainbow'))  # 设置颜色映射
# 设置Z轴范围
ax.set_zlim(-2, 2)
# 设置标题
plt.title("3D")
fig.colorbar(surf, shrink=0.5, aspect=5)
plt.show()
