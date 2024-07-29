# CMakeLists.txt

cmake_minimum_required(VERSION 3.10)
project(TrafficSignDetection)

find_package(OpenCV REQUIRED)

include_directories(${OpenCV_INCLUDE_DIRS} include)

add_executable(TrafficSignDetection src/main.cpp src/shibie.cpp)

target_link_libraries(TrafficSignDetection ${OpenCV_LIBS})