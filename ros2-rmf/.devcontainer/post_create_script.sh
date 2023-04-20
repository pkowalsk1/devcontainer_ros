#!/bin/bash
set -e

BUILD_TYPE=RelWithDebInfo

mkdir /home/husarion/ws_for_build
ln -s /home/husarion/ros2_ws/src /home/husarion/ws_for_build/src
cd /home/husarion/ws_for_build

if [ ! -d src/ros_components_description ]; then 
    git clone -b ros2 https://github.com/husarion/ros_components_description.git src/ros_components_description
fi

if [ ! -d src/rosbot_xl_description ]; then 
    git clone https://github.com/husarion/rosbot_xl_ros.git src/rosbot_xl_ros
    mv src/rosbot_xl_ros/rosbot_xl_description src/rosbot_xl_description
fi

if [ -d src/rosbot_xl_ros ]; then 
    rm -rf src/rosbot_xl_ros
fi

sudo apt update 
sudo rosdep update 
sudo rosdep install --from-paths src --ignore-src -y --rosdistro humble

source /opt/ros/humble/setup.bash
source /rmf_demos_ws/install/setup.bash

colcon build \
    --merge-install \
    --symlink-install \
    --cmake-args "-DCMAKE_BUILD_TYPE=$BUILD_TYPE" \
    -Wall -Wextra -Wpedantic

echo "source /home/husarion/ws_for_build/install/setup.bash" >> /home/husarion/.bashrc