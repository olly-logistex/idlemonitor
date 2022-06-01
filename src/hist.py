
import matplotlib.pyplot as plt
import matplotlib.ticker as mtick
import numpy as np
import os

# TODO 
# - scaling issues on y-axis 
# - number and size of bins based on current dataset
# - use string.strip to remove file extension before adding .png 

percentile = 95

def plot(data,num_bins):
    #num_bins = len(np.arange(min(data), max(data) + 1, 1))
    #plt.vlines(200,0,0.0018, colors="red",linestyles="dashed")
    #get_os()
    percentile_95 = round(np.percentile(data,percentile),2)
    plt.hist(data,bins=num_bins,label=f"95th: {percentile_95}",density=1,stacked=1) #density - integrates to 1 , stacked sums to 1
    plt.legend()
    plt.gca().yaxis.set_major_formatter(mtick.PercentFormatter(xmax=10))

def get_os(filename,save):
#opens the windows matplotlib util if in windows, or saves the image for linux
#may be a wsl compatibilty issue try $ export DISPLAY
    if save == True:
        if os.name == 'nt':
            return plt.show()
            plt.savefig(f"./hists/{filename}.png")
        elif os.name == 'posix':
            print("cannot show interactive utility on linux, files have been saved into ./hists/")
            return plt.savefig(f"./hists/{filename}.png")
        elif save != True:
            return plt.show()

def directory_loop(bins,show):
    plt.clf()
    print("Creating histograms for these files: ")
    for file in os.listdir("./data"):
        filename = os.fsdecode(file)
        if filename.endswith(".txt") or filename.endswith(".csv"):
            print(os.path.join("\data",filename))
            with open(f"./data/{filename}") as datafile:
                array = np.loadtxt(datafile, delimiter=",")
            datafile = list(array)
            plot(datafile,bins)
            plt.title(filename)
            get_os(filename,show) # 1 for show, 0 for save
            #plt.show()
            plt.savefig(f"./hists/{filename}.png")
            plt.gca().cla()
            plt.clf()
    print("Will be saved with the filename .png")

directory_loop(bins=20, show=0)

