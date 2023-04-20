#!/bin/bash

# Workspace customization script
set -e

cd /home/husarion/ros_ws
git clone https://github.com/husarion/panther_ros.git src/panther_ros
vcs import src < src/panther_ros/panther/panther.repos

# Installation of dependencies
rosdep init 
rosdep update --rosdistro $ROS_DISTRO
rosdep install --from-paths src -y -i

# Build pkgs
source /opt/ros/$ROS_DISTRO/setup.bash
catkin_make -DCATKIN_ENABLE_TESTING=0 -DCMAKE_BUILD_TYPE=Release

echo "source /home/husarion/ros_ws/devel/setup.bash" >> /home/husarion/.bashrc