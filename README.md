# thelink2012 dotfiles

After cloning, run `yadm bootstrap` or execute `.yadm/bootstrap` manually to do a few more nice steps (e.g. download vim-plug).

As follows are instructions, specially for myself, on how to setup a system capable of using all the dots in here.

## aliases

 - The `pbcopy` and `pbpaste` aliases depend on **xclip**.

## profile

 - Many variables are set.
 - That includes **$HOST**: This will be used in lots of dots to determine whether some setting should be applied to this machine.
 - Whenever a `~/.pythonenv` directory exists, it'll be sourced as a python virtual environment.
   - Such directory may be created using `python3 -m venv ~/.pythonenv --system-site-packages`.
 - **$GOPATH** is set to `~/.goenv`.
 - **$PATH** is prepended with `~/bin`, `$GOPATH/bin`, `~/.cargo/bin`, and others.

## ~/bin

Only the most important utilities of this directory will be listed on this README.

### takerec

This takes a recording of the screen and uploads somewhere. It requires **curl**, **xclip**, **ffmpeg** and **libnotify**.

### takeshot

Just like `takerec`, but takes screenshots. Requires **curl**, **xclip**, **imagemagick** and **libnotify**.

## Intrusive Dotfiles

 - `~/.config/user-dirs.dirs`

## Tools I Like

### Shell

```
$ pacman -S zsh zsh-completions
```
