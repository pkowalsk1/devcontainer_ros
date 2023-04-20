FROM ghcr.io/open-rmf/rmf/rmf_demos:latest

ARG USERNAME=husarion

# Create a new user
RUN useradd -ms /bin/bash ${USERNAME} && \
    echo "$USERNAME:$USERNAME" | chpasswd && \
    adduser ${USERNAME} sudo && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${USERNAME}

RUN pip3 install \
        nudged \
        black && \
    echo "source /opt/ros/${ROS_DISTRO}/setup.bash && source /rmf_demos_ws/install/setup.bash" >> /home/$USERNAME/.bashrc