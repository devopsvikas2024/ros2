# Use the official ROS 2 base image
FROM ros:foxy

# Copy the ROS 2 workspace into the container
COPY ./ros2_ws /ros2_ws

# Set the working directory
WORKDIR /ros2_ws

# Install dependencies
RUN apt-get update && rosdep install --from-paths src --ignore-src -r -y

# Build the ROS 2 packages
RUN colcon build

# Source the ROS 2 workspace
RUN echo "source /ros2_ws/install/setup.bash" >> /root/.bashrc

# Entry point for running ROS 2 commands
CMD ["bash"]
