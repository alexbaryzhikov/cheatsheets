Ubuntu system setup after fresh installation
============================================

## Change paths to user folders
    ~/.config/user-dirs.dirs


## (Ubuntu 16) Disable mouse acceleration
    $ sudo gedit /usr/share/X11/xorg.conf.d/90-mouse.conf

```
Section "InputClass"
    Identifier "mouse"
    MatchIsPointer "on"
    Option "AccelerationProfile" "-1"
    Option "AccelerationScheme" "none"
EndSection
```


## Hide Amazon
    $ cp /usr/share/applications/ubuntu-amazon-default.desktop ~/.local/share/applications/
    Add "Hidden=true" to the end of the file.


## Disable network Avahi-daemon notification
    $ sudo nano /etc/default/avahi-daemon
    Add this line (or change it if already exists to):
    AVAHI_DAEMON_DETECT_LOCAL=0


## Add gnome-system-monitor hotkey
    System Settings > Keyboard > Shortcuts > Custom Shortcuts > add 'gnome-system-monitor'


## Unity/Gnome Tweak Tool
    $ sudo apt install unity-tweak-tool         # 16.04
    $ sudo apt install gnome-tweak-tool         # 18.04


## Gnome Extensions
Extensions are configured in Tweaks/Extensions.

    $ sudo apt install chrome-gnome-shell	# For Firefox gnome extensions plugin

    Dash to Dock
    Hide activities button
    No title bar
    User themes


## Themes and icons
    $ sudo add-apt-repository ppa:noobslab/themes   # Arc theme
    $ sudo add-apt-repository ppa:snwh/ppa          # Paper icons
    $ sudo apt update
    $ sudo apt install arc-theme
    $ sudo apt install paper-icon-theme


## Cursors
<https://www.gnome-look.org/browse/cat/107/>


## Wallpaper
    /usr/share/backgrounds  # copy image here
    /usr/share/gnome-background-properties/xenial-wallpapers.xml  # edit


## Terminal prompt
    Edit ~/.bashrc
```
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\w\$ '
fi
```


## Apps
    alsamixer           # Audio mixer (helps fixing mic loopback)
    bmon                # Network monitor
    brasero             # DVD burner
    chrome
    firefox
    dosbox
    dropbox
    htop                # Better than top
    keepass2
    mc
    OBS
    openssh-client
    openssh-server
    remmina             # Remote desktop manager
    telegram
    woeusb              # Creating Windows USB from a disk image


## Dev tools
    git
    hexedit             # Hex editor
    openjdk-8-jdk       # java SDK
    perf                # Performance analysis tools
    valgrind            # Tools for debugging and profiling


## IDEs
    Android Studio
    intelliJ IDEA
    PyCharm
    Atom
    Sublime Text


## Tensorflow + Keras
    cuda                # CUDA toolkit
    cudnn               # cuDNN library
    tensorflow          
    keras
    
