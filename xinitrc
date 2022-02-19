#!/bin/bash 
# flameshot
flameshot &
# alpha
picom &
# about the number lock
numlockx &
# for emacs
# emacs --daemon
# about the wallpaper
while habak -ms -hi ~/Pictures/wallpaper
do
sleep 600   #让habak每隔10分钟随机切换一张屏幕壁纸
done &
# for pycharm
export _JAVA_AWT_WM_NONREPARENTING=1
#wmname compiz				   
# for own dwm
slstatus &
#exec xsettingsd &
# for the touch pane
xinput disable $(xinput list | awk '/Touchpad/{for(i=1;i<=NF;i++)if($i~/^id/){gsub("id=", "", $i);print $i}}') &
# set a variable
export DWM=dwm
# for volume
pulseaudio --start &
# make the volume can be used
amixer set Master unmute
amixer set Speaker unmute
# set for light
xbacklight set 70
# for dunst
dunst &
# lock
xscreensaver &
# dwm
if [[ -f "~/dwm.log" ]]
then
	rm -f ~/dwm.log
fi
exec dwm 2< dwm.log


