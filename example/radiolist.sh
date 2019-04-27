#!/bin/sh

whiptail \
  --backtitle Backtitle \
  --title Title \
  --radiolist "$1" 0 0 0 1 2 off 1 2 on
