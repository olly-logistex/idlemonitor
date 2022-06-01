# hist.py
produce histograms from data using matplotlib

## installation
Run hist.py after installing the required packages in requirements.txt and python 3.6+

## data
- place .txt or .csv files into the data folder
- set the delimiter in the directory_loop function line 43

## input
- pass the number of bins (int) and show (bool) 1 for show + save, 0 for save

## output 
- the histograms will be scaled to a percentage on the Y-axis and the value of the 95th percentile will be contained within the legend
- they will be saved to ./data with the original filename followed by ".png"
