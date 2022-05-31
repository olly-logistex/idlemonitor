from unicodedata import name
import matplotlib.pyplot as plt
import matplotlib.ticker as mtick
import numpy as np
import os
#can read in from excel and enumerate through to add to array
idle_data = [83.29,77.17,72.7,77.25,83.57,82.26,83.45,83.58,86.77,76.44,83.13,83.03,82.11,84.23,87.05,82.42,83.85,84.2,84.78,84.15,88.76,83.25,82.55,83.71,82.71,84.17,87.16,82.93,83.28,83.5,81.45,84.49,86.86,80.38,83.12,83.64,82.63,84.09,87.16,77.99,85.94,86.38,85.07,84.21,85.86,81.79,81.36,81.36,81.9,83.17,85.22,79.44,78.62,81.42,81.19,82.71,85.79,80.94,79.8,81.93,81.3,79.94,82.62,80.04,83.18,82.23,82.59,83.68,86.7,82.3,80.02,78.99,79.76,83.33,86.35,79.89,80.63,82.97,79.22,81.59,86.57,75.42,80.71,76.59,81.48,80.19,85.8,75.6,84.17,87.9,81.55,84,86.41,76.94,81.65,83.47,75.95,82.33,84.31,81.56,79.75,83.14,81.81,84,86.68,76.83,83.21,83.47,79.94,79.44,86.78,83.75,85.28,83.25,82.91,83.36,87.1,81.14,80.54,79.46,82.88,84.36,87.35,82.86,80.09,83.79,83.33,82.32,87.25,82.73,82.03,83.64,82.73,81.58,87.22,82.83,85.53,85.79,83.83,84.03,87.99,83,82.58,82.69]

# scaled= []
# for index in range(0,len(idle_data)):
#     scaled.append(100-idle_data[index])

#can replace with command line arg
bin_width = 0.5
percentile = 0.95

def plot():
    fig, (ax0,ax1) = plt.subplots(1,2,figsize=(10,5))
    num_bins = len(np.arange(min(idle_data), max(idle_data) + 1, bin_width))
    ax0.hist(idle_data, bins=num_bins)
    #ax1.hist(scaled,bins=num_bins, cumulative=-1) #shows inverse i.e actual usage instead of idle
    ax1.hist(idle_data,bins=num_bins,cumulative =1)
    ax1.hlines((len(idle_data)/1*percentile),min(idle_data),max(idle_data), color="red", linestyles='dashed')
    plt.xlabel('% idle')
    plt.ylabel("count")
    ax1.yaxis.set_major_formatter(mtick.PercentFormatter(xmax=len(idle_data),decimals=None))

    #opens the windows matplotlib util if in windows, or saves the image for linux
    #may be a wsl compatibilty issue try $ export DISPLAY
    if os.name == 'nt':
        plt.show()
    elif os.name == 'posix':
        plt.savefig('idle.png')