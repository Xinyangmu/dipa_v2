from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

from mpl_toolkits.mplot3d.axes3d import *
from matplotlib import cm

import matplotlib.pyplot as plt
import matplotlib as mpl
import numpy as np
from glob import glob
import os
import skimage.filters as flts
from skimage.io import imread
# read in images

depth = imread('depth.png')
rgb = imread('rgb.jpg')

raw_shape = depth.shape
xx,yy = np.meshgrid(range(raw_shape[1]),range(raw_shape[0]))
# flip xx
xx = xx[:,::-1]

mvertices = np.array([xx[::8,::8].flatten(),
                      yy[::8,::8].flatten(),
                      depth[::8,::8].flatten()])

print(mvertices.shape)

fig = plt.figure(figsize = (10,5))
ax = Axes3D(fig,auto_add_to_figure=False)
Zdata = depth[::8,::8].astype(np.float32)


ax.plot_surface(xx[::8,::8],yy[::8,::8],Zdata, rstride=1, cstride=1,
                facecolors=rgb[::8,::8].astype(np.float32)/255,
                linewidth=0, antialiased=True)

plt.show()
