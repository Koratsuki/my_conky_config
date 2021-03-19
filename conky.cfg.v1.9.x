#=======================================================================
#                         Conky Display Settings
# Date    : 08/18/2020
# Author  : Koratsuki
# Version : 0.8.8
# License : Distributed under the terms of GNU GPL version 2 or later
# Based on: Smooth_Conky style by fabtk
# Status  : Work in progress
#
# Facebook: https://www.faceboook.com/Koratsuki
# Twitter : https://twitter.com/koratsuki84
# Gmail   : koratsuki.nijuusan@gmail.com
# Requires: hddtemp,lm-sensors,lsb-release
# Install : apt install conky-all hddtemp lm-sensors lsb-release
# Remember to dpkg-reconfigure hddtemp to measure HDD temp
# Updated: Some new icons, and minor fixes.
#=======================================================================

own_window_class Conky
own_window yes
own_window_argb_visual yes
own_window_argb_value 180
own_window_transparent yes
own_window_hints undecorated,below,sticky,skip_taskbar,skip_pager

background yes
use_xft yes
xftfont DejaVu Sans:size=8
xftalpha 0.8
update_interval 0.5
total_run_times 0
double_buffer yes

draw_shades no
draw_outline no
draw_borders no
draw_graph_borders no
border_width 1

default_color cccccc

alignment top_right
gap_x 5
gap_y 30

no_buffers yes
uppercase no

cpu_avg_samples 2
net_avg_samples 2

override_utf8_locale yes
use_spacer none
show_graph_scale no
show_graph_range no
text_buffer_size 1024

short_units yes
pad_percents 2

alignment top_right
gap_x 30
gap_y 45
minimum_size 240 800
maximum_width 230



### Conky Output

