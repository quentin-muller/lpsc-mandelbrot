#!/bin/sh

##################################################################################
#                                 _             _
#                                | |_  ___ _ __(_)__ _
#                                | ' \/ -_) '_ \ / _` |
#                                |_||_\___| .__/_\__,_|
#                                         |_|
#
##################################################################################
#
# Company: hepia
# Author: Joachim Schmidt <joachim.schmidt@hesge.ch
#
# Project Name: lpsc_mandelbrot_firmware
# Target Device: digilentinc.com:nexys_video:part0:1.1 xc7a200tsbg484-1
# Tool version: 2021.2
# Description: Cleanup Vitis SDK workspace directory
#
# Last update: 2022-04-12 12:06:07
#
##################################################################################

echo "> Cleanup SDK workspace directory..."

PRJ_DIR=..

# Clean current directory
rm -rf ./xrc.log/ 2> /dev/null
rm -rf ./.Xil/ 2> /dev/null

# Remove generated workspace directory
rm -rf ${PRJ_DIR}/sdk_workspace/ 2> /dev/null
rm -rf ${PRJ_DIR}/vitis_workspace/ 2> /dev/null

echo "> Done"
