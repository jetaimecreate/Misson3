# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zqm/识别

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zqm/识别/build

# Include any dependencies generated for this target.
include CMakeFiles/TrafficSignDetection.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/TrafficSignDetection.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/TrafficSignDetection.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/TrafficSignDetection.dir/flags.make

CMakeFiles/TrafficSignDetection.dir/src/main.cpp.o: CMakeFiles/TrafficSignDetection.dir/flags.make
CMakeFiles/TrafficSignDetection.dir/src/main.cpp.o: ../src/main.cpp
CMakeFiles/TrafficSignDetection.dir/src/main.cpp.o: CMakeFiles/TrafficSignDetection.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zqm/识别/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/TrafficSignDetection.dir/src/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TrafficSignDetection.dir/src/main.cpp.o -MF CMakeFiles/TrafficSignDetection.dir/src/main.cpp.o.d -o CMakeFiles/TrafficSignDetection.dir/src/main.cpp.o -c /home/zqm/识别/src/main.cpp

CMakeFiles/TrafficSignDetection.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TrafficSignDetection.dir/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zqm/识别/src/main.cpp > CMakeFiles/TrafficSignDetection.dir/src/main.cpp.i

CMakeFiles/TrafficSignDetection.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TrafficSignDetection.dir/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zqm/识别/src/main.cpp -o CMakeFiles/TrafficSignDetection.dir/src/main.cpp.s

CMakeFiles/TrafficSignDetection.dir/src/shibie.cpp.o: CMakeFiles/TrafficSignDetection.dir/flags.make
CMakeFiles/TrafficSignDetection.dir/src/shibie.cpp.o: ../src/shibie.cpp
CMakeFiles/TrafficSignDetection.dir/src/shibie.cpp.o: CMakeFiles/TrafficSignDetection.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zqm/识别/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/TrafficSignDetection.dir/src/shibie.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TrafficSignDetection.dir/src/shibie.cpp.o -MF CMakeFiles/TrafficSignDetection.dir/src/shibie.cpp.o.d -o CMakeFiles/TrafficSignDetection.dir/src/shibie.cpp.o -c /home/zqm/识别/src/shibie.cpp

CMakeFiles/TrafficSignDetection.dir/src/shibie.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TrafficSignDetection.dir/src/shibie.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zqm/识别/src/shibie.cpp > CMakeFiles/TrafficSignDetection.dir/src/shibie.cpp.i

CMakeFiles/TrafficSignDetection.dir/src/shibie.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TrafficSignDetection.dir/src/shibie.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zqm/识别/src/shibie.cpp -o CMakeFiles/TrafficSignDetection.dir/src/shibie.cpp.s

# Object files for target TrafficSignDetection
TrafficSignDetection_OBJECTS = \
"CMakeFiles/TrafficSignDetection.dir/src/main.cpp.o" \
"CMakeFiles/TrafficSignDetection.dir/src/shibie.cpp.o"

# External object files for target TrafficSignDetection
TrafficSignDetection_EXTERNAL_OBJECTS =

TrafficSignDetection: CMakeFiles/TrafficSignDetection.dir/src/main.cpp.o
TrafficSignDetection: CMakeFiles/TrafficSignDetection.dir/src/shibie.cpp.o
TrafficSignDetection: CMakeFiles/TrafficSignDetection.dir/build.make
TrafficSignDetection: /usr/local/lib/libopencv_gapi.so.4.10.0
TrafficSignDetection: /usr/local/lib/libopencv_highgui.so.4.10.0
TrafficSignDetection: /usr/local/lib/libopencv_ml.so.4.10.0
TrafficSignDetection: /usr/local/lib/libopencv_objdetect.so.4.10.0
TrafficSignDetection: /usr/local/lib/libopencv_photo.so.4.10.0
TrafficSignDetection: /usr/local/lib/libopencv_stitching.so.4.10.0
TrafficSignDetection: /usr/local/lib/libopencv_video.so.4.10.0
TrafficSignDetection: /usr/local/lib/libopencv_videoio.so.4.10.0
TrafficSignDetection: /usr/local/lib/libopencv_imgcodecs.so.4.10.0
TrafficSignDetection: /usr/local/lib/libopencv_dnn.so.4.10.0
TrafficSignDetection: /usr/local/lib/libopencv_calib3d.so.4.10.0
TrafficSignDetection: /usr/local/lib/libopencv_features2d.so.4.10.0
TrafficSignDetection: /usr/local/lib/libopencv_flann.so.4.10.0
TrafficSignDetection: /usr/local/lib/libopencv_imgproc.so.4.10.0
TrafficSignDetection: /usr/local/lib/libopencv_core.so.4.10.0
TrafficSignDetection: CMakeFiles/TrafficSignDetection.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zqm/识别/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable TrafficSignDetection"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TrafficSignDetection.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/TrafficSignDetection.dir/build: TrafficSignDetection
.PHONY : CMakeFiles/TrafficSignDetection.dir/build

CMakeFiles/TrafficSignDetection.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/TrafficSignDetection.dir/cmake_clean.cmake
.PHONY : CMakeFiles/TrafficSignDetection.dir/clean

CMakeFiles/TrafficSignDetection.dir/depend:
	cd /home/zqm/识别/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zqm/识别 /home/zqm/识别 /home/zqm/识别/build /home/zqm/识别/build /home/zqm/识别/build/CMakeFiles/TrafficSignDetection.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/TrafficSignDetection.dir/depend

