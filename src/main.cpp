#include "head.h"
#include <opencv2/opencv.hpp>
int x=0;
int main() {
	std::string input_folder = "/home/zqm/识别/dataset_任务三/archive";  // 输入图片所在文件夹路径
	std::string output_folder = "/home/zqm/识别/dataset_任务三/output";  // 输出结果保存文件夹路径
	std::string template_path = "/home/zqm/识别/dataset_任务三/template";  // 模板图片路径
	std::vector<cv::String> filenames_input, filenames_template;
	cv::glob(input_folder, filenames_input);
	cv::glob(template_path, filenames_template);
	for (size_t i = 0; i <filenames_template.size(); ++i){
		for (size_t j = 0; j <filenames_input.size(); ++j){
		// 读取两个图像
		cv::Mat image1 = cv::imread(filenames_template[i]);
		cv::Mat image2 = cv::imread(filenames_input[j]);
        //1是样例
        cv::Mat outputImage;
        detect(image1, image2,outputImage,x,i);
		if(x==1){
		// 保存结果图像
		std::string output_name = "output" + std::to_string(i)+std::to_string(j)  + ".jpg";
		std::string output_path = output_folder + "/" + output_name;
 
		// 保存结果图像到指定文件夹
		cv::imwrite(output_path, outputImage);}
		else{std::cout<<"no"<<std::endl;}
		}
	
 }
	
	cv::waitKey(0);
	return 0;
}
//初版想法使用了brute force匹配器，效果不好。故使用flann
