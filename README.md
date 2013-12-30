slack-mining
============

Additional packages for scrypt mining in Slackware Linux 14.1 (x86_64)

* cgminer 3.7.2 was compiled with scrypt, opencl and adl support; Using amd-app-sdk 2.8 and adl-sdk 6.0.

* fglrx was built using amd-catalyst-13.11-beta-v9.4

You will need to reboot the system for it to make use of the new drivers. Before doing so you need to edit /etc/modprobe.d/blacklist.conf (or create a new file: /etc/modprobe.d/radeon_blacklist.conf) and add the following lines to the file:

    blacklist radeon
    blacklist radeonhd

Next you can create a new X.Org configuration file by running (as root):

    aticonfig --initial --adapter=all -f

If there were no errors and the driver was installed successfully, you should reboot now for the drivers to be used.

Note: A new xorg.conf will need to be made everytime GPU's are added/removed/moved to differnt pci-e slots.
It's also a good idea to delete/backup the existing xorg.conf before 
generating a new one (/etc/X11/xorg.conf)

Booting issues:

The slack installer or slack itself may not boot when certian cards are plugged in. I found this to be the case with my R9 280x's. Taking them out, blacklisting the stock radeon drivers and installing catalyst resolves this issue. Put them back in once everything is set up and create a new xorg.conf with aticonfig. 

You may also have to disable IOMMU in your bios to boot successfully with the cards in. (depends on card) 

