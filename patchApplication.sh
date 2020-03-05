#!/bin/bash
# Applies application patches for librealsense2 on a Jetson TX2 Developer Kit
INSTALL_DIR=$PWD
echo "${green}Applying Model-Views Patch${reset}"
# The render loop of the post processing does not yield; add a sleep
patch -d ~/libreaslense -p1 -i $INSTALL_DIR/patches/model-views.patch

echo "${green}Applying Incomplete Frames Patch${reset}"
# The Jetson tends to return incomplete frames at high frame rates; suppress error logging
patch -d ~/librealsense -p1 -i $INSTALL_DIR/patches/incomplete-frame.patch
