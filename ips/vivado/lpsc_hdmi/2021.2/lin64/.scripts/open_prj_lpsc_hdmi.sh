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
# Project Name: lpsc_hdmi
# Target Device: digilentinc.com:nexys_video:part0:1.1 xc7a200tsbg484-1
# Tool version: 2021.2
# Description: Open Vivado project GUI
#
# Last update: 2022-02-28 09:16:58
#
##################################################################################

echo "> Open Vivado GUI..."
vivado -nojournal -nolog -notrace ../lpsc_hdmi/lpsc_hdmi.xpr
