FROM ghcr.io/open-rmf/rmf/rmf_demos:latest

ARG USERNAME=husarion

# Create a new user
RUN useradd -ms /bin/bash ${USERNAME} && \
    echo "$USERNAME:$USERNAME" | chpasswd && \
    adduser ${USERNAME} sudo && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    mkdir -p /home/${USERNAME}/ros2_ws/src && \
    chown -R ${USERNAME} /home/${USERNAME}/ros2_ws

RUN apt update && apt install -y \
        ros-$ROS_DISTRO-plotjuggler-ros && \
    pip3 install \
        nudged \
        black && \
    echo "source /opt/ros/${ROS_DISTRO}/setup.bash && source /rmf_demos_ws/install/setup.bash" >> /home/$USERNAME/.bashrc    

USER ${USERNAME}

