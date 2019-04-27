#!/bin/sh

# TODO
# unused knobs
#   listbox
#   actlistbox
#   label
#   helpline
#   actsellistbox
#   sellistbox

text=`head -n 10240 /usr/share/dict/words | tail -n 64 | tr -d \'s | tr '\n' ' '`

# short text
# whiptail \
#   --backtitle Backtitle \
#   --title Title \
#   --scrolltext \
#   --yesno "text" 15 45

# whiptail \
#   --backtitle Backtitle \
#   --title Title \
#   --scrolltext \
#   --yesno "$text" 20 40

# whiptail \
#   --backtitle Backtitle \
#   --title Title \
#   --scrolltext \
#   --msgbox "$text" 15 45

# TODO: not working
# whiptail \
#   --backtitle Backtitle \
#   --title Title \
#   --scrolltext \
#   --ok-button Ok \
#   --infobox "$text" 15 45 && sleep 1

# whiptail \
#   --backtitle Backtitle \
#   --title Title \
#   --inputbox "$text" 15 45 Nof

# whiptail \
#   --backtitle Backtitle \
#   --title Title \
#   --passwordbox "$text" 15 45 Nof

whiptail \
  --backtitle Backtitle \
  --title Title \
  --checklist "$text" 0 0 0 1 2 3 1 2 3

# whiptail \
#   --backtitle Backtitle \
#   --title Title \
#   --radiolist "$text" 0 0 0 1 2 off 1 2 on

# whiptail \
#   --backtitle Backtitle \
#   --title Title \
#   --gauge "$text" 0 0 40
