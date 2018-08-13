# thelink2012 dotfiles

This repository is managed with [yadm-git](https://github.com/TheLocehiliosan/yadm)<sup>AUR</sup>. Of course, you can just `git clone` it, no big deal.

After cloning, run `yadm bootstrap` or execute `.yadm/bootstrap` manually to do a few more nice steps (e.g. download vim-plug).

As follows are instructions, specially for myself, on how to setup a system capable of using all the dots in here.

## aliases

 - The `getclip` and `putclip` aliases depend on **xclip**.
 - The `getsub` alias needs **subberthehut**<sup>AUR</sup>.

## profile

 - Of course, many variables are set.
 - That includes **$HOST**: This will be used in lots of dots to determine whether some setting should be applied to this machine.
 - Whenever a `~/.pythonenv` directory exists, it'll be sourced as a python virtual environment.
   - Such directory may be created using `python3 -m venv ~/.pythonenv --system-site-packages`.
 - **$GOPATH** is set to `~/.goenv`.
 - **$PATH** is prepended with `~/bin`, `$GOPATH/bin`, `~/.cargo/bin`, and others.

## xinitrc

Every `xinitrc` dependency is optional. The following is a list of packages and its side-effects on X startup:

 - **xorg-xrdb** loads `.Xresources`.
 - **feh** sets the root window background (aka wallpaper).
 - **lemonbar-xft-git**<sup>AUR</sup> creates a bar.
 - **xss-lock-git**<sup>AUR</sup> spawns `~/bin/lock` over time. See its dependencies for more.
 - **xbindkeys** setups many key bindings.
 - **redshift-minimal**<sup>AUR</sup> adjusts the color temperature of the screen according to time and location.

## xbindkeysrc

 - **pulseaudio** is required for the mute and volume media buttons.
 - **playerctl** is required for the play/pause media button.
 - Taking print screens calls `~/bin/takeshot`. See its requirements for details.

## GTK Theme


The following is a prerequisite for most GTK Themes:

```
$ pacman -S gtk-engines gtk-engine-murrine gtk3-print-backends 
```

Then, install **arc-gtk-theme** for the theme, and **super-flat-remix-icon-theme**<sup>AUR</sup> for the icons. For the fonts, **noto-fonts** and **noto-fonts-emoji** are required.

That is all given this repo includes `~/.gtkrc-2.0` and `~/.config/gtk-3.0/`. 

Oh, and remember: The best tool to test themes is **awf-git**<sup>AUR</sup> :)

## ~/bin

Only the most important utilities of this directory will be listed on this README.

### bar

This custom bar depends on **lemonbar-xft-git**<sup>AUR</sup>, **ttf-dejavu** and **ttf-font-awesome**.

### lock

Lock depends on **i3lock**.

### takerec

This takes a recording of the screen and uploads somewhere. It requires **curl**, **xclip**, **ffmpeg** and **libnotify**.

### takeshot

Just like `takerec`, but takes screenshots. Requires **curl**, **xclip**, **imagemagick** and **libnotify**.

### audio-control

Linux audio handling is too complicated. So I made my own controller, which probably only works for me. How nice, eh? Requires **pulseaudio**.

## Intrusive Dotfiles

 - `~/.config/user-dirs.dirs`

## Tools I Like

The following are things I may like to have. They aren't really dependencies of the dotfiles. Some dots, though, may be related to some of these programs in some way.

### Shell

```
$ pacman -S zsh zsh-completions
```

### Terminal

I like **st** with my own set of patches.

```
$ pacaur -S ttf-inconsolata-g
$ git clone https://github.com/thelink2012/st
$ cd st && makepkg -sic
```

Fonts, shell and colors are configured in `~/.Xresources`.

### Application Launcher

```
$ pacman -S dmenu
```

### Desktop Notifications

```
$ pacman -S dunst
```

### Archive Manager

```
$ pacman -S p7zip zip unzip unrar atool
```

### Image Viewer

```
$ pacman -S imagemagick feh
```

### Movie Player

```
$ pacman -S mpv
```

### Image Editing

```
$ pacman -S pinta
```

### Others

Just to remember a few useful packages :)

```
$ pacaur -S dragon-git
$ pacaur -S dspdfviewer
$ pacaur -S entr
```

## Other System Tweaks

Those are not part of the dotfiles and must be done manually.

### Thinkpad T420 Trackpoint Behaviour

The maintainers of `libinput` decided to change the TrackPoint code for the `1.9` version. The problem is this change is quite bad (at least for my muscle memory).

The following are instructions to revert to the old behaviour:

```
pacman -U https://archive.archlinux.org/packages/l/libinput/libinput-1.8.3-1-x86_64.pkg.tar.xz
pacman -U https://archive.archlinux.org/packages/x/xf86-input-libinput/xf86-input-libinput-0.26.0-1-x86_64.pkg.tar.xz
# Note: xf86-input-libinput depends on libinput so we also keep using the version that was built during the libinput 1.8 era.
```

Then edit `/etc/pacman.conf` to freeze these two packages.

**References:**

+ https://bugzilla.redhat.com/show_bug.cgi?id=1509017
+ https://bugs.freedesktop.org/show_bug.cgi?id=103959
+ https://bbs.archlinux.org/viewtopic.php?id=231494