TEXT
SYSTEM ${hr 2}
${voffset 8}${font OpenLogos:size=20}${color FFFFFF}J${color}${font} ${voffset -6}User:  ${alignr 20}${exec users | cut -d " " -f1}@${nodename}
${voffset 3}       Release: ${alignr 20}${execi 60 lsb_release -r -s} [${execi 60 lsb_release -c -s}]
${voffset 3}       Kernel:  ${alignr 20}${kernel}
${voffset 3}       Arch:  ${alignr 20}${machine}
${voffset 3}       CPU: ${alignr 20}${execi 1000 cat /proc/cpuinfo | grep 'model name' | cut -c 14-42 | uniq}
${voffset 8}${font conkycolors:size=14}${color FFFFFF}e${color}${font}  ${voffset -5}CPU0: ${cpu cpu0}% ${alignr}${color CCCCCC}${cpubar cpu0 8,60}${color}
${voffset 8}${font conkycolors:size=14}${color FFFFFF}e${color}${font}  ${voffset -5}CPU1: ${cpu cpu1}% ${alignr}${color CCCCCC}${cpubar cpu1 8,60}${color}
${voffset 8}${font conkycolors:size=14}${color FFFFFF}e${color}${font}  ${voffset -5}CPU2: ${cpu cpu2}% ${alignr}${color CCCCCC}${cpubar cpu2 8,60}${color}
${voffset 8}${font conkycolors:size=14}${color FFFFFF}e${color}${font}  ${voffset -5}CPU3: ${cpu cpu3}% ${alignr}${color CCCCCC}${cpubar cpu3 8,60}${color}
${goto 6}${voffset 5}${color FFFFFF}${font conkycolors:size=14}d${color}${font}${voffset -5}${goto 32}Frequency: ${alignr}${freq_g (1)} GHz
${goto 6}${voffset 8}${font conkycolors:size=14}${color FFFFFF}8${color}${font}${voffset -5}${goto 32}Temperature:${alignr}${color #CCCCCC}\
${execi 30 sensors | grep 'Core ' | awk '{total += $3; count++} END {print total/count}' | sed 's/+//' | sed 's/\.0//g'} °C$color
${voffset 5}${font conkycolors:size=14}${color FFFFFF}g${color}${font}  ${voffset -5}RAM: $mem [$memperc%] ${alignr}${color CCCCCC}${membar 8,60}${color}
${voffset 5}${font conkycolors:size=14}${color FFFFFF}z${color}${font}  ${voffset -5}SWAP: $swapperc% ${alignr}${color CCCCCC}${swapbar 8,60}${color}
${voffset 5}${font conkycolors:size=14}${color FFFFFF}o${font}${voffset -6}${goto 32}${color CCCCCC}Uptime: ${alignr}${uptime}

DATE ${hr 2}
${font}${voffset 1}${color2}${goto 40}${font Aller:size=36}${time %I}${font Aller:size=22}${voffset -25}'${time %M}${font Aller:size=8}${voffset -12}${time %S}
${color2}${goto 130}${voffset 10}${font Aller:size=10}${time %A}
${color2}${goto 130}${voffset 1}${font Aller:size=10}${time %x}
DISCS ${hr 2}
${voffset 8}${font Poky:size=14}${color FFFFFF}y${color}${font}${offset 6}${voffset -7}Root: ${font Liberation Sans:size=8}${color CCCCCC}${fs_used_perc /}%${font}${color}
${color FFFFFF}${voffset 2}${fs_bar 4,20 /}${offset 8}${voffset -2}${color}Free: ${fs_free /}${alignr}Used: ${fs_used /}
${voffset 8}${font Poky:size=14}${color FFFFFF}y${color}${font}${offset 6}${voffset -7}Home: ${font Liberation Sans:size=8}${color CCCCCC}${fs_used_perc /home}%${font}${color}
${color FFFFFF}${voffset 2}${fs_bar 4,20 /home}${offset 8}${voffset -2}${color}Free: ${fs_free /home}${alignr}Used: ${fs_used /home}
${voffset 4}${font conkycolors:size=14}${color FFFFFF}l${color}${font}${voffset -6}${goto 32}I/O: ${diskio}
${voffset 8} ${font Weather:size=17}${color FFFFFF}yz${color}${font}   ${voffset -4}Temperature: ${color CCCCCC}${hddtemp /dev/sda}°C${color}${alignr}/dev/sda
${voffset 8} ${color FFFFFF}${font Weather:size=17}yz${font}${color}   ${voffset -4}Temperature: ${color CCCCCC}${hddtemp /dev/sdb}°C${color}${alignr}/dev/sdb

NETWORKING ${hr 2}
${if_existing /proc/net/route eth0}
${voffset 2}${color FFFFFF}${voffset -6}${font PizzaDude Bullets:size=13}${color cccccc}O${color}${font}   ${voffset -2}Up: ${upspeed eth0} ${alignr}${color 7B9494}${upspeedgraph eth0 8,60}${color}
${voffset 2}${color FFFFFF}${voffset 4}${font PizzaDude Bullets:size=13}${color cccccc}U${color}${font}   ${voffset -2}Down: ${downspeed eth0} ${alignr}${color 7B9494}${downspeedgraph eth0 8,60}${color}
${voffset 2}${color FFFFFF}${voffset 4}${font PizzaDude Bullets:size=13}${color cccccc}N${color}${font}   ${voffset -2}Upload: ${alignr}${totalup eth0}
${voffset 2}${color FFFFFF}${voffset 4}${font PizzaDude Bullets:size=13}${color cccccc}T${color}${font}   ${voffset -2}Download: ${alignr}${totaldown eth0}
${voffset 2}${color FFFFFF}${voffset 4}${font PizzaDude Bullets:size=13}${color cccccc}a${color}${font}   ${voffset -2}Local Ip: ${alignr}${addr eth0}
${endif}${if_existing /proc/net/route wlan0}
${voffset 2}${color FFFFFF}${voffset -6}${font PizzaDude Bullets:size=13}O${color}${font}   ${voffset -2}Up: ${upspeed wlan0} ${alignr}${color 7B9494}${upspeedgraph wlan0 8,60}${color}
${voffset 2}${color FFFFFF}${voffset 4}${font PizzaDude Bullets:size=13}U${color}${font}   ${voffset -2}Down: ${downspeed wlan0} ${alignr}${color 7B9494}${downspeedgraph wlan0 8,60}${color}
${voffset 2}${color FFFFFF}${voffset 4}${font PizzaDude Bullets:size=13}N${color}${font}   ${voffset -2}Upload: ${alignr}${totalup wlan0}
${voffset 2}${color FFFFFF}${voffset 4}${font PizzaDude Bullets:size=13}T${color}${font}   ${voffset -2}Download: ${alignr}${totaldown wlan0}
${voffset 2}${color FFFFFF}${voffset 4}${font conkycolors:size=13}k${color}${font}   ${voffset -2}Signal: ${wireless_link_qual wlan0}% ${alignr}${wireless_link_bar 8,60 wlan0}
${voffset 2}${font conkycolors:size=13}A${font}${goto 32}${voffset -4}Local IP: ${alignr}${addr wlan0}
${endif}${if_existing /proc/net/route ppp0}
${voffset 2}${color FFFFFF}${voffset -6}${font PizzaDude Bullets:size=13}O${color}${font}   ${voffset -2}Up: ${upspeed ppp0} ${alignr}${color 7B9494}${upspeedgraph ppp0 8,60}${color}
${voffset 2}${color FFFFFF}${voffset 4}${font PizzaDude Bullets:size=13}U${color}${font}   ${voffset -2}Down: ${downspeed ppp0} ${alignr}${color 7B9494}${downspeedgraph ppp0 8,60}${color}
${voffset 2}${color FFFFFF}${voffset 4}${font PizzaDude Bullets:size=13}N${color}${font}   ${voffset -2}Upload: ${alignr}${totalup ppp0}
${voffset 2}${color FFFFFF}${voffset 4}${font PizzaDude Bullets:size=13}T${color}${font}   ${voffset -2}Download: ${alignr}${totaldown ppp0}
${voffset 2}${color FFFFFF}${voffset 4}${font PizzaDude Bullets:size=13}a${color}${font}   ${voffset -2}Local Ip: ${alignr}${addr ppp0}
${endif}





