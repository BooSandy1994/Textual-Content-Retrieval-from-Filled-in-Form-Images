# Textual-Content-Retrieval-from-Filled-in-Form-Images
Implementation of our paper published in Spinger, Singapore. This part implements the segregation of the printed texts from the handwritten texts. The code has been implemented in Matlab. 

# Files and What they do :
1. otsu_sd_pl.m - calculate the otsu threshold of the printed and the handwritten
2. batch_bw.m - binarize a batch of data set
3. batch_cc_extract.m - batch extraction of CC for Gray scale image
4. comp_csv.m - generates the csv file which has all the statistical analysis
5. l_diagonal.m - stroke width of the lower diagonal
6. test_stroke.m - Statistical analysis of the stroke width along 8 directions
7. u_diagonal.m - stroke width of the upper diagonal
8. test.m - Pixel mapped to side where it is the minimum distance from. 


# Citation

Ghosh S., Bhattacharya R., Majhi S., Bhowmik S., Malakar S., Sarkar R. (2019) Textual Content Retrieval from Filled-in Form Images. In: Sundaram S., Harit G. (eds) Document Analysis and Recognition. DAR 2018. Communications in Computer and Information Science, vol 1020. Springer, Singapore. 
https:// doi.org/10.1007/978-981-13-9361-7_3

