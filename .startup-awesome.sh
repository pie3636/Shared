# Keyboard
setxkbmap -option compose:rctrl fr-latin9&
numlockx&

# Bumblebee/Optimus
# systemctl start bumblebeed.service

# Wi-Fi preparation
ip link set wlp2s0 up

# WM, graphic commands are in rc.lua
exec awesome > ~/.xsession.log 2>&1
