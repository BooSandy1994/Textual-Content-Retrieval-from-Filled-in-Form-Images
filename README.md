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

```
@InProceedings{10.1007/978-981-13-9361-7_3,
author="Ghosh, Soulib
and Bhattacharya, Rajdeep
and Majhi, Sandipan
and Bhowmik, Showmik
and Malakar, Samir
and Sarkar, Ram",
editor="Sundaram, Suresh
and Harit, Gaurav",
title="Textual Content Retrieval from Filled-in Form Images",
booktitle="Document Analysis and Recognition",
year="2019",
publisher="Springer Singapore",
address="Singapore",
pages="27--37",
abstract="Form processing refers to the process of extraction of information from filled-in forms. In this work, we have addressed three very crucial challenges of a form processing system, namely touching component separation, text non-text separation and handwritten-printed text separation. The proposed method is evaluated on a database having 50 filled-in forms written in Bangla, collected during an essay competition in a school. The experimental results are promising.",
isbn="978-981-13-9361-7"
}
```

