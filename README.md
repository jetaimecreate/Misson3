# Misson3
任务三主要参考了之前ppt的内容，用sift检测器检测关键点，匹配器用了flann，//初版想法使用了brute force匹配器，效果不好。故使用flann
并使用knn-nndr匹配法，用比率筛选匹配点
但实际上鲁棒性并不好，对于遮挡的第三副参照物，识别困难，尝试了放大参照图像，以及更改sift检测器参数等方法，均失败。曾识别出一张图，但结果抽象，不如不加。
