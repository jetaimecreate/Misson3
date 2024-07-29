#include "head.h"
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>

void detect(cv::Mat& image1, cv::Mat& image2,cv::Mat& outputImage,int& x,int a) {
	
    if (image1.empty() || image2.empty()) {
		std::cerr << "Error: Could not read the images." << std::endl;	}
    // 转换为灰度图像
    cv::Mat gray1,gray2;
    cv::cvtColor(image1, gray1, cv::COLOR_BGR2GRAY);
    cv::cvtColor(image2, gray2, cv::COLOR_BGR2GRAY);

    // 高斯模糊
    cv::Mat blurred1,blurred2;
    cv::GaussianBlur(gray1, blurred1, cv::Size(3, 3), 0);
    cv::GaussianBlur(gray2, blurred2, cv::Size(5, 5), 0);

	// 创建SIFT检测器
	cv::Ptr<cv::SIFT> detector = cv::SIFT::create();
    if(a==2){
    detector->setContrastThreshold(0.04);  // 调整对比度阈值
    detector->setEdgeThreshold(10.0);      // 调整边缘阈值
    detector->setSigma(1.6);
    cv::resize(blurred1, blurred1, cv::Size(blurred1.cols*2, blurred1.rows*2));
    cv::resize(blurred2, blurred2, cv::Size(blurred2.cols*2, blurred2.rows*2));}
    else{detector->setContrastThreshold(0.042);  // 调整对比度阈值
    detector->setEdgeThreshold(10.0);      // 调整边缘阈值
    detector->setSigma(1.6);}
 
	// 检测关键点和计算描述子
	std::vector<cv::KeyPoint> keypoints1, keypoints2;
	cv::Mat descriptors1, descriptors2;
	detector->detectAndCompute(blurred1, cv::noArray(), keypoints1, descriptors1);
	detector->detectAndCompute(blurred2, cv::noArray(), keypoints2, descriptors2);
 /*
    // 使用FLANN匹配器进行匹配
    cv::Ptr<cv::DescriptorMatcher> matcher = cv::DescriptorMatcher::create(cv::DescriptorMatcher::FLANNBASED);
    std::vector<std::vector<cv::DMatch>> knn_matches;
    matcher->knnMatch(descriptors1, descriptors2, knn_matches, 2);  // k=2表示查询每个描述子的两个最佳匹配
    
    // 筛选匹配点
    std::vector<cv::DMatch> good_matches;
    for (size_t i = 0; i < knn_matches.size(); ++i) {
        if (knn_matches[i][0].distance < 0.75 * knn_matches[i][1].distance) {
            good_matches.push_back(knn_matches[i][0]);
        }
    }
    // 绘制匹配结果
    cv::Mat matchImage;
    cv::drawMatches(gray1, keypoints1, gray2, keypoints2, good_matches, matchImage,cv::Scalar::all(-1),cv::Scalar::all(-1),std::vector<char>(),cv::DrawMatchesFlags::NOT_DRAW_SINGLE_POINTS);
    std::cout << "SIFT feature matching completed. " << good_matches.size() << " matches found." << std::endl;*/
    //试试knn-nndr,目前看来很好
    cv::Ptr<cv::DescriptorMatcher> matcher = cv::DescriptorMatcher::create(cv::DescriptorMatcher::FLANNBASED);
    std::vector<std::vector<cv::DMatch> > knn_matches;
    const float ratio_thresh = 0.7f;
    std::vector<cv::DMatch> good_matches;
    matcher->knnMatch( descriptors1, descriptors2, knn_matches, 2);
    for (auto & knn_matche : knn_matches) {
        if (knn_matche[0].distance < ratio_thresh * knn_matche[1].distance) {
            good_matches.push_back(knn_matche[0]);
        }
    }
    cv::Mat matchImage;
    cv::drawMatches(blurred1, keypoints1, blurred2, keypoints2, good_matches, matchImage,cv::Scalar::all(-1),cv::Scalar::all(-1),std::vector<char>(),cv::DrawMatchesFlags::NOT_DRAW_SINGLE_POINTS);
    //再试试ransac
    /*
    std::vector<cv::DMatch> matches;
    cv::Ptr<cv::DescriptorMatcher> matcher = cv::DescriptorMatcher::create("BruteForce-Hamming");
    matcher->match(descriptors1, descriptors2, matches);
    std::vector<cv::Point2f> points1, points2;
    for (size_t i = 0; i < matches.size(); ++i) {
        points1.push_back(keypoints1[matches[i].queryIdx].pt);
        points2.push_back(keypoints2[matches[i].trainIdx].pt);
    }

    std::vector<uchar> inliersMask;
    cv::Mat homography = cv::findHomography(points1, points2, cv::RANSAC, 3.0, inliersMask);

    // 绘制内点匹配
    std::vector<cv::DMatch> inliers;
    for (size_t i = 0; i < inliersMask.size(); ++i) {
        if (inliersMask[i])
            inliers.push_back(matches[i]);
    }

    cv::Mat matchImage;
    cv::drawMatches(gray1, keypoints1, gray2, keypoints2, inliers, matchImage);*/

    //有匹配的输出
    std::cout << "SIFT feature matching completed. " << good_matches.size() << " matches found." << std::endl;
    x=0;
    
    //下面是画框了，思路是用单适应矩阵将原图的边框映射到目标图
    std::vector<cv::Point2f> points1;
    std::vector<cv::Point2f> points2; 
    int t;
    if(good_matches.size()>=t){x=1;
    for (size_t i = 0; i < good_matches.size(); i++) {
        points1.push_back(keypoints1[good_matches[i].queryIdx].pt);
        points2.push_back(keypoints2[good_matches[i].trainIdx].pt);
    }
    cv::Mat H=cv::findHomography(points1,points2, cv::RANSAC);
    //检查H正确性
    if (H.cols != 3 || H.rows != 3) {
    std::cout << "Error" << std::endl;
    //跳出函数
    outputImage=matchImage;
    return;            }
    std::vector<cv::Point2f> target_points(4);
    std::vector<cv::Point2f> match_points(4);
    /*cv::Mat edges;
    cv::Canny(matchImage, edges, 50, 150);
    // 寻找轮廓
    std::vector<std::vector<cv::Point>> contours;
    cv::findContours(edges, contours, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_SIMPLE);
    // 寻找包含四个顶点的轮廓并提取顶点坐标
    std::vector<cv::Point2f> approx;
    for (const auto& contour : contours) {
        // 近似多边形拟合
        cv::approxPolyDP(contour, approx, cv::arcLength(contour, true) * 0.02, true);

        // 如果轮廓是四边形，则进行后续处理
        if (approx.size() == 4 && cv::isContourConvex(approx)) {
            // 提取顶点坐标
            for (int i = 0; i < 4; i++) {
                target_points[i] = approx[i];
            }
        }}*/
    target_points[0]=cv::Point2f(0, 0);
    target_points[1]=cv::Point2f(float(image1.cols), 0);
    target_points[2]=cv::Point2f(float(image1.cols), float(image1.rows));
    target_points[3]=cv::Point2f(0, float(image1.rows));
    cv::perspectiveTransform(target_points, match_points, H);
    
    //画线
    cv::line(matchImage, match_points[0] + cv::Point2f((float)image1.cols, 0),match_points[1] + cv::Point2f((float)image1.cols, 0), cv::Scalar(0, 255, 0), 4);
    cv::line(matchImage, match_points[1] + cv::Point2f((float)image1.cols, 0),match_points[2] + cv::Point2f((float)image1.cols, 0), cv::Scalar(0, 255, 0), 4);
    cv::line(matchImage, match_points[2] + cv::Point2f((float)image1.cols, 0),match_points[3] + cv::Point2f((float)image1.cols, 0), cv::Scalar(0, 255, 0), 4);
    cv::line(matchImage, match_points[3] + cv::Point2f((float)image1.cols, 0),match_points[0] + cv::Point2f((float)image1.cols, 0), cv::Scalar(0, 255, 0), 4);}
    outputImage=matchImage;
    
    
    }



    
