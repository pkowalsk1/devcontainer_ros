#!/bin/bash

# Workspace customization script
set -e

BUILD_TYPE=RelWithDebInfo

cd /home/husarion/ros2_ws
git clone -b ros2 https://github.com/husarion/ros_components_description.git src/ros_components_description 
git clone https://github.com/husarion/rosbot_xl_ros.git src/rosbot_xl_ros
mv src/rosbot_xl_ros/rosbot_xl_description src/rosbot_xl_description
rm -rf src/rosbot_xl_ros

# Installation of dependencies
sudo apt update 
sudo rosdep update 
sudo rosdep install --from-paths src --ignore-src -y --rosdistro humble

# Build pkgs
source /opt/ros/humble/setup.bash
source /rmf_demos_ws/install/setup.bash

colcon build \
    --merge-install \
    --symlink-install \
    --cmake-args "-DCMAKE_BUILD_TYPE=$BUILD_TYPE" \
    -Wall -Wextra -Wpedantic

echo "source /home/husarion/ros2_ws/install/setup.bash" >> /home/husarion/.bashrc