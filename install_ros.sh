#!/bin/bash

# Set up ROS Noetic repository
echo "Setting up ROS Noetic repository..."
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Set up the ROS keys
echo "Setting up ROS keys..."
sudo apt install -y curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# Update package list
echo "Updating package list..."
sudo apt update

# Install ROS Noetic Desktop Full
echo "Installing ROS Noetic Desktop Full..."
sudo apt install -y ros-noetic-desktop-full

# Install dependencies for ROS
echo "Installing ROS dependencies..."
sudo apt install -y python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential

# Initialize rosdep
echo "Initializing rosdep..."
sudo rosdep init
rosdep update

# Setup ROS environment variables
echo "Setting up ROS environment variables..."
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Install additional dependencies (optional)
echo "Installing additional dependencies for ROS Noetic..."
sudo apt install -y python-rosdep

echo "ROS Noetic installation complete."
