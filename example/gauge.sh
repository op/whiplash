#!/bin/sh

exec whiptail \
  --backtitle Backtitle \
  --title Title \
  --gauge "$1" 0 0 40
