My current Conky config
==

[Preview](images/preview.png "Preview")

<img src="images/preview.png">


** Author**: *Koratsuki*

**Twitter**: *https://twitter.com/Koratsuki84*

**Version**: *1.11.6*

**License**: *Distributed under the terms of GNU GPL version 2 or later*

**Based on**: [Smooth_Conky style by fabtk](https://www.deviantart.com/fabtk/art/smooth-conky-style-157104223)

**Status**: *Work in progress*

**Updated**: *Some new icons, and minor fixes.*

## How to use this:

### Requirements

**Requires**: hddtemp, lm-sensors and lsb-release

**Install**: ```# apt install conky-all hddtemp lm-sensors lsb-release```

### And what now?

For example: Clone this repo, put it on your home folder under any name, **.conky**, and fonts folder in **.fonts** folder under your home. You will need to compile your font cache. Run:

```# fc-cache -f```

And call the config file with:

```# conky -c /home/$USER/.conky/conky.cfg```

Put that line on system start, and you're done!

## Notes

*Note 1: Remember to dpkg-reconfigure hddtemp to measure HDD temp and enable start on boot*

*Note 2: Since Conky 1.10.x, configuration files have been written with a new Lua syntax. I provide both config file if needed.*

*Note 3: I use Devuan, and Devuan uses old style networking interfaces names, so, you might change wlan0 and eth0 for wlp5s0 and enp0s1. Thanks systemd/udev.*

Read this:

[Network interfaces renaming](https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/)

Regards! 
