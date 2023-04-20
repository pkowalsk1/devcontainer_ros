FROM osrf/ros:noetic-desktop

ARG USERNAME=husarion

ENV HUSARION_ROS_BUILD_TYPE=simulation

# Create a new user
RUN useradd -ms /bin/bash ${USERNAME} && \
    echo "$USERNAME:$USERNAME" | chpasswd && \
    adduser ${USERNAME} sudo && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    mkdir -p /home/${USERNAME}/ros_ws/src && \
    chown -R ${USERNAME} /home/${USERNAME}/ros_ws

RUN apt update && apt dist-upgrade -y && \
    apt install -y \
        build-essential \
        cmake \
        git \
        libbullet-dev \
        python3-catkin-tools \
        python3-dev \
        python3-flake8 \
        python3-pip \
        python3-pytest-cov \
        python3-rosdep \
        python3-setuptools \
        python3-vcstool \
        iproute2 \
        wget \
        clang-format \
        ros-$ROS_DISTRO-plotjuggler-ros && \
    python3 -m pip install -U \
        rosdep \
        psutil \
        vcstool \
        argcomplete \
        pytest-repeat \
        pytest-rerunfailures \
        pytest \
        black && \
    echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> /home/$USERNAME/.bashrc

USER ${USERNAME}